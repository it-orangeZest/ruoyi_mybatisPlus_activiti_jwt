package com.ruoyi.act.config;

import org.activiti.spring.SpringProcessEngineConfiguration;
import org.activiti.spring.boot.ProcessEngineConfigurationConfigurer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

/**
 * @author badcat
 * @date 2021-07-23 0:22
 */
@Configuration
public class ActivitiConfig implements ProcessEngineConfigurationConfigurer {

    @Autowired
    private ICustomProcessDiagramGenerator customProcessDiagramGenerator;

    /**
     * 解決工作流生成图片乱码问题
     *
     * @param processEngineConfiguration
     */
    @Override
    public void configure(SpringProcessEngineConfiguration processEngineConfiguration) {
        processEngineConfiguration.setActivityFontName("宋体");
        processEngineConfiguration.setAnnotationFontName("宋体");
        processEngineConfiguration.setLabelFontName("宋体");
        processEngineConfiguration.setProcessDiagramGenerator(customProcessDiagramGenerator);
    }

    /*@Autowired
    private UUIDGenerator uuidGenerator;

    @Bean
    public ProcessEngineConfigurationImpl processEngineConfigurationImpl(ProcessEngineConfigurationImpl processEngineConfigurationImpl){
        //设置ProcessEngineConfigurationImpl里的uuidGenerator
        processEngineConfigurationImpl.setIdGenerator(uuidGenerator);
        //设置DbSqlSessionFactory的uuidGenerator，否则流程id，任务id，实例id依然是用DbIdGenerator生成
        processEngineConfigurationImpl.getDbSqlSessionFactory().setIdGenerator(uuidGenerator);
        return processEngineConfigurationImpl;
    }*/
}