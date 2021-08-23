package com.ruoyi.act.api;

import com.ruoyi.act.domain.VO.DefinitionVO;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.repository.ProcessDefinition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
