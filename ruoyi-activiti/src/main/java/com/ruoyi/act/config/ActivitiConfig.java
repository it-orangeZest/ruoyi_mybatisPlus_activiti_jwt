package com.ruoyi.act.config;

import org.activiti.engine.*;
import org.activiti.spring.ProcessEngineFactoryBean;
import org.activiti.spring.SpringProcessEngineConfiguration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.PlatformTransactionManager;

import javax.sql.DataSource;

/**
 * @author badcat
 * @date 2021-07-23 0:22
 */
@Configuration
public class ActivitiConfig {
    @Autowired
    private DataSource dataSource;
    @Autowired
    private PlatformTransactionManager platformTransactionManager;

    private SpringProcessEngineConfiguration springProcessEngineConfiguration(){
        SpringProcessEngineConfiguration spec = new SpringProcessEngineConfiguration();
        spec.setDataSource(dataSource);
        spec.setTransactionManager(platformTransactionManager);
        spec.setDatabaseSchemaUpdate("true");
        return spec;
    }

    private ProcessEngineFactoryBean processEngine(){
        ProcessEngineFactoryBean processEngineFactoryBean = new ProcessEngineFactoryBean();
        processEngineFactoryBean.setProcessEngineConfiguration(springProcessEngineConfiguration());
        return processEngineFactoryBean;
    }


    @Bean
    public RepositoryService repositoryService() throws Exception{
        return processEngine().getObject().getRepositoryService();
    }
    @Bean
    public RuntimeService runtimeService() throws Exception{
        return processEngine().getObject().getRuntimeService();
    }
    @Bean
    public TaskService taskService() throws Exception{
        return processEngine().getObject().getTaskService();
    }
    @Bean
    public HistoryService historyService() throws Exception{
        return processEngine().getObject().getHistoryService();
    }
    @Bean
    public FormService formService() throws Exception{
        return processEngine().getObject().getFormService();
    }
    @Bean
    public IdentityService identityService() throws Exception{
        return processEngine().getObject().getIdentityService();
    }

}
