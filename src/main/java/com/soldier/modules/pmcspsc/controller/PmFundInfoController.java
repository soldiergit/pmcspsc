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

import com.soldier.modules.pmcspsc.entity.PmFundInfoEntity;
import com.soldier.modules.pmcspsc.service.PmFundInfoService;
import com.soldier.common.utils.PageUtils;
import com.soldier.common.utils.R;



/**
 * 经费预算/实际支出信息表
 *
 * @author:soldier
 * @Email:583403411@qq.com
 * @create:19-12-1上午9:58
 */
@RestController
@RequestMapping("pm/fund")
public class PmFundInfoController {
    @Autowired
    private PmFundInfoService pmFundInfoService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("pm:fund:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = pmFundInfoService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{budgetId}")
    @RequiresPermissions("pm:fund:info")
    public R info(@PathVariable("budgetId") Integer budgetId){
		PmFundInfoEntity pmFundInfo = pmFundInfoService.getById(budgetId);

        return R.ok().put("pmFundInfo", pmFundInfo);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("pm:fund:save")
    public R save(@RequestBody PmFundInfoEntity pmFundInfo){
		pmFundInfoService.save(pmFundInfo);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("pm:fund:update")
    public R update(@RequestBody PmFundInfoEntity pmFundInfo){
		pmFundInfoService.updateById(pmFundInfo);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("pm:fund:delete")
    public R delete(@RequestBody Integer[] budgetIds){
		pmFundInfoService.removeByIds(Arrays.asList(budgetIds));

        return R.ok();
    }

}
