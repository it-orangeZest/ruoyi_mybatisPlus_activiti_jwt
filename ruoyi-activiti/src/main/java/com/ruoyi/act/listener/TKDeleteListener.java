package com.ruoyi.act.listener;

import org.activiti.engine.delegate.DelegateTask;
import org.activiti.engine.delegate.Expression;
import org.activiti.engine.delegate.TaskListener;

/**
 * @author badcat
 * @date 2021-09-04 15:02
 */
public class TKDeleteListener implements TaskListener {

    private Expression param;

    @Override
    public void notify(DelegateTask delegateTask) {
        System.err.println("Delete, param=["+param.getValue(delegateTask).toString()+"]");
    }
}