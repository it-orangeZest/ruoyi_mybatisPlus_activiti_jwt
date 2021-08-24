package com.ruoyi.act.mapper;

import java.util.List;
import com.ruoyi.act.domain.TProcessModel;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * 流程模型Mapper接口
 * 
 * @author ruoyi
 * @date 2021-08-24
 */
public interface TProcessModelMapper extends BaseMapper<TProcessModel>
{
    /**
     * 查询流程模型列表
     * 
     * @param tProcessModel 流程模型
     * @return 流程模型集合
     */
    public List<TProcessModel> selectTProcessModelList(TProcessModel tProcessModel);

}
