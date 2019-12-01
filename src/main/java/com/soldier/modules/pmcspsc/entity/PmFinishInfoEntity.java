package com.soldier.modules.pmcspsc.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 结题信息表
 * 
 * @author:soldier
 * @Email:583403411@qq.com
 * @create:19-12-1上午9:58
 */
@Data
@TableName("pm_finish_info")
public class PmFinishInfoEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * Id
	 */
	@TableId
	private Integer finishInfoId;
	/**
	 * 立项项目id
	 */
	private Integer itemInfoId;
	/**
	 * 删除标识
	 */
	private Integer finishIsDel;

}
