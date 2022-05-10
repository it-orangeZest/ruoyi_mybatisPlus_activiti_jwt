package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.MrCollection;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * 藏品库Mapper接口
 * 
 * @author ruoyi
 * @date 2022-05-10
 */
public interface MrCollectionMapper extends BaseMapper<MrCollection>
{
    /**
     * 查询藏品库列表
     * 
     * @param mrCollection 藏品库
     * @return 藏品库集合
     */
    public List<MrCollection> selectMrCollectionList(MrCollection mrCollection);

}
