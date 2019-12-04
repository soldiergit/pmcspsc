package com.soldier.modules.pmcspsc.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.soldier.common.utils.PageUtils;
import com.soldier.common.utils.Query;

import com.soldier.modules.pmcspsc.dao.PmFundInfoDao;
import com.soldier.modules.pmcspsc.entity.PmFundInfoEntity;
import com.soldier.modules.pmcspsc.service.PmFundInfoService;


@Service("pmFundInfoService")
public class PmFundInfoServiceImpl extends ServiceImpl<PmFundInfoDao, PmFundInfoEntity> implements PmFundInfoService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<PmFundInfoEntity> page = this.page(
                new Query<PmFundInfoEntity>().getPage(params),
                new QueryWrapper<PmFundInfoEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    public PmFundInfoEntity findByItemInfoId(Integer itemInfoId) {

        QueryWrapper<PmFundInfoEntity> qw = new QueryWrapper<>();
        qw.eq("item_info_id", itemInfoId);

        return baseMapper.selectOne(qw);
    }

    @Override
    public PmFundInfoEntity findByFinishInfoId(Integer finishInfoId) {

        QueryWrapper<PmFundInfoEntity> qw = new QueryWrapper<>();
        qw.eq("finish_info_id", finishInfoId);

        return baseMapper.selectOne(qw);
    }

}