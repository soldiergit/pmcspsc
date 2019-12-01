package com.soldier.modules.pmcspsc.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.soldier.common.utils.PageUtils;
import com.soldier.modules.pmcspsc.entity.PmItemInfoEntity;

import java.util.Map;

/**
 * 项目立项申请表
 *
 * @author:soldier
 * @Email:583403411@qq.com
 * @create:19-12-1上午9:58
 */
public interface PmItemInfoService extends IService<PmItemInfoEntity> {

    //  分页
    PageUtils queryPage(Map<String, Object> params);

    //  审批
    void apply(Map<String, Object> params);
}

