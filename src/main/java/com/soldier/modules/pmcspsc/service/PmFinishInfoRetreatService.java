package com.soldier.modules.pmcspsc.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.soldier.common.utils.PageUtils;
import com.soldier.modules.pmcspsc.entity.PmFinishInfoRetreatEntity;

import java.util.Map;

/**
 * 立项结题回退表
 *
 * @author:soldier
 * @Email:583403411@qq.com
 * @create:19-12-1上午9:58
 */
public interface PmFinishInfoRetreatService extends IService<PmFinishInfoRetreatEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

