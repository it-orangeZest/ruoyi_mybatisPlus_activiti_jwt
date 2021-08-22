package com.ruoyi.act.controller;

import org.activiti.engine.RepositoryService;
import org.activiti.engine.repository.Deployment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author badcat
 * @date 2021-08-23 0:25
 */
@RestController
@RequestMapping("/act")
public class ACT_Test {
    @Autowired
    private RepositoryService repositoryService;

    /**
     * 根据文件路径部署流程
     */
    @GetMapping("/initDeploymentBPMN")
    public String initDeploymentBPMN(){
        String filename = "BPMN/test.bpmn";
        Deployment deployment = this.repositoryService.createDeployment()
                .addClasspathResource(filename)
                .name("流程部署测试uel_v3")
                .deploy();
        return deployment.getName();
    }
}
