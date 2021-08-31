package com.ruoyi.act.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.github.pagehelper.Page;
import com.ruoyi.act.config.GlobalConfig;
import com.ruoyi.act.domain.TProcessModel;
import com.ruoyi.act.domain.VO.DefinitionVO;
import com.ruoyi.act.domain.VO.ProcessDefinitionVO;
import com.ruoyi.act.service.ITProcessModelService;
import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.utils.uuid.UUID;
import org.activiti.editor.constants.ModelDataJsonConstants;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.impl.persistence.entity.ProcessDefinitionEntityImpl;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.Model;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.repository.ProcessDefinitionQuery;
import org.activiti.engine.runtime.ProcessInstance;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.ZipInputStream;

/**
 * @author badcat
 * Date 2021/8/23
 * Time 11:13
 */
@Service
public class ProcessDefinitionService {

    @Autowired
    private RepositoryService repositoryService;

    @Autowired
    private RuntimeService runtimeService;

    @Autowired
    private ITProcessModelService itProcessModelService;

    /**
     * 获取所有最新版本的流程定义，按部署id排序
     * @return
     */
    public List<DefinitionVO> getDefinitions(){
        List<DefinitionVO> voList = new ArrayList<>();
        List<ProcessDefinition> list = this.repositoryService.createProcessDefinitionQuery()
                .latestVersion()
                .active()
                .orderByDeploymentId().asc()
                .list();
        for (ProcessDefinition e : list){
            DefinitionVO vo = new DefinitionVO();
            vo.setId(e.getId());
            vo.setDeploymentId(e.getDeploymentId());
            vo.setName(e.getName());
            vo.setKey(e.getKey());
            vo.setVersion(e.getVersion());
            vo.setResourceName(e.getResourceName());
            vo.setDiagramResourceName(e.getDiagramResourceName());
            voList.add(vo);
        }
        return voList;
    }

    /**
     * 读取流程资源
     * 可以用于获取流程的图片和xml
     * @param processDefinitionId 流程定义ID
     * @param resourceName        资源名称
     */
    public InputStream readResource(String processDefinitionId, String resourceName){
        //通过流程定义id获取流程定义对象
        ProcessDefinition processDefinition = this.repositoryService.createProcessDefinitionQuery()
                .processDefinitionId(processDefinitionId)
                .singleResult();

        //通过流程部署id和资源名称获取流
        InputStream resourceAsStream = repositoryService.getResourceAsStream(processDefinition.getDeploymentId(), resourceName);
        return resourceAsStream;
    }


    public String upload(HttpServletRequest request, MultipartFile multipartFile) {

        if (multipartFile.isEmpty()) {
            System.out.println("文件为空");
        }
        String fileName = multipartFile.getOriginalFilename();  // 文件名
        String suffixName = fileName.substring(fileName.lastIndexOf("."));  // 后缀名
        String filePath = GlobalConfig.BPMN_PathMapping; // 上传后的路径

        //本地路径格式转上传路径格式
        filePath = filePath.replace("\\", "/");
        filePath = filePath.replace("file:", "");

        // String filePath = request.getSession().getServletContext().getRealPath("/") + "bpmn/";
        fileName = UUID.randomUUID() + suffixName; // 新文件名
        File file = new File(filePath + fileName);
        if (!file.getParentFile().exists()) {
            file.getParentFile().mkdirs();
        }
        try {
            multipartFile.transferTo(file);
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return fileName;
    }

    /**
     * 保存流程模型
     * @param name
     * @param key
     * @param description
     * @param values
     */
    public String saveModel(String name, String key, String description, String values) {
        try {
            ObjectMapper objectMapper = new ObjectMapper();
            ObjectNode editorNode = objectMapper.createObjectNode();
            editorNode.put("id", "canvas");
            editorNode.put("resourceId", "canvas");
            ObjectNode stencilSetNode = objectMapper.createObjectNode();
            stencilSetNode.put("namespace", "http://b3mn.org/stencilset/bpmn2.0#");
            editorNode.put("stencilset", stencilSetNode);

            ObjectNode modelObjectNode = objectMapper.createObjectNode();
            modelObjectNode.put(ModelDataJsonConstants.MODEL_NAME, name);
            modelObjectNode.put(ModelDataJsonConstants.MODEL_REVISION, 1);
            description = StringUtils.defaultString(description);
            modelObjectNode.put(ModelDataJsonConstants.MODEL_DESCRIPTION, description);

            Model newModel = repositoryService.newModel();
            newModel.setMetaInfo(modelObjectNode.toString());
            newModel.setName(name);
            newModel.setKey(StringUtils.defaultString(key));

            repositoryService.saveModel(newModel);
            Model model = repositoryService.createModelQuery().modelKey(key).latestVersion().singleResult();
            String modelId = model.getId();
            repositoryService.addModelEditorSource(modelId, values.getBytes("utf-8"));

            return modelId;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 根据modelId获取模型xml字节
     * @param modelId
     * @return
     */
    public byte[] getBpmnXML(String modelId) {
        byte[] source = this.repositoryService.getModelEditorSource(modelId);
        return source;
    }

    /**
     *
     * @return
     */
    public String editModel(String modelId, String values){
        try {
            repositoryService.addModelEditorSource(modelId, values.getBytes("utf-8"));
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 删除流程模型
     * @param modelId
     */
    public void deleteModel(String modelId) {
        this.repositoryService.deleteModel(modelId);
    }

    /**
     * 将流程模型部署
     * @param modelId
     */
    public String deployModel(String modelId) {
        Model model = repositoryService.getModel(modelId);
        byte[] source = repositoryService.getModelEditorSource(modelId);

        String stringBPMN = new String(source);
        Deployment deployment = repositoryService.createDeployment()
                .addString("CreateWithBPMNJS.bpmn",stringBPMN)
                .name(model.getName())
                .key(modelId)
                .deploy();
        return deployment.getId();
    }

    /**
     * 获取部署管理页面列表数据
     * @param processDefinition
     * @param pageNum
     * @param pageSize
     */
    public Page<ProcessDefinitionVO> getDeployManagerList(ProcessDefinitionVO processDefinition, Integer pageNum, Integer pageSize) {
        Page<ProcessDefinitionVO> list = new Page<>();
        ProcessDefinitionQuery processDefinitionQuery = repositoryService.createProcessDefinitionQuery();
        processDefinitionQuery.orderByProcessDefinitionId().orderByProcessDefinitionVersion().desc();
        if (com.ruoyi.common.utils.StringUtils.isNotBlank(processDefinition.getName())) {
            processDefinitionQuery.processDefinitionNameLike("%" + processDefinition.getName() + "%");
        }
        if (com.ruoyi.common.utils.StringUtils.isNotBlank(processDefinition.getKey())) {
            processDefinitionQuery.processDefinitionKeyLike("%" + processDefinition.getKey() + "%");
        }
        if (com.ruoyi.common.utils.StringUtils.isNotBlank(processDefinition.getCategory())) {
            processDefinitionQuery.processDefinitionCategoryLike("%" + processDefinition.getCategory() + "%");
        }

        List<ProcessDefinition> processDefinitionList;
        if (pageNum != null && pageSize != null) {
            processDefinitionList = processDefinitionQuery.listPage((pageNum - 1) * pageSize, pageSize);
            list.setTotal(processDefinitionQuery.count());
            list.setPageNum(pageNum);
            list.setPageSize(pageSize);
        } else {
            processDefinitionList = processDefinitionQuery.list();
        }
        for (ProcessDefinition definition: processDefinitionList) {
            ProcessDefinitionEntityImpl entityImpl = (ProcessDefinitionEntityImpl) definition;
            ProcessDefinitionVO entity = new ProcessDefinitionVO();
            entity.setId(definition.getId());
            entity.setKey(definition.getKey());
            entity.setName(definition.getName());
            entity.setCategory(definition.getCategory());
            entity.setVersion(definition.getVersion());
            entity.setDescription(definition.getDescription());
            entity.setDeploymentId(definition.getDeploymentId());
            Deployment deployment = repositoryService.createDeploymentQuery()
                    .deploymentId(definition.getDeploymentId())
                    .singleResult();
            entity.setDeploymentTime(deployment.getDeploymentTime());
            entity.setDiagramResourceName(definition.getDiagramResourceName());
            entity.setResourceName(definition.getResourceName());
            entity.setSuspendState(entityImpl.getSuspensionState() + "");
            if (entityImpl.getSuspensionState() == 1) {
                entity.setSuspendStateName("已激活");
            } else {
                entity.setSuspendStateName("已挂起");
            }
            list.add(entity);
        }
        return list;
    }

    /**
     * 激活或挂起流程
     * @param id
     * @param suspendState
     */
    public void suspendOrActiveApply(String id, String suspendState) {
        if ("1".equals(suspendState)) {
            // 当流程定义被挂起时，已经发起的该流程定义的流程实例不受影响（如果选择级联挂起则流程实例也会被挂起）。
            // 当流程定义被挂起时，无法发起新的该流程定义的流程实例。
            // 直观变化：act_re_procdef 的 SUSPENSION_STATE_ 为 2
            repositoryService.suspendProcessDefinitionById(id);
        } else if ("2".equals(suspendState)) {
            repositoryService.activateProcessDefinitionById(id);
        }
    }

    /**
     * 删除流程定义
     * @param ids
     * @return
     */
    public int deleteProcessDeploymentByIds(String deploymentIds) throws Exception {
        String[] deploymentIdsArr = Convert.toStrArray(deploymentIds);
        int counter = 0;
        for (String deploymentId: deploymentIdsArr) {
            List<ProcessInstance> instanceList = runtimeService.createProcessInstanceQuery()
                    .deploymentId(deploymentId)
                    .list();
            if (!CollectionUtils.isEmpty(instanceList)) {
                // 存在流程实例的流程定义
                throw new Exception("删除失败，存在运行中的流程实例");
            }
            repositoryService.deleteDeployment(deploymentId, true); // true 表示级联删除引用，比如 act_ru_execution 数据
            counter++;
        }
        return counter;
    }

    /**
     * 根据附件部署流程
     * @param filePath
     * @throws FileNotFoundException
     */
    public void deployProcessDefinition(String filePath) throws Exception {

        Deployment deploy = null;
        if (StringUtils.isNotBlank(filePath)) {
            if (filePath.endsWith(".zip")) {
                ZipInputStream inputStream = new ZipInputStream(new FileInputStream(filePath));
                deploy = repositoryService.createDeployment()
                        .addZipInputStream(inputStream)
                        .deploy();
            } else if (filePath.endsWith(".bpmn")) {
                deploy = repositoryService.createDeployment()
                        .addInputStream(filePath, new FileInputStream(filePath))
                        .deploy();
            }

            if(deploy != null){
                List<ProcessDefinition> list = this.repositoryService.createProcessDefinitionQuery().deploymentId(deploy.getId())
                        .list();

                for(ProcessDefinition e : list){
                    InputStream inputStream = this.readResource(e.getId(), e.getResourceName());
                    byte[] bytes = new byte[0];
                    bytes = new byte[inputStream.available()];
                    inputStream.read(bytes);
                    String xml = new String(bytes);

                    String modelId = this.saveModel(e.getName(), e.getKey(),
                            "from upload file", xml);

                    TProcessModel tProcessModel = new TProcessModel();
                    tProcessModel.setProcessKey(e.getKey());
                    tProcessModel.setName(e.getName());
                    tProcessModel.setModelId(modelId);
                    tProcessModel.setStatus("act_model_status_004");
                    boolean save = this.itProcessModelService.save(tProcessModel);
                }
            }
        }
    }

    public ProcessDefinition getDefinitionByKey(String processKey) {
        ProcessDefinition processDefinition = this.repositoryService.createProcessDefinitionQuery()
                .processDefinitionKey(processKey)
                .latestVersion()
                .singleResult();
        return processDefinition;
    }

    /**
     * 流程定义转流程模型
     * @param processDefinitionId
     */
    /*public void convert2Model(String processDefinitionId) throws Exception {
        ProcessDefinition processDefinition = this.repositoryService.createProcessDefinitionQuery()
                .processDefinitionId(processDefinitionId)
                .singleResult();

        InputStream inputStream = this.readResource(processDefinitionId, processDefinition.getResourceName());
        byte[] bytes = new byte[0];
        bytes = new byte[inputStream.available()];
        inputStream.read(bytes);
        String xml = new String(bytes);

        String modelId = this.saveModel(processDefinition.getName(), processDefinition.getKey(),
                "from definition", xml);

        TProcessModel tProcessModel = new TProcessModel();
        //tProcessModel.set
    }*/
}
