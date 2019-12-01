package com.soldier.modules.pmcspsc.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.soldier.common.utils.PageUtils;
import com.soldier.modules.pmcspsc.entity.PmItemInfoRetreatEntity;

import java.util.Map;

/**
 * 项目立项回退表
 *
 * @author:soldier
 * @Email:583403411@qq.com
 * @create:19-12-1上午9:58
 */
public interface PmItemInfoRetreatService extends IService<PmItemInfoRetreatEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

