package com.ruoyi.act.listener;

import com.ruoyi.common.utils.spring.SpringUtils;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.delegate.DelegateTask;
import org.activiti.engine.delegate.Expression;
import org.activiti.engine.delegate.TaskListener;

/**
 * 设置取回消息参数监听类
 * @author badcat
 * @date 2021-09-05 0:14
 */
public class TKOffBackParamListener implements TaskListener {

    private RuntimeService runtimeService = SpringUtils.getBean(RuntimeService.class);

    @Override
    public void notify(DelegateTask delegateTask) {

        String processInstanceId = delegateTask.getProcessInstanceId();

        this.runtimeService.setVariable(processInstanceId, "backMsgKey", null);
    }
}
