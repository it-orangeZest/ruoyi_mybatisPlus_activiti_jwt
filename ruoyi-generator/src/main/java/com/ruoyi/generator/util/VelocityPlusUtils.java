package com.ruoyi.generator.util;

import com.ruoyi.common.constant.GenConstants;

import java.util.ArrayList;
import java.util.List;

public class VelocityPlusUtils extends VelocityUtils{
    /**
     * 获取模板信息
     * 目前仅支持单表
     * @return 模板列表
     */
    public static List<String> getTemplateList(String tplCategory)
    {
        List<String> templates = new ArrayList<String>();
        templates.add("vm/java/plus/domain.java.vm");
        templates.add("vm/java/plus/mapper.java.vm");
        templates.add("vm/java/plus/service.java.vm");
        templates.add("vm/java/plus/serviceImpl.java.vm");
        templates.add("vm/java/plus/controller.java.vm");
        templates.add("vm/xml/plus/mapper.xml.vm");
        if (GenConstants.TPL_CRUD.equals(tplCategory))
        {
            templates.add("vm/html/list.html.vm");
        }
        else if (GenConstants.TPL_TREE.equals(tplCategory))
        {
            templates.add("vm/html/tree.html.vm");
            templates.add("vm/html/list-tree.html.vm");
        }
        else if (GenConstants.TPL_SUB.equals(tplCategory))
        {
            templates.add("vm/html/list.html.vm");
            templates.add("vm/java/sub-domain.java.vm");
        }
        templates.add("vm/html/add.html.vm");
        templates.add("vm/html/edit.html.vm");
        templates.add("vm/sql/sql.vm");
        return templates;
    }
}