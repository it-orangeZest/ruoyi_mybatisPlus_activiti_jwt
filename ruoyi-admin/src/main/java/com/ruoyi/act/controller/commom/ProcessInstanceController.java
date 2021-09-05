package com.ruoyi.act.controller.commom;

import com.github.pagehelper.Page;
import com.ruoyi.act.domain.VO.ProcessInstanceListVO;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.page.PageDomain;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.page.TableSupport;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.ShiroUtils;
import com.ruoyi.common.utils.StringUtils;
import org.activiti.engine.HistoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.history.HistoricProcessInstanceQuery;
import org.activiti.engine.runtime.Execution;
import org.activiti.engine.runtime.ProcessInstance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author badcat
 * @date 2021-09-01 0:31
 */
@Controller
@RequestMapping("/act/processInstance")
public class ProcessInstanceController extends BaseController {

    @Autowired
    private HistoryService historyService;

    @Autowired
    private RuntimeService runtimeService;

    private String prefix = "act/definition/needDealt";

    @RequestMapping("/myInstanceList")
    public String myInstanceList(Model model) {
        return prefix + "/myInstanceList";
    }

    /**
     * 查询我发起的某个流程定义的实例列表
     * @param key 流程定义key
     * @param model
     * @param firstResult 起始索引
     * @param maxResults  要查询多少条
     * @return
     */
    @ResponseBody
    @RequestMapping("/getMyInstance")
    public TableDataInfo getMyInstance(Model model) throws Exception {
        String name = this.getRequest().getParameter("name");
        String beginTime = this.getRequest().getParameter("beginTime");
        String endTime = this.getRequest().getParameter("endTime");
        String processKey = this.getRequest().getParameter("processKey");
        String status = this.getRequest().getParameter("status");

        SysUser sysUser = ShiroUtils.getSysUser();
        String loginName = sysUser.getLoginName();
        PageDomain pageDomain = TableSupport.buildPageRequest();
        Integer pageNum = pageDomain.getPageNum();
        Integer pageSize = pageDomain.getPageSize();

        Page<ProcessInstanceListVO> voList =new Page<>();
        HistoricProcessInstanceQuery query = historyService.createHistoricProcessInstanceQuery()
                .startedBy(loginName)
                .orderByProcessInstanceStartTime()
                .desc();
        if(StringUtils.isNotBlank(name)){
            query.processInstanceNameLike(name);
        }
        if(StringUtils.isNotBlank(beginTime)){
            Date beginTime_date = DateUtils.parseDate(beginTime, "yyyy-MM-dd");
            query.startedAfter(beginTime_date);
        }
        if(StringUtils.isNotBlank(endTime)){
            Date endTime_date = DateUtils.parseDate(endTime, "yyyy-MM-dd");
            query.startedBefore(endTime_date);
        }
        if(StringUtils.isNotBlank(processKey)){
            query.processDefinitionKey(processKey);
        }
        if(StringUtils.isNotBlank(status)){
            if(StringUtils.equals("act_complete_type_001", status)){
                //已完成
                query.finished();
            }else{
                //未完成
                query.unfinished();
            }
        }
        List<HistoricProcessInstance> listPage = query.listPage((pageNum - 1) * pageSize, pageSize);
        voList.setTotal(query.count());
        voList.setPageNum(pageNum);
        voList.setPageSize(pageSize);
        toProcessInstanceListVO(voList, listPage);
        return getDataTable(voList);
    }

    public void toProcessInstanceListVO(Page<ProcessInstanceListVO> voList, List<HistoricProcessInstance> list) {

        for (HistoricProcessInstance e : list) {
            ProcessInstanceListVO vo = new ProcessInstanceListVO();
            vo.setId(e.getId());
            vo.setBusinessKey(e.getBusinessKey());
            vo.setProcessDefinitionId(e.getProcessDefinitionId());
            vo.setProcessDefinitionKey(e.getProcessDefinitionKey());
            vo.setProcessDefinitionName(e.getProcessDefinitionName());
            vo.setEndTime(e.getEndTime());
            vo.setStartTime(e.getStartTime());
            vo.setStartUserId(e.getStartUserId());
            if(e.getEndTime() != null){
                vo.setCompleteType("act_complete_type_001");
            }else{
                vo.setCompleteType("act_complete_type_002");
            }
            voList.add(vo);
        }
    }

    @ResponseBody
    @RequestMapping("/deleteInstanceById")
    public AjaxResult deleteInstanceById(@RequestParam("instanceId") String instanceId){
        runtimeService.deleteProcessInstance(instanceId,"发起人删除");
        historyService.deleteHistoricProcessInstance(instanceId);
        return AjaxResult.success();
    }

    @ResponseBody
    @RequestMapping("/backTask")
    public AjaxResult backTask(@RequestParam("instanceId") String instanceId){
        ProcessInstance processInstance = this.runtimeService.createProcessInstanceQuery()
                .processInstanceId(instanceId)
                .singleResult();

        Object o = runtimeService.getVariable(instanceId, "backMsgKey");
        String backMsgKey = "";
        if(o != null){
            backMsgKey = o.toString();
        }
        if(StringUtils.isBlank(backMsgKey)){
            return AjaxResult.error();
        }
        Execution execution = this.runtimeService.createExecutionQuery()
                .messageEventSubscriptionName(backMsgKey)
                .processInstanceId(instanceId)
                .singleResult();

        this.runtimeService.messageEventReceived(backMsgKey, execution.getId());
        return AjaxResult.success();
    }
}
