package com.ruoyi.act.controller.commom;

import com.ruoyi.act.api.ProcessDefinitionService;
import com.ruoyi.act.domain.VO.DefinitionVO;
import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.file.FileUploadUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.List;

/**
 * @author badcat
 * Date 2021/8/23
 * Time 12:05
 */
@Controller
@RequestMapping("/act/processDefinition")
public class ProcessDefinitionController extends BaseController {

    @Autowired
    private ProcessDefinitionService processDefinitionService;

    private String prefix = "act/definition";
    /**
     * 获取所有最新版本的流程定义，按部署id排序
     * @return
     */
    @RequestMapping("/getSysProcessList")
    public String getDefinitions(Model model){
        List<DefinitionVO> list = this.processDefinitionService.getDefinitions();
        model.addAttribute("sysProcessList", list);
        return prefix + "/sysProcessList";
    }

    /**
     * 读取流程资源
     *
     * @param processDefinitionId 流程定义ID
     * @param resourceName        资源名称
     */
    @RequestMapping(value = "/readResource")
    public void readResource(@RequestParam("pdid") String processDefinitionId, @RequestParam("resourceName") String resourceName, HttpServletResponse response)
            throws Exception {

        InputStream inputStream = this.processDefinitionService.readResource(processDefinitionId, resourceName);

        // 输出资源内容到相应对象
        byte[] b = new byte[1024];
        int len = -1;
        while ((len = inputStream.read(b, 0, 1024)) != -1) {
            response.getOutputStream().write(b, 0, len);
        }
    }

    @PostMapping( "/suspendOrActiveApply")
    @ResponseBody
    public AjaxResult suspendOrActiveApply(String id, String suspendState) {
        processDefinitionService.suspendOrActiveApply(id, suspendState);
        return AjaxResult.success();
    }

    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        try {
            return toAjax(processDefinitionService.deleteProcessDeploymentByIds(ids));
        }
        catch (Exception e) {
            return error(e.getMessage());
        }
    }

    @PostMapping("/upload")
    @ResponseBody
    public AjaxResult upload(@RequestParam("processDefinition") MultipartFile file) {
        try {
            if (!file.isEmpty()) {
                String extensionName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf('.') + 1);
                if (!"bpmn".equalsIgnoreCase(extensionName)
                        && !"zip".equalsIgnoreCase(extensionName)
                        && !"bar".equalsIgnoreCase(extensionName)) {
                    return error("流程定义文件仅支持 bpmn, zip 和 bar 格式！");
                }
                // p.s. 此时 FileUploadUtils.upload() 返回字符串 fileName 前缀为 Constants.RESOURCE_PREFIX，需剔除
                // 详见: FileUploadUtils.getPathFileName(...)
                String fileName = FileUploadUtils.upload(RuoYiConfig.getProfile() + "/processDefiniton", file);
                if (StringUtils.isNotBlank(fileName)) {
                    String realFilePath = RuoYiConfig.getProfile() + fileName.substring(Constants.RESOURCE_PREFIX.length());
                    this.processDefinitionService.deployProcessDefinition(realFilePath);
                    return success();
                }
            }
            return error("不允许上传空文件！");
        }
        catch (Exception e) {
            logger.error("上传流程定义文件失败！", e);
            return error(e.getMessage());
        }
    }

    /*@PostMapping("/convert2Model")
    @ResponseBody
    public AjaxResult convert2Model(String processDefinitionId){
        this.processDefinitionService.convert2Model(processDefinitionId);
    }*/

}
