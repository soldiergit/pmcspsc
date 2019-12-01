package com.soldier.modules.pmcspsc.controller;

import java.util.Arrays;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.soldier.modules.pmcspsc.entity.PmItemInfoRetreatEntity;
import com.soldier.modules.pmcspsc.service.PmItemInfoRetreatService;
import com.soldier.common.utils.PageUtils;
import com.soldier.common.utils.R;



/**
 * 项目立项回退表
 *
 * @author:soldier
 * @Email:583403411@qq.com
 * @create:19-12-1上午9:58
 */
@RestController
@RequestMapping("pm/item/retreat")
public class PmItemInfoRetreatController {
    @Autowired
    private PmItemInfoRetreatService pmItemInfoRetreatService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("pm:item:retreat:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = pmItemInfoRetreatService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{retreatId}")
    @RequiresPermissions("pm:item:retreat:info")
    public R info(@PathVariable("retreatId") Integer retreatId){
		PmItemInfoRetreatEntity pmItemInfoRetreat = pmItemInfoRetreatService.getById(retreatId);

        return R.ok().put("pmItemInfoRetreat", pmItemInfoRetreat);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("pm:item:retreat:save")
    public R save(@RequestBody PmItemInfoRetreatEntity pmItemInfoRetreat){
		pmItemInfoRetreatService.save(pmItemInfoRetreat);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("pm:item:retreat:update")
    public R update(@RequestBody PmItemInfoRetreatEntity pmItemInfoRetreat){
		pmItemInfoRetreatService.updateById(pmItemInfoRetreat);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("pm:item:retreat:delete")
    public R delete(@RequestBody Integer[] retreatIds){
		pmItemInfoRetreatService.removeByIds(Arrays.asList(retreatIds));

        return R.ok();
    }

}
