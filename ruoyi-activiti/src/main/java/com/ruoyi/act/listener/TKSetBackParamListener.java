package com.ruoyi.act.listener;

import com.ruoyi.common.utils.spring.SpringUtils;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.delegate.DelegateTask;
import org.activiti.engine.delegate.Expression;
import org.activiti.engine.delegate.TaskListener;
import org.activiti.engine.runtime.ProcessInstance;

/**
 * 设置取回消息参数监听类
 * @author badcat
 * @date 2021-09-05 0:14
 */
public class TKSetBackParamListener implements TaskListener {

    private Expression backMsgKey;

    private TaskService taskService = SpringUtils.getBean(TaskService.class);

    private RuntimeService runtimeService = SpringUtils.getBean(RuntimeService.class);

    private RepositoryService repositoryService = SpringUtils.getBean(RepositoryService.class);


    @Override
    public void notify(DelegateTask delegateTask) {
        /*String taskDefinitionKey = delegateTask.getTaskDefinitionKey();
        String backMsgKey = this.backMsgKey.getValue(delegateTask).toString();

        Execution execution = this.runtimeService.createExecutionQuery()
                .messageEventSubscriptionName(backMsgKey)
                .processInstanceId(delegateTask.getProcessInstanceId())
                .singleResult();

        this.runtimeService.messageEventReceived(backMsgKey, execution.getId());*/

//        delegateTask.setVariable("backMsgKey", this.backMsgKey.getValue(delegateTask).toString());

        String backMsgKey = this.backMsgKey.getValue(delegateTask).toString();

        String processInstanceId = delegateTask.getProcessInstanceId();

        this.runtimeService.setVariable(processInstanceId, "backMsgKey", this.backMsgKey.getValue(delegateTask).toString());
    }
}
