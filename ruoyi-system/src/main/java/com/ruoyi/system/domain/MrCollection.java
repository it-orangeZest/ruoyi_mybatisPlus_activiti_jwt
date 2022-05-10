package com.ruoyi.system.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.MPBaseEntity;

/**
 * 藏品库对象 mr_collection
 * 
 * @author ruoyi
 * @date 2022-05-10
 */
public class MrCollection extends MPBaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    @TableId(type = IdType.ASSIGN_UUID)
    private String id;

    /** 封面图 */
    @Excel(name = "封面图")
    private String surfacePlot;

    /** 创作者头像 */
    @Excel(name = "创作者头像")
    private String createrPhoto;

    /** 创作者名称 */
    @Excel(name = "创作者名称")
    private String createrName;

    public void setId(String id) 
    {
        this.id = id;
    }

    public String getId() 
    {
        return id;
    }
    public void setSurfacePlot(String surfacePlot) 
    {
        this.surfacePlot = surfacePlot;
    }

    public String getSurfacePlot() 
    {
        return surfacePlot;
    }
    public void setCreaterPhoto(String createrPhoto) 
    {
        this.createrPhoto = createrPhoto;
    }

    public String getCreaterPhoto() 
    {
        return createrPhoto;
    }
    public void setCreaterName(String createrName) 
    {
        this.createrName = createrName;
    }

    public String getCreaterName() 
    {
        return createrName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("surfacePlot", getSurfacePlot())
            .append("createrPhoto", getCreaterPhoto())
            .append("createrName", getCreaterName())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .append("createBy", getCreateBy())
            .append("updateBy", getUpdateBy())
            .append("remark", getRemark())
            .toString();
    }
}
