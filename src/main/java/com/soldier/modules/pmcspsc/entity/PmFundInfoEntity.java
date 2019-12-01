package com.soldier.modules.pmcspsc.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 经费预算/实际支出信息表
 * 
 * @author:soldier
 * @Email:583403411@qq.com
 * @create:19-12-1上午9:58
 */
@Data
@TableName("pm_fund_info")
public class PmFundInfoEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * Id
	 */
	@TableId
	private Integer budgetId;
	/**
	 * 项目立项id
	 */
	private Integer itemInfoId;
	/**
	 * 参赛注册费
	 */
	private Double registerCost;
	/**
	 * 差旅费
	 */
	private Double travelCost;
	/**
	 * 培训费
	 */
	private Double trainCost;
	/**
	 * 评审费
	 */
	private Double reviewCost;
	/**
	 * 指导费
	 */
	private Double guideCost;
	/**
	 * 领队费
	 */
	private Double leaderCost;
	/**
	 * 组织费
	 */
	private Double organizeCost;
	/**
	 * 耗材费
	 */
	private Double consumablesCost;
	/**
	 * 奖金
	 */
	private Double awardCost;
	/**
	 * 其他费用
	 */
	private Double anotherCost;
	/**
	 * 合计
	 */
	private Double totalCost;
	/**
	 * 删除标识
	 */
	private Integer budgetInfoIsDel;

}
