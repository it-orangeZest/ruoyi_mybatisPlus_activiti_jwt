package com.ruoyi.act.controller;

import com.github.pagehelper.Page;
import com.ruoyi.act.api.ProcessDefinitionService;
import com.ruoyi.act.domain.VO.ProcessDefinitionVO;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.page.PageDomain;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.page.TableSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author badcat
 * @date 2021-08-29 10:48
 */
@Controller
@RequestMapping("/act/deployManager")
public class DeployManagerController extends BaseController {

    @Autowired
    private ProcessDefinitionService processDefinitionService;

    private String prefix = "act/definition/deployManager";

    @RequestMapping("/definition")
    public String definition(){
        return prefix + "/definitionList";
    }

    //获取流程定义列表
    @ResponseBody
    @RequestMapping("/getDefinitions")
    public TableDataInfo getDefinitions(ProcessDefinitionVO processDefinition){

        PageDomain pageDomain = TableSupport.buildPageRequest();
        Integer pageNum = pageDomain.getPageNum();
        Integer pageSize = pageDomain.getPageSize();

        Page<ProcessDefinitionVO> list = this.processDefinitionService.getDeployManagerList(processDefinition, pageNum, pageSize);
        return getDataTable(list);
    }
}
