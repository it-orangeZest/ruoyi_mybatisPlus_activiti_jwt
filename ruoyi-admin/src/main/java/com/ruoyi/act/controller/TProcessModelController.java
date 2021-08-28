package com.ruoyi.act.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.util.Arrays;
import java.util.List;

import com.ruoyi.act.api.ProcessDefinitionService;
import com.ruoyi.common.utils.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.act.domain.TProcessModel;
import com.ruoyi.act.service.ITProcessModelService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
    private ITProcessModelService tProcessModelService;

    @Autowired
    private ProcessDefinitionService processDefinitionService;

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
        List<TProcessModel> list = tProcessModelService.selectTProcessModelList(tProcessModel);
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
        List<TProcessModel> list = tProcessModelService.selectTProcessModelList(tProcessModel);
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
        return toAjax(tProcessModelService.save(tProcessModel));
    }

    /**
     * 修改流程模型
     */
    @GetMapping("/edit")
    public String edit(Long id, String windowName, ModelMap mmap)
    {
        TProcessModel tProcessModel = tProcessModelService.getById(id);
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
        return toAjax(tProcessModelService.updateById(tProcessModel));
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
            TProcessModel tProcessModel = this.tProcessModelService.getById(id);
            String modelId = tProcessModel.getModelId();
            this.processDefinitionService.deleteModel(modelId);
            b = this.tProcessModelService.removeById(id);
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
                save = this.tProcessModelService.save(tProcessModel);
            }
            return save ? AjaxResult.success() : AjaxResult.error();
        } else {//有模型流程，修改
            boolean edit = false;

            String result = this.processDefinitionService.editModel(tProcessModel.getModelId(), tProcessModel.getValues());
            if(StringUtils.equals(result, "success")){
                tProcessModel.setStatus("act_model_status_002");
                edit = this.tProcessModelService.updateById(tProcessModel);
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
                TProcessModel tProcessModel = this.tProcessModelService.getById(id);
        String deploymentId = this.processDefinitionService.deployModel(tProcessModel.getModelId());
        if(StringUtils.isNotBlank(deploymentId)){
            TProcessModel model = new TProcessModel();
            model.setId(id);
            model.setStatus("act_model_status_003");
            b = this.tProcessModelService.updateById(model);
        }

        return b ? AjaxResult.success() : AjaxResult.error();
    }
}
