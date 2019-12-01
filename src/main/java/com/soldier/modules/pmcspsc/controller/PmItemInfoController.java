package com.soldier.modules.pmcspsc.controller;

import java.util.Arrays;
import java.util.Date;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.soldier.modules.pmcspsc.entity.PmItemInfoEntity;
import com.soldier.modules.pmcspsc.service.PmItemInfoService;
import com.soldier.common.utils.PageUtils;
import com.soldier.common.utils.R;



/**
 * 项目立项申请表
 *
 * @author:soldier
 * @Email:583403411@qq.com
 * @create:19-12-1上午9:58
 */
@RestController
@RequestMapping("pm/item")
public class PmItemInfoController {
    @Autowired
    private PmItemInfoService pmItemInfoService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("pm:item:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = pmItemInfoService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{itemInfoId}")
    @RequiresPermissions("pm:item:info")
    public R info(@PathVariable("itemInfoId") Integer itemInfoId){
		PmItemInfoEntity pmItemInfo = pmItemInfoService.getById(itemInfoId);

        return R.ok().put("pmItemInfo", pmItemInfo);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("pm:item:save")
    public R save(@RequestBody PmItemInfoEntity pmItemInfo){
		pmItemInfoService.save(pmItemInfo);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("pm:item:update")
    public R update(@RequestBody PmItemInfoEntity pmItemInfo){
		pmItemInfoService.updateById(pmItemInfo);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("pm:item:delete")
    public R delete(@RequestBody Integer[] itemInfoIds){
		pmItemInfoService.removeByIds(Arrays.asList(itemInfoIds));

        return R.ok();
    }

    /**
     * 审批
     */
    @RequestMapping("/apply")
    @RequiresPermissions("pm:item:info")
    public R apply(@RequestParam Map<String, Object> params){

        pmItemInfoService.apply(params);

        return R.ok();
    }

}
