package com.soldier.modules.pmcspsc.controller;

import com.soldier.common.utils.PageUtils;
import com.soldier.common.utils.R;
import com.soldier.modules.pmcspsc.entity.PmFinishInfoRetreatEntity;
import com.soldier.modules.pmcspsc.service.PmFinishInfoRetreatService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;


/**
 * 立项结题回退表
 *
 * @author:soldier
 * @Email:583403411@qq.com
 * @create:19-12-1上午9:58
 */
@RestController
@RequestMapping("pm/finish/retreat")
public class PmFinishInfoRetreatController {
    @Autowired
    private PmFinishInfoRetreatService pmFinishInfoRetreatService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("pm:finish:retreat:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = pmFinishInfoRetreatService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{retreatId}")
    @RequiresPermissions("pm:finish:retreat:info")
    public R info(@PathVariable("retreatId") Integer retreatId){
        PmFinishInfoRetreatEntity pmFinishInfoRetreat = pmFinishInfoRetreatService.getById(retreatId);

        return R.ok().put("pmFinishInfoRetreat", pmFinishInfoRetreat);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("pm:finish:retreat:save")
    public R save(@RequestBody PmFinishInfoRetreatEntity pmFinishInfoRetreat){
        pmFinishInfoRetreatService.save(pmFinishInfoRetreat);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("pm:finish:retreat:update")
    public R update(@RequestBody PmFinishInfoRetreatEntity pmFinishInfoRetreat){
        pmFinishInfoRetreatService.updateById(pmFinishInfoRetreat);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("pm:finish:retreat:delete")
    public R delete(@RequestBody Integer[] retreatIds){
        pmFinishInfoRetreatService.removeByIds(Arrays.asList(retreatIds));

        return R.ok();
    }

}
