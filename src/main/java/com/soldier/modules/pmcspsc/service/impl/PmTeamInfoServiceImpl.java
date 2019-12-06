package com.soldier.modules.pmcspsc.service.impl;

import com.soldier.modules.pmcspsc.service.PmTeamPersonInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.List;
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

    @Autowired
    private PmTeamPersonInfoService pmTeamPersonInfoService;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {

        QueryWrapper ew = new QueryWrapper<PmTeamInfoEntity>().setEntity(new PmTeamInfoEntity());

        Object key = params.get("key");
        Object userId = params.get("userId");
        Object itemInfoId = params.get("itemInfoId");
        if (key!=null&&key!="")ew.like("match_title",key);
        if (userId!=null&&userId!="")ew.eq("user_id",userId);
        if (itemInfoId!=null&&itemInfoId!="")ew.eq("item_info_id",itemInfoId);

        IPage<PmTeamInfoEntity> page = this.page(
                new Query<PmTeamInfoEntity>().getPage(params),  ew
        );
        return new PageUtils(page);
    }

    @Override
    public List<PmTeamInfoEntity> findByItemId(Integer itemInfoId) {
        return baseMapper.findByItemId(itemInfoId);
    }

    @Override
    public void updateBySimple(PmTeamInfoEntity v) {
        super.updateById(v);
    }

    /**
     * 重写底层方法：保存，因为还要保存团队成员信息
     * @param entity
     */
    @Override
    public boolean save(PmTeamInfoEntity entity) {

        //  先保存团队信息
        boolean res = super.save(entity);

        //  保存团队成员信息
        entity.getPmTeamPersonInfoEntities().forEach(v ->{
            v.setPersonTeamInfoId(entity.getTeamId());
            pmTeamPersonInfoService.save(v);
        });

        return res;
    }

    /**
     * 重写底层方法：查询，因为还要一对多查询出团队成员信息
     * @param id
     */
    @Override
    public PmTeamInfoEntity getById(Serializable id) {
        return baseMapper.findById((Integer) id);
    }

    /**
     * 重写底层方法：更新--因为还要更新团队成员信息(只能删除了重新添加)
     * @param entity
     * @return
     */
    @Override
    public boolean updateById(PmTeamInfoEntity entity) {

        //  首先删除旧的团队成员
        PmTeamInfoEntity oldEntity = getById(entity.getTeamId());
        oldEntity.getPmTeamPersonInfoEntities().forEach(v->{
            pmTeamPersonInfoService.removeById(v);
        });

        //  然后保存新的团队成员
        entity.getPmTeamPersonInfoEntities().forEach(v->{
            //  因为前端修改成员信息的时候已经把团队id（teamId）一并保存了
            v.setPersonTeamInfoId(entity.getTeamId());
            pmTeamPersonInfoService.saveOrUpdate(v);
        });

        //  最后更新团队基本信息
        return super.updateById(entity);
    }
}