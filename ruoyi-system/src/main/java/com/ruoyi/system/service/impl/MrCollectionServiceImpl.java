package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.MrCollectionMapper;
import com.ruoyi.system.domain.MrCollection;
import com.ruoyi.system.service.IMrCollectionService;
import com.ruoyi.common.core.text.Convert;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

/**
 * 藏品库Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-05-10
 */
@Service
public class MrCollectionServiceImpl extends ServiceImpl<MrCollectionMapper, MrCollection> implements IMrCollectionService
{
    @Autowired
    private MrCollectionMapper mrCollectionMapper;

    /**
     * 查询藏品库列表
     * 
     * @param mrCollection 藏品库
     * @return 藏品库
     */
    @Override
    public List<MrCollection> selectMrCollectionList(MrCollection mrCollection)
    {
        return mrCollectionMapper.selectMrCollectionList(mrCollection);
    }

}
