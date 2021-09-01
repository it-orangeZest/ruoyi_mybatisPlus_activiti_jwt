package com.ruoyi.act.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.act.mapper.TProcessFileMapper;
import com.ruoyi.act.domain.TProcessFile;
import com.ruoyi.act.service.ITProcessFileService;
import com.ruoyi.common.core.text.Convert;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

/**
 * 流程附件Service业务层处理
 * 
 * @author ruoyi
 * @date 2021-09-01
 */
@Service
public class TProcessFileServiceImpl extends ServiceImpl<TProcessFileMapper, TProcessFile> implements ITProcessFileService
{
    @Autowired
    private TProcessFileMapper tProcessFileMapper;

    /**
     * 查询流程附件列表
     * 
     * @param tProcessFile 流程附件
     * @return 流程附件
     */
    @Override
    public List<TProcessFile> selectTProcessFileList(TProcessFile tProcessFile)
    {
        return tProcessFileMapper.selectTProcessFileList(tProcessFile);
    }

}
