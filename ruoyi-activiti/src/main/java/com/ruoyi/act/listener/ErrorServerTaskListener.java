package com.ruoyi.act.listener;

import org.activiti.engine.delegate.BpmnError;
import org.activiti.engine.delegate.DelegateExecution;
import org.activiti.engine.delegate.JavaDelegate;

/**
 * 触发错误事件
 * @author badcat
 * @date 2021-09-05 10:06
 */
public class ErrorServerTaskListener implements JavaDelegate {
    @Override
    public void execute(DelegateExecution execution) {
        //流程错误时间中的error name
        throw new BpmnError("Error_138fnq2");
    }
}
