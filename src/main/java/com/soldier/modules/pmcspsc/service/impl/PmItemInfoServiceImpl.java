package com.soldier.modules.pmcspsc.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.soldier.common.utils.Query;
import com.soldier.modules.pmcspsc.entity.PmFundInfoEntity;
import com.soldier.modules.pmcspsc.entity.PmItemAttachEntity;
import com.soldier.modules.pmcspsc.service.PmFundInfoService;
import com.soldier.modules.pmcspsc.service.PmItemAttachService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.soldier.common.utils.PageUtils;

import com.soldier.modules.pmcspsc.dao.PmItemInfoDao;
import com.soldier.modules.pmcspsc.entity.PmItemInfoEntity;
import com.soldier.modules.pmcspsc.service.PmItemInfoService;


@Service("pmItemInfoService")
public class PmItemInfoServiceImpl extends ServiceImpl<PmItemInfoDao, PmItemInfoEntity> implements PmItemInfoService {

    @Autowired
    private PmFundInfoService pmFundInfoService;
    @Autowired
    private PmItemAttachService pmItemAttachService;
    
    @Override
    public PageUtils queryPage(Map<String, Object> params) {

        QueryWrapper ew = new QueryWrapper<PmItemInfoEntity>().setEntity(new PmItemInfoEntity());

        Object key = params.get("key");
        Object status = params.get("itemInfoStatus");
        Object userId = params.get("userId");
        if (key!=null&&key!="")ew.like("match_name",key);
        if (status!=null&&status!="")ew.eq("item_info_status",status);
        if (userId!=null&&userId!="")ew.eq("user_id",userId);

        IPage<PmItemInfoEntity> page = this.page(
                new Query<PmItemInfoEntity>().getPage(params),  ew
        );
        return new PageUtils(page);
    }

    /**
     * 审批
     * @param params
     */
    @Override
    public void apply(Map<String, Object> params) {
        Integer itemInfoId = Integer.parseInt(params.get("id").toString());

        PmItemInfoEntity pmItemInfoEntity = this.getById(itemInfoId);

        pmItemInfoEntity.setItemInfoStatus(Integer.parseInt(params.get("status").toString()));

        this.updateById(pmItemInfoEntity);
    }

    /**
     * 查询教师的所有立项项目
     * @param userId
     */
    @Override
    public List<PmItemInfoEntity> findItemByUserId(Integer userId) {

        QueryWrapper ew = new QueryWrapper<PmItemInfoEntity>().setEntity(new PmItemInfoEntity());

        ew.eq("user_id", userId);

        return super.list(ew);
    }

    /**
     * 简单的更新自身，不更新其它表数据
     * @param itemInfoEntity
     */
    @Override
    public void updateBySimple(PmItemInfoEntity itemInfoEntity) {
        super.updateById(itemInfoEntity);
    }

    /**
     * 重写底层方法：保存--因为还要保存经费预算/实际支出信息 和 附件
     * @param entity
     */
    @Override
    public boolean save(PmItemInfoEntity entity) {

        //  保存项目基本信息
        boolean res = super.save(entity);

        PmFundInfoEntity pfi = entity.getPmFundInfoEntity();
        PmItemAttachEntity pia = entity.getPmItemAttachEntity();

        pfi.setItemInfoId(entity.getItemInfoId());
        pia.setItemInfoId(entity.getItemInfoId());

        //合计预算
        pfi.setTotalCost(pfi.getTotalCost());

        //  保存经费预算/实际支出信息 和 附件
        pmItemAttachService.save(pia);
        pmFundInfoService.save(pfi);

        return res;
    }

    /**
     * 重写底层方法：查询--因为还要查询出经费预算/实际支出信息 和 附件
     * @param id
     */
    @Override
    public PmItemInfoEntity getById(Serializable id) {
        //  dao层实现一对一关联查询
        return baseMapper.findById((Integer) id);
    }

    /**
     * 重写底层方法：更新--因为还要更新经费预算/实际支出信息 和 附件
     * @param entity
     * @return
     */
    @Override
    public boolean updateById(PmItemInfoEntity entity) {

        //  首先更新经费预算/实际支出信息
        pmFundInfoService.updateById(entity.getPmFundInfoEntity());

        PmItemAttachEntity pia = entity.getPmItemAttachEntity();

        if (!entity.getItemInfoId().equals(pia.getItemInfoId())){
            //修改附件：删除原来的重新添加
            PmItemInfoEntity temp = getById(entity.getItemInfoId());
            pmItemAttachService.removeById(temp.getPmItemAttachEntity().getAttachId());
            pia.setItemInfoId(entity.getItemInfoId());
            pmItemAttachService.save(pia);
        }

        //  最后更新项目基本信息
        return super.updateById(entity);
    }
}