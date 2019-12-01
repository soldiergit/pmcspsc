package com.soldier.modules.pmcspsc.dao;

import com.soldier.modules.pmcspsc.entity.PmItemInfoEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 项目立项申请表
 * 
 * @author:soldier
 * @Email:583403411@qq.com
 * @create:19-12-1上午9:58
 */
@Mapper
public interface PmItemInfoDao extends BaseMapper<PmItemInfoEntity> {

    //  另写一个查询方法，因为还要查询出经费预算/实际支出信息 和 附件
    PmItemInfoEntity findById(Integer itemInfoId);

}
