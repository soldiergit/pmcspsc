package com.soldier.modules.pmcspsc.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.soldier.common.utils.PageUtils;
import com.soldier.modules.pmcspsc.entity.PmTeamInfoEntity;

import java.util.Map;

/**
 * 团队信息
 *
 * @author:soldier
 * @Email:583403411@qq.com
 * @create:19-12-1上午9:58
 */
public interface PmTeamInfoService extends IService<PmTeamInfoEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

