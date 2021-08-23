package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.TCustForm;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * 表单设计Mapper接口
 * 
 * @author ruoyi
 * @date 2021-08-23
 */
public interface TCustFormMapper extends BaseMapper<TCustForm>
{
    /**
     * 查询表单设计列表
     * 
     * @param tCustForm 表单设计
     * @return 表单设计集合
     */
    public List<TCustForm> selectTCustFormList(TCustForm tCustForm);

}
