package com.soldier.modules.pmcspsc.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.soldier.common.utils.PageUtils;
import com.soldier.modules.pmcspsc.entity.PmFundInfoEntity;

import java.util.Map;

/**
 * 经费预算/实际支出信息表
 *
 * @author:soldier
 * @Email:583403411@qq.com
 * @create:19-12-1上午9:58
 */
public interface PmFundInfoService extends IService<PmFundInfoEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

