package com.soldier.modules.pmcspsc.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.soldier.common.utils.PageUtils;
import com.soldier.modules.pmcspsc.entity.PmFinishInfoEntity;

import java.util.Map;

/**
 * 结题信息表
 *
 * @author:soldier
 * @Email:583403411@qq.com
 * @create:19-12-1上午9:58
 */
public interface PmFinishInfoService extends IService<PmFinishInfoEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

