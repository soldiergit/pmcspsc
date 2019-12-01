package com.soldier.modules.pmcspsc.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.soldier.common.utils.PageUtils;
import com.soldier.common.utils.Query;

import com.soldier.modules.pmcspsc.dao.PmItemAttachDao;
import com.soldier.modules.pmcspsc.entity.PmItemAttachEntity;
import com.soldier.modules.pmcspsc.service.PmItemAttachService;


@Service("pmItemAttachService")
public class PmItemAttachServiceImpl extends ServiceImpl<PmItemAttachDao, PmItemAttachEntity> implements PmItemAttachService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<PmItemAttachEntity> page = this.page(
                new Query<PmItemAttachEntity>().getPage(params),
                new QueryWrapper<PmItemAttachEntity>()
        );

        return new PageUtils(page);
    }

}