package com.soldier.modules.pmcspsc.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.soldier.common.utils.PageUtils;
import com.soldier.modules.pmcspsc.entity.PmItemInfoEntity;

import java.util.List;
import java.util.Map;

/**
 * 项目立项申请表
 *
 * @author:soldier
 * @Email:583403411@qq.com
 * @create:19-12-1上午9:58
 */
public interface PmItemInfoService extends IService<PmItemInfoEntity> {

    /**
     * 分页
     */
    PageUtils queryPage(Map<String, Object> params);

    /**
     * 审批
     */
    void apply(Map<String, Object> params);

    /**
     * 根据指导老师id查询，因为要实现一对多查询
     */
    List<PmItemInfoEntity> findItemByUserId(Integer userId);

    /**
     * 简单的更新自身，不更新其它表数据
     */
    void updateBySimple(PmItemInfoEntity itemInfoEntity);
}

