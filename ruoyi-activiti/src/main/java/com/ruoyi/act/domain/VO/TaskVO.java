package com.ruoyi.act.domain.VO;

import org.apache.commons.lang3.StringUtils;

import java.util.Date;

/**
 * @author badcat
 * @date 2021-07-26 18:34
 */
public class TaskVO {
    private String taskId;
    private String definitionId;
    private String definitionName;
    private String instanceId;
    private String taskName;
    //任务类型：待办/待拾取
    private String type;
    private Date CreateTime;

    public String getTaskId() {
        return taskId;
    }

    public void setTaskId(String taskId) {
        this.taskId = taskId;
    }

    public String getDefinitionId() {
        return definitionId;
    }

    public void setDefinitionId(String definitionId) {
        this.definitionId = definitionId;
    }

    public String getDefinitionName() {
        return definitionName;
    }

    public void setDefinitionName(String definitionName) {
        this.definitionName = definitionName;
    }

    public String getInstanceId() {
        return instanceId;
    }

    public void setInstanceId(String instanceId) {
        this.instanceId = instanceId;
    }

    public String getTaskName() {
        return taskName;
    }

    public void setTaskName(String taskName) {
        this.taskName = taskName;
    }

    public String getType() {
        return type;
    }

    public void setType(String Assignee) {
        if(StringUtils.isBlank(Assignee)){
            this.type = "待拾取";
        } else {
            this.type = "待办";
        }
    }

    public Date getCreateTime() {
        return CreateTime;
    }

    public void setCreateTime(Date createTime) {
        CreateTime = createTime;
    }
}
