package com.ruoyi.api.controller;

import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.enums.UserStatus;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.framework.jwt.utils.JwtUtils;
import com.ruoyi.framework.shiro.service.SysPasswordService;
import com.ruoyi.system.service.ISysUserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @autor Administrator
 * @date 2022/5/11 21:04
 */
@RestController
@CrossOrigin
@RequestMapping("/app")
@Api(value = "系统登录",tags = "系统登录")
public class ApiLoginController {
    @Autowired
    private ISysUserService userService;

    @Autowired
    private SysPasswordService passwordService;
    @PostMapping("/login")
    @ApiOperation(value = "api登录", notes = "api登录")
    public AjaxResult login(String username, String password)
    {
        if (StringUtils.isEmpty(username) || StringUtils.isEmpty(password))
        {
            return AjaxResult.error("账号和密码不能为空!");
        }

        SysUser user = userService.selectUserByLoginName(username);
        if (user == null)
        {
            return AjaxResult.error("用户不存在/密码错误!");
        }

        if (UserStatus.DELETED.getCode().equals(user.getDelFlag()))
        {
            return AjaxResult.error("对不起，您的账号已被删除!");
        }

        if (UserStatus.DISABLE.getCode().equals(user.getStatus()))
        {
            return AjaxResult.error("用户已封禁，请联系管理员!");
        }

        if (!passwordService.matches(user, password))
        {
            return AjaxResult.error("用户不存在/密码错误!");
        }

        String token = JwtUtils.createToken(username, user.getPassword());
        return AjaxResult.success("登录成功,请妥善保管您的token信息").put("token", token);
    }
}
