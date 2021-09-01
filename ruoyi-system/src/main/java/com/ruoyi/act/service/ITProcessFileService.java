package com.ruoyi.act.service;

import java.util.List;
import com.ruoyi.act.domain.TProcessFile;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 流程附件Service接口
 * 
 * @author ruoyi
 * @date 2021-09-01
 */
public interface ITProcessFileService extends IService<TProcessFile>
{
    /**
     * 查询流程附件列表
     * 
     * @param tProcessFile 流程附件
     * @return 流程附件集合
     */
    public List<TProcessFile> selectTProcessFileList(TProcessFile tProcessFile);

}
