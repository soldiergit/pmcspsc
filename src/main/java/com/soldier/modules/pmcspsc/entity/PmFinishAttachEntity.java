package com.soldier.modules.pmcspsc.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 结题附件
 * 
 * @author:soldier
 * @Email:583403411@qq.com
 * @create:19-12-1上午9:58
 */
@Data
@TableName("pm_finish_attach")
public class PmFinishAttachEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * id
	 */
	@TableId
	private Integer attachId;
	/**
	 * 结题id
	 */
	private Integer finishInfoId;
	/**
	 * 附件名称
	 */
	private String attachName;
	/**
	 * 附件路径
	 */
	private String attachPath;
	/**
	 * 删除标识
	 */
	private Integer attachIsDel;

}
