package com.ruoyi.framework.config.mybatitsPlus;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import com.ruoyi.common.utils.ShiroUtils;
import org.apache.ibatis.reflection.MetaObject;

import java.util.Date;

/**
 * 自动填充的字段处理
 * 字段上方需要添加@TableField注解
 */
public class MyMetaObjectHandler implements MetaObjectHandler {
    @Override
    public void insertFill(MetaObject metaObject) {
        this.strictInsertFill(metaObject, "createTime", Date.class, new Date());
        this.strictInsertFill(metaObject, "createBy", String.class, ShiroUtils.getLoginName());
    }

    @Override
    public void updateFill(MetaObject metaObject) {
        this.strictUpdateFill(metaObject, "updateTime", Date.class, new Date()); // 起始版本 3.3.0(推荐)
        this.strictUpdateFill(metaObject, "updateBy", String.class, ShiroUtils.getLoginName());
    }
}
