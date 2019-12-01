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

import com.soldier.modules.pmcspsc.entity.PmFinishAttachEntity;
import com.soldier.modules.pmcspsc.service.PmFinishAttachService;
import com.soldier.common.utils.PageUtils;
import com.soldier.common.utils.R;



/**
 * 结题附件
 *
 * @author:soldier
 * @Email:583403411@qq.com
 * @create:19-12-1上午9:58
 */
@RestController
@RequestMapping("pm/finish/attach")
public class PmFinishAttachController {
    @Autowired
    private PmFinishAttachService pmFinishAttachService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("pm:finish:attach:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = pmFinishAttachService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{attachId}")
    @RequiresPermissions("pm:finish:attach:info")
    public R info(@PathVariable("attachId") Integer attachId){
		PmFinishAttachEntity pmFinishAttach = pmFinishAttachService.getById(attachId);

        return R.ok().put("pmFinishAttach", pmFinishAttach);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("pm:finish:attach:save")
    public R save(@RequestBody PmFinishAttachEntity pmFinishAttach){
		pmFinishAttachService.save(pmFinishAttach);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("pm:finish:attach:update")
    public R update(@RequestBody PmFinishAttachEntity pmFinishAttach){
		pmFinishAttachService.updateById(pmFinishAttach);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("pm:finish:attach:delete")
    public R delete(@RequestBody Integer[] attachIds){
		pmFinishAttachService.removeByIds(Arrays.asList(attachIds));

        return R.ok();
    }

}
