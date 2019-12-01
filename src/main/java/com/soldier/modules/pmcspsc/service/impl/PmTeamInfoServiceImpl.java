package com.soldier.modules.pmcspsc.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.soldier.common.utils.PageUtils;
import com.soldier.common.utils.Query;

import com.soldier.modules.pmcspsc.dao.PmTeamInfoDao;
import com.soldier.modules.pmcspsc.entity.PmTeamInfoEntity;
import com.soldier.modules.pmcspsc.service.PmTeamInfoService;


@Service("pmTeamInfoService")
public class PmTeamInfoServiceImpl extends ServiceImpl<PmTeamInfoDao, PmTeamInfoEntity> implements PmTeamInfoService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<PmTeamInfoEntity> page = this.page(
                new Query<PmTeamInfoEntity>().getPage(params),
                new QueryWrapper<PmTeamInfoEntity>()
        );

        return new PageUtils(page);
    }

}