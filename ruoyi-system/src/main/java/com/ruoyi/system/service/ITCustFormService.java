package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.TCustForm;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 表单设计Service接口
 * 
 * @author ruoyi
 * @date 2021-08-23
 */
public interface ITCustFormService extends IService<TCustForm>
{
    /**
     * 查询表单设计列表
     * 
     * @param tCustForm 表单设计
     * @return 表单设计集合
     */
    public List<TCustForm> selectTCustFormList(TCustForm tCustForm);

}
