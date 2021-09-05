package com.ruoyi.act.listener;

import com.ruoyi.common.utils.StringUtils;
import org.activiti.engine.delegate.DelegateExecution;
import org.activiti.engine.delegate.DelegateTask;
import org.activiti.engine.delegate.TaskListener;

/**
 * @author badcat
 * @date 2021-09-05 15:27
 */
public class MultInstancesCompleteListener implements TaskListener {
    @Override
    public void notify(DelegateTask delegateTask) {
        DelegateExecution execution = delegateTask.getExecution();
        Object type = delegateTask.getVariableLocal("type");
        if(type != null){
            if(StringUtils.equals(type.toString(), "act_common_approve_001")){
                Object up = execution.getVariable("up");
                if(up != null){
                    Integer integer_up = Integer.valueOf(up.toString());
                    execution.setVariable("up", integer_up+1);
                }
            }
        }
    }
}
