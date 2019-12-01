package com.soldier.modules.pmcspsc.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.soldier.common.utils.PageUtils;
import com.soldier.common.utils.Query;

import com.soldier.modules.pmcspsc.dao.PmFinishInfoDao;
import com.soldier.modules.pmcspsc.entity.PmFinishInfoEntity;
import com.soldier.modules.pmcspsc.service.PmFinishInfoService;


@Service("pmFinishInfoService")
public class PmFinishInfoServiceImpl extends ServiceImpl<PmFinishInfoDao, PmFinishInfoEntity> implements PmFinishInfoService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<PmFinishInfoEntity> page = this.page(
                new Query<PmFinishInfoEntity>().getPage(params),
                new QueryWrapper<PmFinishInfoEntity>()
        );

        return new PageUtils(page);
    }

}