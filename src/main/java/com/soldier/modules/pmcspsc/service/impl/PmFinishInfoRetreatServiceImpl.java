package com.soldier.modules.pmcspsc.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.soldier.common.utils.PageUtils;
import com.soldier.common.utils.Query;
import com.soldier.modules.pmcspsc.dao.PmFinishInfoRetreatDao;
import com.soldier.modules.pmcspsc.entity.PmFinishInfoRetreatEntity;
import com.soldier.modules.pmcspsc.service.PmFinishInfoRetreatService;
import org.springframework.stereotype.Service;

import java.util.Map;


@Service("pmFinishInfoRetreatService")
public class PmFinishInfoRetreatServiceImpl extends ServiceImpl<PmFinishInfoRetreatDao, PmFinishInfoRetreatEntity> implements PmFinishInfoRetreatService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {

        QueryWrapper ew = new QueryWrapper<PmFinishInfoRetreatEntity>().setEntity(new PmFinishInfoRetreatEntity());

        Object key = params.get("key");
        Object finishInfoId = params.get("finishInfoId");
        if (key!=null&&key!="")ew.like("retreat_advise",key);
        if (finishInfoId!=null&&finishInfoId!="")ew.eq("finish_info_id",finishInfoId);

        IPage<PmFinishInfoRetreatEntity> page = this.page(
                new Query<PmFinishInfoRetreatEntity>().getPage(params),  ew
        );
        return new PageUtils(page);
    }

}