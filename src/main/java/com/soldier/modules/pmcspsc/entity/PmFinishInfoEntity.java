package com.soldier.modules.pmcspsc.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

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
    /**
     * 结题人
     */
    private Integer userId;
	/**
	 * 审核状态：0-未提交审核，1-未审核，2-已通过，3-未通过
	 */
	private Integer finishInfoStatus;

	/**
	 * 对应的立项项目
	 * 注解加载bean属性上，表示当前属性不是数据库的字段，但在项目中必须使用，这样在新增等使用bean的时候，mybatis-plus就会忽略这个，不会报错
	 */
	@TableField(exist = false)
	private PmItemInfoEntity pmItemInfoEntity;
	/**
	 * 参赛队伍
	 */
	@TableField(exist = false)
	List<PmTeamInfoEntity> pmTeamInfoEntities;
	/**
	 * 实际预算
	 */
	@TableField(exist = false)
	private PmFundInfoEntity pmFundInfoEntity;
	/**
	 * 结题报告书
	 */
	@TableField(exist = false)
	private PmFinishAttachEntity pmFinishAttachEntity;

}
