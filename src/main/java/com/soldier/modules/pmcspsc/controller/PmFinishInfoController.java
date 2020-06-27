package com.soldier.modules.pmcspsc.controller;

import java.util.Arrays;
import java.util.Map;

import com.soldier.common.annotation.Prevent;
import com.soldier.common.utils.RabbitMQSender;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.soldier.modules.pmcspsc.entity.PmFinishInfoEntity;
import com.soldier.modules.pmcspsc.service.PmFinishInfoService;
import com.soldier.common.utils.PageUtils;
import com.soldier.common.utils.R;



/**
 * 结题信息表
 *
 * @author:soldier
 * @Email:583403411@qq.com
 * @create:19-12-1上午9:58
 */
@RestController
@RequestMapping("pm/finish")
public class PmFinishInfoController {

    @Autowired
    private PmFinishInfoService pmFinishInfoService;

    @Autowired
    private RabbitMQSender rabbitMQSender;

    /**
     * 列表
     */
    @Prevent(value = 100, frequency = 20)
    @RequestMapping("/list")
    @RequiresPermissions("pm:finish:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = pmFinishInfoService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{finishInfoId}")
    @RequiresPermissions("pm:finish:info")
    public R info(@PathVariable("finishInfoId") Integer finishInfoId){
		PmFinishInfoEntity pmFinishInfo = pmFinishInfoService.getById(finishInfoId);

        return R.ok().put("pmFinishInfo", pmFinishInfo);
    }

    /**
     * 保存
     * 使用rabbitmq进行改造
     */
    @RequestMapping("/save")
    @RequiresPermissions("pm:finish:save")
    public R save(@RequestBody PmFinishInfoEntity pmFinishInfo){

//		pmFinishInfoService.save(pmFinishInfo);
        rabbitMQSender.sendMessage(pmFinishInfo);


        return R.ok();
    }

    /**
     * 保存信息轮询
     * 0：成功
     * -1：保存失败
     * 2345： 排队中
     */
    @RequestMapping("/saveResultStatus")
    @RequiresPermissions("pm:finish:save")
    public R result(@RequestBody PmFinishInfoEntity pmFinishInfo){

        Integer result = pmFinishInfoService.selectFinishSaveStatus(pmFinishInfo);

        if (result == 0) return R.ok();
        else return R.error(result, "未成功！");
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("pm:finish:update")
    public R update(@RequestBody PmFinishInfoEntity pmFinishInfo){
		pmFinishInfoService.updateById(pmFinishInfo);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("pm:finish:delete")
    public R delete(@RequestBody Integer[] finishInfoIds){
		pmFinishInfoService.removeByIds(Arrays.asList(finishInfoIds));

        return R.ok();
    }

    /**
     * 审批
     */
    @RequestMapping("/apply")
    @RequiresPermissions("pm:item:info")
    public R apply(@RequestParam Map<String, Object> params){

        pmFinishInfoService.apply(params);

        return R.ok();
    }

}
