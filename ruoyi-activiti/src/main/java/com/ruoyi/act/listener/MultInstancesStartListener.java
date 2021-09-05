package com.ruoyi.act.listener;

import org.activiti.engine.delegate.DelegateExecution;
import org.activiti.engine.delegate.ExecutionListener;

import java.util.ArrayList;
import java.util.List;

/**
 * @author badcat
 * @date 2021-09-05 15:17
 */
public class MultInstancesStartListener implements ExecutionListener {
    @Override
    public void notify(DelegateExecution execution) {

        List<String> assigneeList = new ArrayList<>();
        assigneeList.add("lj");
        assigneeList.add("gw");
        assigneeList.add("hmxs");

        execution.setVariable("assigneeList", assigneeList);
        execution.setVariable("up", 0);
    }
}
