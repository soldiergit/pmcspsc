package com.soldier.modules.pmcspsc.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 项目立项回退表
 * 
 * @author:soldier
 * @Email:583403411@qq.com
 * @create:19-12-1上午9:58
 */
@Data
@TableName("pm_item_info_retreat")
public class PmItemInfoRetreatEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * id
	 */
	@TableId
	private Integer retreatId;
	/**
	 * 项目立项申请Id
	 */
	private Integer itemInfoId;
	/**
	 * 回退意见
	 */
	private String retreatAdvise;
	/**
	 * 删除标识
	 */
	private Integer retreatIsDel;

}
