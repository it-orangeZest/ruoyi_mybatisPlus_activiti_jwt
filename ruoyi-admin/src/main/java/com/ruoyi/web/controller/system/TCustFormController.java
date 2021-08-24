package com.ruoyi.web.controller.system;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysDictData;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.service.DictService;
import com.ruoyi.system.domain.TCustForm;
import com.ruoyi.system.service.ITCustFormService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Arrays;
import java.util.List;

/**
 * 表单设计Controller
 * 
 * @author ruoyi
 * @date 2021-08-23
 */
@Controller
@RequestMapping("/custForm/form")
public class TCustFormController extends BaseController
{
    private String prefix = "system/custForm";

    @Autowired
    private ITCustFormService tCustFormService;

    @Autowired
    private DictService dictService;

    @RequiresPermissions("custForm:form:view")
    @GetMapping()
    public String form()
    {
        return prefix + "/form";
    }

    /**
     * 查询表单设计列表
     */
    @RequiresPermissions("custForm:form:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(TCustForm tCustForm)
    {
        startPage();
        List<TCustForm> list = tCustFormService.selectTCustFormList(tCustForm);
        return getDataTable(list);
    }

    /**
     * 导出表单设计列表
     */
    @RequiresPermissions("custForm:form:export")
    @Log(title = "表单设计", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(TCustForm tCustForm)
    {
        List<TCustForm> list = tCustFormService.selectTCustFormList(tCustForm);
        ExcelUtil<TCustForm> util = new ExcelUtil<TCustForm>(TCustForm.class);
        return util.exportExcel(list, "表单设计数据");
    }

    /**
     * 新增表单设计
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存表单设计
     */
    @RequiresPermissions("custForm:form:add")
    @Log(title = "表单设计", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(TCustForm tCustForm)
    {
        return toAjax(tCustFormService.save(tCustForm));
    }

    /**
     * 修改表单设计
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        TCustForm tCustForm = tCustFormService.getById(id);
        mmap.put("tCustForm", tCustForm);
        return prefix + "/edit";
    }

    /**
     * 修改保存表单设计
     */
    @RequiresPermissions("custForm:form:edit")
    @Log(title = "表单设计", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(TCustForm tCustForm)
    {
        return toAjax(tCustFormService.updateById(tCustForm));
    }

    /**
     * 删除表单设计
     */
    @RequiresPermissions("custForm:form:remove")
    @Log(title = "表单设计", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(tCustFormService.removeByIds(Arrays.asList(ids.split(","))));
    }

    @GetMapping("/design")
    public String design(String id, ModelMap mmap){
        TCustForm tCustForm = this.tCustFormService.getById(id);
        mmap.put("custForm", tCustForm);
        return prefix + "/design";
    }

    @GetMapping("/designFromDefinition")
    public String designFromDefinition(String windowName, ModelMap mmap){

        mmap.put("windowName", windowName);
        return prefix + "/design_from_definition";
    }

    @ResponseBody()
    @RequestMapping("/getType")
    public List<SysDictData> getType(String dictType)
    {
        return dictService.getType(dictType);
    }

    @ResponseBody()
    @RequestMapping("/saveDesign")
    public AjaxResult saveDesign(TCustForm tCustForm){
        try {
            String decode = URLDecoder.decode(tCustForm.getContent(), "UTF-8");
            tCustForm.setContent(decode);
            boolean b = this.tCustFormService.updateById(tCustForm);
            if(b){
                return AjaxResult.success();
            } else {
                return AjaxResult.error();
            }
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.error("系统异常：" + e.getMessage());
        }
    }

    @ResponseBody()
    @GetMapping("/getFormByStatus")
    public List<TCustForm> getFormByStatus(String status){
        QueryWrapper<TCustForm> wrapper = new QueryWrapper<>();
        wrapper.eq("status", status);
        List<TCustForm> list = this.tCustFormService.list(wrapper);
        return list;
    }


    @ResponseBody()
    @GetMapping("/getFormById")
    public TCustForm getFormById(String id){
        return this.tCustFormService.getById(id);
    }
}
