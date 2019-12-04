package com.soldier.modules.pmcspsc.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

/**
 * 团队信息
 * 
 * @author:soldier
 * @Email:583403411@qq.com
 * @create:19-12-1上午9:58
 */
@Data
@TableName("pm_team_info")
public class PmTeamInfoEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * id
	 */
	@TableId
	private Integer teamId;
	/**
	 * 指导老师id
	 */
	private Long userId;
	/**
	 * 团队编号
	 */
	private String teamCode;
	/**
	 * 立项id
	 */
	private Integer itemInfoId;
	/**
	 * 项目编号
	 */
	private String itemInfoCode;
	/**
	 * 赛题
	 */
	private String matchTitle;
	/**
	 * 报名时间
	 */
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd")
	private Date signUpTime;
	/**
	 * 获奖级别：国家级：区级
	 */
	private Integer awardGrade;
	/**
	 * 获奖等级
	 */
	private Integer awardInfo;
	/**
	 * 删除标识
	 */
	private Integer teamInfoIsDel;

	/**
	 * 团队成员
	 * 注解加载bean属性上，表示当前属性不是数据库的字段，但在项目中必须使用，这样在新增等使用bean的时候，mybatis-plus就会忽略这个，不会报错
	 */
	@TableField(exist = false)
	List<PmTeamPersonInfoEntity> pmTeamPersonInfoEntities;

}
