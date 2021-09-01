package com.ruoyi.act.mapper;

import java.util.List;
import com.ruoyi.act.domain.TProcessFile;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * 流程附件Mapper接口
 * 
 * @author ruoyi
 * @date 2021-09-01
 */
public interface TProcessFileMapper extends BaseMapper<TProcessFile>
{
    /**
     * 查询流程附件列表
     * 
     * @param tProcessFile 流程附件
     * @return 流程附件集合
     */
    public List<TProcessFile> selectTProcessFileList(TProcessFile tProcessFile);

}
