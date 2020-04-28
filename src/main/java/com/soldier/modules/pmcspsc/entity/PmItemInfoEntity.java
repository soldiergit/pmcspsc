package com.soldier.modules.pmcspsc.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

/**
 * 项目立项申请表
 * 
 * @author:soldier
 * @Email:583403411@qq.com
 * @create:19-12-1上午9:58
 */
@Data
@TableName("pm_item_info")
public class PmItemInfoEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 项目id
	 */
	@TableId
	private Integer itemInfoId;
	/**
	 * 赛事名称
	 */
	private String matchName;
	/**
	 * 组赛单位
	 */
	private String matchUnit;
	/**
	 * 赛制：0：单人赛、1：团体赛
	 */
	private Integer matchType;
	/**
	 * 指导老师id
	 */
	private Long userId;
	/**
	 * 项目负责人姓名
	 */
	private String userName;
	/**
	 * 竞赛起始日期
	 */
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd")
	private Date matchStartTime;
	/**
	 * 竞赛结束日期
	 */
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd")
	private Date matchEndTime;
	/**
	 * 专业
	 */
	private String matchMajor;
	/**
	 * 竞赛主办单位
	 */
	private String hostUnit;
	/**
	 * 竞赛承办单位
	 */
	private String undertakeUnit;
	/**
	 * 申请立项日期
	 */
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd")
	private Date itemInfoTime;
	/**
	 * 论证组赛的目的和意义
	 */
	private String matchSign;
	/**
	 * 审核状态：0-未提交审核，1-未审核，2-已通过，3-未通过
	 */
	private Integer itemInfoStatus;
	/**
	 * 是否已经结题 1-已结题	0-未结题
	 */
	private Integer itemInfoFinish;
	/**
	 * 删除标识
	 */
	private Integer itemInfoIsDel;

	/**
	 * 资金
	 * 注解加载bean属性上，表示当前属性不是数据库的字段，但在项目中必须使用，这样在新增等使用bean的时候，mybatis-plus就会忽略这个，不会报错
	 */
	@TableField(exist = false)
	private PmFundInfoEntity pmFundInfoEntity;

	/**
	 * 附件
	 */
	@TableField(exist = false)
	private PmItemAttachEntity pmItemAttachEntity;
}
