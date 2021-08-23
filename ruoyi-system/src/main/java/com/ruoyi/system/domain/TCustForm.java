package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.MPBaseEntity;

/**
 * 表单设计对象 t_cust_form
 * 
 * @author ruoyi
 * @date 2021-08-23
 */
public class TCustForm extends MPBaseEntity
{
    private static final long serialVersionUID = 1L;

    /**  */
    private Long id;

    /** 表单key */
    @Excel(name = "表单key")
    private String formKey;

    /** 表单名 */
    @Excel(name = "表单名")
    private String formName;

    /** 表单类型 */
    @Excel(name = "表单类型")
    private String type;

    /** 表单内容 */
    private String content;

    /** 状态 */
    @Excel(name = "状态")
    private String status;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setFormKey(String formKey) 
    {
        this.formKey = formKey;
    }

    public String getFormKey() 
    {
        return formKey;
    }
    public void setFormName(String formName) 
    {
        this.formName = formName;
    }

    public String getFormName() 
    {
        return formName;
    }
    public void setType(String type) 
    {
        this.type = type;
    }

    public String getType() 
    {
        return type;
    }
    public void setContent(String content) 
    {
        this.content = content;
    }

    public String getContent() 
    {
        return content;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("formKey", getFormKey())
            .append("formName", getFormName())
            .append("type", getType())
            .append("content", getContent())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .append("status", getStatus())
            .toString();
    }
}
