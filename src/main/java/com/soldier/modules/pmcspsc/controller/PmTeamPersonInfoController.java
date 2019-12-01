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

import com.soldier.modules.pmcspsc.entity.PmTeamPersonInfoEntity;
import com.soldier.modules.pmcspsc.service.PmTeamPersonInfoService;
import com.soldier.common.utils.PageUtils;
import com.soldier.common.utils.R;



/**
 * 团队成员信息
 *
 * @author:soldier
 * @Email:583403411@qq.com
 * @create:19-12-1上午9:58
 */
@RestController
@RequestMapping("pm/person")
public class PmTeamPersonInfoController {
    @Autowired
    private PmTeamPersonInfoService pmTeamPersonInfoService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("pm:person:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = pmTeamPersonInfoService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{personInfoId}")
    @RequiresPermissions("pm:person:info")
    public R info(@PathVariable("personInfoId") Integer personInfoId){
		PmTeamPersonInfoEntity pmTeamPersonInfo = pmTeamPersonInfoService.getById(personInfoId);

        return R.ok().put("pmTeamPersonInfo", pmTeamPersonInfo);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("pm:person:save")
    public R save(@RequestBody PmTeamPersonInfoEntity pmTeamPersonInfo){
		pmTeamPersonInfoService.save(pmTeamPersonInfo);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("pm:person:update")
    public R update(@RequestBody PmTeamPersonInfoEntity pmTeamPersonInfo){
		pmTeamPersonInfoService.updateById(pmTeamPersonInfo);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("pm:person:delete")
    public R delete(@RequestBody Integer[] personInfoIds){
		pmTeamPersonInfoService.removeByIds(Arrays.asList(personInfoIds));

        return R.ok();
    }

}
