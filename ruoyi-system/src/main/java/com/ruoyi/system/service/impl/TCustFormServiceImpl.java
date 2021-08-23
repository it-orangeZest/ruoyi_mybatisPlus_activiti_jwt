package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.TCustFormMapper;
import com.ruoyi.system.domain.TCustForm;
import com.ruoyi.system.service.ITCustFormService;
import com.ruoyi.common.core.text.Convert;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

/**
 * 表单设计Service业务层处理
 * 
 * @author ruoyi
 * @date 2021-08-23
 */
@Service
public class TCustFormServiceImpl extends ServiceImpl<TCustFormMapper, TCustForm> implements ITCustFormService
{
    @Autowired
    private TCustFormMapper tCustFormMapper;

    /**
     * 查询表单设计列表
     * 
     * @param tCustForm 表单设计
     * @return 表单设计
     */
    @Override
    public List<TCustForm> selectTCustFormList(TCustForm tCustForm)
    {
        return tCustFormMapper.selectTCustFormList(tCustForm);
    }

}
