package com.soldier.modules.pmcspsc.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.soldier.common.utils.PageUtils;
import com.soldier.common.utils.Query;

import com.soldier.modules.pmcspsc.dao.PmItemInfoRetreatDao;
import com.soldier.modules.pmcspsc.entity.PmItemInfoRetreatEntity;
import com.soldier.modules.pmcspsc.service.PmItemInfoRetreatService;


@Service("pmItemInfoRetreatService")
public class PmItemInfoRetreatServiceImpl extends ServiceImpl<PmItemInfoRetreatDao, PmItemInfoRetreatEntity> implements PmItemInfoRetreatService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {

        QueryWrapper ew = new QueryWrapper<PmItemInfoRetreatEntity>().setEntity(new PmItemInfoRetreatEntity());

        Object key = params.get("key");
        Object itemInfoId = params.get("itemInfoId");
        if (key!=null&&key!="")ew.like("retreat_advise",key);
        if (itemInfoId!=null&&itemInfoId!="")ew.eq("item_info_id",itemInfoId);

        IPage<PmItemInfoRetreatEntity> page = this.page(
                new Query<PmItemInfoRetreatEntity>().getPage(params),  ew
        );
        return new PageUtils(page);
    }

}