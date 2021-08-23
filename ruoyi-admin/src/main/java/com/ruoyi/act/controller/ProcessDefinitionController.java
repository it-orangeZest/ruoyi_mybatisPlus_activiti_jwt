package com.ruoyi.act.controller;

import com.ruoyi.act.api.ProcessDefinitionService;
import com.ruoyi.act.domain.VO.DefinitionVO;
import com.ruoyi.common.core.domain.AjaxResult;
import org.activiti.engine.repository.ProcessDefinitionQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.util.List;

/**
 * @author badcat
 * Date 2021/8/23
 * Time 12:05
 */
@Controller
@RequestMapping("/act/processDefinition")
public class ProcessDefinitionController {

    @Autowired
    private ProcessDefinitionService processDefinitionService;

    private String prefix = "act/definition";
    /**
     * 获取所有最新版本的流程定义，按部署id排序
     * @return
     */
    @RequestMapping("/getDefinitions")
    public String getDefinitions(Model model){
        List<DefinitionVO> list = this.processDefinitionService.getDefinitions();
        model.addAttribute("definitionList", list);
        return prefix + "/definitionList";
    }

    /**
     * 读取流程资源
     *
     * @param processDefinitionId 流程定义ID
     * @param resourceName        资源名称
     */
    @RequestMapping(value = "/readResource")
    public void readResource(@RequestParam("pdid") String processDefinitionId, @RequestParam("resourceName") String resourceName, HttpServletResponse response)
            throws Exception {

        InputStream inputStream = this.processDefinitionService.readResource(processDefinitionId, resourceName);

        // 输出资源内容到相应对象
        byte[] b = new byte[1024];
        int len = -1;
        while ((len = inputStream.read(b, 0, 1024)) != -1) {
            response.getOutputStream().write(b, 0, len);
        }
    }
}
