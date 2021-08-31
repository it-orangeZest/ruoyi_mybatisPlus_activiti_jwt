package com.ruoyi.act.controller;

import com.ruoyi.act.api.ProcessDefinitionService;
import com.ruoyi.act.domain.TProcessModel;
import com.ruoyi.act.service.ITProcessModelService;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.config.ServerConfig;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysDept;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.utils.uuid.UUID;
import com.ruoyi.system.domain.TCustForm;
import com.ruoyi.system.service.ISysDeptService;
import com.ruoyi.system.service.ITCustFormService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

/**
 * 流程模型Controller
 * 
 * @author ruoyi
 * @date 2021-08-24
 */
@Controller
@RequestMapping("/act/definition/model")
public class TProcessModelController extends BaseController
{
    private String prefix = "act/definition/model";

    @Autowired
    private ITProcessModelService itProcessModelService;

    @Autowired
    private ProcessDefinitionService processDefinitionService;

    @Autowired
    private ITCustFormService itCustFormService;

    @Autowired
    private ISysDeptService iSysDeptService;

    @Autowired
    private ServerConfig serverConfig;

    @RequiresPermissions("act/definition:model:view")
    @GetMapping()
    public String model()
    {
        return prefix + "/model";
    }

    /**
     * 查询流程模型列表
     */
    @RequiresPermissions("act/definition:model:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(TProcessModel tProcessModel)
    {
        startPage();
        List<TProcessModel> list = itProcessModelService.selectTProcessModelList(tProcessModel);
        for(TProcessModel e : list){
            if(e.getFormId() != null){
                TCustForm custForm = this.itCustFormService.getById(e.getFormId());
                if(custForm != null){
                    e.setFormName(custForm.getFormName());
                }
            }
            if(e.getDeptId() != null){
                SysDept sysDept = this.iSysDeptService.selectDeptById(e.getDeptId());
                if(sysDept != null){
                    e.setDeptName(sysDept.getDeptName());
                }
            }
        }
        return getDataTable(list);
    }

    /**
     * 导出流程模型列表
     */
    @RequiresPermissions("act/definition:model:export")
    @Log(title = "流程模型", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(TProcessModel tProcessModel)
    {
        List<TProcessModel> list = itProcessModelService.selectTProcessModelList(tProcessModel);
        ExcelUtil<TProcessModel> util = new ExcelUtil<TProcessModel>(TProcessModel.class);
        return util.exportExcel(list, "流程模型数据");
    }

    /**
     * 新增流程模型
     */
    @GetMapping("/add")
    public String add(String windowName, ModelMap mmap)
    {
        mmap.put("windowName", windowName);
        return prefix + "/add";
    }

    /**
     * 新增保存流程模型
     */
    @RequiresPermissions("act/definition:model:add")
    @Log(title = "流程模型", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(TProcessModel tProcessModel)
    {
        return toAjax(itProcessModelService.save(tProcessModel));
    }

    /**
     * 修改流程模型
     */
    @GetMapping("/edit")
    public String edit(Long id, String windowName, ModelMap mmap)
    {
        TProcessModel tProcessModel = itProcessModelService.getById(id);
        if(tProcessModel.getDeptId() != null){
            SysDept sysDept = this.iSysDeptService.selectDeptById(tProcessModel.getDeptId());
            tProcessModel.setDeptName(sysDept.getDeptName());
        }
        mmap.put("windowName", windowName);
        mmap.put("tProcessModel", tProcessModel);
        return prefix + "/edit";
    }

    /**
     * 修改保存流程模型
     */
    @RequiresPermissions("act/definition:model:edit")
    @Log(title = "流程模型", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(TProcessModel tProcessModel)
    {
        return toAjax(itProcessModelService.updateById(tProcessModel));
    }

    /**
     * 删除流程模型
     */
    @RequiresPermissions("act/definition:model:remove")
    @Log(title = "流程模型", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    @Transactional
    public AjaxResult remove(String ids)
    {
        String[] arr = ids.split(",");
        boolean b = false;
        for(String id : arr){
            TProcessModel tProcessModel = this.itProcessModelService.getById(id);
            String modelId = tProcessModel.getModelId();
            this.processDefinitionService.deleteModel(modelId);
            b = this.itProcessModelService.removeById(id);
        }
        return toAjax(b);
    }

    /**
     * 流程编辑器上传功能
     * @param request
     * @param multipartFile
     * @return
     */
    @ResponseBody
    @PostMapping(value = "/upload")
    public AjaxResult upload(HttpServletRequest request, @RequestParam("processFile") MultipartFile multipartFile) {
        String fileName = this.processDefinitionService.upload(request, multipartFile);
        return AjaxResult.success("成功", fileName);
    }

    @ResponseBody
    @PostMapping(value = "/save")
    public AjaxResult save(TProcessModel tProcessModel){

        //没有模型id，创建
        if(StringUtils.isBlank(tProcessModel.getModelId())){
            boolean save = false;
            String modelId = this.processDefinitionService.saveModel(tProcessModel.getName(),
                    tProcessModel.getProcessKey(),
                    tProcessModel.getRemark(),
                    tProcessModel.getValues());
            if(StringUtils.isNotBlank(modelId)){
                tProcessModel.setModelId(modelId);
                tProcessModel.setStatus("act_model_status_001");
                save = this.itProcessModelService.save(tProcessModel);
            }
            return save ? AjaxResult.success() : AjaxResult.error();
        } else {//有模型流程，修改
            boolean edit = false;

            String result = this.processDefinitionService.editModel(tProcessModel.getModelId(), tProcessModel.getValues());
            if(StringUtils.equals(result, "success")){
                tProcessModel.setStatus("act_model_status_002");
                edit = this.itProcessModelService.updateById(tProcessModel);
            }

            return edit ? AjaxResult.success() : AjaxResult.error();
        }
    }

    @ResponseBody
    @RequestMapping("/getBpmnXML")
    public void getBpmnXML(HttpServletResponse response, String modelId){
        byte[] source = this.processDefinitionService.getBpmnXML(modelId);

        response.setContentType("text/xml");

        try {
            OutputStream outputStream = response.getOutputStream();
            outputStream.write(source);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @ResponseBody
    @RequestMapping("/deployModel")
    public AjaxResult deployModel(Long id){
        boolean b = false;
                TProcessModel tProcessModel = this.itProcessModelService.getById(id);
        String deploymentId = this.processDefinitionService.deployModel(tProcessModel.getModelId());
        if(StringUtils.isNotBlank(deploymentId)){
            TProcessModel model = new TProcessModel();
            model.setId(id);
            model.setStatus("act_model_status_003");
            b = this.itProcessModelService.updateById(model);
        }

        return b ? AjaxResult.success() : AjaxResult.error();
    }

    @GetMapping("/downLoad")
    @ResponseBody
    public AjaxResult downLoad(String id){
        FileOutputStream fileOutputStream = null;
        try {
            TProcessModel tProcessModel = this.itProcessModelService.getById(id);
            byte[] bpmnXML = this.processDefinitionService.getBpmnXML(tProcessModel.getModelId());
            String xml = new String(bpmnXML);
            String absoluteFile = getAbsoluteFile(tProcessModel.getName() + ".bpmn");
            fileOutputStream = new FileOutputStream(absoluteFile);
            fileOutputStream.write(bpmnXML);
            fileOutputStream.flush();
            return AjaxResult.success(tProcessModel.getName() + ".bpmn");
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.error(e.getMessage());
        } finally {
            if(fileOutputStream != null){
                try {
                    fileOutputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    @PostMapping("/multipleDownLoad")
    @ResponseBody
    public AjaxResult multipleDownLoad(String ids){
        ArrayList<String> filePath = new ArrayList<>();
        String[] arr = ids.split(",");
        FileOutputStream fileOutputStream = null;
        try {
            for(int i=0 ; i<arr.length ; i++){
                TProcessModel tProcessModel = this.itProcessModelService.getById(arr[i]);
                byte[] bpmnXML = this.processDefinitionService.getBpmnXML(tProcessModel.getModelId());
                String xml = new String(bpmnXML);
                String absoluteFile = getAbsoluteFile(i + "_" + tProcessModel.getName() + ".bpmn");
                fileOutputStream = new FileOutputStream(absoluteFile);
                fileOutputStream.write(bpmnXML);
                fileOutputStream.flush();
                filePath.add(absoluteFile);
            }

            String zipName = UUID.randomUUID() + ".zip";
            // 输出流
            FileOutputStream outputStream = new FileOutputStream(getAbsoluteFile(zipName));

            // 压缩输出流
            ZipOutputStream zipOutputStream = new ZipOutputStream(new BufferedOutputStream(outputStream));

            for(String e : filePath){
                FileInputStream inputStream = new FileInputStream(new File(e));
                // 标记要打包的条目
                zipOutputStream.putNextEntry(new ZipEntry(e));
                // 进行写操作
                int len = 0;
                byte[] bytes = new byte[1024];
                while ((len = inputStream.read(bytes)) > 0) {
                    zipOutputStream.write(bytes, 0, len);
                }
                // 关闭输入流
                inputStream.close();
            }
            zipOutputStream.close();

            return AjaxResult.success(zipName);
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.error(e.getMessage());
        } finally {
            if(fileOutputStream != null){
                try {
                    fileOutputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
    /**
     * 获取下载路径
     *
     * @param filename 文件名称
     */
    public String getAbsoluteFile(String filename)
    {
        String downloadPath = RuoYiConfig.getDownloadPath() + filename;
        File desc = new File(downloadPath);
        if (!desc.getParentFile().exists())
        {
            desc.getParentFile().mkdirs();
        }
        return downloadPath;
    }
}
