-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: pmcspsc
-- ------------------------------------------------------
-- Server version	5.7.28-0ubuntu0.19.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `QRTZ_BLOB_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_BLOB_TRIGGERS`
--

LOCK TABLES `QRTZ_BLOB_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_BLOB_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_BLOB_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_CALENDARS`
--

DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_CALENDARS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_CALENDARS`
--

LOCK TABLES `QRTZ_CALENDARS` WRITE;
/*!40000 ALTER TABLE `QRTZ_CALENDARS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_CALENDARS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_CRON_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_CRON_TRIGGERS`
--

LOCK TABLES `QRTZ_CRON_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_CRON_TRIGGERS` DISABLE KEYS */;
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('RenrenScheduler','TASK_1','DEFAULT','0 0/30 * * * ?','Asia/Shanghai');
/*!40000 ALTER TABLE `QRTZ_CRON_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_FIRED_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_FIRED_TRIGGERS`
--

LOCK TABLES `QRTZ_FIRED_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_FIRED_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_FIRED_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_JOB_DETAILS`
--

DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_JOB_DETAILS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_JOB_DETAILS`
--

LOCK TABLES `QRTZ_JOB_DETAILS` WRITE;
/*!40000 ALTER TABLE `QRTZ_JOB_DETAILS` DISABLE KEYS */;
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('RenrenScheduler','TASK_1','DEFAULT',NULL,'com.soldier.modules.job.utils.ScheduleJob','0','0','0','0',_binary '�\�\0sr\0org.quartz.JobDataMap���迩�\�\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�\�\��\�](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap\�.�(v\n\�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\00com.soldier.modules.job.entity.ScheduleJobEntity\0\0\0\0\0\0\0\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statust\0Ljava/lang/Integer;xpt\0testTasksr\0java.util.Datehj�KYt\0\0xpw\0\0n�n\0xt\00 0/30 * * * ?sr\0java.lang.Long;�\�̏#\�\0J\0valuexr\0java.lang.Number����\��\0\0xp\0\0\0\0\0\0\0t\0renrent\0参数测试sr\0java.lang.Integer⠤���8\0I\0valuexq\0~\0\0\0\0\0x\0');
/*!40000 ALTER TABLE `QRTZ_JOB_DETAILS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_LOCKS`
--

DROP TABLE IF EXISTS `QRTZ_LOCKS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_LOCKS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_LOCKS`
--

LOCK TABLES `QRTZ_LOCKS` WRITE;
/*!40000 ALTER TABLE `QRTZ_LOCKS` DISABLE KEYS */;
INSERT INTO `QRTZ_LOCKS` VALUES ('RenrenScheduler','STATE_ACCESS'),('RenrenScheduler','TRIGGER_ACCESS');
/*!40000 ALTER TABLE `QRTZ_LOCKS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_PAUSED_TRIGGER_GRPS`
--

DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_PAUSED_TRIGGER_GRPS`
--

LOCK TABLES `QRTZ_PAUSED_TRIGGER_GRPS` WRITE;
/*!40000 ALTER TABLE `QRTZ_PAUSED_TRIGGER_GRPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_PAUSED_TRIGGER_GRPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SCHEDULER_STATE`
--

DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SCHEDULER_STATE`
--

LOCK TABLES `QRTZ_SCHEDULER_STATE` WRITE;
/*!40000 ALTER TABLE `QRTZ_SCHEDULER_STATE` DISABLE KEYS */;
INSERT INTO `QRTZ_SCHEDULER_STATE` VALUES ('RenrenScheduler','soldier-RESCUER-R720-15IKBN1575448463340',1575448555952,15000);
/*!40000 ALTER TABLE `QRTZ_SCHEDULER_STATE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SIMPLE_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SIMPLE_TRIGGERS`
--

LOCK TABLES `QRTZ_SIMPLE_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_SIMPLE_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_SIMPLE_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SIMPROP_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SIMPROP_TRIGGERS`
--

LOCK TABLES `QRTZ_SIMPROP_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_SIMPROP_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_SIMPROP_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_TRIGGERS`
--

LOCK TABLES `QRTZ_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_TRIGGERS` DISABLE KEYS */;
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RenrenScheduler','TASK_1','DEFAULT','TASK_1','DEFAULT',NULL,1575450000000,-1,5,'WAITING','CRON',1575161096000,0,NULL,2,_binary '�\�\0sr\0org.quartz.JobDataMap���迩�\�\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�\�\��\�](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap\�.�(v\n\�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\00com.soldier.modules.job.entity.ScheduleJobEntity\0\0\0\0\0\0\0\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statust\0Ljava/lang/Integer;xpt\0testTasksr\0java.util.Datehj�KYt\0\0xpw\0\0n�n\0xt\00 0/30 * * * ?sr\0java.lang.Long;�\�̏#\�\0J\0valuexr\0java.lang.Number����\��\0\0xp\0\0\0\0\0\0\0t\0renrent\0参数测试sr\0java.lang.Integer⠤���8\0I\0valuexq\0~\0\0\0\0\0x\0');
/*!40000 ALTER TABLE `QRTZ_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_finish_attach`
--

DROP TABLE IF EXISTS `pm_finish_attach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='项目立项申请表';
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='团队信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_team_info`
--

LOCK TABLES `pm_team_info` WRITE;
/*!40000 ALTER TABLE `pm_team_info` DISABLE KEYS */;
INSERT INTO `pm_team_info` VALUES (1,1,2,'SHUXUE001','XIANGMU001','c.s.m.s.d.SysUserTokenDao.queryByToken   : ==> Parameters: ee9ba5dc82469d5845e11479f03946ce(String)','2019-12-12',3,2,0),(2,NULL,2,'SHUXUE002','XIANGMU002','SELECT COUNT(1) FROM pm_item_info WHERE (item_info_status = ? AND user_id = ?) ','2019-12-12',NULL,NULL,0);
/*!40000 ALTER TABLE `pm_team_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_team_person_info`
--

DROP TABLE IF EXISTS `pm_team_person_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
-- Table structure for table `schedule_job`
--

DROP TABLE IF EXISTS `schedule_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='定时任务';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_job`
--

LOCK TABLES `schedule_job` WRITE;
/*!40000 ALTER TABLE `schedule_job` DISABLE KEYS */;
INSERT INTO `schedule_job` VALUES (1,'testTask','renren','0 0/30 * * * ?',0,'参数测试','2019-11-30 21:09:20');
/*!40000 ALTER TABLE `schedule_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_job_log`
--

DROP TABLE IF EXISTS `schedule_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule_job_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COMMENT='定时任务日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_job_log`
--

LOCK TABLES `schedule_job_log` WRITE;
/*!40000 ALTER TABLE `schedule_job_log` DISABLE KEYS */;
INSERT INTO `schedule_job_log` VALUES (1,1,'testTask','renren',0,NULL,1,'2019-12-01 09:00:00'),(2,1,'testTask','renren',0,NULL,1,'2019-12-01 09:30:00'),(3,1,'testTask','renren',0,NULL,1,'2019-12-01 10:30:00'),(4,1,'testTask','renren',0,NULL,0,'2019-12-01 11:00:00'),(5,1,'testTask','renren',0,NULL,1,'2019-12-01 11:30:00'),(6,1,'testTask','renren',0,NULL,0,'2019-12-01 12:00:00'),(7,1,'testTask','renren',0,NULL,1,'2019-12-01 12:30:00'),(8,1,'testTask','renren',0,NULL,0,'2019-12-01 13:00:00'),(9,1,'testTask','renren',0,NULL,1,'2019-12-01 13:30:00'),(10,1,'testTask','renren',0,NULL,0,'2019-12-01 14:00:00'),(11,1,'testTask','renren',0,NULL,1,'2019-12-01 15:00:00'),(12,1,'testTask','renren',0,NULL,0,'2019-12-01 15:30:00'),(13,1,'testTask','renren',0,NULL,1,'2019-12-01 16:00:00'),(14,1,'testTask','renren',0,NULL,0,'2019-12-01 16:30:00'),(15,1,'testTask','renren',0,NULL,0,'2019-12-01 17:00:00'),(16,1,'testTask','renren',0,NULL,1,'2019-12-01 17:30:00'),(17,1,'testTask','renren',0,NULL,1,'2019-12-01 18:00:00'),(18,1,'testTask','renren',0,NULL,1,'2019-12-01 18:30:00'),(19,1,'testTask','renren',0,NULL,1,'2019-12-01 19:00:01'),(20,1,'testTask','renren',0,NULL,0,'2019-12-01 19:30:00'),(21,1,'testTask','renren',0,NULL,1,'2019-12-01 20:00:00'),(22,1,'testTask','renren',0,NULL,1,'2019-12-01 20:30:00'),(23,1,'testTask','renren',0,NULL,0,'2019-12-01 22:00:00'),(24,1,'testTask','renren',0,NULL,0,'2019-12-01 22:30:00'),(25,1,'testTask','renren',0,NULL,0,'2019-12-01 23:00:00'),(26,1,'testTask','renren',0,NULL,1,'2019-12-01 23:30:00'),(27,1,'testTask','renren',0,NULL,2,'2019-12-02 00:00:00'),(28,1,'testTask','renren',0,NULL,1,'2019-12-02 00:30:00'),(29,1,'testTask','renren',0,NULL,0,'2019-12-02 01:00:00'),(30,1,'testTask','renren',0,NULL,0,'2019-12-02 01:30:00'),(31,1,'testTask','renren',0,NULL,0,'2019-12-02 02:00:00'),(32,1,'testTask','renren',0,NULL,0,'2019-12-02 02:30:00'),(33,1,'testTask','renren',0,NULL,0,'2019-12-02 03:00:00'),(34,1,'testTask','renren',0,NULL,1,'2019-12-02 03:30:00'),(35,1,'testTask','renren',0,NULL,1,'2019-12-02 04:00:00'),(36,1,'testTask','renren',0,NULL,1,'2019-12-02 04:30:00'),(37,1,'testTask','renren',0,NULL,1,'2019-12-02 05:00:00'),(38,1,'testTask','renren',0,NULL,0,'2019-12-02 05:30:00'),(39,1,'testTask','renren',0,NULL,2,'2019-12-02 06:00:00'),(40,1,'testTask','renren',0,NULL,0,'2019-12-02 06:30:00'),(41,1,'testTask','renren',0,NULL,0,'2019-12-02 07:00:00'),(42,1,'testTask','renren',0,NULL,0,'2019-12-02 07:30:00'),(43,1,'testTask','renren',0,NULL,1,'2019-12-02 08:00:00'),(44,1,'testTask','renren',0,NULL,1,'2019-12-02 08:30:00'),(45,1,'testTask','renren',0,NULL,1,'2019-12-02 09:00:00'),(46,1,'testTask','renren',0,NULL,0,'2019-12-02 09:30:00'),(47,1,'testTask','renren',0,NULL,0,'2019-12-02 10:00:00'),(48,1,'testTask','renren',0,NULL,0,'2019-12-02 10:30:00'),(49,1,'testTask','renren',0,NULL,0,'2019-12-02 11:00:00'),(50,1,'testTask','renren',0,NULL,0,'2019-12-02 11:30:00'),(51,1,'testTask','renren',0,NULL,0,'2019-12-02 12:00:00'),(52,1,'testTask','renren',0,NULL,0,'2019-12-02 12:30:00'),(53,1,'testTask','renren',0,NULL,0,'2019-12-02 13:00:00'),(54,1,'testTask','renren',0,NULL,1,'2019-12-02 16:30:00'),(55,1,'testTask','renren',0,NULL,1,'2019-12-02 17:00:00'),(56,1,'testTask','renren',0,NULL,1,'2019-12-02 17:30:00'),(57,1,'testTask','renren',0,NULL,0,'2019-12-02 18:00:00'),(58,1,'testTask','renren',0,NULL,0,'2019-12-02 18:30:00'),(59,1,'testTask','renren',0,NULL,0,'2019-12-02 19:00:00'),(60,1,'testTask','renren',0,NULL,0,'2019-12-02 19:30:00'),(61,1,'testTask','renren',0,NULL,0,'2019-12-02 20:00:00'),(62,1,'testTask','renren',0,NULL,0,'2019-12-02 20:30:00'),(63,1,'testTask','renren',0,NULL,1,'2019-12-02 21:00:00'),(64,1,'testTask','renren',0,NULL,1,'2019-12-02 21:30:00'),(65,1,'testTask','renren',0,NULL,1,'2019-12-02 22:00:00'),(66,1,'testTask','renren',0,NULL,0,'2019-12-02 22:30:00'),(67,1,'testTask','renren',0,NULL,1,'2019-12-02 23:00:00'),(68,1,'testTask','renren',0,NULL,0,'2019-12-02 23:30:00'),(69,1,'testTask','renren',0,NULL,8,'2019-12-03 00:00:00'),(70,1,'testTask','renren',0,NULL,1,'2019-12-03 00:30:00'),(71,1,'testTask','renren',0,NULL,1,'2019-12-03 01:00:00'),(72,1,'testTask','renren',0,NULL,1,'2019-12-03 01:30:00'),(73,1,'testTask','renren',0,NULL,0,'2019-12-03 02:00:00'),(74,1,'testTask','renren',0,NULL,0,'2019-12-03 02:30:00'),(75,1,'testTask','renren',0,NULL,1,'2019-12-03 03:00:00'),(76,1,'testTask','renren',0,NULL,0,'2019-12-03 03:30:00'),(77,1,'testTask','renren',0,NULL,1,'2019-12-03 04:00:00'),(78,1,'testTask','renren',0,NULL,0,'2019-12-03 04:30:00'),(79,1,'testTask','renren',0,NULL,0,'2019-12-03 05:00:00'),(80,1,'testTask','renren',0,NULL,0,'2019-12-03 05:30:00'),(81,1,'testTask','renren',0,NULL,0,'2019-12-03 06:00:00'),(82,1,'testTask','renren',0,NULL,0,'2019-12-03 06:30:00'),(83,1,'testTask','renren',0,NULL,1,'2019-12-03 07:00:00'),(84,1,'testTask','renren',0,NULL,1,'2019-12-03 07:30:00'),(85,1,'testTask','renren',0,NULL,0,'2019-12-03 08:00:00'),(86,1,'testTask','renren',0,NULL,1,'2019-12-03 08:30:00'),(87,1,'testTask','renren',0,NULL,1,'2019-12-03 09:00:00'),(88,1,'testTask','renren',0,NULL,0,'2019-12-03 09:30:00'),(89,1,'testTask','renren',0,NULL,1,'2019-12-03 10:00:00'),(90,1,'testTask','renren',0,NULL,1,'2019-12-03 10:30:00'),(91,1,'testTask','renren',0,NULL,1,'2019-12-03 11:00:00'),(92,1,'testTask','renren',0,NULL,0,'2019-12-03 11:30:00'),(93,1,'testTask','renren',0,NULL,0,'2019-12-03 12:00:00'),(94,1,'testTask','renren',0,NULL,0,'2019-12-03 12:30:00'),(95,1,'testTask','renren',0,NULL,0,'2019-12-03 13:00:00'),(96,1,'testTask','renren',0,NULL,0,'2019-12-03 13:30:00'),(97,1,'testTask','renren',0,NULL,0,'2019-12-03 14:00:00'),(98,1,'testTask','renren',0,NULL,0,'2019-12-03 14:30:00'),(99,1,'testTask','renren',0,NULL,0,'2019-12-03 15:00:00'),(100,1,'testTask','renren',0,NULL,1,'2019-12-03 15:30:00'),(101,1,'testTask','renren',0,NULL,0,'2019-12-03 16:00:00'),(102,1,'testTask','renren',0,NULL,0,'2019-12-03 16:30:00'),(103,1,'testTask','renren',0,NULL,0,'2019-12-03 17:00:00'),(104,1,'testTask','renren',0,NULL,0,'2019-12-03 17:30:00'),(105,1,'testTask','renren',0,NULL,1,'2019-12-03 18:00:00'),(106,1,'testTask','renren',0,NULL,1,'2019-12-03 18:30:00'),(107,1,'testTask','renren',0,NULL,0,'2019-12-03 19:00:00'),(108,1,'testTask','renren',0,NULL,0,'2019-12-03 19:30:00'),(109,1,'testTask','renren',0,NULL,0,'2019-12-03 20:00:00'),(110,1,'testTask','renren',0,NULL,1,'2019-12-03 20:30:00'),(111,1,'testTask','renren',0,NULL,1,'2019-12-03 21:00:00'),(112,1,'testTask','renren',0,NULL,1,'2019-12-03 21:30:00'),(113,1,'testTask','renren',0,NULL,1,'2019-12-03 22:00:00'),(114,1,'testTask','renren',0,NULL,0,'2019-12-03 22:30:00'),(115,1,'testTask','renren',0,NULL,1,'2019-12-03 23:00:00'),(116,1,'testTask','renren',0,NULL,1,'2019-12-03 23:30:00'),(117,1,'testTask','renren',0,NULL,4,'2019-12-04 00:00:00'),(118,1,'testTask','renren',0,NULL,0,'2019-12-04 00:30:00'),(119,1,'testTask','renren',0,NULL,0,'2019-12-04 01:00:00'),(120,1,'testTask','renren',0,NULL,1,'2019-12-04 01:30:00'),(121,1,'testTask','renren',0,NULL,0,'2019-12-04 02:00:00'),(122,1,'testTask','renren',0,NULL,1,'2019-12-04 02:30:00'),(123,1,'testTask','renren',0,NULL,1,'2019-12-04 03:00:00'),(124,1,'testTask','renren',0,NULL,0,'2019-12-04 03:30:00'),(125,1,'testTask','renren',0,NULL,1,'2019-12-04 04:00:00'),(126,1,'testTask','renren',0,NULL,1,'2019-12-04 04:30:00'),(127,1,'testTask','renren',0,NULL,0,'2019-12-04 05:00:00'),(128,1,'testTask','renren',0,NULL,0,'2019-12-04 05:30:00'),(129,1,'testTask','renren',0,NULL,1,'2019-12-04 06:00:00'),(130,1,'testTask','renren',0,NULL,1,'2019-12-04 06:30:00'),(131,1,'testTask','renren',0,NULL,1,'2019-12-04 07:00:00'),(132,1,'testTask','renren',0,NULL,1,'2019-12-04 07:30:00'),(133,1,'testTask','renren',0,NULL,0,'2019-12-04 08:00:00'),(134,1,'testTask','renren',0,NULL,1,'2019-12-04 08:30:00'),(135,1,'testTask','renren',0,NULL,0,'2019-12-04 09:00:00'),(136,1,'testTask','renren',0,NULL,0,'2019-12-04 09:30:00'),(137,1,'testTask','renren',0,NULL,2,'2019-12-04 10:00:00'),(138,1,'testTask','renren',0,NULL,0,'2019-12-04 10:30:00'),(139,1,'testTask','renren',0,NULL,0,'2019-12-04 11:00:00'),(140,1,'testTask','renren',0,NULL,0,'2019-12-04 11:30:00'),(141,1,'testTask','renren',0,NULL,0,'2019-12-04 12:00:00'),(142,1,'testTask','renren',0,NULL,0,'2019-12-04 12:30:00'),(143,1,'testTask','renren',0,NULL,1,'2019-12-04 13:00:00'),(144,1,'testTask','renren',0,NULL,1,'2019-12-04 13:30:00'),(145,1,'testTask','renren',0,NULL,0,'2019-12-04 14:00:00'),(146,1,'testTask','renren',0,NULL,0,'2019-12-04 14:30:00'),(147,1,'testTask','renren',0,NULL,0,'2019-12-04 15:00:00'),(148,1,'testTask','renren',0,NULL,0,'2019-12-04 15:30:00'),(149,1,'testTask','renren',0,NULL,0,'2019-12-04 16:00:00'),(150,1,'testTask','renren',0,NULL,0,'2019-12-04 16:30:00');
/*!40000 ALTER TABLE `schedule_job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_captcha`
--

DROP TABLE IF EXISTS `sys_captcha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_captcha` (
  `uuid` char(36) NOT NULL COMMENT 'uuid',
  `code` varchar(6) NOT NULL COMMENT '验证码',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统验证码';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_captcha`
--

LOCK TABLES `sys_captcha` WRITE;
/*!40000 ALTER TABLE `sys_captcha` DISABLE KEYS */;
INSERT INTO `sys_captcha` VALUES ('05ce9695-0773-4f12-8a12-d4a867e4b591','effg7','2019-12-01 20:32:25'),('10ce2f67-61ae-4a55-8fdc-61ffbe2ca12a','5bnmn','2019-12-04 08:26:55'),('13b64535-4743-4c46-8744-4d3b9a1e016e','m7cmx','2019-12-04 08:26:29'),('1df1ae7f-1066-4031-8929-00e6ebef2e8b','g6cx7','2019-12-04 11:12:53'),('22654cd2-ada1-4fdf-837f-f963330da30d','46w44','2019-12-04 08:48:39'),('32b5a552-b428-439e-8d0e-fca96e5179a3','2egm5','2019-12-01 22:05:04'),('45a662b7-8aeb-49ae-89cb-603757fcada8','myce5','2019-12-04 08:26:35'),('62f621ee-3f70-4b38-8e23-3680cf991ce7','p3bam','2019-12-04 08:28:39'),('6c6c9048-684e-400e-8e52-0583b943cc55','82gag','2019-12-04 08:29:51'),('d7778325-1058-4ecb-8593-cfcc6de26a23','b8m44','2019-12-01 20:37:16');
/*!40000 ALTER TABLE `sys_captcha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `param_key` (`param_key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='系统配置信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'CLOUD_STORAGE_CONFIG_KEY','{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}',0,'云存储配置信息');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_log`
--

DROP TABLE IF EXISTS `sys_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COMMENT='系统日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_log`
--

LOCK TABLES `sys_log` WRITE;
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;
INSERT INTO `sys_log` VALUES (1,'admin','保存角色','com.soldier.modules.sys.controller.SysRoleController.save()','[{\"roleId\":1,\"roleName\":\"超级管理员\",\"remark\":\"超级管理员，唯一\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,-666666],\"createTime\":\"Dec 1, 2019 8:54:08 AM\"}]',131,'0:0:0:0:0:0:0:1','2019-12-01 08:54:09'),(2,'admin','保存角色','com.soldier.modules.sys.controller.SysRoleController.save()','[{\"roleId\":2,\"roleName\":\"指导老师\",\"remark\":\"每年在线填写参加专业学科竞赛项目立项申请信息，\",\"createUserId\":1,\"menuIdList\":[30,-666666,1],\"createTime\":\"Dec 1, 2019 8:55:17 AM\"}]',25,'0:0:0:0:0:0:0:1','2019-12-01 08:55:18'),(3,'admin','修改角色','com.soldier.modules.sys.controller.SysRoleController.update()','[{\"roleId\":2,\"roleName\":\"指导老师\",\"remark\":\"每年在线填写参加专业学科竞赛项目立项申请信息，\",\"createUserId\":1,\"menuIdList\":[-666666]}]',42,'0:0:0:0:0:0:0:1','2019-12-01 08:55:36'),(4,'admin','保存角色','com.soldier.modules.sys.controller.SysRoleController.save()','[{\"roleId\":3,\"roleName\":\"教务处实验实践科\",\"remark\":\"审核指导老师每年在线填写的参加专业学科竞赛项目立项申请信息\",\"createUserId\":1,\"menuIdList\":[-666666],\"createTime\":\"Dec 1, 2019 8:56:31 AM\"}]',28,'0:0:0:0:0:0:0:1','2019-12-01 08:56:32'),(5,'admin','修改用户','com.soldier.modules.sys.controller.SysUserController.update()','[{\"userId\":1,\"username\":\"admin\",\"password\":\"9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"soldier_wyyx@163.com\",\"mobile\":\"18277404022\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1}]',84,'0:0:0:0:0:0:0:1','2019-12-01 08:57:13'),(6,'admin','保存用户','com.soldier.modules.sys.controller.SysUserController.save()','[{\"userId\":2,\"username\":\"teacher\",\"password\":\"71062396a607d3b61194e8122d2ec448f9c8cefbaccf0a9bc15e159060d3ba73\",\"salt\":\"L80xBZ68Ze8MVOSsY4LW\",\"email\":\"teacher@wzxy.com\",\"mobile\":\"18888888888\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1,\"createTime\":\"Dec 1, 2019 8:58:32 AM\"}]',19,'0:0:0:0:0:0:0:1','2019-12-01 08:58:32'),(7,'admin','保存用户','com.soldier.modules.sys.controller.SysUserController.save()','[{\"userId\":3,\"username\":\"jwc\",\"password\":\"caa5332a8f222480c702be9211cfb9138c9c4c0f500e8f5c9ac8d7625f5c4a65\",\"salt\":\"NnCQrG2gHTRKJxVdu1ZF\",\"email\":\"jiaowuchu@wzxy.com\",\"mobile\":\"18888888888\",\"status\":1,\"roleIdList\":[3],\"createUserId\":1,\"createTime\":\"Dec 1, 2019 8:59:14 AM\"}]',19,'0:0:0:0:0:0:0:1','2019-12-01 08:59:14'),(8,'admin','保存菜单','com.soldier.modules.sys.controller.SysMenuController.save()','[{\"menuId\":31,\"parentId\":0,\"name\":\"申请管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"zhedie\",\"orderNum\":0}]',13,'0:0:0:0:0:0:0:1','2019-12-01 09:08:33'),(9,'admin','保存菜单','com.soldier.modules.sys.controller.SysMenuController.save()','[{\"menuId\":32,\"parentId\":0,\"name\":\"赛事报名\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"zhedie\",\"orderNum\":0}]',11,'0:0:0:0:0:0:0:1','2019-12-01 09:08:57'),(10,'admin','保存菜单','com.soldier.modules.sys.controller.SysMenuController.save()','[{\"menuId\":33,\"parentId\":0,\"name\":\"结题管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"zhedie\",\"orderNum\":0}]',11,'0:0:0:0:0:0:0:1','2019-12-01 09:09:16'),(11,'admin','保存菜单','com.soldier.modules.sys.controller.SysMenuController.save()','[{\"menuId\":34,\"parentId\":31,\"name\":\"项目立项申请列表\",\"url\":\"pmcspsc/pmiteminfo\",\"perms\":\"pm:item:list,pm:item:info\",\"type\":1,\"icon\":\"daohang\",\"orderNum\":0}]',18,'0:0:0:0:0:0:0:1','2019-12-01 09:36:26'),(12,'admin','保存菜单','com.soldier.modules.sys.controller.SysMenuController.save()','[{\"menuId\":35,\"parentId\":34,\"name\":\"查看\",\"url\":\"\",\"perms\":\"pm:item:list,pm:item:info\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]',15,'0:0:0:0:0:0:0:1','2019-12-01 09:45:32'),(13,'admin','修改菜单','com.soldier.modules.sys.controller.SysMenuController.update()','[{\"menuId\":34,\"parentId\":31,\"name\":\"项目立项申请列表\",\"url\":\"pmcspsc/pmiteminfo\",\"perms\":\"\",\"type\":1,\"icon\":\"daohang\",\"orderNum\":0}]',20,'0:0:0:0:0:0:0:1','2019-12-01 09:45:54'),(14,'admin','保存菜单','com.soldier.modules.sys.controller.SysMenuController.save()','[{\"menuId\":36,\"parentId\":34,\"name\":\"新增\",\"url\":\"\",\"perms\":\"pm:item:save\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]',9,'0:0:0:0:0:0:0:1','2019-12-01 09:47:16'),(15,'admin','保存菜单','com.soldier.modules.sys.controller.SysMenuController.save()','[{\"menuId\":37,\"parentId\":34,\"name\":\"修改\",\"url\":\"\",\"perms\":\"pm:item:update\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]',27,'0:0:0:0:0:0:0:1','2019-12-01 09:47:34'),(16,'admin','保存菜单','com.soldier.modules.sys.controller.SysMenuController.save()','[{\"menuId\":38,\"parentId\":34,\"name\":\"删除\",\"url\":\"\",\"perms\":\"pm:item:delete\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]',10,'0:0:0:0:0:0:0:1','2019-12-01 09:47:46'),(17,'admin','修改菜单','com.soldier.modules.sys.controller.SysMenuController.update()','[{\"menuId\":34,\"parentId\":31,\"name\":\"指导老师立项申请列表\",\"url\":\"pmcspsc/item/pmiteminfo-teahcer\",\"perms\":\"\",\"type\":1,\"icon\":\"daohang\",\"orderNum\":0}]',13,'0:0:0:0:0:0:0:1','2019-12-01 16:56:14'),(18,'admin','保存菜单','com.soldier.modules.sys.controller.SysMenuController.save()','[{\"menuId\":39,\"parentId\":31,\"name\":\"实践科审批列表\",\"url\":\"pmcspsc/item/pmiteminfo-dean\",\"perms\":\"pm:item:list,pm:item:info\",\"type\":1,\"icon\":\"daohang\",\"orderNum\":0}]',13,'0:0:0:0:0:0:0:1','2019-12-01 16:58:00'),(19,'admin','修改菜单','com.soldier.modules.sys.controller.SysMenuController.update()','[{\"menuId\":31,\"parentId\":0,\"name\":\"立项申请管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"zhedie\",\"orderNum\":0}]',10,'0:0:0:0:0:0:0:1','2019-12-01 16:58:36'),(20,'admin','修改菜单','com.soldier.modules.sys.controller.SysMenuController.update()','[{\"menuId\":34,\"parentId\":31,\"name\":\"指导老师提交列表\",\"url\":\"pmcspsc/item/pmiteminfo-teahcer\",\"perms\":\"\",\"type\":1,\"icon\":\"daohang\",\"orderNum\":0}]',14,'0:0:0:0:0:0:0:1','2019-12-01 16:58:51'),(21,'admin','修改菜单','com.soldier.modules.sys.controller.SysMenuController.update()','[{\"menuId\":39,\"parentId\":31,\"name\":\"实践科审批列表\",\"url\":\"pmcspsc/item/pmiteminfo-dean\",\"perms\":\"\",\"type\":1,\"icon\":\"daohang\",\"orderNum\":0}]',7,'0:0:0:0:0:0:0:1','2019-12-01 16:59:02'),(22,'admin','保存菜单','com.soldier.modules.sys.controller.SysMenuController.save()','[{\"menuId\":40,\"parentId\":39,\"name\":\"查看\",\"url\":\"\",\"perms\":\"pm:item:list,pm:item:info\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]',24,'0:0:0:0:0:0:0:1','2019-12-01 16:59:28'),(23,'admin','修改角色','com.soldier.modules.sys.controller.SysRoleController.update()','[{\"roleId\":3,\"roleName\":\"教务处实验实践科\",\"remark\":\"审核指导老师每年在线填写的参加专业学科竞赛项目立项申请信息\",\"createUserId\":1,\"menuIdList\":[39,40,41,42,43,-666666,31]}]',261,'0:0:0:0:0:0:0:1','2019-12-01 19:49:03'),(24,'admin','修改角色','com.soldier.modules.sys.controller.SysRoleController.update()','[{\"roleId\":3,\"roleName\":\"教务处实验实践科\",\"remark\":\"审核指导老师每年在线填写的参加专业学科竞赛项目立项申请信息\",\"createUserId\":1,\"menuIdList\":[-666666]}]',37,'0:0:0:0:0:0:0:1','2019-12-01 19:49:12'),(25,'admin','修改角色','com.soldier.modules.sys.controller.SysRoleController.update()','[{\"roleId\":2,\"roleName\":\"指导老师\",\"remark\":\"每年在线填写参加专业学科竞赛项目立项申请信息，\",\"createUserId\":1,\"menuIdList\":[34,35,36,37,38,-666666,31]}]',28,'0:0:0:0:0:0:0:1','2019-12-01 19:51:36'),(26,'admin','修改角色','com.soldier.modules.sys.controller.SysRoleController.update()','[{\"roleId\":3,\"roleName\":\"教务处实验实践科\",\"remark\":\"审核指导老师每年在线填写的参加专业学科竞赛项目立项申请信息\",\"createUserId\":1,\"menuIdList\":[39,40,42,-666666,31]}]',44,'0:0:0:0:0:0:0:1','2019-12-01 19:51:44'),(27,'admin','保存菜单','com.soldier.modules.sys.controller.SysMenuController.save()','[{\"menuId\":44,\"parentId\":32,\"name\":\"指导老师报名列表\",\"url\":\"pmcspsc/match/pmteaminfo-teacher\",\"perms\":\"\",\"type\":1,\"icon\":\"daohang\",\"orderNum\":0}]',18,'127.0.0.1','2019-12-02 09:09:41'),(28,'admin','保存菜单','com.soldier.modules.sys.controller.SysMenuController.save()','[{\"menuId\":45,\"parentId\":44,\"name\":\"查看\",\"url\":\"\",\"perms\":\"pm:team:list,pm:team:info\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]',13,'127.0.0.1','2019-12-02 09:10:18'),(29,'admin','修改角色','com.soldier.modules.sys.controller.SysRoleController.update()','[{\"roleId\":2,\"roleName\":\"指导老师\",\"remark\":\"每年在线填写参加专业学科竞赛项目立项申请信息，\",\"createUserId\":1,\"menuIdList\":[34,35,36,37,38,32,44,45,-666666,31]}]',143,'127.0.0.1','2019-12-02 09:10:59'),(30,'admin','修改角色','com.soldier.modules.sys.controller.SysRoleController.update()','[{\"roleId\":2,\"roleName\":\"指导老师\",\"remark\":\"每年在线填写参加专业学科竞赛项目立项申请信息，\",\"createUserId\":1,\"menuIdList\":[34,35,36,37,38,32,44,45,46,47,48,-666666,31]}]',21,'127.0.0.1','2019-12-02 09:20:03'),(31,'admin','保存菜单','com.soldier.modules.sys.controller.SysMenuController.save()','[{\"menuId\":49,\"parentId\":33,\"name\":\"项目结题申请\",\"url\":\"pmcspsc/finishpmfinishinfo-teacher\",\"perms\":\"\",\"type\":1,\"icon\":\"daohang\",\"orderNum\":0}]',17,'127.0.0.1','2019-12-03 09:01:59'),(32,'admin','保存菜单','com.soldier.modules.sys.controller.SysMenuController.save()','[{\"menuId\":50,\"parentId\":49,\"name\":\"查看\",\"url\":\"\",\"perms\":\"pm:finish:list,pm:finish:info\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]',17,'127.0.0.1','2019-12-03 09:02:45'),(33,'admin','修改角色','com.soldier.modules.sys.controller.SysRoleController.update()','[{\"roleId\":2,\"roleName\":\"指导老师\",\"remark\":\"每年在线填写参加专业学科竞赛项目立项申请信息，\",\"createUserId\":1,\"menuIdList\":[34,35,36,37,38,32,44,45,46,47,48,33,49,50,51,52,53,-666666,31]}]',355,'127.0.0.1','2019-12-03 09:04:03'),(34,'admin','保存菜单','com.soldier.modules.sys.controller.SysMenuController.save()','[{\"menuId\":54,\"parentId\":33,\"name\":\"实践科审批列表\",\"url\":\"pmcspsc/finish/pmfinishinfo-dean\",\"perms\":\"\",\"type\":1,\"icon\":\"daohang\",\"orderNum\":0}]',12,'127.0.0.1','2019-12-04 16:14:40'),(35,'admin','保存菜单','com.soldier.modules.sys.controller.SysMenuController.save()','[{\"menuId\":55,\"parentId\":54,\"name\":\"查看\",\"url\":\"\",\"perms\":\"pm:finish:list,pm:finish:info\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]',8,'127.0.0.1','2019-12-04 16:15:33'),(36,'admin','保存菜单','com.soldier.modules.sys.controller.SysMenuController.save()','[{\"menuId\":56,\"parentId\":54,\"name\":\"修改\",\"url\":\"\",\"perms\":\"pm:finish:update,pm:finish:retreat:save\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]',10,'127.0.0.1','2019-12-04 16:16:05'),(37,'admin','修改角色','com.soldier.modules.sys.controller.SysRoleController.update()','[{\"roleId\":3,\"roleName\":\"教务处实验实践科\",\"remark\":\"审核指导老师每年在线填写的参加专业学科竞赛项目立项申请信息\",\"createUserId\":1,\"menuIdList\":[39,40,42,54,55,56,-666666,31,33]}]',107,'127.0.0.1','2019-12-04 16:16:19');
/*!40000 ALTER TABLE `sys_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COMMENT='菜单管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,0,'系统管理',NULL,NULL,0,'system',0),(2,1,'管理员列表','sys/user',NULL,1,'admin',1),(3,1,'角色管理','sys/role',NULL,1,'role',2),(4,1,'菜单管理','sys/menu',NULL,1,'menu',3),(5,1,'SQL监控','http://localhost:8080/renren-fast/druid/sql.html',NULL,1,'sql',4),(6,1,'定时任务','job/schedule',NULL,1,'job',5),(7,6,'查看',NULL,'sys:schedule:list,sys:schedule:info',2,NULL,0),(8,6,'新增',NULL,'sys:schedule:save',2,NULL,0),(9,6,'修改',NULL,'sys:schedule:update',2,NULL,0),(10,6,'删除',NULL,'sys:schedule:delete',2,NULL,0),(11,6,'暂停',NULL,'sys:schedule:pause',2,NULL,0),(12,6,'恢复',NULL,'sys:schedule:resume',2,NULL,0),(13,6,'立即执行',NULL,'sys:schedule:run',2,NULL,0),(14,6,'日志列表',NULL,'sys:schedule:log',2,NULL,0),(15,2,'查看',NULL,'sys:user:list,sys:user:info',2,NULL,0),(16,2,'新增',NULL,'sys:user:save,sys:role:select',2,NULL,0),(17,2,'修改',NULL,'sys:user:update,sys:role:select',2,NULL,0),(18,2,'删除',NULL,'sys:user:delete',2,NULL,0),(19,3,'查看',NULL,'sys:role:list,sys:role:info',2,NULL,0),(20,3,'新增',NULL,'sys:role:save,sys:menu:list',2,NULL,0),(21,3,'修改',NULL,'sys:role:update,sys:menu:list',2,NULL,0),(22,3,'删除',NULL,'sys:role:delete',2,NULL,0),(23,4,'查看',NULL,'sys:menu:list,sys:menu:info',2,NULL,0),(24,4,'新增',NULL,'sys:menu:save,sys:menu:select',2,NULL,0),(25,4,'修改',NULL,'sys:menu:update,sys:menu:select',2,NULL,0),(26,4,'删除',NULL,'sys:menu:delete',2,NULL,0),(27,1,'参数管理','sys/config','sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete',1,'config',6),(29,1,'系统日志','sys/log','sys:log:list',1,'log',7),(30,1,'文件上传','oss/oss','sys:oss:all',1,'oss',6),(31,0,'立项申请管理','','',0,'zhedie',0),(32,0,'赛事报名','','',0,'zhedie',0),(33,0,'结题管理','','',0,'zhedie',0),(34,31,'指导老师提交列表','pmcspsc/item/pmiteminfo-teahcer','',1,'daohang',0),(35,34,'查看','','pm:item:list,pm:item:info',2,'',0),(36,34,'新增','','pm:item:save',2,'',0),(37,34,'修改','','pm:item:update,pm:item:retreat:list',2,'',0),(38,34,'删除','','pm:item:delete',2,'',0),(39,31,'实践科审批列表','pmcspsc/item/pmiteminfo-dean','',1,'daohang',0),(40,39,'查看','','pm:item:list,pm:item:info',2,'',0),(42,39,'修改','','pm:item:update,pm:item:retreat:save',2,'',0),(44,32,'指导老师报名列表','pmcspsc/match/pmteaminfo-teacher','',1,'daohang',0),(45,44,'查看','','pm:team:list,pm:team:info,pm:person:list',2,'',0),(46,44,'新增','','pm:team:save',2,'',0),(47,44,'修改','','pm:team:update,pm:finish:retreat:list',2,'',0),(48,44,'删除','','pm:team:delete',2,'',0),(49,33,'项目结题申请','pmcspsc/finish/pmfinishinfo-teacher','',1,'daohang',0),(50,49,'查看','','pm:finish:list,pm:finish:info',2,'',0),(51,49,'新增','','pm:finish:save',2,'',0),(52,49,'修改','','pm:finish:update',2,'',0),(53,49,'删除','','pm:finish:delete',2,'',0),(54,33,'实践科审批列表','pmcspsc/finish/pmfinishinfo-dean','',1,'daohang',0),(55,54,'查看','','pm:finish:list,pm:finish:info',2,'',0),(56,54,'修改','','pm:finish:update,pm:finish:retreat:save',2,'',0);
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oss`
--

DROP TABLE IF EXISTS `sys_oss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_oss` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='文件上传';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oss`
--

LOCK TABLES `sys_oss` WRITE;
/*!40000 ALTER TABLE `sys_oss` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_oss` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='角色';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COMMENT='角色与菜单对应关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (1,1,1),(2,1,2),(3,1,15),(4,1,16),(5,1,17),(6,1,18),(7,1,3),(8,1,19),(9,1,20),(10,1,21),(11,1,22),(12,1,4),(13,1,23),(14,1,24),(15,1,25),(16,1,26),(17,1,5),(18,1,6),(19,1,7),(20,1,8),(21,1,9),(22,1,10),(23,1,11),(24,1,12),(25,1,13),(26,1,14),(27,1,27),(28,1,29),(29,1,30),(30,1,-666666),(79,2,34),(80,2,35),(81,2,36),(82,2,37),(83,2,38),(84,2,32),(85,2,44),(86,2,45),(87,2,46),(88,2,47),(89,2,48),(90,2,33),(91,2,49),(92,2,50),(93,2,51),(94,2,52),(95,2,53),(96,2,-666666),(97,2,31),(98,3,39),(99,3,40),(100,3,42),(101,3,54),(102,3,55),(103,3,56),(104,3,-666666),(105,3,31),(106,3,33);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) DEFAULT NULL COMMENT '盐',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='系统用户';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='用户与角色对应关系';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_token` (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(100) NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统用户Token';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_token`
--

LOCK TABLES `sys_user_token` WRITE;
/*!40000 ALTER TABLE `sys_user_token` DISABLE KEYS */;
INSERT INTO `sys_user_token` VALUES (1,'995f8c9b00e665aca440de1f35f03bdf','2019-12-05 04:13:13','2019-12-04 16:13:13'),(2,'66764bae33970da3c7c32438469d5400','2019-12-05 04:26:26','2019-12-04 16:26:26'),(3,'363361c087d59b1a0bc9e236efee9bfc','2019-12-05 04:35:42','2019-12-04 16:35:42');
/*!40000 ALTER TABLE `sys_user_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user`
--

DROP TABLE IF EXISTS `tb_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user`
--

LOCK TABLES `tb_user` WRITE;
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` VALUES (1,'mark','13612345678','8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918','2017-03-23 22:37:41');
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-04 16:36:19
