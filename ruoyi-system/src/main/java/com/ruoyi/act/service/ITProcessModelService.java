package com.ruoyi.act.service;

import java.util.List;
import com.ruoyi.act.domain.TProcessModel;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 流程模型Service接口
 * 
 * @author ruoyi
 * @date 2021-08-24
 */
public interface ITProcessModelService extends IService<TProcessModel>
{
    /**
     * 查询流程模型列表
     * 
     * @param tProcessModel 流程模型
     * @return 流程模型集合
     */
    public List<TProcessModel> selectTProcessModelList(TProcessModel tProcessModel);

}
