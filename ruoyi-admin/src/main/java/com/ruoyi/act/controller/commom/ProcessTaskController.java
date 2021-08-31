package com.ruoyi.act.controller.commom;

import com.github.pagehelper.Page;
import com.ruoyi.act.config.ICustomProcessDiagramGenerator;
import com.ruoyi.act.config.WorkflowConstants;
import com.ruoyi.act.domain.VO.HisTaskVO;
import com.ruoyi.act.domain.VO.MyTaskListVO;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.PageDomain;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.page.TableSupport;
import com.ruoyi.common.utils.ShiroUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.TCustForm;
import com.ruoyi.system.service.ITCustFormService;
import org.activiti.bpmn.model.BpmnModel;
import org.activiti.bpmn.model.FlowNode;
import org.activiti.bpmn.model.SequenceFlow;
import org.activiti.engine.*;
import org.activiti.engine.history.HistoricActivityInstance;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.history.HistoricTaskInstance;
import org.activiti.engine.history.HistoricVariableInstance;
import org.activiti.engine.impl.RepositoryServiceImpl;
import org.activiti.engine.impl.persistence.entity.ProcessDefinitionEntity;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.repository.ProcessDefinitionQuery;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.activiti.engine.task.TaskQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author badcat
 * Date 2021/8/31
 * Time 15:20
 */
@Controller
@RequestMapping("/act/processTask")
public class ProcessTaskController extends BaseController {

    @Autowired
    private ProcessEngine processEngine;

    @Autowired
    private TaskService taskService;

    @Autowired
    private HistoryService historyService;

    @Autowired
    private ITCustFormService itCustFormService;

    @Autowired
    private RuntimeService runtimeService;

    @Autowired
    private RepositoryService repositoryService;

    private String prefix = "act/definition/needDealt";

    @RequestMapping("/myTask")
    public String myTask(Model model) {
        return prefix + "/myTask";
    }

    @RequestMapping("/getMyTask")
    @ResponseBody
    public TableDataInfo getMyTaskList(Model model) {
        String loginName = ShiroUtils.getLoginName();

        PageDomain pageDomain = TableSupport.buildPageRequest();
        Integer pageNum = pageDomain.getPageNum();
        Integer pageSize = pageDomain.getPageSize();

        Page<MyTaskListVO> voList =new Page<>();
        TaskQuery query = taskService.createTaskQuery().taskCandidateOrAssigned(loginName)
                .orderByTaskCreateTime().desc();//.listPage((pageNum-1)*pageSize, pageSize);
        List<Task> myTaskList = query.listPage((pageNum - 1) * pageSize, pageSize);
        voList.setTotal(query.count());
        voList.setPageNum(pageNum);
        voList.setPageSize(pageSize);
        toMyTaskListVO(voList, myTaskList);
        return getDataTable(voList);
    }

    public void toMyTaskListVO(Page<MyTaskListVO> voList, List<Task> list) {

        for (Task e : list) {
            MyTaskListVO vo = new MyTaskListVO();
            String processInstanceId = e.getProcessInstanceId();
            HistoricProcessInstance historicProcessInstance = historyService.createHistoricProcessInstanceQuery()
                    .processInstanceId(processInstanceId).singleResult();
            vo.setTaskId(e.getId());
            vo.setProcessName(historicProcessInstance.getProcessDefinitionName());
            vo.setCreateTime(historicProcessInstance.getStartTime());
            vo.setCreater(historicProcessInstance.getStartUserId());
            vo.setInstanceId(processInstanceId);

            voList.add(vo);
        }
    }

    @RequestMapping("/goHisTasks/{instanceId}")
    public String goHisTasks(@PathVariable("instanceId") String instanceId, Model model){
        model.addAttribute("instanceId", instanceId);
        List<HistoricTaskInstance> historicTaskList = historyService
                .createHistoricTaskInstanceQuery()
                .processInstanceId(instanceId)
                .orderByHistoricTaskInstanceEndTime().asc()
                .finished()
                .list();

        List<HisTaskVO> hisTaskVOS = new ArrayList<>();
        for (HistoricTaskInstance historicTaskInstance : historicTaskList){
            HisTaskVO hisTaskVO = new HisTaskVO();
            hisTaskVO.setTaskId(historicTaskInstance.getId());
            hisTaskVO.setTaskId(historicTaskInstance.getId());
            hisTaskVO.setProcessDefinitionId(historicTaskInstance.getProcessDefinitionId());
            hisTaskVO.setProcessInstanceId(historicTaskInstance.getProcessInstanceId());
            hisTaskVO.setStartTime(historicTaskInstance.getStartTime());
            hisTaskVO.setEndTime(historicTaskInstance.getEndTime());
            String assignee = historicTaskInstance.getAssignee();
            String formId = historicTaskInstance.getFormKey();
            if(StringUtils.isBlank(formId)){
                List<HistoricVariableInstance> list = historyService
                        .createHistoricVariableInstanceQuery()
                        .taskId(historicTaskInstance.getId())
                        .list();
                for(HistoricVariableInstance e : list){
                    if(StringUtils.equals(e.getVariableName(), "formId")){
                        formId = e.getValue().toString();
                    }
                    if(StringUtils.isBlank(assignee) && StringUtils.equals(e.getVariableName(), "assignee")){
                        assignee = e.getValue().toString();
                    }
                }
            }
            hisTaskVO.setAssignee(assignee);
            TCustForm tCustForm = this.itCustFormService.getById(formId);
            hisTaskVO.setFormContent(tCustForm.getContent());
            hisTaskVOS.add(hisTaskVO);
        }
        model.addAttribute("hisTaskVOS", hisTaskVOS);
        return prefix + "/hisTasks";
    }

    @ResponseBody
    @RequestMapping("/historyList/{instanceId}")
    public AjaxResult historyList(@PathVariable("instanceId") String instanceId){
        List<HistoricTaskInstance> historicTaskList = historyService
                .createHistoricTaskInstanceQuery()
                .processInstanceId(instanceId)
                .orderByHistoricTaskInstanceEndTime().asc()
                .finished()
                .list();

        List<HisTaskVO> hisTaskVOS = new ArrayList<>();
        for (HistoricTaskInstance historicTaskInstance : historicTaskList){
            HisTaskVO hisTaskVO = new HisTaskVO();
            String assignee = historicTaskInstance.getAssignee();
            Date endTime = historicTaskInstance.getEndTime();
            Map<String, Object> taskLocalVariables = historicTaskInstance.getTaskLocalVariables();
            Map<String, Object> processVariables = historicTaskInstance.getProcessVariables();
            String taskInstanceId = historicTaskInstance.getId();

            //查询历史任务节点的local参数
            List<HistoricVariableInstance> list = historyService.createHistoricVariableInstanceQuery().taskId(taskInstanceId)
                    .list();

            hisTaskVO.setTaskId(historicTaskInstance.getId());
            hisTaskVO.setProcessDefinitionId(historicTaskInstance.getProcessDefinitionId());
            hisTaskVO.setProcessInstanceId(historicTaskInstance.getProcessInstanceId());
            hisTaskVO.setStartTime(historicTaskInstance.getStartTime());
            hisTaskVO.setEndTime(historicTaskInstance.getEndTime());
            hisTaskVO.setAssignee(historicTaskInstance.getAssignee());
            hisTaskVO.setFormKey(historicTaskInstance.getFormKey());
            hisTaskVO.setVariableVOList(list);

            hisTaskVOS.add(hisTaskVO);
        }

        return AjaxResult.success(hisTaskVOS);
    }

    @GetMapping("/processImg/{instanceId}")
    public String processImg(@PathVariable("instanceId") String instanceId, ModelMap mmap) {
        mmap.put("instanceId", instanceId);
        return prefix + "/processImg";
    }

    @RequestMapping(value = "/read-resource")
    public void readResource(String pProcessInstanceId, HttpServletResponse response) throws Exception {
        // 设置页面不缓存
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);

        String processDefinitionId = "";
        ProcessInstance processInstance = runtimeService.createProcessInstanceQuery()
                .processInstanceId(pProcessInstanceId).singleResult();
        if (processInstance == null) {
            HistoricProcessInstance historicProcessInstance = historyService.createHistoricProcessInstanceQuery()
                    .processInstanceId(pProcessInstanceId).singleResult();
            processDefinitionId = historicProcessInstance.getProcessDefinitionId();
        } else {
            processDefinitionId = processInstance.getProcessDefinitionId();
        }
        ProcessDefinitionQuery pdq = repositoryService.createProcessDefinitionQuery();
        ProcessDefinition pd = pdq.processDefinitionId(processDefinitionId).singleResult();

        String resourceName = pd.getDiagramResourceName();

        if (resourceName.endsWith(".png") && org.apache.commons.lang3.StringUtils.isEmpty(pProcessInstanceId) == false) {
            getActivitiProccessImage(pProcessInstanceId, response);
            // ProcessDiagramGenerator.generateDiagram(pde, "png",
            // getRuntimeService().getActiveActivityIds(processInstanceId));
        } else {
            // 通过接口读取
            InputStream resourceAsStream = repositoryService.getResourceAsStream(pd.getDeploymentId(), resourceName);

            // 输出资源内容到相应对象
            byte[] b = new byte[1024];
            int len = -1;
            while ((len = resourceAsStream.read(b, 0, 1024)) != -1) {
                response.getOutputStream().write(b, 0, len);
            }
        }
    }

    /**
     * 获取流程图像，已执行节点和流程线高亮显示
     */
    public void getActivitiProccessImage(String pProcessInstanceId, HttpServletResponse response) {
        // logger.info("[开始]-获取流程图图像");
        try {
            // 获取历史流程实例
            HistoricProcessInstance historicProcessInstance = historyService.createHistoricProcessInstanceQuery()
                    .processInstanceId(pProcessInstanceId).singleResult();

            if (historicProcessInstance == null) {
                // throw new BusinessException("获取流程实例ID[" + pProcessInstanceId +
                // "]对应的历史流程实例失败！");
            } else {
                // 获取流程定义
                ProcessDefinitionEntity processDefinition = (ProcessDefinitionEntity) ((RepositoryServiceImpl) repositoryService)
                        .getDeployedProcessDefinition(historicProcessInstance.getProcessDefinitionId());

                // 获取流程历史中已执行节点，并按照节点在流程中执行先后顺序排序
                List<HistoricActivityInstance> historicActivityInstanceList = historyService
                        .createHistoricActivityInstanceQuery().processInstanceId(pProcessInstanceId)
                        .orderByHistoricActivityInstanceId().asc().list();

                // 已执行的节点ID集合
                List<String> executedActivityIdList = new ArrayList<String>();
                int index = 1;
                // logger.info("获取已经执行的节点ID");
                for (HistoricActivityInstance activityInstance : historicActivityInstanceList) {
                    executedActivityIdList.add(activityInstance.getActivityId());

                    // logger.info("第[" + index + "]个已执行节点=" + activityInstance.getActivityId() + "
                    // : " +activityInstance.getActivityName());
                    index++;
                }

                BpmnModel bpmnModel = repositoryService.getBpmnModel(historicProcessInstance.getProcessDefinitionId());

                // 已执行的线集合
                List<String> flowIds = new ArrayList<String>();
                // 获取流程走过的线 (getHighLightedFlows是下面的方法)
                flowIds = getHighLightedFlows(bpmnModel, processDefinition, historicActivityInstanceList);

//                // 获取流程图图像字符流
//                ProcessDiagramGenerator pec = processEngine.getProcessEngineConfiguration().getProcessDiagramGenerator();
//                //配置字体
//                InputStream imageStream = pec.generateDiagram(bpmnModel, "png", executedActivityIdList, flowIds,"宋体","微软雅黑","黑体",null,2.0);

                Set<String> currIds = runtimeService.createExecutionQuery().processInstanceId(pProcessInstanceId).list()
                        .stream().map(e -> e.getActivityId()).collect(Collectors.toSet());

                ICustomProcessDiagramGenerator diagramGenerator = (ICustomProcessDiagramGenerator) processEngine
                        .getProcessEngineConfiguration().getProcessDiagramGenerator();
                InputStream imageStream = diagramGenerator.generateDiagram(bpmnModel, "png", executedActivityIdList,
                        flowIds, "宋体", "宋体", "宋体", null, 1.0,
                        new Color[] { WorkflowConstants.COLOR_NORMAL, WorkflowConstants.COLOR_CURRENT }, currIds);

                response.setContentType("image/png");
                OutputStream os = response.getOutputStream();
                int bytesRead = 0;
                byte[] buffer = new byte[8192];
                while ((bytesRead = imageStream.read(buffer, 0, 8192)) != -1) {
                    os.write(buffer, 0, bytesRead);
                }
                os.close();
                imageStream.close();
            }
            // logger.info("[完成]-获取流程图图像");
        } catch (Exception e) {
            System.out.println(e.getMessage());
            // logger.error("【异常】-获取流程图失败！" + e.getMessage());
            // throw new BusinessException("获取流程图失败！" + e.getMessage());
        }
    }

    private List<String> getHighLightedFlows(BpmnModel bpmnModel, ProcessDefinitionEntity processDefinitionEntity,
                                             List<HistoricActivityInstance> historicActivityInstances) {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); // 24小时制
        List<String> highFlows = new ArrayList<String>();// 用以保存高亮的线flowId

        for (int i = 0; i < historicActivityInstances.size() - 1; i++) {
            // 对历史流程节点进行遍历
            // 得到节点定义的详细信息
            FlowNode activityImpl = (FlowNode) bpmnModel.getMainProcess()
                    .getFlowElement(historicActivityInstances.get(i).getActivityId());

            List<FlowNode> sameStartTimeNodes = new ArrayList<FlowNode>();// 用以保存后续开始时间相同的节点
            FlowNode sameActivityImpl1 = null;

            HistoricActivityInstance activityImpl_ = historicActivityInstances.get(i);// 第一个节点
            HistoricActivityInstance activityImp2_;

            for (int k = i + 1; k <= historicActivityInstances.size() - 1; k++) {
                activityImp2_ = historicActivityInstances.get(k);// 后续第1个节点

                if (activityImpl_.getActivityType().equals("userTask")
                        && activityImp2_.getActivityType().equals("userTask")
                        && df.format(activityImpl_.getStartTime()).equals(df.format(activityImp2_.getStartTime()))) // 都是usertask，且主节点与后续节点的开始时间相同，说明不是真实的后继节点
                {

                } else {
                    sameActivityImpl1 = (FlowNode) bpmnModel.getMainProcess()
                            .getFlowElement(historicActivityInstances.get(k).getActivityId());// 找到紧跟在后面的一个节点
                    break;
                }

            }
            sameStartTimeNodes.add(sameActivityImpl1); // 将后面第一个节点放在时间相同节点的集合里
            for (int j = i + 1; j < historicActivityInstances.size() - 1; j++) {
                HistoricActivityInstance activityImpl1 = historicActivityInstances.get(j);// 后续第一个节点
                HistoricActivityInstance activityImpl2 = historicActivityInstances.get(j + 1);// 后续第二个节点

                if (df.format(activityImpl1.getStartTime()).equals(df.format(activityImpl2.getStartTime()))) {// 如果第一个节点和第二个节点开始时间相同保存
                    FlowNode sameActivityImpl2 = (FlowNode) bpmnModel.getMainProcess()
                            .getFlowElement(activityImpl2.getActivityId());
                    sameStartTimeNodes.add(sameActivityImpl2);
                } else {// 有不相同跳出循环
                    break;
                }
            }
            List<SequenceFlow> pvmTransitions = activityImpl.getOutgoingFlows(); // 取出节点的所有出去的线

            for (SequenceFlow pvmTransition : pvmTransitions) {// 对所有的线进行遍历
                FlowNode pvmActivityImpl = (FlowNode) bpmnModel.getMainProcess()
                        .getFlowElement(pvmTransition.getTargetRef());// 如果取出的线的目标节点存在时间相同的节点里，保存该线的id，进行高亮显示
                if (sameStartTimeNodes.contains(pvmActivityImpl)) {
                    highFlows.add(pvmTransition.getId());
                }
            }

        }
        return highFlows;

    }

    @RequestMapping("/taskForm")
    public String taskForm(@RequestParam("taskId") String taskId,
                           Model model) {
        Task task = taskService.createTaskQuery().taskId(taskId).singleResult();
    	/*TaskFormData taskFormData = formService.getTaskFormData(task.getId());
        List<FormProperty> formProperties = taskFormData.getFormProperties();

        List<FieldSuper> fieldList = new ArrayList<FieldSuper>();
        for(FormProperty f : formProperties) {
        	FieldSuper fieldSuper = toInputField(f);
        	if(fieldSuper != null) {
        		fieldList.add(fieldSuper);
        	}
        }*/

        String formKey = task.getFormKey();
        if(StringUtils.isBlank(formKey)){
            formKey = "31";
        }
        TCustForm tCustForm = this.itCustFormService.getById(formKey);
        //model.addAttribute("fieldList", fieldList);
        model.addAttribute("taskId", task.getId());
        model.addAttribute("content", tCustForm.getContent());
        return prefix + "/taskForm";
    }

    @RequestMapping("/complete")
    @ResponseBody
    public AjaxResult completeTask(HttpServletRequest request){
        String loginName = ShiroUtils.getLoginName();

        Map<String, String[]> parameterMap = request.getParameterMap();
        Map<String, Object> map = new HashMap<>();
        for(Map.Entry<String, String[]> entry : parameterMap.entrySet() ) {
            map.put(entry.getKey(), entry.getValue()[0]);
        }

        String taskId = (String)map.get("taskId");
        Task task = this.taskService.createTaskQuery().taskId(taskId).singleResult();
        String formId = task.getFormKey();
        if(StringUtils.isBlank(formId)){
            formId = "31";
        }
        map.put("formId", formId);
        map.put("assignee", loginName);
        taskService.setVariablesLocal(task.getId(), map);
        taskService.complete(taskId, map);
        return toAjax(1);
    }
}
