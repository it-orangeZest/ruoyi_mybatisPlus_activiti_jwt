package com.ruoyi.api.controller;

import com.ruoyi.common.core.domain.AjaxResult;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @autor Administrator
 * @date 2022/5/11 16:55
 */
@RestController
@RequestMapping("/api")
public class ApiController
{
    /**
     * 无权限访问
     *
     * @return
     */
    @GetMapping("/list")
    public AjaxResult list()
    {
        return AjaxResult.success();
    }

    /**
     * 菜单权限 system:user:list
     */
    @GetMapping("/user/list")
    @RequiresPermissions("system:user:list")
    public AjaxResult userlist()
    {
        return AjaxResult.success("user list success");
    }

    /**
     * 角色权限 admin
     */
    @GetMapping("/role/list")
    @RequiresRoles("admin")
    public AjaxResult rolelist()
    {
        return AjaxResult.success("role list success");
    }
}