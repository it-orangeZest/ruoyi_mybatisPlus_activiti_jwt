package com.ruoyi.act.controller;

import java.util.Arrays;
import java.util.List;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.act.domain.TProcessModel;
import com.ruoyi.act.service.ITProcessModelService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 流程模型Controller
 * 
 * @author ruoyi
 * @date 2021-08-24
 */
@Controller
@RequestMapping("/act/definition/model")
public class TProcessModelController extends BaseController
{
    private String prefix = "act/definition/model";

    @Autowired
    private ITProcessModelService tProcessModelService;

    @RequiresPermissions("act/definition:model:view")
    @GetMapping()
    public String model()
    {
        return prefix + "/model";
    }

    /**
     * 查询流程模型列表
     */
    @RequiresPermissions("act/definition:model:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(TProcessModel tProcessModel)
    {
        startPage();
        List<TProcessModel> list = tProcessModelService.selectTProcessModelList(tProcessModel);
        return getDataTable(list);
    }

    /**
     * 导出流程模型列表
     */
    @RequiresPermissions("act/definition:model:export")
    @Log(title = "流程模型", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(TProcessModel tProcessModel)
    {
        List<TProcessModel> list = tProcessModelService.selectTProcessModelList(tProcessModel);
        ExcelUtil<TProcessModel> util = new ExcelUtil<TProcessModel>(TProcessModel.class);
        return util.exportExcel(list, "流程模型数据");
    }

    /**
     * 新增流程模型
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存流程模型
     */
    @RequiresPermissions("act/definition:model:add")
    @Log(title = "流程模型", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(TProcessModel tProcessModel)
    {
        return toAjax(tProcessModelService.save(tProcessModel));
    }

    /**
     * 修改流程模型
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        TProcessModel tProcessModel = tProcessModelService.getById(id);
        mmap.put("tProcessModel", tProcessModel);
        return prefix + "/edit";
    }

    /**
     * 修改保存流程模型
     */
    @RequiresPermissions("act/definition:model:edit")
    @Log(title = "流程模型", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(TProcessModel tProcessModel)
    {
        return toAjax(tProcessModelService.updateById(tProcessModel));
    }

    /**
     * 删除流程模型
     */
    @RequiresPermissions("act/definition:model:remove")
    @Log(title = "流程模型", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(tProcessModelService.removeByIds(Arrays.asList(ids.split(","))));
    }
}
