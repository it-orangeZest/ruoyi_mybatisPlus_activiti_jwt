package com.ruoyi.act.listener;

import org.activiti.engine.delegate.DelegateExecution;
import org.activiti.engine.delegate.JavaDelegate;

/**
 * @author badcat
 * @date 2021-09-05 10:50
 */
public class ServerListener2 implements JavaDelegate {
    @Override
    public void execute(DelegateExecution execution) {
        Object name = execution.getVariable("name");
        System.err.println(name);
    }
}
