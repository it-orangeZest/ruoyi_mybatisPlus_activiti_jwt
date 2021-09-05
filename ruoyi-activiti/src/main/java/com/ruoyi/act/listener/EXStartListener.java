package com.ruoyi.act.listener;

import org.activiti.engine.delegate.DelegateExecution;
import org.activiti.engine.delegate.ExecutionListener;
import org.activiti.engine.delegate.Expression;

/**
 * @author badcat
 * @date 2021-09-04 15:59
 */
public class EXStartListener implements ExecutionListener {

    private Expression param;

    @Override
    public void notify(DelegateExecution execution) {
        System.err.println("execution start, param=[" + param.getValue(execution).toString() + "]");
    }
}
