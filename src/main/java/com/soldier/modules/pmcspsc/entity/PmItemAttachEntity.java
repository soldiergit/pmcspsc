package com.soldier.modules.pmcspsc.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 附件表
 * 
 * @author:soldier
 * @Email:583403411@qq.com
 * @create:19-12-1上午9:58
 */
@Data
@TableName("pm_item_attach")
public class PmItemAttachEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * id
	 */
	@TableId
	private Integer attachId;
	/**
	 * 项目立项id
	 */
	private Integer itemInfoId;
	/**
	 * 附件名称
	 */
	private String attachName;
	/**
	 * 附件存放路径
	 */
	private String attachPath;
	/**
	 * 是否删除
	 */
	private Integer attachIsDel;

}
