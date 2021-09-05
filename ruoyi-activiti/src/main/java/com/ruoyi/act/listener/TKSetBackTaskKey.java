package com.ruoyi.act.listener;

import com.ruoyi.common.utils.spring.SpringUtils;
import org.activiti.engine.TaskService;
import org.activiti.engine.delegate.DelegateTask;
import org.activiti.engine.delegate.Expression;
import org.activiti.engine.delegate.TaskListener;

/**
 * @author badcat
 * @date 2021-09-05 1:51
 */
public class TKSetBackTaskKey implements TaskListener {

    private Expression backTaskKey;

    private TaskService taskService = SpringUtils.getBean(TaskService.class);

    @Override
    public void notify(DelegateTask delegateTask) {
        this.taskService.setVariable(delegateTask.getId(), "backTaskKey", this.backTaskKey.getValue(delegateTask).toString());
    }
}
