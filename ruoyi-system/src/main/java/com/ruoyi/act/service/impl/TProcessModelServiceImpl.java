package com.ruoyi.act.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.act.mapper.TProcessModelMapper;
import com.ruoyi.act.domain.TProcessModel;
import com.ruoyi.act.service.ITProcessModelService;
import com.ruoyi.common.core.text.Convert;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

/**
 * 流程模型Service业务层处理
 * 
 * @author ruoyi
 * @date 2021-08-24
 */
@Service
public class TProcessModelServiceImpl extends ServiceImpl<TProcessModelMapper, TProcessModel> implements ITProcessModelService
{
    @Autowired
    private TProcessModelMapper tProcessModelMapper;

    /**
     * 查询流程模型列表
     * 
     * @param tProcessModel 流程模型
     * @return 流程模型
     */
    @Override
    public List<TProcessModel> selectTProcessModelList(TProcessModel tProcessModel)
    {
        return tProcessModelMapper.selectTProcessModelList(tProcessModel);
    }

}
