package com.ruoyi.act.domain;

import com.baomidou.mybatisplus.annotation.TableField;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.MPBaseEntity;

/**
 * 流程模型对象 t_process_model
 * 
 * @author ruoyi
 * @date 2021-08-24
 */
public class TProcessModel extends MPBaseEntity
{
    private static final long serialVersionUID = 1L;

    /**  */
    private Long id;

    /** key */
    @Excel(name = "key")
    private String processKey;

    /** 部门id */
    @Excel(name = "部门id")
    private Long deptId;

    /** 模型名称 */
    @Excel(name = "模型名称")
    private String name;

    /** 表单id */
    @Excel(name = "表单id")
    private Long formId;

    /** 状态 */
    @Excel(name = "状态")
    private String status;

    private String modelId;

    @TableField(exist = false)
    private String values;

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
    public void setDeptId(Long deptId) 
    {
        this.deptId = deptId;
    }

    public Long getDeptId() 
    {
        return deptId;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setFormId(Long formId) 
    {
        this.formId = formId;
    }

    public Long getFormId() 
    {
        return formId;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }

    public String getModelId() {
        return modelId;
    }

    public void setModelId(String modelId) {
        this.modelId = modelId;
    }

    public String getValues() {
        return values;
    }

    public void setValues(String values) {
        this.values = values;
    }

    @Override
    public String toString() {
        return "TProcessModel{" +
                "id=" + id +
                ", processKey='" + processKey + '\'' +
                ", deptId=" + deptId +
                ", name='" + name + '\'' +
                ", formId=" + formId +
                ", status='" + status + '\'' +
                ", modelId='" + modelId + '\'' +
                ", values='" + values + '\'' +
                '}';
    }
}
