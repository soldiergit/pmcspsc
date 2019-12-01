package com.soldier.modules.pmcspsc.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import com.soldier.common.utils.ConfigConstant;
import com.soldier.common.utils.FileUtils;
import org.apache.commons.lang.math.RandomUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.soldier.modules.pmcspsc.entity.PmItemAttachEntity;
import com.soldier.modules.pmcspsc.service.PmItemAttachService;
import com.soldier.common.utils.PageUtils;
import com.soldier.common.utils.R;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * 附件表
 *
 * @author:soldier
 * @Email:583403411@qq.com
 * @create:19-12-1上午9:58
 */
@RestController
@RequestMapping("pm/item/attach")
public class PmItemAttachController {
    @Autowired
    private PmItemAttachService pmItemAttachService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("pm:item:attach:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = pmItemAttachService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{attachId}")
    @RequiresPermissions("pm:item:attach:info")
    public R info(@PathVariable("attachId") Integer attachId){
		PmItemAttachEntity pmItemAttach = pmItemAttachService.getById(attachId);

        return R.ok().put("pmItemAttach", pmItemAttach);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("pm:item:attach:save")
    public R save(@RequestBody PmItemAttachEntity pmItemAttach){
		pmItemAttachService.save(pmItemAttach);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("pm:item:attach:update")
    public R update(@RequestBody PmItemAttachEntity pmItemAttach){
		pmItemAttachService.updateById(pmItemAttach);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("pm:item:attach:delete")
    public R delete(@RequestBody Integer[] attachIds){
		pmItemAttachService.removeByIds(Arrays.asList(attachIds));

        return R.ok();
    }

    /**
     * 文件上传
     * @param files
     * @param request
     * @return
     */
    @PostMapping(value = "/upload")
    public Object uploadFile(@RequestParam("file") List<MultipartFile> files, HttpServletRequest request) {

        String UPLOAD_FILES_PATH = ConfigConstant.UPLOAD_FILE_SAVE_PATH + "/"+ RandomUtils.nextLong()+"/";

        if (Objects.isNull(files) || files.isEmpty()) {
            return R.error("文件为空，请重新上传");
        }

        PmItemAttachEntity pmItemAttachEntity = null;

        for(MultipartFile file : files){
            String fileName = file.getOriginalFilename();
            String result = null;
            try {
                result = FileUtils.upLoad(UPLOAD_FILES_PATH, fileName, file);
            } catch (Exception e) {
                e.printStackTrace();
            }
            if (!result.equals("true")) {
                R.error(result);
            }
            UPLOAD_FILES_PATH += fileName;
            pmItemAttachEntity = new PmItemAttachEntity();
            pmItemAttachEntity.setAttachName(fileName);
            pmItemAttachEntity.setAttachPath(UPLOAD_FILES_PATH);
        }
        return R.ok("文件上传成功").put("pmItemAttachEntity", pmItemAttachEntity);
    }

    /**
     * 文件下载
     * @param response
     * @param request
     */
    @PostMapping(value = "/download")
    public void downloadFile(final HttpServletResponse response, final HttpServletRequest request) {
        String filePath = request.getParameter("filePath");
        FileUtils.download(response, filePath);
    }

}
