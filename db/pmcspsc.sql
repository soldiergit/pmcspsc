-- MySQL dump 10.13  Distrib 8.0.18, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: pmcspsc
-- ------------------------------------------------------
-- Server version	8.0.18-0ubuntu0.19.10.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `pm_finish_attach`
--

DROP TABLE IF EXISTS `pm_finish_attach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pm_finish_attach` (
  `attach_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `finish_info_id` int(11) DEFAULT NULL COMMENT '结题id',
  `attach_name` varchar(255) DEFAULT NULL COMMENT '附件名称',
  `attach_path` varchar(255) DEFAULT NULL COMMENT '附件路径',
  `attach_is_del` int(11) DEFAULT '0' COMMENT '删除标识',
  PRIMARY KEY (`attach_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='结题附件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_finish_attach`
--

LOCK TABLES `pm_finish_attach` WRITE;
/*!40000 ALTER TABLE `pm_finish_attach` DISABLE KEYS */;
INSERT INTO `pm_finish_attach` VALUES (4,1,'pmcspsc.sql','/home/soldier/SOLDIER/IDE_project/idea_project/pmcspsc/target/6974026363079021921/pmcspsc.sql',0);
/*!40000 ALTER TABLE `pm_finish_attach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_finish_info`
--

DROP TABLE IF EXISTS `pm_finish_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pm_finish_info` (
  `finish_info_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `item_info_id` int(11) DEFAULT NULL COMMENT '立项项目id',
  `user_id` int(11) DEFAULT NULL COMMENT '结题人',
  `finish_info_status` int(11) DEFAULT '0' COMMENT '审核状态',
  `finish_is_del` int(11) DEFAULT '0' COMMENT '删除标识',
  PRIMARY KEY (`finish_info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='结题信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_finish_info`
--

LOCK TABLES `pm_finish_info` WRITE;
/*!40000 ALTER TABLE `pm_finish_info` DISABLE KEYS */;
INSERT INTO `pm_finish_info` VALUES (1,1,2,2,0);
/*!40000 ALTER TABLE `pm_finish_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_finish_info_retreat`
--

DROP TABLE IF EXISTS `pm_finish_info_retreat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pm_finish_info_retreat` (
  `retreat_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `finish_info_id` int(11) DEFAULT NULL COMMENT '立项结题Id',
  `retreat_advise` text COMMENT '回退意见',
  `retreat_is_del` int(11) DEFAULT '0' COMMENT '删除标识',
  PRIMARY KEY (`retreat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='立项结题回退表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_finish_info_retreat`
--

LOCK TABLES `pm_finish_info_retreat` WRITE;
/*!40000 ALTER TABLE `pm_finish_info_retreat` DISABLE KEYS */;
INSERT INTO `pm_finish_info_retreat` VALUES (1,1,'写清楚点！！！',0);
/*!40000 ALTER TABLE `pm_finish_info_retreat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_fund_info`
--

DROP TABLE IF EXISTS `pm_fund_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pm_fund_info` (
  `budget_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `item_info_id` int(11) DEFAULT NULL COMMENT '项目立项id',
  `finish_info_id` int(11) DEFAULT NULL COMMENT '结题Id',
  `register_cost` double DEFAULT NULL COMMENT '参赛注册费',
  `travel_cost` double DEFAULT NULL COMMENT '差旅费',
  `train_cost` double DEFAULT NULL COMMENT '培训费',
  `review_cost` double DEFAULT NULL COMMENT '评审费',
  `guide_cost` double DEFAULT NULL COMMENT '指导费',
  `leader_cost` double DEFAULT NULL COMMENT '领队费',
  `organize_cost` double DEFAULT NULL COMMENT '组织费',
  `consumables_cost` double DEFAULT NULL COMMENT '耗材费',
  `award_cost` double DEFAULT NULL COMMENT '奖金',
  `another_cost` double DEFAULT NULL COMMENT '其他费用',
  `total_cost` double DEFAULT NULL COMMENT '合计',
  `budget_info_is_del` int(11) DEFAULT '0' COMMENT '删除标识',
  PRIMARY KEY (`budget_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='经费预算/实际支出信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_fund_info`
--

LOCK TABLES `pm_fund_info` WRITE;
/*!40000 ALTER TABLE `pm_fund_info` DISABLE KEYS */;
INSERT INTO `pm_fund_info` VALUES (1,1,NULL,20,20,20,20,20,20,20,20,20,20,200,0),(2,2,NULL,10,10,10,10,10,10,10,10,10,10,100,0),(3,1,NULL,20,20,20,20,20,20,20,20,20,20,200,0),(4,NULL,1,11,11,11,1,1,1,1,1,1,1,40,0);
/*!40000 ALTER TABLE `pm_fund_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_item_attach`
--

DROP TABLE IF EXISTS `pm_item_attach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pm_item_attach` (
  `attach_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `item_info_id` int(11) DEFAULT NULL COMMENT '项目立项id',
  `attach_name` varchar(255) DEFAULT NULL COMMENT '附件名称',
  `attach_path` varchar(255) DEFAULT NULL COMMENT '附件存放路径',
  `attach_is_del` int(11) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`attach_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='附件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_item_attach`
--

LOCK TABLES `pm_item_attach` WRITE;
/*!40000 ALTER TABLE `pm_item_attach` DISABLE KEYS */;
INSERT INTO `pm_item_attach` VALUES (1,1,'用户注册.xlsx','/home/soldier/SOLDIER/IDE_project/idea_project/pmcspsc/target/464316178302747467/用户注册.xlsx',0),(2,2,'pmcspsc.sql','/home/soldier/SOLDIER/IDE_project/idea_project/pmcspsc/target/7072770028793153612/pmcspsc.sql',0),(3,3,'用户注册.xlsx','/home/soldier/SOLDIER/IDE_project/idea_project/pmcspsc/target/464316178302747467/用户注册.xlsx',0);
/*!40000 ALTER TABLE `pm_item_attach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_item_info`
--

DROP TABLE IF EXISTS `pm_item_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pm_item_info` (
  `item_info_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '项目id',
  `match_name` varchar(255) DEFAULT NULL COMMENT '赛事名称',
  `match_unit` varchar(255) DEFAULT NULL COMMENT '组赛单位',
  `match_type` int(11) DEFAULT NULL COMMENT '赛制：0：单人赛、1：团体赛',
  `user_id` bigint(20) DEFAULT NULL COMMENT '指导老师id',
  `user_name` varchar(255) DEFAULT NULL COMMENT '项目负责人姓名',
  `match_start_time` date DEFAULT NULL COMMENT '竞赛起始日期',
  `match_end_time` date DEFAULT NULL COMMENT '竞赛结束日期',
  `match_major` varchar(255) DEFAULT NULL COMMENT '专业',
  `host_unit` varchar(255) DEFAULT NULL COMMENT '竞赛主办单位',
  `undertake_unit` varchar(255) DEFAULT NULL COMMENT '竞赛承办单位',
  `item_info_time` date DEFAULT NULL COMMENT '申请立项日期',
  `match_sign` text COMMENT '论证组赛的目的和意义',
  `item_info_status` int(11) DEFAULT '0' COMMENT '审核状态',
  `item_info_finish` int(11) DEFAULT '0' COMMENT '是否已经结题',
  `item_info_is_del` int(11) DEFAULT '0' COMMENT '删除标识',
  PRIMARY KEY (`item_info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='项目立项申请表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_item_info`
--

LOCK TABLES `pm_item_info` WRITE;
/*!40000 ALTER TABLE `pm_item_info` DISABLE KEYS */;
INSERT INTO `pm_item_info` VALUES (1,'数学竞赛','梧州学院',1,2,'数学竞赛','2019-12-18','2019-12-18','数学竞赛','数学竞赛','数学竞赛','2019-12-03',' Parameters: ee9ba5dc82469d5845e11479f03946ce(String)',2,1,0),(2,'蓝桥杯','蓝桥杯',0,2,'蓝桥杯','2019-12-12','2019-12-26','蓝桥杯','蓝桥杯','蓝桥杯','2019-12-11','1010101010101010101010101010101010101010',3,0,0);
/*!40000 ALTER TABLE `pm_item_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_item_info_retreat`
--

DROP TABLE IF EXISTS `pm_item_info_retreat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pm_item_info_retreat` (
  `retreat_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `item_info_id` int(11) DEFAULT NULL COMMENT '项目立项申请Id',
  `retreat_advise` text COMMENT '回退意见',
  `retreat_is_del` int(11) DEFAULT '0' COMMENT '删除标识',
  PRIMARY KEY (`retreat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='项目立项回退表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_item_info_retreat`
--

LOCK TABLES `pm_item_info_retreat` WRITE;
/*!40000 ALTER TABLE `pm_item_info_retreat` DISABLE KEYS */;
INSERT INTO `pm_item_info_retreat` VALUES (1,2,'写清楚点！！！',0);
/*!40000 ALTER TABLE `pm_item_info_retreat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_team_info`
--

DROP TABLE IF EXISTS `pm_team_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pm_team_info` (
  `team_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `item_info_id` int(11) DEFAULT NULL COMMENT '立项id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '指导老师id',
  `team_code` varchar(255) DEFAULT NULL COMMENT '团队编号',
  `item_info_code` varchar(255) DEFAULT NULL COMMENT '项目编号',
  `match_title` varchar(255) DEFAULT NULL COMMENT '赛题',
  `sign_up_time` date DEFAULT NULL COMMENT '报名时间',
  `award_grade` int(11) DEFAULT NULL COMMENT '获奖级别：国家级：区级',
  `award_info` int(11) DEFAULT NULL COMMENT '获奖等级',
  `team_info_is_del` int(11) DEFAULT '0' COMMENT '删除标识',
  PRIMARY KEY (`team_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='团队信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_team_info`
--

LOCK TABLES `pm_team_info` WRITE;
/*!40000 ALTER TABLE `pm_team_info` DISABLE KEYS */;
INSERT INTO `pm_team_info` VALUES (1,NULL,2,'SHUXUE001','XIANGMU001','c.s.m.s.d.SysUserTokenDao.queryByToken   : ==> Parameters: ee9ba5dc82469d5845e11479f03946ce(String)','2019-12-12',3,2,0),(2,1,2,'SHUXUE002','XIANGMU002','SELECT COUNT(1) FROM pm_item_info WHERE (item_info_status = ? AND user_id = ?) ','2019-12-12',NULL,NULL,0),(3,1,2,'SHUXUE003','XIANGMU003','SELECT COUNT(1) FROM pm_item_info WHERE (item_info_status = ? AND user_id = ?) ','2019-12-12',NULL,NULL,0);
/*!40000 ALTER TABLE `pm_team_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_team_person_info`
--

DROP TABLE IF EXISTS `pm_team_person_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pm_team_person_info` (
  `person_info_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `person_team_info_id` int(11) DEFAULT NULL COMMENT '团队id',
  `person_code` varchar(255) DEFAULT NULL COMMENT '学号',
  `person_name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `person_institute` varchar(255) DEFAULT NULL COMMENT '学院',
  `person_class` varchar(255) DEFAULT NULL COMMENT '班级',
  `person_grade` varchar(255) DEFAULT NULL COMMENT '年级',
  `person_major` varchar(255) DEFAULT NULL COMMENT '专业',
  `person_email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `person_phone` varchar(255) DEFAULT NULL COMMENT '电话',
  `person_info_is_del` int(11) DEFAULT '0' COMMENT '删除标识',
  PRIMARY KEY (`person_info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='团队成员信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_team_person_info`
--

LOCK TABLES `pm_team_person_info` WRITE;
/*!40000 ALTER TABLE `pm_team_person_info` DISABLE KEYS */;
INSERT INTO `pm_team_person_info` VALUES (1,1,'001','001','001','001','001','001','001','001',0),(2,1,'002','002','002','002','002','002','002','002',0),(3,2,'002-1','002-1','002-1','002-1','002-1','002-1','002-1','002-1',0),(4,2,'002-1','002-1','002-1','002-1','002-1','002-1','002-1','002-1',0),(5,2,'002-1','002-1','002-1','002-1','002-1','002-1','002-1','002-1',0);
/*!40000 ALTER TABLE `pm_team_person_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_captcha`
--

DROP TABLE IF EXISTS `sys_captcha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_captcha` (
  `uuid` char(36) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'uuid',
  `code` varchar(6) COLLATE utf8mb4_general_ci NOT NULL COMMENT '验证码',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='系统验证码';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_captcha`
--

LOCK TABLES `sys_captcha` WRITE;
/*!40000 ALTER TABLE `sys_captcha` DISABLE KEYS */;
INSERT INTO `sys_captcha` VALUES ('02c97388-bd5f-40b1-8b36-7f1cb68d1bbd','fm66a','2019-12-17 10:43:03'),('04fdc832-ae5c-4fd1-8fdc-9914b421cd68','x3dfb','2019-12-17 10:15:27'),('05ce9695-0773-4f12-8a12-d4a867e4b591','effg7','2019-12-01 20:32:25'),('0cd3c1fb-c62c-43a9-8bbc-3f7e7980c4ce','m6ed2','2019-12-17 10:12:27'),('10ce2f67-61ae-4a55-8fdc-61ffbe2ca12a','5bnmn','2019-12-04 08:26:55'),('13b64535-4743-4c46-8744-4d3b9a1e016e','m7cmx','2019-12-04 08:26:29'),('14c99e3d-98e0-447a-8f16-f5fa2690717f','d6nyn','2019-12-17 10:15:21'),('19d02c28-a52e-4b95-8bb4-f68a504e2b97','5cnc8','2019-12-17 10:16:35'),('1b64a144-d04d-48e7-8024-aa3f4b5bd3dc','2ancg','2019-12-17 10:20:53'),('1df1ae7f-1066-4031-8929-00e6ebef2e8b','g6cx7','2019-12-04 11:12:53'),('22654cd2-ada1-4fdf-837f-f963330da30d','46w44','2019-12-04 08:48:39'),('29c24672-b368-464e-8e7c-30388bb55743','awebc','2019-12-17 10:19:23'),('2b5261d4-3025-4383-8d0e-6144e9dff7d1','xgxx2','2019-12-17 10:31:00'),('32b5a552-b428-439e-8d0e-fca96e5179a3','2egm5','2019-12-01 22:05:04'),('37b67b25-ae3b-4047-86f1-0648761d5eb1','apm6c','2019-12-17 10:19:26'),('45a662b7-8aeb-49ae-89cb-603757fcada8','myce5','2019-12-04 08:26:35'),('47d4ba42-039e-4fe0-8a04-fcf911bfe7c6','ym5a8','2019-12-17 10:40:59'),('4a716e42-c175-4e0e-8825-22807fdff22b','p5yab','2019-12-17 10:16:06'),('558207c0-98af-4502-8480-46fe676021f7','m8f33','2019-12-17 10:18:23'),('621a8ee8-fffd-44bf-88f1-f80772374398','nxgwg','2019-12-17 10:15:58'),('62f621ee-3f70-4b38-8e23-3680cf991ce7','p3bam','2019-12-04 08:28:39'),('669003ae-6c62-4091-8f18-151e8cbf68f7','gp6n6','2019-12-17 10:14:04'),('6c6c9048-684e-400e-8e52-0583b943cc55','82gag','2019-12-04 08:29:51'),('726b4924-3337-4d10-861f-0a7d0fd843ab','fcdan','2019-12-17 10:18:44'),('7717c6dd-83a8-43de-8fb9-19f07ef06106','8d6pb','2019-12-17 10:43:02'),('87be3884-49e9-4467-8389-3c9e9610d327','7wa5d','2019-12-17 10:12:32'),('a864e335-252a-43c0-8e21-43d362d7fbf3','d4pyd','2019-12-17 10:43:01'),('ad2be80a-9f4e-48a5-8368-298f90b0d5de','4bxbx','2019-12-17 10:43:02'),('c16fbacf-734d-412f-8535-caee26af8076','ey87e','2019-12-17 10:12:45'),('c17b9741-1b1c-459b-81ad-8d02cb8b85e7','4d8cc','2019-12-17 10:43:02'),('c87d0887-2a1b-4dd0-80f3-c49dc7e2e523','px58g','2019-12-17 10:43:02'),('d75db6f9-a307-4af3-8450-b7aa0d69870f','76mwy','2019-12-17 10:43:03'),('d7778325-1058-4ecb-8593-cfcc6de26a23','b8m44','2019-12-01 20:37:16'),('d9037790-b1d6-4129-896f-eed9753523f8','m7apf','2019-12-17 10:18:33'),('df0c9372-b7c1-4641-84b9-7416ebceca9a','8a6nx','2019-12-17 10:16:16'),('ec787223-3271-4845-8268-a1a507b41878','3a35n','2019-12-17 10:16:11'),('edc810d4-b18b-4779-881e-283fd2a4a02f','8mpb3','2019-12-17 10:21:24'),('f3f933b1-3c9a-4e50-8f07-45ecfa94e9f7','nxb47','2019-12-17 10:18:16'),('ff1fa37f-7f53-46f1-8457-c52b1f3fff24','4n2n5','2019-12-17 10:10:55');
/*!40000 ALTER TABLE `sys_captcha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_log`
--

DROP TABLE IF EXISTS `sys_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='系统日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_log`
--

LOCK TABLES `sys_log` WRITE;
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;
INSERT INTO `sys_log` VALUES (1,'admin','保存角色','com.soldier.modules.sys.controller.SysRoleController.save()','[{\"roleId\":1,\"roleName\":\"超级管理员\",\"remark\":\"超级管理员，唯一\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,-666666],\"createTime\":\"Dec 1, 2019 8:54:08 AM\"}]',131,'0:0:0:0:0:0:0:1','2019-12-01 08:54:09'),(2,'admin','保存角色','com.soldier.modules.sys.controller.SysRoleController.save()','[{\"roleId\":2,\"roleName\":\"指导老师\",\"remark\":\"每年在线填写参加专业学科竞赛项目立项申请信息，\",\"createUserId\":1,\"menuIdList\":[30,-666666,1],\"createTime\":\"Dec 1, 2019 8:55:17 AM\"}]',25,'0:0:0:0:0:0:0:1','2019-12-01 08:55:18'),(3,'admin','修改角色','com.soldier.modules.sys.controller.SysRoleController.update()','[{\"roleId\":2,\"roleName\":\"指导老师\",\"remark\":\"每年在线填写参加专业学科竞赛项目立项申请信息，\",\"createUserId\":1,\"menuIdList\":[-666666]}]',42,'0:0:0:0:0:0:0:1','2019-12-01 08:55:36'),(4,'admin','保存角色','com.soldier.modules.sys.controller.SysRoleController.save()','[{\"roleId\":3,\"roleName\":\"教务处实验实践科\",\"remark\":\"审核指导老师每年在线填写的参加专业学科竞赛项目立项申请信息\",\"createUserId\":1,\"menuIdList\":[-666666],\"createTime\":\"Dec 1, 2019 8:56:31 AM\"}]',28,'0:0:0:0:0:0:0:1','2019-12-01 08:56:32'),(5,'admin','修改用户','com.soldier.modules.sys.controller.SysUserController.update()','[{\"userId\":1,\"username\":\"admin\",\"password\":\"9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"soldier_wyyx@163.com\",\"mobile\":\"18277404022\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1}]',84,'0:0:0:0:0:0:0:1','2019-12-01 08:57:13'),(6,'admin','保存用户','com.soldier.modules.sys.controller.SysUserController.save()','[{\"userId\":2,\"username\":\"teacher\",\"password\":\"71062396a607d3b61194e8122d2ec448f9c8cefbaccf0a9bc15e159060d3ba73\",\"salt\":\"L80xBZ68Ze8MVOSsY4LW\",\"email\":\"teacher@wzxy.com\",\"mobile\":\"18888888888\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1,\"createTime\":\"Dec 1, 2019 8:58:32 AM\"}]',19,'0:0:0:0:0:0:0:1','2019-12-01 08:58:32'),(7,'admin','保存用户','com.soldier.modules.sys.controller.SysUserController.save()','[{\"userId\":3,\"username\":\"jwc\",\"password\":\"caa5332a8f222480c702be9211cfb9138c9c4c0f500e8f5c9ac8d7625f5c4a65\",\"salt\":\"NnCQrG2gHTRKJxVdu1ZF\",\"email\":\"jiaowuchu@wzxy.com\",\"mobile\":\"18888888888\",\"status\":1,\"roleIdList\":[3],\"createUserId\":1,\"createTime\":\"Dec 1, 2019 8:59:14 AM\"}]',19,'0:0:0:0:0:0:0:1','2019-12-01 08:59:14'),(8,'admin','保存菜单','com.soldier.modules.sys.controller.SysMenuController.save()','[{\"menuId\":31,\"parentId\":0,\"name\":\"申请管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"zhedie\",\"orderNum\":0}]',13,'0:0:0:0:0:0:0:1','2019-12-01 09:08:33'),(9,'admin','保存菜单','com.soldier.modules.sys.controller.SysMenuController.save()','[{\"menuId\":32,\"parentId\":0,\"name\":\"赛事报名\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"zhedie\",\"orderNum\":0}]',11,'0:0:0:0:0:0:0:1','2019-12-01 09:08:57'),(10,'admin','保存菜单','com.soldier.modules.sys.controller.SysMenuController.save()','[{\"menuId\":33,\"parentId\":0,\"name\":\"结题管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"zhedie\",\"orderNum\":0}]',11,'0:0:0:0:0:0:0:1','2019-12-01 09:09:16'),(11,'admin','保存菜单','com.soldier.modules.sys.controller.SysMenuController.save()','[{\"menuId\":34,\"parentId\":31,\"name\":\"项目立项申请列表\",\"url\":\"pmcspsc/pmiteminfo\",\"perms\":\"pm:item:list,pm:item:info\",\"type\":1,\"icon\":\"daohang\",\"orderNum\":0}]',18,'0:0:0:0:0:0:0:1','2019-12-01 09:36:26'),(12,'admin','保存菜单','com.soldier.modules.sys.controller.SysMenuController.save()','[{\"menuId\":35,\"parentId\":34,\"name\":\"查看\",\"url\":\"\",\"perms\":\"pm:item:list,pm:item:info\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]',15,'0:0:0:0:0:0:0:1','2019-12-01 09:45:32'),(13,'admin','修改菜单','com.soldier.modules.sys.controller.SysMenuController.update()','[{\"menuId\":34,\"parentId\":31,\"name\":\"项目立项申请列表\",\"url\":\"pmcspsc/pmiteminfo\",\"perms\":\"\",\"type\":1,\"icon\":\"daohang\",\"orderNum\":0}]',20,'0:0:0:0:0:0:0:1','2019-12-01 09:45:54'),(14,'admin','保存菜单','com.soldier.modules.sys.controller.SysMenuController.save()','[{\"menuId\":36,\"parentId\":34,\"name\":\"新增\",\"url\":\"\",\"perms\":\"pm:item:save\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]',9,'0:0:0:0:0:0:0:1','2019-12-01 09:47:16'),(15,'admin','保存菜单','com.soldier.modules.sys.controller.SysMenuController.save()','[{\"menuId\":37,\"parentId\":34,\"name\":\"修改\",\"url\":\"\",\"perms\":\"pm:item:update\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]',27,'0:0:0:0:0:0:0:1','2019-12-01 09:47:34'),(16,'admin','保存菜单','com.soldier.modules.sys.controller.SysMenuController.save()','[{\"menuId\":38,\"parentId\":34,\"name\":\"删除\",\"url\":\"\",\"perms\":\"pm:item:delete\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]',10,'0:0:0:0:0:0:0:1','2019-12-01 09:47:46'),(17,'admin','修改菜单','com.soldier.modules.sys.controller.SysMenuController.update()','[{\"menuId\":34,\"parentId\":31,\"name\":\"指导老师立项申请列表\",\"url\":\"pmcspsc/item/pmiteminfo-teahcer\",\"perms\":\"\",\"type\":1,\"icon\":\"daohang\",\"orderNum\":0}]',13,'0:0:0:0:0:0:0:1','2019-12-01 16:56:14'),(18,'admin','保存菜单','com.soldier.modules.sys.controller.SysMenuController.save()','[{\"menuId\":39,\"parentId\":31,\"name\":\"实践科审批列表\",\"url\":\"pmcspsc/item/pmiteminfo-dean\",\"perms\":\"pm:item:list,pm:item:info\",\"type\":1,\"icon\":\"daohang\",\"orderNum\":0}]',13,'0:0:0:0:0:0:0:1','2019-12-01 16:58:00'),(19,'admin','修改菜单','com.soldier.modules.sys.controller.SysMenuController.update()','[{\"menuId\":31,\"parentId\":0,\"name\":\"立项申请管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"zhedie\",\"orderNum\":0}]',10,'0:0:0:0:0:0:0:1','2019-12-01 16:58:36'),(20,'admin','修改菜单','com.soldier.modules.sys.controller.SysMenuController.update()','[{\"menuId\":34,\"parentId\":31,\"name\":\"指导老师提交列表\",\"url\":\"pmcspsc/item/pmiteminfo-teahcer\",\"perms\":\"\",\"type\":1,\"icon\":\"daohang\",\"orderNum\":0}]',14,'0:0:0:0:0:0:0:1','2019-12-01 16:58:51'),(21,'admin','修改菜单','com.soldier.modules.sys.controller.SysMenuController.update()','[{\"menuId\":39,\"parentId\":31,\"name\":\"实践科审批列表\",\"url\":\"pmcspsc/item/pmiteminfo-dean\",\"perms\":\"\",\"type\":1,\"icon\":\"daohang\",\"orderNum\":0}]',7,'0:0:0:0:0:0:0:1','2019-12-01 16:59:02'),(22,'admin','保存菜单','com.soldier.modules.sys.controller.SysMenuController.save()','[{\"menuId\":40,\"parentId\":39,\"name\":\"查看\",\"url\":\"\",\"perms\":\"pm:item:list,pm:item:info\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]',24,'0:0:0:0:0:0:0:1','2019-12-01 16:59:28'),(23,'admin','修改角色','com.soldier.modules.sys.controller.SysRoleController.update()','[{\"roleId\":3,\"roleName\":\"教务处实验实践科\",\"remark\":\"审核指导老师每年在线填写的参加专业学科竞赛项目立项申请信息\",\"createUserId\":1,\"menuIdList\":[39,40,41,42,43,-666666,31]}]',261,'0:0:0:0:0:0:0:1','2019-12-01 19:49:03'),(24,'admin','修改角色','com.soldier.modules.sys.controller.SysRoleController.update()','[{\"roleId\":3,\"roleName\":\"教务处实验实践科\",\"remark\":\"审核指导老师每年在线填写的参加专业学科竞赛项目立项申请信息\",\"createUserId\":1,\"menuIdList\":[-666666]}]',37,'0:0:0:0:0:0:0:1','2019-12-01 19:49:12'),(25,'admin','修改角色','com.soldier.modules.sys.controller.SysRoleController.update()','[{\"roleId\":2,\"roleName\":\"指导老师\",\"remark\":\"每年在线填写参加专业学科竞赛项目立项申请信息，\",\"createUserId\":1,\"menuIdList\":[34,35,36,37,38,-666666,31]}]',28,'0:0:0:0:0:0:0:1','2019-12-01 19:51:36'),(26,'admin','修改角色','com.soldier.modules.sys.controller.SysRoleController.update()','[{\"roleId\":3,\"roleName\":\"教务处实验实践科\",\"remark\":\"审核指导老师每年在线填写的参加专业学科竞赛项目立项申请信息\",\"createUserId\":1,\"menuIdList\":[39,40,42,-666666,31]}]',44,'0:0:0:0:0:0:0:1','2019-12-01 19:51:44'),(27,'admin','保存菜单','com.soldier.modules.sys.controller.SysMenuController.save()','[{\"menuId\":44,\"parentId\":32,\"name\":\"指导老师报名列表\",\"url\":\"pmcspsc/match/pmteaminfo-teacher\",\"perms\":\"\",\"type\":1,\"icon\":\"daohang\",\"orderNum\":0}]',18,'127.0.0.1','2019-12-02 09:09:41'),(28,'admin','保存菜单','com.soldier.modules.sys.controller.SysMenuController.save()','[{\"menuId\":45,\"parentId\":44,\"name\":\"查看\",\"url\":\"\",\"perms\":\"pm:team:list,pm:team:info\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]',13,'127.0.0.1','2019-12-02 09:10:18'),(29,'admin','修改角色','com.soldier.modules.sys.controller.SysRoleController.update()','[{\"roleId\":2,\"roleName\":\"指导老师\",\"remark\":\"每年在线填写参加专业学科竞赛项目立项申请信息，\",\"createUserId\":1,\"menuIdList\":[34,35,36,37,38,32,44,45,-666666,31]}]',143,'127.0.0.1','2019-12-02 09:10:59'),(30,'admin','修改角色','com.soldier.modules.sys.controller.SysRoleController.update()','[{\"roleId\":2,\"roleName\":\"指导老师\",\"remark\":\"每年在线填写参加专业学科竞赛项目立项申请信息，\",\"createUserId\":1,\"menuIdList\":[34,35,36,37,38,32,44,45,46,47,48,-666666,31]}]',21,'127.0.0.1','2019-12-02 09:20:03'),(31,'admin','保存菜单','com.soldier.modules.sys.controller.SysMenuController.save()','[{\"menuId\":49,\"parentId\":33,\"name\":\"项目结题申请\",\"url\":\"pmcspsc/finishpmfinishinfo-teacher\",\"perms\":\"\",\"type\":1,\"icon\":\"daohang\",\"orderNum\":0}]',17,'127.0.0.1','2019-12-03 09:01:59'),(32,'admin','保存菜单','com.soldier.modules.sys.controller.SysMenuController.save()','[{\"menuId\":50,\"parentId\":49,\"name\":\"查看\",\"url\":\"\",\"perms\":\"pm:finish:list,pm:finish:info\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]',17,'127.0.0.1','2019-12-03 09:02:45'),(33,'admin','修改角色','com.soldier.modules.sys.controller.SysRoleController.update()','[{\"roleId\":2,\"roleName\":\"指导老师\",\"remark\":\"每年在线填写参加专业学科竞赛项目立项申请信息，\",\"createUserId\":1,\"menuIdList\":[34,35,36,37,38,32,44,45,46,47,48,33,49,50,51,52,53,-666666,31]}]',355,'127.0.0.1','2019-12-03 09:04:03'),(34,'admin','保存菜单','com.soldier.modules.sys.controller.SysMenuController.save()','[{\"menuId\":54,\"parentId\":33,\"name\":\"实践科审批列表\",\"url\":\"pmcspsc/finish/pmfinishinfo-dean\",\"perms\":\"\",\"type\":1,\"icon\":\"daohang\",\"orderNum\":0}]',12,'127.0.0.1','2019-12-04 16:14:40'),(35,'admin','保存菜单','com.soldier.modules.sys.controller.SysMenuController.save()','[{\"menuId\":55,\"parentId\":54,\"name\":\"查看\",\"url\":\"\",\"perms\":\"pm:finish:list,pm:finish:info\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]',8,'127.0.0.1','2019-12-04 16:15:33'),(36,'admin','保存菜单','com.soldier.modules.sys.controller.SysMenuController.save()','[{\"menuId\":56,\"parentId\":54,\"name\":\"修改\",\"url\":\"\",\"perms\":\"pm:finish:update,pm:finish:retreat:save\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]',10,'127.0.0.1','2019-12-04 16:16:05'),(37,'admin','修改角色','com.soldier.modules.sys.controller.SysRoleController.update()','[{\"roleId\":3,\"roleName\":\"教务处实验实践科\",\"remark\":\"审核指导老师每年在线填写的参加专业学科竞赛项目立项申请信息\",\"createUserId\":1,\"menuIdList\":[39,40,42,54,55,56,-666666,31,33]}]',107,'127.0.0.1','2019-12-04 16:16:19'),(38,'admin','修改菜单','com.soldier.modules.sys.controller.SysMenuController.update()','[{\"menuId\":5,\"parentId\":1,\"name\":\"SQL监控\",\"url\":\"http://localhost:8080/pmcspsc/druid/sql.html\",\"type\":1,\"icon\":\"sql\",\"orderNum\":4}]',13,'0:0:0:0:0:0:0:1','2019-12-24 08:33:50'),(39,'admin','删除菜单','com.soldier.modules.sys.controller.SysMenuController.delete()','[5]',3,'0:0:0:0:0:0:0:1','2019-12-24 08:38:05'),(40,'admin','删除菜单','com.soldier.modules.sys.controller.SysMenuController.delete()','[6]',0,'0:0:0:0:0:0:0:1','2019-12-24 08:38:32'),(41,'admin','修改菜单','com.soldier.modules.sys.controller.SysMenuController.update()','[{\"menuId\":2,\"parentId\":1,\"name\":\"用户列表\",\"url\":\"sys/user\",\"type\":1,\"icon\":\"admin\",\"orderNum\":1}]',19,'0:0:0:0:0:0:0:1','2019-12-24 08:38:59'),(42,'admin','修改角色','com.soldier.modules.sys.controller.SysRoleController.update()','[{\"roleId\":1,\"roleName\":\"超级管理员\",\"remark\":\"超级管理员，唯一\",\"createUserId\":1,\"menuIdList\":[2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,29,35,40,45,50,55,-666666,1,31,34,39,32,44,33,49,54]}]',114,'0:0:0:0:0:0:0:1','2019-12-24 08:40:10'),(43,'admin','修改角色','com.soldier.modules.sys.controller.SysRoleController.update()','[{\"roleId\":1,\"roleName\":\"超级管理员\",\"remark\":\"超级管理员，唯一\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,29,35,40,45,50,55,-666666,31,34,39,32,44,33,49,54]}]',135,'0:0:0:0:0:0:0:1','2019-12-24 09:12:57'),(44,'admin','修改菜单','com.soldier.modules.sys.controller.SysMenuController.update()','[{\"menuId\":5,\"parentId\":1,\"name\":\"SQL监控\",\"url\":\"http://localhost:8080/druid/sql.html\",\"type\":1,\"icon\":\"sql\",\"orderNum\":4}]',19,'0:0:0:0:0:0:0:1','2019-12-24 09:13:25');
/*!40000 ALTER TABLE `sys_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='菜单管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,0,'系统管理',NULL,NULL,0,'system',0),(2,1,'用户列表','sys/user',NULL,1,'admin',1),(3,1,'角色管理','sys/role',NULL,1,'role',2),(4,1,'菜单管理','sys/menu',NULL,1,'menu',3),(5,1,'SQL监控','http://localhost:8080/druid/sql.html',NULL,1,'sql',4),(15,2,'查看',NULL,'sys:user:list,sys:user:info',2,NULL,0),(16,2,'新增',NULL,'sys:user:save,sys:role:select',2,NULL,0),(17,2,'修改',NULL,'sys:user:update,sys:role:select',2,NULL,0),(18,2,'删除',NULL,'sys:user:delete',2,NULL,0),(19,3,'查看',NULL,'sys:role:list,sys:role:info',2,NULL,0),(20,3,'新增',NULL,'sys:role:save,sys:menu:list',2,NULL,0),(21,3,'修改',NULL,'sys:role:update,sys:menu:list',2,NULL,0),(22,3,'删除',NULL,'sys:role:delete',2,NULL,0),(23,4,'查看',NULL,'sys:menu:list,sys:menu:info',2,NULL,0),(24,4,'新增',NULL,'sys:menu:save,sys:menu:select',2,NULL,0),(25,4,'修改',NULL,'sys:menu:update,sys:menu:select',2,NULL,0),(26,4,'删除',NULL,'sys:menu:delete',2,NULL,0),(29,1,'系统日志','sys/log','sys:log:list',1,'log',7),(31,0,'立项申请管理','','',0,'zhedie',0),(32,0,'赛事报名','','',0,'zhedie',0),(33,0,'结题管理','','',0,'zhedie',0),(34,31,'指导老师提交列表','pmcspsc/item/pmiteminfo-teahcer','',1,'daohang',0),(35,34,'查看','','pm:item:list,pm:item:info',2,'',0),(36,34,'新增','','pm:item:save',2,'',0),(37,34,'修改','','pm:item:update,pm:item:retreat:list',2,'',0),(38,34,'删除','','pm:item:delete',2,'',0),(39,31,'实践科审批列表','pmcspsc/item/pmiteminfo-dean','',1,'daohang',0),(40,39,'查看','','pm:item:list,pm:item:info',2,'',0),(42,39,'修改','','pm:item:update,pm:item:retreat:save',2,'',0),(44,32,'指导老师报名列表','pmcspsc/match/pmteaminfo-teacher','',1,'daohang',0),(45,44,'查看','','pm:team:list,pm:team:info,pm:person:list',2,'',0),(46,44,'新增','','pm:team:save',2,'',0),(47,44,'修改','','pm:team:update,pm:finish:retreat:list',2,'',0),(48,44,'删除','','pm:team:delete',2,'',0),(49,33,'项目结题申请','pmcspsc/finish/pmfinishinfo-teacher','',1,'daohang',0),(50,49,'查看','','pm:finish:list,pm:finish:info',2,'',0),(51,49,'新增','','pm:finish:save',2,'',0),(52,49,'修改','','pm:finish:update',2,'',0),(53,49,'删除','','pm:finish:delete',2,'',0),(54,33,'实践科审批列表','pmcspsc/finish/pmfinishinfo-dean','',1,'daohang',0),(55,54,'查看','','pm:finish:list,pm:finish:info',2,'',0),(56,54,'修改','','pm:finish:update,pm:finish:retreat:save',2,'',0);
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级管理员','超级管理员，唯一',1,'2019-12-01 08:54:09'),(2,'指导老师','每年在线填写参加专业学科竞赛项目立项申请信息，',1,'2019-12-01 08:55:18'),(3,'教务处实验实践科','审核指导老师每年在线填写的参加专业学科竞赛项目立项申请信息',1,'2019-12-01 08:56:31');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色与菜单对应关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (79,2,34),(80,2,35),(81,2,36),(82,2,37),(83,2,38),(84,2,32),(85,2,44),(86,2,45),(87,2,46),(88,2,47),(89,2,48),(90,2,33),(91,2,49),(92,2,50),(93,2,51),(94,2,52),(95,2,53),(96,2,-666666),(97,2,31),(98,3,39),(99,3,40),(100,3,42),(101,3,54),(102,3,55),(103,3,56),(104,3,-666666),(105,3,31),(106,3,33),(138,1,1),(139,1,2),(140,1,15),(141,1,16),(142,1,17),(143,1,18),(144,1,3),(145,1,19),(146,1,20),(147,1,21),(148,1,22),(149,1,4),(150,1,23),(151,1,24),(152,1,25),(153,1,26),(154,1,5),(155,1,29),(156,1,35),(157,1,40),(158,1,45),(159,1,50),(160,1,55),(161,1,-666666),(162,1,31),(163,1,34),(164,1,39),(165,1,32),(166,1,44),(167,1,33),(168,1,49),(169,1,54);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '盐',
  `email` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='系统用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,'admin','9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d','YzcmCZNvbXocrsz9dm8e','soldier_wyyx@163.com','18277404022',1,1,'2016-11-11 11:11:11'),(2,'teacher','71062396a607d3b61194e8122d2ec448f9c8cefbaccf0a9bc15e159060d3ba73','L80xBZ68Ze8MVOSsY4LW','teacher@wzxy.com','18888888888',1,1,'2019-12-01 08:58:32'),(3,'jwc','caa5332a8f222480c702be9211cfb9138c9c4c0f500e8f5c9ac8d7625f5c4a65','NnCQrG2gHTRKJxVdu1ZF','jiaowuchu@wzxy.com','18888888888',1,1,'2019-12-01 08:59:14');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户与角色对应关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,1,1),(2,2,2),(3,3,3);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_token`
--

DROP TABLE IF EXISTS `sys_user_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_token` (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='系统用户Token';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_token`
--

LOCK TABLES `sys_user_token` WRITE;
/*!40000 ALTER TABLE `sys_user_token` DISABLE KEYS */;
INSERT INTO `sys_user_token` VALUES (1,'d246a7fdc4cc4993c2821f64fa152aca','2019-12-24 20:29:26','2019-12-24 08:29:26'),(2,'19773d39603be9ae74593167c94e1270','2019-12-17 22:38:58','2019-12-17 10:38:58'),(3,'363361c087d59b1a0bc9e236efee9bfc','2019-12-05 04:35:42','2019-12-04 16:35:42');
/*!40000 ALTER TABLE `sys_user_token` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-24  9:14:42
