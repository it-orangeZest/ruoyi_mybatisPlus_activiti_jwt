package com.ruoyi.act.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.MPBaseEntity;

/**
 * 流程附件对象 t_process_file
 * 
 * @author ruoyi
 * @date 2021-09-01
 */
public class TProcessFile extends MPBaseEntity
{
    private static final long serialVersionUID = 1L;

    /**  */
    private Long id;

    /** 流程key */
    @Excel(name = "流程key")
    private String processKey;

    /** 流程实例id */
    @Excel(name = "流程实例id")
    private String instanceId;

    /** 任务节点id */
    @Excel(name = "任务节点id")
    private String taskId;

    /** 文件名 */
    @Excel(name = "文件名")
    private String fileName;

    /** 真实文件名 */
    @Excel(name = "真实文件名")
    private String realName;

    /** 文件路径 */
    @Excel(name = "文件路径")
    private String path;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setProcessKey(String processKey) 
    {
        this.processKey = processKey;
    }

    public String getProcessKey() 
    {
        return processKey;
    }
    public void setInstanceId(String instanceId) 
    {
        this.instanceId = instanceId;
    }

    public String getInstanceId() 
    {
        return instanceId;
    }
    public void setTaskId(String taskId) 
    {
        this.taskId = taskId;
    }

    public String getTaskId() 
    {
        return taskId;
    }
    public void setFileName(String fileName) 
    {
        this.fileName = fileName;
    }

    public String getFileName() 
    {
        return fileName;
    }
    public void setRealName(String realName) 
    {
        this.realName = realName;
    }

    public String getRealName() 
    {
        return realName;
    }
    public void setPath(String path) 
    {
        this.path = path;
    }

    public String getPath() 
    {
        return path;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("processKey", getProcessKey())
            .append("instanceId", getInstanceId())
            .append("taskId", getTaskId())
            .append("fileName", getFileName())
            .append("realName", getRealName())
            .append("path", getPath())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
