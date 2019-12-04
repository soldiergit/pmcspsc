package com.soldier.modules.pmcspsc.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

/**
 * 立项结题回退表
 * 
 * @author:soldier
 * @Email:583403411@qq.com
 * @create:19-12-1上午9:58
 */
@Data
@TableName("pm_finish_info_retreat")
public class PmFinishInfoRetreatEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * id
	 */
	@TableId
	private Integer retreatId;
	/**
	 * 项目结题Id
	 */
	private Integer finishInfoId;
	/**
	 * 回退意见
	 */
	private String retreatAdvise;
	/**
	 * 删除标识
	 */
	private Integer retreatIsDel;

}
