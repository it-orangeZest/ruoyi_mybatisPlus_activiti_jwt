package com.ruoyi.act.controller.commom;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ruoyi.act.api.ProcessDefinitionService;
import com.ruoyi.act.domain.TProcessFile;
import com.ruoyi.act.domain.TProcessModel;
import com.ruoyi.act.domain.VO.SysProcessVO;
import com.ruoyi.act.service.ITProcessFileService;
import com.ruoyi.act.service.ITProcessModelService;
import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.ShiroUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.file.FileUploadUtils;
import com.ruoyi.common.utils.file.FileUtils;
import com.ruoyi.system.domain.TCustForm;
import com.ruoyi.system.service.ITCustFormService;
import org.activiti.engine.IdentityService;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.InputStream;
import java.util.*;

/**
 * @author badcat
 * Date 2021/8/23
 * Time 12:05
 */
@Controller
@RequestMapping("/act/processDefinition")
public class ProcessDefinitionController extends BaseController {

    @Autowired
    private ProcessDefinitionService processDefinitionService;

    @Autowired
    private ITProcessModelService itProcessModelService;

    @Autowired
    private ITCustFormService itCustFormService;

    @Autowired
    private IdentityService identityService;

    @Autowired
    private RuntimeService runtimeService;

    @Autowired
    private TaskService taskService;

    @Autowired
    private RepositoryService repositoryService;

    @Autowired
    private ITProcessFileService itProcessFileService;

    private String prefix = "act/definition";
    /**
     * 获取所属部门所有最新版本的流程定义，按部署id排序
     * @return
     */
    /*@RequestMapping("/getSysProcessList")
    public String getDefinitions(Model model){

        SysUser currentUser = ShiroUtils.getSysUser();
        Long deptId = currentUser.getDeptId();
        TProcessModel tProcessModel = new TProcessModel();
        tProcessModel.setDeptId(deptId);
        List<TProcessModel> tProcessModelList = this.itProcessModelService.selectTProcessModelByDept(tProcessModel);

        List<DefinitionVO> voList = new ArrayList<>();
        for(TProcessModel e : tProcessModelList){
            ProcessDefinition definition = this.processDefinitionService.getDefinitionByKey(e.getProcessKey());
            DefinitionVO vo = new DefinitionVO();
            vo.setId(definition.getId());
            vo.setDeploymentId(definition.getDeploymentId());
            vo.setName(definition.getName());
            vo.setKey(definition.getKey());
            vo.setVersion(definition.getVersion());
            vo.setResourceName(definition.getResourceName());
            vo.setDiagramResourceName(definition.getDiagramResourceName());
            voList.add(vo);
        }

        model.addAttribute("sysProcessList", voList);
        return prefix + "/sysProcessList";
    }*/

    @RequestMapping("/getSysProcessList")
    public String getDefinitions(Model model){

        ArrayList<SysProcessVO> voList = new ArrayList<>();

        QueryWrapper<TProcessModel> queryWrapper = new QueryWrapper<>();
        queryWrapper.in("status", "act_model_status_002", "act_model_status_003", "act_model_status_004")
                .orderByAsc("create_time");
        List<TProcessModel> list = this.itProcessModelService.list(queryWrapper);

        for(TProcessModel e : list){
            SysProcessVO vo = new SysProcessVO();
            ProcessDefinition definition = this.processDefinitionService.getDefinitionByKey(e.getProcessKey());

            if(definition != null){
                vo.setDeptId(e.getDeptId());
                vo.setProcessModelId(e.getId());
                vo.setDefinitionId(definition.getId());
                vo.setProcesskey(e.getProcessKey());
                vo.setName(e.getName());
                vo.setFormId(e.getFormId());
                vo.setResourceName(definition.getResourceName());
                vo.setDiagramResourceName(definition.getDiagramResourceName());
                voList.add(vo);
            }
        }

        model.addAttribute("sysProcessList", voList);
        return prefix + "/startProcess/sysProcessList";
    }

    /**
     * 读取流程资源
     *
     * @param processDefinitionId 流程定义ID
     * @param resourceName        资源名称
     */
    @RequestMapping(value = "/readResource")
    public void readResource(@RequestParam("pdid") String processDefinitionId, @RequestParam("resourceName") String resourceName, HttpServletResponse response)
            throws Exception {

        InputStream inputStream = this.processDefinitionService.readResource(processDefinitionId, resourceName);

        // 输出资源内容到相应对象
        byte[] b = new byte[1024];
        int len = -1;
        while ((len = inputStream.read(b, 0, 1024)) != -1) {
            response.getOutputStream().write(b, 0, len);
        }
    }

    @PostMapping( "/suspendOrActiveApply")
    @ResponseBody
    public AjaxResult suspendOrActiveApply(String id, String suspendState) {
        processDefinitionService.suspendOrActiveApply(id, suspendState);
        return AjaxResult.success();
    }

    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {

        String loginName = ShiroUtils.getLoginName();
        if(!StringUtils.equals("admin", loginName)){
            String[] arr = ids.split(",");
            for (String id : arr){
                Deployment deployment = this.repositoryService.createDeploymentQuery().deploymentId(id).singleResult();
                String modelId = deployment.getKey();
                QueryWrapper<TProcessModel> queryWrapper = new QueryWrapper<>();
                queryWrapper.eq("model_id", modelId);
                TProcessModel one = this.itProcessModelService.getOne(queryWrapper);
                if(one != null){
                    String type = one.getType();
                    if(StringUtils.equals("1", type)){
                        return AjaxResult.error("案例流程模型不允许删除");
                    }
                }
            }
        }


        try {
            return toAjax(processDefinitionService.deleteProcessDeploymentByIds(ids));
        }
        catch (Exception e) {
            return error(e.getMessage());
        }
    }

    @PostMapping("/upload")
    @ResponseBody
    public AjaxResult upload(@RequestParam("processDefinition") MultipartFile file) {
        try {
            if (!file.isEmpty()) {
                String extensionName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf('.') + 1);
                if (!"bpmn".equalsIgnoreCase(extensionName)
                        && !"zip".equalsIgnoreCase(extensionName)
                        && !"bar".equalsIgnoreCase(extensionName)) {
                    return error("流程定义文件仅支持 bpmn, zip 和 bar 格式！");
                }
                // p.s. 此时 FileUploadUtils.upload() 返回字符串 fileName 前缀为 Constants.RESOURCE_PREFIX，需剔除
                // 详见: FileUploadUtils.getPathFileName(...)
                String fileName = FileUploadUtils.upload(RuoYiConfig.getProfile() + "/processDefiniton", file);
                if (StringUtils.isNotBlank(fileName)) {
                    String realFilePath = RuoYiConfig.getProfile() + fileName.substring(Constants.RESOURCE_PREFIX.length());
                    this.processDefinitionService.deployProcessDefinition(realFilePath);
                    return success();
                }
            }
            return error("不允许上传空文件！");
        }
        catch (Exception e) {
            logger.error("上传流程定义文件失败！", e);
            return error(e.getMessage());
        }
    }

    /*@PostMapping("/convert2Model")
    @ResponseBody
    public AjaxResult convert2Model(String processDefinitionId){
        this.processDefinitionService.convert2Model(processDefinitionId);
    }*/

    @RequestMapping("/startForm")
    public String startForm(String processModelId, Model model){
        TProcessModel tProcessModel = this.itProcessModelService.getById(processModelId);
        Long formId = tProcessModel.getFormId();

        TCustForm tCustForm = this.itCustFormService.getById(formId);
        model.addAttribute("sysProcessId", processModelId);
        model.addAttribute("content", tCustForm.getContent());
        return prefix + "/startProcess/startForm";

    }

    /**
     * 完成流程发起表单后，发起流程
     * @param request
     * @return
     */
    @RequestMapping("/startSysProcessByNullForm")
    @ResponseBody
    public AjaxResult startSysProcessByNullForm(String processModelId){

        TProcessModel processModel = this.itProcessModelService.getById(processModelId);
        String processkey = processModel.getProcessKey();

        //发起流程
        String loginName = ShiroUtils.getLoginName();
        //设置发起人
        identityService.setAuthenticatedUserId(loginName);
        Map<String, Object> map1 = new HashMap<>();
        map1.put("starter", loginName);
        ProcessInstance processInstance = this.runtimeService.startProcessInstanceByKey(processkey, map1);

        return toAjax(1);
    }

    /**
     * 完成流程发起表单后，发起流程
     * @param request
     * @return
     */
    @RequestMapping("/startSysProcessByForm")
    @ResponseBody
    public AjaxResult startSysProcessByForm(HttpServletRequest request){
        String sysProcessId = "";
        String uploadFiles = "";
        Map<String, String[]> parameterMap = request.getParameterMap();
        Map<String, Object> map = new HashMap<>();
        for(Map.Entry<String, String[]> entry : parameterMap.entrySet() ) {
            map.put(entry.getKey(), entry.getValue()[0]);
            if(StringUtils.equals("sysProcessId", entry.getKey())){
                sysProcessId = entry.getValue()[0];
            }
            if(StringUtils.equals("processFile", entry.getKey())){
                uploadFiles = entry.getValue()[0];
            }
        }

        TProcessModel processModel = this.itProcessModelService.getById(sysProcessId);
        String processkey = processModel.getProcessKey();
        TCustForm tCustForm = this.itCustFormService.getById(processModel.getFormId());
        map.put("formKey", tCustForm.getFormKey());

        //发起流程
        String loginName = ShiroUtils.getLoginName();
        //设置发起人
        identityService.setAuthenticatedUserId(loginName);
        Map<String, Object> map1 = new HashMap<>();
        map1.put("starter", loginName);
        ProcessInstance processInstance = this.runtimeService.startProcessInstanceByKey(processkey, map1);

        //获取我的节点
        Task task = taskService.createTaskQuery().taskAssignee(loginName).processInstanceId(processInstance.getId()).singleResult();
        //将相关变量放入节点本地变量，查询历史各节点信息时使用
        taskService.setVariablesLocal(task.getId(), map);
        //完成节点
        taskService.complete(task.getId(), map);

        if(StringUtils.isNotBlank(uploadFiles)){
            String[] arr = uploadFiles.split(",");
            for (String fileRealName : arr){
                QueryWrapper<TProcessFile> queryWrapper = new QueryWrapper<>();
                queryWrapper.eq("real_name", fileRealName);

                TProcessFile one = this.itProcessFileService.getOne(queryWrapper);
                one.setInstanceId(processInstance.getId());
                one.setTaskId(task.getId());
                this.itProcessFileService.updateById(one);
            }
        }


        return toAjax(1);
    }

    @PostMapping("/uploadProcessFile")
    @ResponseBody
    public AjaxResult uploadProcessFile(@RequestParam("processFile") MultipartFile file, String sysProcessId) {

        TProcessModel tProcessModel = this.itProcessModelService.getById(sysProcessId);

        String name = file.getOriginalFilename();
        try {
            String realNamePath = FileUploadUtils.upload(RuoYiConfig.getProfile() + "/processFile", file);
            TProcessFile tProcessFile = new TProcessFile();
            if (StringUtils.isNotBlank(realNamePath)) {
                String realFilePath = RuoYiConfig.getProfile() + realNamePath.substring(Constants.RESOURCE_PREFIX.length());

                tProcessFile.setFileName(name);
                tProcessFile.setPath(realFilePath);
                tProcessFile.setRealName(realNamePath.substring(realNamePath.lastIndexOf("/")+1));
                tProcessFile.setProcessKey(tProcessModel.getProcessKey());
                this.itProcessFileService.save(tProcessFile);

            }
            return AjaxResult.success(tProcessFile);
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.error(e.getMessage());
        }
    }

    @PostMapping("/uploadProcessFile2")
    @ResponseBody
    public AjaxResult uploadProcessFile2(@RequestParam("processFile") MultipartFile file, String taskId) {

        Task task = this.taskService.createTaskQuery().taskId(taskId).singleResult();
        String processDefinitionId = task.getProcessDefinitionId();
        ProcessDefinition processDefinition = this.repositoryService.createProcessDefinitionQuery()
                .processDefinitionId(processDefinitionId)
                .singleResult();
        String key = processDefinition.getKey();

        String name = file.getOriginalFilename();
        try {
            String realNamePath = FileUploadUtils.upload(RuoYiConfig.getProfile() + "/processFile", file);
            TProcessFile tProcessFile = new TProcessFile();
            if (StringUtils.isNotBlank(realNamePath)) {
                String realFilePath = RuoYiConfig.getProfile() + realNamePath.substring(Constants.RESOURCE_PREFIX.length());

                tProcessFile.setFileName(name);
                tProcessFile.setPath(realFilePath);
                tProcessFile.setRealName(realNamePath.substring(realNamePath.lastIndexOf("/")+1));
                tProcessFile.setProcessKey(key);
                this.itProcessFileService.save(tProcessFile);

            }
            return AjaxResult.success(tProcessFile);
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.error(e.getMessage());
        }
    }

    @GetMapping("/download")
    @ResponseBody
    public void download(String path, String fileName, HttpServletResponse response){
        try
        {
            response.setContentType(MediaType.APPLICATION_OCTET_STREAM_VALUE);
            FileUtils.setAttachmentResponseHeader(response, fileName);
            FileUtils.writeBytes(path, response.getOutputStream());

        }
        catch (Exception e)
        {
            logger.error("下载文件失败", e);
        }
    }

    @GetMapping("/removeFile")
    @ResponseBody
    public AjaxResult removeFile(String realName){
        QueryWrapper<TProcessFile> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("real_name", realName);
        TProcessFile tProcessFile = this.itProcessFileService.getOne(queryWrapper);
        boolean b = this.itProcessFileService.removeById(tProcessFile.getId());
        File file = new File(tProcessFile.getPath());
        if(file.exists()){
            file.delete();
        }
        return AjaxResult.success();
    }


    @PostMapping("/getProcessFileByRealNames")
    @ResponseBody
    public AjaxResult getProcessFileByRealNames(String realNames){
        String[] split = realNames.split(",");
        List<String> list = Arrays.asList(split);
        QueryWrapper<TProcessFile> queryWrapper = new QueryWrapper<>();
        queryWrapper.in("real_name", list);
        List<TProcessFile> fileList = this.itProcessFileService.list(queryWrapper);
        return AjaxResult.success(fileList);
    }
}
