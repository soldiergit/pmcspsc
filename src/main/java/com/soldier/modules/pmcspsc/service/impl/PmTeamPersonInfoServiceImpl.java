package com.soldier.modules.pmcspsc.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.soldier.common.utils.PageUtils;
import com.soldier.common.utils.Query;

import com.soldier.modules.pmcspsc.dao.PmTeamPersonInfoDao;
import com.soldier.modules.pmcspsc.entity.PmTeamPersonInfoEntity;
import com.soldier.modules.pmcspsc.service.PmTeamPersonInfoService;


@Service("pmTeamPersonInfoService")
public class PmTeamPersonInfoServiceImpl extends ServiceImpl<PmTeamPersonInfoDao, PmTeamPersonInfoEntity> implements PmTeamPersonInfoService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<PmTeamPersonInfoEntity> page = this.page(
                new Query<PmTeamPersonInfoEntity>().getPage(params),
                new QueryWrapper<PmTeamPersonInfoEntity>()
        );

        return new PageUtils(page);
    }

}