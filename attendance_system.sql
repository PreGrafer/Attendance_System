-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: attendance_system
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE = @@TIME_ZONE */;
/*!40103 SET TIME_ZONE = '+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES = @@SQL_NOTES, SQL_NOTES = 0 */;

--
-- Schema structure for schema `attendance_system`
--

DROP SCHEMA IF EXISTS `attendance_system`;
CREATE SCHEMA attendance_system;
USE attendance_system;

--
-- Table structure for table `department_code`
--

DROP TABLE IF EXISTS `department_code`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department_code`
(
    `DEPARTMENT_ID`   int NOT NULL COMMENT '部门代码',
    `DEPARTMENT_NAME` varchar(20) DEFAULT NULL COMMENT '部门名称',
    PRIMARY KEY (`DEPARTMENT_ID`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb3
  ROW_FORMAT = COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department_code`
--

LOCK TABLES `department_code` WRITE;
/*!40000 ALTER TABLE `department_code`
    DISABLE KEYS */;
INSERT INTO `department_code`
VALUES (0, '管理员'),
       (1, '人事部'),
       (2, '技术部'),
       (3, '销售部');
/*!40000 ALTER TABLE `department_code`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_record`
--

DROP TABLE IF EXISTS `leave_record`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leave_record`
(
    `RECORD_ID`         int NOT NULL AUTO_INCREMENT COMMENT '记录编号',
    `DEPARTMENT_ID`     int          DEFAULT NULL COMMENT '部门编号',
    `STAFF_ID`          varchar(11)  DEFAULT NULL COMMENT '员工编号',
    `HANIN_TIME`        datetime     DEFAULT NULL COMMENT '申请时间',
    `LEAVE_START_TIME`  datetime     DEFAULT NULL COMMENT '假期开始时间',
    `LEAVE_END_TIME`    datetime     DEFAULT NULL COMMENT '假期结束时间',
    `APPLICATION_STATE` varchar(20)  DEFAULT NULL COMMENT '申请状态0.待审核1.通过2.不通过',
    `REASON`            varchar(100) DEFAULT NULL COMMENT '请假事由',
    `REPLY`             varchar(100) DEFAULT NULL COMMENT '审批片语',
    `HANDLE_TIME`       datetime     DEFAULT NULL COMMENT '处理时间',
    PRIMARY KEY (`RECORD_ID`) USING BTREE,
    FOREIGN KEY (`DEPARTMENT_ID`) REFERENCES `department_code` (`DEPARTMENT_ID`) ON DELETE SET NULL,
    FOREIGN KEY (`STAFF_ID`) REFERENCES `staff` (`STAFF_ID`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  DEFAULT CHARSET = utf8mb3
  ROW_FORMAT = COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_record`
--

LOCK TABLES `leave_record` WRITE;
/*!40000 ALTER TABLE `leave_record`
    DISABLE KEYS */;
INSERT INTO `leave_record`
VALUES (1, 1, '1001', '2023-05-29 23:24:15', '2023-05-17 00:00:00', '2023-05-18 23:59:00', '1', '请假', '通过',
        '2023-05-29 23:24:28');
/*!40000 ALTER TABLE `leave_record`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_detail`
--

DROP TABLE IF EXISTS `report_detail`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report_detail`
(
    `DETAIL_ID`         int NOT NULL AUTO_INCREMENT,
    `REPORT_ID`         int         DEFAULT NULL,
    `CREATE_DATE`       datetime    DEFAULT NULL,
    `DEPARTMENT_ID`     int         DEFAULT NULL,
    `DEPARTMENT_NAME`   varchar(20) DEFAULT NULL,
    `STAFF_ID`          varchar(20) DEFAULT NULL,
    `STAFF_NAME`        varchar(20) DEFAULT NULL,
    `DAY_LATE_COUNT`    int         DEFAULT NULL COMMENT '部门当天迟到人次统计',
    `DAY_EARLY_COUNT`   int         DEFAULT NULL COMMENT '部门当天早退人次统计',
    `MONTH_LATE_COUNT`  int         DEFAULT NULL COMMENT '部门当月迟到人次统计',
    `MONTH_EARLY_COUNT` int         DEFAULT NULL COMMENT '部门当月早退人次统计',
    `YEAR_LATE_COUNT`   int         DEFAULT NULL COMMENT '部门当年迟到人次统计',
    `YEAR_EARLY_COUNT`  int         DEFAULT NULL COMMENT '部门当年迟到人次统计',
    PRIMARY KEY (`DETAIL_ID`) USING BTREE,
    FOREIGN KEY (`REPORT_ID`) REFERENCES `report_info` (`REPORT_ID`) ON DELETE SET NULL
) ENGINE = InnoDB
  AUTO_INCREMENT = 13
  DEFAULT CHARSET = utf8mb3
  ROW_FORMAT = COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_detail`
--

LOCK TABLES `report_detail` WRITE;
/*!40000 ALTER TABLE `report_detail`
    DISABLE KEYS */;
INSERT INTO `report_detail`
VALUES (1, 1, '2023-05-27 00:00:00', 3, '销售部', '3000', '柳明', 0, 0, 1, 1, 1, 1),
       (2, 1, '2023-05-27 00:00:00', 3, '销售部', '3001', '王心凌', 0, 0, 0, 0, 0, 0),
       (3, 1, '2023-05-27 00:00:00', 3, '销售部', '3002', '龚珍', 0, 0, 0, 1, 0, 1),
       (4, 1, '2023-05-27 00:00:00', 3, '销售部', '3003', '沈强', 0, 0, 0, 1, 0, 1),
       (5, 2, '2023-05-27 00:00:00', 2, '技术部', '2000', '陈磊', 0, 0, 1, 0, 1, 0),
       (6, 2, '2023-05-27 00:00:00', 2, '技术部', '2001', '白岭', 0, 0, 0, 0, 0, 0),
       (7, 2, '2023-05-27 00:00:00', 2, '技术部', '2002', '王晓', 0, 0, 0, 3, 0, 3),
       (8, 2, '2023-05-27 00:00:00', 2, '技术部', '2003', '杨磊', 0, 0, 7, 0, 7, 0),
       (9, 3, '2023-05-27 00:00:00', 1, '人事部', '1000', '王蕾', 0, 0, 1, 1, 1, 1),
       (10, 3, '2023-05-27 00:00:00', 1, '人事部', '1001', '王晓蕾', 0, 0, 0, 0, 0, 0),
       (11, 3, '2023-05-27 00:00:00', 1, '人事部', '1002', '陈颖', 0, 0, 6, 0, 6, 0),
       (12, 3, '2023-05-27 00:00:00', 1, '人事部', '1003', '杨磊', 0, 0, 0, 0, 0, 0);
/*!40000 ALTER TABLE `report_detail`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_info`
--

DROP TABLE IF EXISTS `report_info`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report_info`
(
    `REPORT_ID`         int NOT NULL AUTO_INCREMENT,
    `CREATE_DATE`       datetime    DEFAULT NULL,
    `DEPARTMENT_ID`     int         DEFAULT NULL,
    `DEPARTMENT_NAME`   varchar(20) DEFAULT NULL,
    `DAY_LATE_COUNT`    int         DEFAULT NULL COMMENT '部门当天迟到人次统计',
    `DAY_EARLY_COUNT`   int         DEFAULT NULL COMMENT '部门当天早退人次统计',
    `MONTH_LATE_COUNT`  int         DEFAULT NULL COMMENT '部门当月迟到人次统计',
    `MONTH_EARLY_COUNT` int         DEFAULT NULL COMMENT '部门当月早退人次统计',
    `YEAR_LATE_COUNT`   int         DEFAULT NULL COMMENT '部门当年迟到人次统计',
    `YEAR_EARLY_COUNT`  int         DEFAULT NULL COMMENT '部门当年迟到人次统计',
    PRIMARY KEY (`REPORT_ID`) USING BTREE,
    FOREIGN KEY (`DEPARTMENT_ID`) REFERENCES `department_code` (`DEPARTMENT_ID`) ON DELETE SET NULL
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARSET = utf8mb3
  ROW_FORMAT = COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_info`
--

LOCK TABLES `report_info` WRITE;
/*!40000 ALTER TABLE `report_info`
    DISABLE KEYS */;
INSERT INTO `report_info`
VALUES (1, '2023-05-27 00:00:00', 3, '销售部', 0, 0, 1, 3, 1, 3),
       (2, '2023-05-27 00:00:00', 2, '技术部', 0, 0, 8, 3, 8, 3),
       (3, '2023-05-27 00:00:00', 1, '人事部', 0, 0, 7, 1, 7, 1);
/*!40000 ALTER TABLE `report_info`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role`
(
    `ROLE_ID`     int         NOT NULL,
    `ROLE_NAME`   varchar(20) NOT NULL,
    `PERMISSIONS` varchar(255) DEFAULT NULL COMMENT '权限',
    PRIMARY KEY (`ROLE_ID`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb3
  ROW_FORMAT = COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role`
    DISABLE KEYS */;
INSERT INTO `role`
VALUES (0, 'admin', '1.用户增加、查询、修改、删除2.签到、签退、请假数据查询'),
       (1, 'manager', '1.编辑个人详细信息2.签到、签退3.请假审核4.数据查询'),
       (2, 'staff', '1.编辑个人详细信息2.签到、签退3数据查询4.请假申请');
/*!40000 ALTER TABLE `role`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sign_record`
--

DROP TABLE IF EXISTS `sign_record`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sign_record`
(
    `RECORD_ID`      int NOT NULL AUTO_INCREMENT COMMENT '签到记录编号',
    `DEPARTMENT_ID`  int         DEFAULT NULL COMMENT '部门编号',
    `STAFF_ID`       varchar(11) DEFAULT NULL COMMENT '员工编号',
    `SIGN_IN_TIME`   datetime    DEFAULT NULL COMMENT '签到时间',
    `SIGN_IN_STATE`  varchar(20) DEFAULT NULL COMMENT '1-迟到 0-正常 null-未签到',
    `SIGN_OUT_TIME`  datetime    DEFAULT NULL COMMENT '签退时间',
    `SIGN_OUT_STATE` varchar(20) DEFAULT NULL COMMENT '1-早退 0-正常 null-未签退',
    `UPDATE_TIME`    datetime    DEFAULT NULL COMMENT '记录更新时间',
    PRIMARY KEY (`RECORD_ID`) USING BTREE,
    FOREIGN KEY (`DEPARTMENT_ID`) REFERENCES `department_code` (`DEPARTMENT_ID`) ON DELETE SET NULL,
    FOREIGN KEY (`STAFF_ID`) REFERENCES `staff` (`STAFF_ID`) ON DELETE SET NULL
) ENGINE = InnoDB
  AUTO_INCREMENT = 122
  DEFAULT CHARSET = utf8mb3
  ROW_FORMAT = COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sign_record`
--

LOCK TABLES `sign_record` WRITE;
/*!40000 ALTER TABLE `sign_record`
    DISABLE KEYS */;
INSERT INTO `sign_record`
VALUES (1, 1, '1000', '2023-05-06 08:28:15', '0', '2023-05-06 18:08:42', '0', '2023-05-06 18:08:42'),
       (2, 1, '1001', '2023-05-06 08:32:15', '0', '2023-05-06 18:02:42', '0', '2023-05-06 18:02:42'),
       (3, 1, '1002', '2023-05-06 09:02:16', '1', '2023-05-06 18:04:42', '0', '2023-05-06 18:04:42'),
       (4, 1, '1003', '2023-05-06 08:59:15', '0', '2023-05-06 18:05:42', '0', '2023-05-06 18:05:42'),
       (5, 2, '2000', '2023-05-06 08:48:15', '0', '2023-05-06 18:09:42', '0', '2023-05-06 18:09:42'),
       (6, 2, '2001', '2023-05-06 08:52:15', '0', '2023-05-06 18:15:42', '0', '2023-05-06 18:15:42'),
       (7, 2, '2002', '2023-05-06 08:56:15', '0', '2023-05-06 17:48:42', '1', '2023-05-06 17:48:42'),
       (8, 2, '2003', '2023-05-06 09:28:15', '1', '2023-05-06 18:08:42', '0', '2023-05-06 18:08:42'),
       (9, 3, '3000', '2023-05-06 08:48:15', '0', '2023-05-06 18:09:42', '0', '2023-05-06 18:09:42'),
       (10, 3, '3001', '2023-05-06 08:52:15', '0', '2023-05-06 18:15:42', '0', '2023-05-06 18:15:42'),
       (11, 3, '3002', '2023-05-06 08:56:15', '0', '2023-05-06 18:48:42', '0', '2023-05-06 18:48:42'),
       (12, 3, '3003', '2023-05-06 08:28:15', '0', '2023-05-06 18:08:42', '0', '2023-05-06 18:08:42'),
       (13, 1, '1000', '2023-05-07 08:28:15', '0', '2023-05-07 18:08:42', '0', '2023-05-07 18:08:42'),
       (14, 1, '1001', '2023-05-07 08:32:15', '0', '2023-05-07 18:02:42', '0', '2023-05-07 18:02:42'),
       (15, 1, '1002', '2023-05-07 09:02:16', '1', '2023-05-07 18:04:42', '0', '2023-05-07 18:04:42'),
       (16, 1, '1003', '2023-05-07 08:59:15', '0', '2023-05-07 18:05:42', '0', '2023-05-07 18:05:42'),
       (17, 2, '2000', '2023-05-07 09:48:15', '1', '2023-05-07 18:09:42', '0', '2023-05-07 18:09:42'),
       (18, 2, '2001', '2023-05-07 08:52:15', '0', '2023-05-07 18:15:42', '0', '2023-05-07 18:15:42'),
       (19, 2, '2002', '2023-05-07 08:56:15', '0', '2023-05-07 18:48:42', '0', '2023-05-07 17:48:42'),
       (20, 2, '2003', '2023-05-07 08:28:15', '0', '2023-05-07 18:08:42', '0', '2023-05-07 18:08:42'),
       (21, 3, '3000', '2023-05-07 08:48:15', '0', '2023-05-07 18:09:42', '0', '2023-05-07 18:09:42'),
       (22, 3, '3001', '2023-05-07 08:52:15', '0', '2023-05-07 18:15:42', '0', '2023-05-07 18:15:42'),
       (23, 3, '3002', '2023-05-07 08:56:15', '0', '2023-05-07 18:48:42', '0', '2023-05-07 18:48:42'),
       (24, 3, '3003', '2023-05-07 08:28:15', '0', '2023-05-07 16:08:42', '1', '2023-05-07 18:08:42'),
       (25, 1, '1000', '2023-05-08 08:28:15', '0', '2023-05-08 18:08:42', '0', '2023-05-08 18:08:42'),
       (26, 1, '1001', '2023-05-08 08:32:15', '0', '2023-05-08 18:02:42', '0', '2023-05-08 18:02:42'),
       (27, 1, '1002', '2023-05-08 09:02:16', '1', '2023-05-08 18:04:42', '0', '2023-05-08 18:04:42'),
       (28, 1, '1003', '2023-05-08 08:59:15', '0', '2023-05-08 18:05:42', '0', '2023-05-08 18:05:42'),
       (29, 2, '2000', '2023-05-08 08:48:15', '0', '2023-05-08 18:09:42', '0', '2023-05-08 18:09:42'),
       (30, 2, '2001', '2023-05-08 08:52:15', '0', '2023-05-08 18:15:42', '0', '2023-05-08 18:15:42'),
       (31, 2, '2002', '2023-05-08 08:56:15', '0', '2023-05-08 17:48:42', '1', '2023-05-08 17:48:42'),
       (32, 2, '2003', '2023-05-08 09:28:15', '1', '2023-05-08 18:08:42', '0', '2023-05-08 18:08:42'),
       (33, 3, '3000', '2023-05-08 08:48:15', '0', '2023-05-08 18:09:42', '0', '2023-05-08 18:09:42'),
       (34, 3, '3001', '2023-05-08 08:52:15', '0', '2023-05-08 18:15:42', '0', '2023-05-08 18:15:42'),
       (35, 3, '3002', '2023-05-08 08:56:15', '0', '2023-05-08 15:48:42', '1', '2023-05-08 18:48:42'),
       (36, 3, '3003', '2023-05-08 08:56:15', '0', '2023-05-08 18:48:42', '0', '2023-05-08 18:48:42'),
       (37, 1, '1000', '2023-05-09 08:28:15', '0', '2023-05-09 18:08:42', '0', '2023-05-09 18:08:42'),
       (38, 1, '1001', '2023-05-09 08:32:15', '0', '2023-05-09 18:02:42', '0', '2023-05-09 18:02:42'),
       (39, 1, '1002', '2023-05-09 08:52:16', '0', '2023-05-09 18:04:42', '0', '2023-05-09 18:04:42'),
       (40, 1, '1003', '2023-05-09 08:59:15', '0', '2023-05-09 18:05:42', '0', '2023-05-09 18:05:42'),
       (41, 2, '2000', '2023-05-09 08:48:15', '0', '2023-05-09 18:09:42', '0', '2023-05-09 18:09:42'),
       (42, 2, '2001', '2023-05-09 08:52:15', '0', '2023-05-09 18:15:42', '0', '2023-05-09 18:15:42'),
       (43, 2, '2002', '2023-05-09 08:56:15', '0', '2023-05-09 16:08:42', '0', '2023-05-09 17:48:42'),
       (44, 2, '2003', '2023-05-09 09:28:15', '1', '2023-05-09 18:08:42', '0', '2023-05-09 18:08:42'),
       (45, 3, '3000', '2023-05-09 08:48:15', '0', '2023-05-09 18:09:42', '0', '2023-05-09 18:09:42'),
       (46, 3, '3001', '2023-05-09 08:53:15', '0', '2023-05-09 18:15:42', '0', '2023-05-09 18:15:42'),
       (47, 3, '3002', '2023-05-09 08:56:15', '0', '2023-05-09 18:48:42', '0', '2023-05-09 18:48:42'),
       (48, 3, '3003', '2023-05-09 08:28:15', '0', '2023-05-09 18:08:42', '0', '2023-05-09 18:08:42'),
       (49, 1, '1000', '2023-05-10 08:28:15', '0', '2023-05-10 18:08:42', '0', '2023-05-10 18:08:42'),
       (50, 1, '1001', '2023-05-10 08:32:15', '0', '2023-05-10 18:02:42', '0', '2023-05-10 18:02:42'),
       (51, 1, '1002', '2023-05-10 09:02:16', '1', '2023-05-10 18:04:42', '0', '2023-05-10 18:04:42'),
       (52, 1, '1003', '2023-05-10 08:59:15', '0', '2023-05-10 18:05:42', '0', '2023-05-10 18:05:42'),
       (53, 2, '2000', '2023-05-10 08:48:15', '0', '2023-05-10 18:09:42', '0', '2023-05-10 18:09:42'),
       (54, 2, '2001', '2023-05-10 08:52:15', '0', '2023-05-10 18:15:42', '0', '2023-05-10 18:15:42'),
       (55, 2, '2002', '2023-05-10 08:56:15', '0', '2023-05-10 18:48:42', '0', '2023-05-10 17:48:42'),
       (56, 2, '2003', '2023-05-10 09:28:15', '1', '2023-05-10 18:08:42', '0', '2023-05-10 18:08:42'),
       (57, 3, '3000', '2023-05-10 08:48:15', '0', '2023-05-10 18:09:42', '0', '2023-05-10 18:09:42'),
       (58, 3, '3001', '2023-05-10 08:52:15', '0', '2023-05-10 18:15:42', '0', '2023-05-10 18:15:42'),
       (59, 3, '3002', '2023-05-10 08:56:15', '0', '2023-05-10 18:48:42', '0', '2023-05-10 18:48:42'),
       (60, 3, '3003', '2023-05-10 08:28:15', '0', '2023-05-10 18:08:42', '0', '2023-05-10 18:08:42'),
       (61, 1, '1000', '2023-05-11 08:28:15', '0', '2023-05-11 15:48:42', '1', '2023-05-11 18:08:42'),
       (62, 1, '1001', '2023-05-11 08:32:15', '0', '2023-05-11 18:02:42', '0', '2023-05-11 18:02:42'),
       (63, 1, '1002', '2023-05-11 08:59:16', '0', '2023-05-11 18:04:42', '0', '2023-05-11 18:04:42'),
       (64, 1, '1003', '2023-05-11 08:59:15', '0', '2023-05-11 18:05:42', '0', '2023-05-11 18:05:42'),
       (65, 2, '2000', '2023-05-11 08:48:15', '0', '2023-05-11 18:09:42', '0', '2023-05-11 18:09:42'),
       (66, 2, '2001', '2023-05-11 08:52:15', '0', '2023-05-11 18:15:42', '0', '2023-05-11 18:15:42'),
       (67, 2, '2002', '2023-05-11 08:56:15', '0', '2023-05-11 16:48:42', '0', '2023-05-11 17:48:42'),
       (68, 2, '2003', '2023-05-11 09:28:15', '1', '2023-05-11 18:08:42', '0', '2023-05-11 18:08:42'),
       (69, 3, '3000', '2023-05-11 08:48:15', '0', '2023-05-11 18:09:42', '0', '2023-05-11 18:09:42'),
       (70, 3, '3001', '2023-05-11 08:52:15', '0', '2023-05-11 18:15:42', '0', '2023-05-11 18:15:42'),
       (71, 3, '3002', '2023-05-11 08:56:15', '0', '2023-05-11 18:48:42', '0', '2023-05-11 18:48:42'),
       (72, 3, '3003', '2023-05-11 08:28:15', '0', '2023-05-11 18:08:42', '0', '2023-05-11 18:08:42'),
       (73, 1, '1000', '2023-05-12 08:28:15', '0', '2023-05-12 18:08:42', '0', '2023-05-12 18:08:42'),
       (74, 1, '1001', '2023-05-12 08:32:15', '0', '2023-05-12 18:02:42', '0', '2023-05-12 18:02:42'),
       (75, 1, '1002', '2023-05-12 08:02:16', '0', '2023-05-12 18:04:42', '0', '2023-05-12 18:04:42'),
       (76, 1, '1003', '2023-05-12 08:59:15', '0', '2023-05-12 18:05:42', '0', '2023-05-12 18:05:42'),
       (77, 2, '2000', '2023-05-12 08:48:15', '0', '2023-05-12 18:09:42', '0', '2023-05-12 18:09:42'),
       (78, 2, '2001', '2023-05-12 08:52:15', '0', '2023-05-12 18:15:42', '0', '2023-05-12 18:15:42'),
       (79, 2, '2002', '2023-05-12 08:56:15', '0', '2023-05-12 16:48:42', '0', '2023-05-12 17:48:42'),
       (80, 2, '2003', '2023-05-12 09:28:15', '1', '2023-05-12 18:08:42', '0', '2023-05-12 18:08:42'),
       (81, 3, '3000', '2023-05-12 08:48:15', '0', '2023-05-12 18:09:42', '0', '2023-05-12 18:09:42'),
       (82, 3, '3001', '2023-05-12 08:52:15', '0', '2023-05-12 18:15:42', '0', '2023-05-12 18:15:42'),
       (83, 3, '3002', '2023-05-12 08:56:15', '0', '2023-05-12 18:48:42', '0', '2023-05-12 18:48:42'),
       (84, 3, '3003', '2023-05-12 08:28:15', '0', '2023-05-12 18:08:42', '0', '2023-05-12 18:08:42'),
       (85, 1, '1000', '2023-05-13 08:28:15', '0', '2023-05-13 18:08:42', '0', '2023-05-13 18:08:42'),
       (86, 1, '1001', '2023-05-13 08:32:15', '0', '2023-05-13 18:02:42', '0', '2023-05-13 18:02:42'),
       (87, 1, '1002', '2023-05-13 09:02:16', '1', '2023-05-13 18:04:42', '0', '2023-05-13 18:04:42'),
       (88, 1, '1003', '2023-05-13 08:59:15', '0', '2023-05-13 18:05:42', '0', '2023-05-13 18:05:42'),
       (89, 2, '2000', '2023-05-13 08:48:15', '0', '2023-05-13 18:09:42', '0', '2023-05-13 18:09:42'),
       (90, 2, '2001', '2023-05-13 08:52:15', '0', '2023-05-13 18:15:42', '0', '2023-05-13 18:15:42'),
       (91, 2, '2002', '2023-05-13 08:56:15', '0', '2023-05-13 17:48:42', '1', '2023-05-13 17:48:42'),
       (92, 2, '2003', '2023-05-13 09:28:15', '1', '2023-05-13 18:08:42', '0', '2023-05-13 18:08:42'),
       (93, 3, '3000', '2023-05-13 08:48:15', '0', '2023-05-13 18:09:42', '0', '2023-05-13 18:09:42'),
       (94, 3, '3001', '2023-05-13 08:52:15', '0', '2023-05-13 18:15:42', '0', '2023-05-13 18:15:42'),
       (95, 3, '3002', '2023-05-13 08:56:15', '0', '2023-05-13 18:48:42', '0', '2023-05-13 18:48:42'),
       (96, 3, '3003', '2023-05-13 08:28:15', '0', '2023-05-13 18:08:42', '0', '2023-05-13 18:08:42'),
       (97, 1, '1000', '2023-05-14 08:28:15', '0', '2023-05-14 18:08:42', '0', '2023-05-14 18:08:42'),
       (98, 1, '1001', '2023-05-14 08:28:15', '0', '2023-05-14 18:08:42', '0', '2023-05-14 18:08:42'),
       (99, 1, '1002', '2023-05-14 09:02:16', '1', '2023-05-14 18:04:42', '0', '2023-05-14 18:04:42'),
       (100, 1, '1003', '2023-05-14 08:59:15', '0', '2023-05-14 18:05:42', '0', '2023-05-14 18:05:42'),
       (101, 2, '2000', '2023-05-14 08:48:15', '0', '2023-05-14 18:09:42', '0', '2023-05-14 18:09:42'),
       (102, 2, '2001', '2023-05-14 08:52:15', '0', '2023-05-14 18:15:42', '0', '2023-05-14 18:15:42'),
       (103, 2, '2002', '2023-05-14 08:56:15', '0', '2023-05-14 18:18:42', '0', '2023-05-14 17:48:42'),
       (104, 2, '2003', '2023-05-14 08:38:15', '0', '2023-05-14 18:08:42', '0', '2023-05-14 18:08:42'),
       (105, 3, '3000', '2023-05-14 08:48:15', '0', '2023-05-14 17:09:42', '1', '2023-05-14 18:09:42'),
       (106, 3, '3001', '2023-05-14 08:52:15', '0', '2023-05-14 18:15:42', '0', '2023-05-14 18:15:42'),
       (107, 3, '3002', '2023-05-14 08:56:15', '0', '2023-05-14 18:48:42', '0', '2023-05-14 18:48:42'),
       (108, 3, '3003', '2023-05-14 08:56:15', '0', '2023-05-14 18:48:42', '0', '2023-05-14 18:48:42'),
       (109, 1, '1000', '2023-05-15 09:02:16', '1', '2023-05-15 18:08:42', '0', '2023-05-15 18:08:42'),
       (110, 1, '1001', '2023-05-15 08:32:15', '0', '2023-05-15 18:02:42', '0', '2023-05-15 18:02:42'),
       (111, 1, '1002', '2023-05-15 08:53:16', '0', '2023-05-15 18:04:42', '0', '2023-05-15 18:04:42'),
       (112, 1, '1003', '2023-05-15 08:59:15', '0', '2023-05-15 18:05:42', '0', '2023-05-15 18:05:42'),
       (113, 2, '2000', '2023-05-15 08:48:15', '0', '2023-05-15 18:09:42', '0', '2023-05-15 18:09:42'),
       (114, 2, '2001', '2023-05-15 08:52:15', '0', '2023-05-15 18:15:42', '0', '2023-05-15 18:15:42'),
       (115, 2, '2002', '2023-05-15 08:56:15', '0', '2023-05-15 18:03:42', '0', '2023-05-15 17:48:42'),
       (116, 2, '2003', '2023-05-15 08:28:15', '0', '2023-05-15 18:08:42', '0', '2023-05-15 18:08:42'),
       (117, 3, '3000', '2023-05-15 09:28:15', '1', '2023-05-15 18:09:42', '0', '2023-05-15 18:09:42'),
       (118, 3, '3001', '2023-05-15 08:52:15', '0', '2023-05-15 18:15:42', '0', '2023-05-15 18:15:42'),
       (119, 3, '3002', '2023-05-15 08:56:15', '0', '2023-05-15 18:48:42', '0', '2023-05-15 18:48:42'),
       (120, 3, '3003', '2023-05-15 08:28:15', '0', '2023-05-15 18:08:42', '0', '2023-05-15 18:08:42'),
       (121, 1, '1001', '2023-05-29 23:23:59', '1', '2023-05-29 23:24:01', '0', '2023-05-29 23:24:01');
/*!40000 ALTER TABLE `sign_record`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff`
(
    `STAFF_ID`      varchar(20) NOT NULL COMMENT '用户编号',
    `STAFF_NAME`    varchar(20) NOT NULL COMMENT '用户名',
    `SEX`           varchar(20) DEFAULT NULL COMMENT '性别',
    `DEPARTMENT_ID` int         DEFAULT NULL COMMENT '部门编号',
    `ROLE`          int         DEFAULT NULL COMMENT '权限',
    `GRADE`         date        DEFAULT NULL COMMENT '入职日期',
    `BIRTHDAY`      date        DEFAULT NULL COMMENT '出生日期',
    `TEL`           varchar(20) DEFAULT NULL COMMENT '手机号',
    `EMAIL`         varchar(20) DEFAULT NULL COMMENT '邮箱',
    `HOBBY`         varchar(50) DEFAULT NULL COMMENT '爱好',
    `PASSWORD`      varchar(20) DEFAULT NULL COMMENT '登录密码',
    PRIMARY KEY (`STAFF_ID`) USING BTREE,
    FOREIGN KEY (`DEPARTMENT_ID`) REFERENCES `department_code` (`DEPARTMENT_ID`) ON DELETE SET NULL,
    FOREIGN KEY (`ROLE`) REFERENCES `role` (`ROLE_ID`) ON DELETE SET NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb3
  ROW_FORMAT = COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff`
    DISABLE KEYS */;
INSERT INTO `staff`
VALUES ('1000', '王蕾', '女', 1, 1, '2023-05-01', NULL, NULL, NULL, NULL, '123'),
       ('1001', '王晓蕾', '女', 1, 2, '2023-05-02', NULL, NULL, NULL, NULL, '123'),
       ('1002', '陈颖', '女', 1, 2, '2023-05-04', NULL, NULL, NULL, NULL, '123'),
       ('1003', '杨磊', '男', 1, 2, '2023-05-05', NULL, NULL, NULL, NULL, '123'),
       ('2000', '陈磊', '男', 2, 1, '2023-05-01', NULL, NULL, NULL, NULL, '123'),
       ('2001', '白岭', '男', 2, 2, '2023-05-03', NULL, NULL, NULL, NULL, '123'),
       ('2002', '王晓', '女', 2, 2, '2023-05-04', NULL, NULL, NULL, NULL, '123'),
       ('2003', '杨磊', '男', 2, 2, '2023-05-05', NULL, NULL, NULL, NULL, '123'),
       ('3000', '柳明', '男', 3, 1, '2023-05-01', NULL, NULL, NULL, NULL, '123'),
       ('3001', '王心凌', '女', 3, 2, '2023-05-03', NULL, NULL, NULL, NULL, '123'),
       ('3002', '龚珍', '女', 3, 2, '2023-05-04', NULL, NULL, NULL, NULL, '123'),
       ('3003', '沈强', '男', 3, 2, '2023-05-05', NULL, NULL, NULL, NULL, '123'),
       ('admin', '管理员', '男', 0, 0, '2023-05-01', NULL, NULL, NULL, NULL, '123');
/*!40000 ALTER TABLE `staff`
    ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE = @OLD_TIME_ZONE */;

--
-- Procedure structure for `SIGN_REPORT_PROC`
--

DROP PROCEDURE IF EXISTS `SIGN_REPORT_PROC`;
DELIMITER ;;
CREATE
    DEFINER = `root`@`localhost` PROCEDURE `SIGN_REPORT_PROC`(IN `PARAM_DATE` varchar(20), IN `DEPARTMENT` int)
BEGIN
    /*声明变量*/
    DECLARE V_DEPARTMENT INT;
    DECLARE V_DEPARTMENT_NAME CHAR(20);
    DECLARE V_STAFF_ID CHAR(20);
    DECLARE V_STAFF_NAME CHAR(20);
    DECLARE V_REPORT_ID INT;
    DECLARE V_DAY_LATE_COUNT, V_MONTH_LATE_COUNT, V_YEAR_LATE_COUNT INT DEFAULT 0;
    DECLARE V_DAY_EARLY_COUNT,V_MONTH_EARLY_COUNT, V_YEAR_EARLY_COUNT INT DEFAULT 0;


    /*声明游标*/
    DECLARE CURSOR_STAFF_ID CURSOR FOR SELECT STAFF_ID, STAFF_NAME
                                       FROM STAFF
                                       WHERE DEPARTMENT_ID = DEPARTMENT;
    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET V_STAFF_ID = NULL;
    /*创建临时表*/
    DROP TABLE IF EXISTS TEMP_REPORT;
    CREATE TEMPORARY TABLE TEMP_REPORT
    (
        RECORD_ID      INT(11) NOT NULL,
        DEPARTMENT_ID  INT(11),
        STAFF_ID       INT(11),
        SIGN_IN_TIME   DATETIME,
        SIGN_IN_STATE  VARCHAR(20),
        SIGN_OUT_TIME  DATETIME,
        SIGN_OUT_STATE VARCHAR(20),
        UPDATE_TIME    DATETIME,
        PRIMARY KEY (RECORD_ID)
    ) ENGINE = InnoDB
      DEFAULT CHARSET = utf8;

    INSERT INTO TEMP_REPORT
    SELECT *
    FROM SIGN_RECORD
    WHERE DEPARTMENT_ID = DEPARTMENT
      AND DATE_FORMAT(UPDATE_TIME, '%Y-%m-%d') <= PARAM_DATE;

    /*按日统计*/
    SELECT COUNT(*)
    FROM TEMP_REPORT
    WHERE (RECORD_ID IS NOT NULL AND RECORD_ID != '')
      AND DATE_FORMAT(UPDATE_TIME, '%Y-%m-%d') = PARAM_DATE
      AND SIGN_IN_STATE = '1'
    INTO V_DAY_LATE_COUNT;
    SELECT COUNT(*)
    FROM TEMP_REPORT
    WHERE (RECORD_ID IS NOT NULL AND RECORD_ID != '')
      AND DATE_FORMAT(UPDATE_TIME, '%Y-%m-%d') = PARAM_DATE
      AND SIGN_OUT_STATE = '1'
    INTO V_DAY_EARLY_COUNT;

    /*按月统计*/
    SELECT COUNT(*)
    FROM TEMP_REPORT
    WHERE (RECORD_ID IS NOT NULL AND RECORD_ID != '')
      AND DATE_FORMAT(UPDATE_TIME, '%Y-%m') = SUBSTRING(PARAM_DATE, 1, 7)
      AND SIGN_IN_STATE = '1'
    INTO V_MONTH_LATE_COUNT;
    SELECT COUNT(*)
    FROM TEMP_REPORT
    WHERE (RECORD_ID IS NOT NULL AND RECORD_ID != '')
      AND DATE_FORMAT(UPDATE_TIME, '%Y-%m') = SUBSTRING(PARAM_DATE, 1, 7)
      AND SIGN_OUT_STATE = '1'
    INTO V_MONTH_EARLY_COUNT;

    /*按年统计*/
    SELECT COUNT(*)
    FROM TEMP_REPORT
    WHERE (RECORD_ID IS NOT NULL AND RECORD_ID != '')
      AND DATE_FORMAT(UPDATE_TIME, '%Y') = SUBSTRING(PARAM_DATE, 1, 4)
      AND SIGN_IN_STATE = '1'
    INTO V_YEAR_LATE_COUNT;
    SELECT COUNT(*)
    FROM TEMP_REPORT
    WHERE (RECORD_ID IS NOT NULL AND RECORD_ID != '')
      AND DATE_FORMAT(UPDATE_TIME, '%Y') = SUBSTRING(PARAM_DATE, 1, 4)
      AND SIGN_OUT_STATE = '1'
    INTO V_YEAR_EARLY_COUNT;

    /* 统计部门代码翻译 */
    SELECT DEPARTMENT_NAME FROM DEPARTMENT_CODE WHERE DEPARTMENT_ID = DEPARTMENT INTO V_DEPARTMENT_NAME;
    /* 保存统计数据 */
    INSERT INTO REPORT_INFO(CREATE_DATE, DEPARTMENT_ID, DEPARTMENT_NAME, DAY_LATE_COUNT, DAY_EARLY_COUNT,
                            MONTH_LATE_COUNT, MONTH_EARLY_COUNT, YEAR_LATE_COUNT, YEAR_EARLY_COUNT)
    VALUES (PARAM_DATE, DEPARTMENT, V_DEPARTMENT_NAME, V_DAY_LATE_COUNT, V_DAY_EARLY_COUNT, V_MONTH_LATE_COUNT,
            V_MONTH_EARLY_COUNT, V_YEAR_LATE_COUNT, V_YEAR_EARLY_COUNT);

    /* 获取自增的REPORT_ID */
    SET V_REPORT_ID = LAST_INSERT_ID();

    OPEN CURSOR_STAFF_ID;
    FETCH CURSOR_STAFF_ID INTO V_STAFF_ID, V_STAFF_NAME;
    WHILE (V_STAFF_ID IS NOT NULL)
        DO
            /*按日统计*/
            SELECT COUNT(*)
            FROM TEMP_REPORT
            WHERE STAFF_ID = V_STAFF_ID
              AND DATE_FORMAT(UPDATE_TIME, '%Y-%m-%d') = PARAM_DATE
              AND DEPARTMENT_ID = DEPARTMENT
              AND SIGN_IN_STATE = '1'
            INTO V_DAY_LATE_COUNT;
            SELECT COUNT(*)
            FROM TEMP_REPORT
            WHERE STAFF_ID = V_STAFF_ID
              AND DATE_FORMAT(UPDATE_TIME, '%Y-%m-%d') = PARAM_DATE
              AND DEPARTMENT_ID = DEPARTMENT
              AND SIGN_OUT_STATE = '1'
            INTO V_DAY_EARLY_COUNT;

            /*按月统计*/
            SELECT COUNT(*)
            FROM TEMP_REPORT
            WHERE STAFF_ID = V_STAFF_ID
              AND DATE_FORMAT(UPDATE_TIME, '%Y-%m') = SUBSTRING(PARAM_DATE, 1, 7)
              AND DEPARTMENT_ID = DEPARTMENT
              AND SIGN_IN_STATE = '1'
            INTO V_MONTH_LATE_COUNT;
            SELECT COUNT(*)
            FROM TEMP_REPORT
            WHERE STAFF_ID = V_STAFF_ID
              AND DATE_FORMAT(UPDATE_TIME, '%Y-%m') = SUBSTRING(PARAM_DATE, 1, 7)
              AND DEPARTMENT_ID = DEPARTMENT
              AND SIGN_OUT_STATE = '1'
            INTO V_MONTH_EARLY_COUNT;

            /*按年统计*/
            SELECT COUNT(*)
            FROM TEMP_REPORT
            WHERE STAFF_ID = V_STAFF_ID
              AND DATE_FORMAT(UPDATE_TIME, '%Y') = SUBSTRING(PARAM_DATE, 1, 4)
              AND DEPARTMENT_ID = DEPARTMENT
              AND SIGN_IN_STATE = '1'
            INTO V_YEAR_LATE_COUNT;
            SELECT COUNT(*)
            FROM TEMP_REPORT
            WHERE STAFF_ID = V_STAFF_ID
              AND DATE_FORMAT(UPDATE_TIME, '%Y') = SUBSTRING(PARAM_DATE, 1, 4)
              AND DEPARTMENT_ID = DEPARTMENT
              AND SIGN_OUT_STATE = '1'
            INTO V_YEAR_EARLY_COUNT;

            INSERT INTO REPORT_DETAIL(REPORT_ID, CREATE_DATE, DEPARTMENT_ID, DEPARTMENT_NAME, STAFF_ID, STAFF_NAME,
                                      DAY_LATE_COUNT, DAY_EARLY_COUNT, MONTH_LATE_COUNT, MONTH_EARLY_COUNT,
                                      YEAR_LATE_COUNT, YEAR_EARLY_COUNT)
            VALUES (V_REPORT_ID, PARAM_DATE, DEPARTMENT, V_DEPARTMENT_NAME, V_STAFF_ID, V_STAFF_NAME, V_DAY_LATE_COUNT,
                    V_DAY_EARLY_COUNT, V_MONTH_LATE_COUNT, V_MONTH_EARLY_COUNT, V_YEAR_LATE_COUNT, V_YEAR_EARLY_COUNT);
            FETCH CURSOR_STAFF_ID INTO V_STAFF_ID, V_STAFF_NAME;
        END WHILE;
    CLOSE CURSOR_STAFF_ID;

END
;;
DELIMITER ;

/*!40101 SET SQL_MODE = @OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES = @OLD_SQL_NOTES */;

-- Dump completed on 2023-05-31 10:29:07