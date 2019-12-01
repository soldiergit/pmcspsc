package com.soldier.modules.pmcspsc.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.soldier.common.utils.PageUtils;
import com.soldier.modules.pmcspsc.entity.PmTeamPersonInfoEntity;

import java.util.Map;

/**
 * 团队成员信息
 *
 * @author:soldier
 * @Email:583403411@qq.com
 * @create:19-12-1上午9:58
 */
public interface PmTeamPersonInfoService extends IService<PmTeamPersonInfoEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

