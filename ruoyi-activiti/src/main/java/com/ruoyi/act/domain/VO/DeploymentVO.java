package com.ruoyi.act.domain.VO;

import java.util.Date;

/**
 * @author badcat
 * @date 2021-07-26 11:55
 */
public class DeploymentVO {
    private String id;
    private String name;
    private Date deploymentTime;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getDeploymentTime() {
        return deploymentTime;
    }

    public void setDeploymentTime(Date deploymentTime) {
        this.deploymentTime = deploymentTime;
    }
}
