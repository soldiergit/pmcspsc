package com.soldier.modules.pmcspsc.dao;

import com.soldier.modules.pmcspsc.entity.PmTeamInfoEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 团队信息
 * 
 * @author:soldier
 * @Email:583403411@qq.com
 * @create:19-12-1上午9:58
 */
@Mapper
public interface PmTeamInfoDao extends BaseMapper<PmTeamInfoEntity> {

    /**
     * 根据id查询，因为要实现一对多查询
     * @param teamId
     */
    PmTeamInfoEntity findById(Integer teamId);

    /**
     * 根据立项项目id查询，因为要实现一对多查询
     * @param itemInfoId
     */
    List<PmTeamInfoEntity> findByItemId(Integer itemInfoId);

    /**
     * 根据指导老师id查询，因为要实现一对多查询
     * @param userId
     */
    List<PmTeamInfoEntity> findByUserId(Long userId);
}
