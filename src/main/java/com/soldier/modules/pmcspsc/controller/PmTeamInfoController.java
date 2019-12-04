package com.soldier.modules.pmcspsc.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import com.soldier.modules.pmcspsc.entity.PmTeamPersonInfoEntity;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.soldier.modules.pmcspsc.entity.PmTeamInfoEntity;
import com.soldier.modules.pmcspsc.service.PmTeamInfoService;
import com.soldier.common.utils.PageUtils;
import com.soldier.common.utils.R;



/**
 * 团队信息
 *
 * @author:soldier
 * @Email:583403411@qq.com
 * @create:19-12-1上午9:58
 */
@RestController
@RequestMapping("pm/team")
public class PmTeamInfoController {
    @Autowired
    private PmTeamInfoService pmTeamInfoService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("pm:team:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = pmTeamInfoService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{teamId}")
    @RequiresPermissions("pm:team:info")
    public R info(@PathVariable("teamId") Integer teamId){
		PmTeamInfoEntity pmTeamInfo = pmTeamInfoService.getById(teamId);

        return R.ok().put("pmTeamInfo", pmTeamInfo);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("pm:team:save")
    public R save(@RequestBody PmTeamInfoEntity pmTeamInfo){
		pmTeamInfoService.save(pmTeamInfo);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("pm:team:update")
    public R update(@RequestBody PmTeamInfoEntity pmTeamInfo){
		pmTeamInfoService.updateById(pmTeamInfo);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("pm:team:delete")
    public R delete(@RequestBody Integer[] teamIds){
		pmTeamInfoService.removeByIds(Arrays.asList(teamIds));

        return R.ok();
    }

}
