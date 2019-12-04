package com.soldier.modules.pmcspsc.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.soldier.common.utils.PageUtils;
import com.soldier.common.utils.Query;

import com.soldier.modules.pmcspsc.dao.PmFinishAttachDao;
import com.soldier.modules.pmcspsc.entity.PmFinishAttachEntity;
import com.soldier.modules.pmcspsc.service.PmFinishAttachService;


@Service("pmFinishAttachService")
public class PmFinishAttachServiceImpl extends ServiceImpl<PmFinishAttachDao, PmFinishAttachEntity> implements PmFinishAttachService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<PmFinishAttachEntity> page = this.page(
                new Query<PmFinishAttachEntity>().getPage(params),
                new QueryWrapper<PmFinishAttachEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    public PmFinishAttachEntity findByFinishInfoId(Integer finishInfoId) {

        QueryWrapper<PmFinishAttachEntity> qw = new QueryWrapper<>();
        qw.eq("finish_info_id", finishInfoId);

        return baseMapper.selectOne(qw);
    }

}