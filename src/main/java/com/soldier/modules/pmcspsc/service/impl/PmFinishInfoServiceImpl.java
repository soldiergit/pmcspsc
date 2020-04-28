package com.soldier.modules.pmcspsc.service.impl;

import com.soldier.common.utils.RedisUtils;
import com.soldier.config.RabbitMQConfig;
import com.soldier.modules.pmcspsc.entity.PmFinishAttachEntity;
import com.soldier.modules.pmcspsc.entity.PmFundInfoEntity;
import com.soldier.modules.pmcspsc.entity.PmItemInfoEntity;
import com.soldier.modules.pmcspsc.service.*;
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

import com.soldier.modules.pmcspsc.dao.PmFinishInfoDao;
import com.soldier.modules.pmcspsc.entity.PmFinishInfoEntity;


@Service("pmFinishInfoService")
public class PmFinishInfoServiceImpl extends ServiceImpl<PmFinishInfoDao, PmFinishInfoEntity> implements PmFinishInfoService {

    @Autowired
    private PmItemInfoService pmItemInfoService;
    @Autowired
    private PmTeamInfoService pmTeamInfoService;
    @Autowired
    private PmFundInfoService pmFundInfoService;
    @Autowired
    private PmFinishAttachService pmFinishAttachService;
    @Autowired
    private RedisUtils redisUtils;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {

        QueryWrapper ew = new QueryWrapper<PmFinishInfoEntity>().setEntity(new PmFinishInfoEntity());

        Object key = params.get("key");
        Object itemInfoId = params.get("itemInfoId");
        Object userId = params.get("userId");
        Object status = params.get("finishInfoStatus");
        if (key!=null&&key!="")ew.like("item_info_id",key);
        if (itemInfoId!=null&&itemInfoId!="")ew.eq("item_info_id",itemInfoId);
        if (userId!=null&&userId!="")ew.eq("user_id",userId);
        if (status!=null&&status!="")ew.eq("finish_info_status",status);

        IPage<PmItemInfoEntity> page = this.page(
                new Query<PmFinishInfoEntity>().getPage(params),  ew
        );
        return new PageUtils(page);
    }

    /**
     * 简单的更新自身，不更新其它表数据
     */
    @Override
    public void apply(Map<String, Object> params) {
        Integer itemInfoId = Integer.parseInt(params.get("id").toString());

        PmFinishInfoEntity pmFinishInfoEntity = this.getById(itemInfoId);

        pmFinishInfoEntity.setFinishInfoStatus(Integer.parseInt(params.get("status").toString()));

        super.updateById(pmFinishInfoEntity);
    }

    @Override
    public Integer selectFinishSaveStatus(PmFinishInfoEntity pmFinishInfo) {

        QueryWrapper ew = new QueryWrapper<PmFinishInfoEntity>().setEntity(new PmFinishInfoEntity());
        Integer userId = pmFinishInfo.getUserId();
        Integer itemInfoId = pmFinishInfo.getItemInfoId();
        if (itemInfoId!=null)ew.eq("item_info_id",itemInfoId);
        if (userId!=null)ew.eq("user_id",userId);

        List list = this.baseMapper.selectList(ew);
        // 有数据
        if (list.size() > 0) {
            return 0;
        } else {
            // 数据库无数据，查询redis
            // true(0)：成功
            // false(-1)：保存失败
            // null(2345)： 排队中
            String key = RabbitMQConfig.REDIS_KEY + pmFinishInfo.getUserId() +","+pmFinishInfo.getItemInfoId();
            Boolean saveResult = redisUtils.get(key, Boolean.class);
            if (saveResult == null) {
                return 2345;
            } else if (saveResult) {
                return 0;
            } else {
                return -1;
            }
        }
    }

    /**
     * 重写底层方法：保存--因为还要保存经费预算/实际支出信息 和 附件
     * @param entity
     */
    @Override
    public boolean save(PmFinishInfoEntity entity) {

        //  先保存结题基本信息
        boolean res = super.save(entity);

        //附件
        PmFinishAttachEntity attachEntity = entity.getPmFinishAttachEntity();
        attachEntity.setFinishInfoId(entity.getFinishInfoId());
        pmFinishAttachService.save(attachEntity);

        //修改当前结题项目下所有参赛队伍的获奖情况
        entity.getPmTeamInfoEntities().forEach(v->{
            pmTeamInfoService.updateBySimple(v);
        });

        //新增赛事的支出
        PmFundInfoEntity pfi = entity.getPmFundInfoEntity();
        pfi.setTotalCost(pfi.getTotalCost());
        pfi.setFinishInfoId(entity.getFinishInfoId());
        pmFundInfoService.save(pfi);

        //更新立项项目状态
        PmItemInfoEntity pmItemInfoEntity = pmItemInfoService.getById(entity.getItemInfoId());
        pmItemInfoEntity.setItemInfoFinish(1);
        pmItemInfoService.updateBySimple(pmItemInfoEntity);

        return res;
    }

    /**
     * 重写底层方法：查询--因为还要查询出经费预算/实际支出信息 和 附件
     */
    @Override
    public PmFinishInfoEntity getById(Serializable id) {

        //  首先查询出结题信息
        PmFinishInfoEntity entity = super.getById(id);

        //  立项信息
        Integer itemInfoId = entity.getItemInfoId();
        entity.setPmItemInfoEntity(pmItemInfoService.getById(itemInfoId));

        //  获取实际预算
        entity.setPmFundInfoEntity(pmFundInfoService.findByFinishInfoId((Integer) id));

        //  参赛队伍信息队伍
        entity.setPmTeamInfoEntities(pmTeamInfoService.findByItemId(itemInfoId));

        //  结题报告书
        entity.setPmFinishAttachEntity(pmFinishAttachService.findByFinishInfoId((Integer) id));

        return entity;
    }

    /**
     * 重写底层方法：更新--因为还要更新经费预算/实际支出信息 和 附件
     */
    @Override
    public boolean updateById(PmFinishInfoEntity entity) {

        boolean res = super.updateById(entity);

        //修改当前结题项目下所有参赛队伍的获奖情况
        entity.getPmTeamInfoEntities().forEach(v->{
            pmTeamInfoService.updateBySimple(v);
        });

        //支出
        PmFundInfoEntity pfi = entity.getPmFundInfoEntity();
        pfi.setTotalCost(pfi.getTotalCost());
        pmFundInfoService.updateById(pfi);

        //修改附件
        PmFinishInfoEntity infoEntity = getById(entity.getFinishInfoId());
        PmFinishAttachEntity attachEntity = infoEntity.getPmFinishAttachEntity();
        //  先删除
        pmFinishAttachService.removeById(attachEntity);
        PmFinishAttachEntity newAttachEntity = entity.getPmFinishAttachEntity();
        newAttachEntity.setFinishInfoId(entity.getFinishInfoId());
        //  再重新添加
        pmFinishAttachService.save(newAttachEntity);

        return res;
    }
}