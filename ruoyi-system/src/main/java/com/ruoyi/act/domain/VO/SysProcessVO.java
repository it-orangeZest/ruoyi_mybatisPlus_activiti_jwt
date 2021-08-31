package com.ruoyi.act.domain.VO;

/**
 * @author badcat
 * @date 2021-07-27 16:21
 */
public class SysProcessVO {
    private Long processModelId;

    private String definitionId;

    private String processkey;

    private Long deptId;

    private String name;

    private Long formId;

    private String ResourceName;

    private String DiagramResourceName;

    public String getProcesskey() {
        return processkey;
    }

    public void setProcesskey(String processkey) {
        this.processkey = processkey;
    }

    public Long getDeptId() {
        return deptId;
    }

    public void setDeptId(Long deptId) {
        this.deptId = deptId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getFormId() {
        return formId;
    }

    public void setFormId(Long formId) {
        this.formId = formId;
    }

    public String getResourceName() {
        return ResourceName;
    }

    public void setResourceName(String resourceName) {
        ResourceName = resourceName;
    }

    public String getDiagramResourceName() {
        return DiagramResourceName;
    }

    public void setDiagramResourceName(String diagramResourceName) {
        DiagramResourceName = diagramResourceName;
    }

    public Long getProcessModelId() {
        return processModelId;
    }

    public void setProcessModelId(Long processModelId) {
        this.processModelId = processModelId;
    }

    public String getDefinitionId() {
        return definitionId;
    }

    public void setDefinitionId(String definitionId) {
        this.definitionId = definitionId;
    }
}
