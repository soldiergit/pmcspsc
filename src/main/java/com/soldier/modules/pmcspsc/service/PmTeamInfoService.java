package com.soldier.modules.pmcspsc.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.soldier.common.utils.PageUtils;
import com.soldier.modules.pmcspsc.entity.PmTeamInfoEntity;

import java.util.List;
import java.util.Map;

/**
 * 团队信息
 *
 * @author:soldier
 * @Email:583403411@qq.com
 * @create:19-12-1上午9:58
 */
public interface PmTeamInfoService extends IService<PmTeamInfoEntity> {
    /**
     * 分页
     */
    PageUtils queryPage(Map<String, Object> params);

    /**
     * 根据立项项目id查询
     */
    List<PmTeamInfoEntity> findByItemId(Integer itemInfoId);

    /**
     * 简单的更新自身，不更新其它表数据
     */
    void updateBySimple(PmTeamInfoEntity v);
}

