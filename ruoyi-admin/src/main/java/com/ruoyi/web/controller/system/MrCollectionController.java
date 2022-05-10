package com.ruoyi.web.controller.system;

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
import com.ruoyi.system.domain.MrCollection;
import com.ruoyi.system.service.IMrCollectionService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 藏品库Controller
 * 
 * @author ruoyi
 * @date 2022-05-10
 */
@Controller
@RequestMapping("/system/collection")
public class MrCollectionController extends BaseController
{
    private String prefix = "system/collection";

    @Autowired
    private IMrCollectionService imrCollectionService;

    @RequiresPermissions("system:collection:view")
    @GetMapping()
    public String collection()
    {
        return prefix + "/collection";
    }

    /**
     * 查询藏品库列表
     */
    @RequiresPermissions("system:collection:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(MrCollection mrCollection)
    {
        startPage();
        List<MrCollection> list = imrCollectionService.selectMrCollectionList(mrCollection);
        return getDataTable(list);
    }

    /**
     * 导出藏品库列表
     */
    @RequiresPermissions("system:collection:export")
    @Log(title = "藏品库", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(MrCollection mrCollection)
    {
        List<MrCollection> list = imrCollectionService.selectMrCollectionList(mrCollection);
        ExcelUtil<MrCollection> util = new ExcelUtil<MrCollection>(MrCollection.class);
        return util.exportExcel(list, "藏品库数据");
    }

    /**
     * 新增藏品库
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存藏品库
     */
    @RequiresPermissions("system:collection:add")
    @Log(title = "藏品库", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(MrCollection mrCollection)
    {
        return toAjax(imrCollectionService.save(mrCollection));
    }

    /**
     * 修改藏品库
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") String id, ModelMap mmap)
    {
        MrCollection mrCollection = imrCollectionService.getById(id);
        mmap.put("mrCollection", mrCollection);
        return prefix + "/edit";
    }

    /**
     * 修改保存藏品库
     */
    @RequiresPermissions("system:collection:edit")
    @Log(title = "藏品库", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(MrCollection mrCollection)
    {
        return toAjax(imrCollectionService.updateById(mrCollection));
    }

    /**
     * 删除藏品库
     */
    @RequiresPermissions("system:collection:remove")
    @Log(title = "藏品库", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(imrCollectionService.removeByIds(Arrays.asList(ids.split(","))));
    }
}
