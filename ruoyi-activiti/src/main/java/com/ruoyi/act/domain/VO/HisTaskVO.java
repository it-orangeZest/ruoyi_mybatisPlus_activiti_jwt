package com.ruoyi.act.domain.VO;

import org.activiti.engine.history.HistoricVariableInstance;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author badcat
 * @date 2021-07-28 14:59
 */
public class HisTaskVO {
    private String taskId;
    private String processDefinitionId;
    private String processInstanceId;
    private Date startTime;
    private Date endTime;
    private String assignee;
    private String formKey;
    private String formContent;
    private String processName;
    private List<HistoricVariableInstance> variableVOList = new ArrayList<>();

    public String getTaskId() {
        return taskId;
    }

    public void setTaskId(String taskId) {
        this.taskId = taskId;
    }

    public String getProcessDefinitionId() {
        return processDefinitionId;
    }

    public void setProcessDefinitionId(String processDefinitionId) {
        this.processDefinitionId = processDefinitionId;
    }

    public String getProcessInstanceId() {
        return processInstanceId;
    }

    public void setProcessInstanceId(String processInstanceId) {
        this.processInstanceId = processInstanceId;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public String getAssignee() {
        return assignee;
    }

    public void setAssignee(String assignee) {
        this.assignee = assignee;
    }

    public String getFormKey() {
        return formKey;
    }

    public void setFormKey(String formKey) {
        this.formKey = formKey;
    }

    public String getProcessName() {
        return processName;
    }

    public void setProcessName(String processName) {
        this.processName = processName;
    }

    public List<HistoricVariableInstance> getVariableVOList() {
        return variableVOList;
    }

    public void setVariableVOList(List<HistoricVariableInstance> variableVOList) {
        this.variableVOList = variableVOList;
    }

    public String getFormContent() {
        return formContent;
    }

    public void setFormContent(String formContent) {
        this.formContent = formContent;
    }
}
