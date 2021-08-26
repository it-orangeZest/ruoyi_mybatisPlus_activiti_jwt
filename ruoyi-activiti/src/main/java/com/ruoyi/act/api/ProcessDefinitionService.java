package com.ruoyi.act.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.ruoyi.act.config.GlobalConfig;
import com.ruoyi.act.domain.VO.DefinitionVO;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.uuid.UUID;
import org.activiti.editor.constants.ModelDataJsonConstants;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.repository.Model;
import org.activiti.engine.repository.ProcessDefinition;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.activiti.editor.constants.ModelDataJsonConstants;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * @author badcat
 * Date 2021/8/23
 * Time 11:13
 */
@Service
public class ProcessDefinitionService {

    @Autowired
    private RepositoryService repositoryService;

    /**
     * 获取所有最新版本的流程定义，按部署id排序
     * @return
     */
    public List<DefinitionVO> getDefinitions(){
        List<DefinitionVO> voList = new ArrayList<>();
        List<ProcessDefinition> list = this.repositoryService.createProcessDefinitionQuery()
                .latestVersion()
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
            return null;
        }
    }
}
