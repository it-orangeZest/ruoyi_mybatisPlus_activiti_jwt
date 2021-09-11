/*
Navicat MySQL Data Transfer

Source Server         : 阿里云
Source Server Version : 80018
Source Host           : rm-2zeg4yqm712q81gwido.mysql.rds.aliyuncs.com:3306
Source Database       : ry_mp_activiti

Target Server Type    : MYSQL
Target Server Version : 80018
File Encoding         : 65001

Date: 2021-09-11 00:13:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作 sub主子表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES ('1', 'ac_test', '测试表', '', null, 'AcTest', 'crud', 'com.ruoyi.act', 'act', 'test', '测试', 'ruoyi', '0', '/', '{\"parentMenuId\":\"1\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"系统管理\",\"treeCode\":\"\"}', 'admin', '2021-08-22 17:29:59', '', '2021-08-22 19:37:32', '');
INSERT INTO `gen_table` VALUES ('2', 't_cust_form', '自定义表单', '', null, 'TCustForm', 'crud', 'com.ruoyi.system', 'custForm', 'form', '表单设计', 'ruoyi', '0', '/', '{\"parentMenuId\":\"2008\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"流程管理\",\"treeCode\":\"\"}', 'admin', '2021-08-23 23:03:39', '', '2021-08-23 23:14:51', '');
INSERT INTO `gen_table` VALUES ('3', 't_process_model', '流程模型表', '', null, 'TProcessModel', 'crud', 'com.ruoyi.act', 'act/definition', 'model', '流程模型', 'ruoyi', '0', '/', '{\"parentMenuId\":\"2008\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"流程管理\",\"treeCode\":\"\"}', 'admin', '2021-08-24 18:00:03', '', '2021-08-27 14:39:20', '');
INSERT INTO `gen_table` VALUES ('4', 't_process_file', '流程附件表', '', null, 'TProcessFile', 'crud', 'com.ruoyi.act', 'act', 'file', '流程附件', 'ruoyi', '0', '/', '{\"parentMenuId\":\"1\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"系统管理\",\"treeCode\":\"\"}', 'ttz', '2021-09-01 23:36:57', '', '2021-09-01 23:38:16', '');

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES ('1', '1', 'id', '', 'int(11)', 'Long', 'id', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2021-08-22 17:29:59', null, '2021-08-22 19:37:33');
INSERT INTO `gen_table_column` VALUES ('2', '1', 'name', '姓名', 'varchar(20)', 'String', 'name', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '2', 'admin', '2021-08-22 17:29:59', null, '2021-08-22 19:37:33');
INSERT INTO `gen_table_column` VALUES ('3', '1', 'sex', '性别', 'varchar(2)', 'String', 'sex', '0', '0', null, '1', '1', '1', '1', 'EQ', 'select', 'sys_user_sex', '3', 'admin', '2021-08-22 17:29:59', null, '2021-08-22 19:37:33');
INSERT INTO `gen_table_column` VALUES ('4', '1', 'age', '年龄', 'int(11)', 'Long', 'age', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2021-08-22 17:30:00', null, '2021-08-22 19:37:33');
INSERT INTO `gen_table_column` VALUES ('5', '1', 'create_by', '创建人', 'varchar(255)', 'String', 'createBy', '0', '0', null, '1', null, null, null, 'EQ', 'input', '', '5', '', '2021-08-22 19:29:49', null, '2021-08-22 19:37:33');
INSERT INTO `gen_table_column` VALUES ('6', '1', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', null, '1', null, null, null, 'EQ', 'datetime', '', '6', '', '2021-08-22 19:29:49', null, '2021-08-22 19:37:33');
INSERT INTO `gen_table_column` VALUES ('7', '1', 'update_by', '更新人', 'varchar(255)', 'String', 'updateBy', '0', '0', null, '1', '1', null, null, 'EQ', 'input', '', '7', '', '2021-08-22 19:29:49', null, '2021-08-22 19:37:33');
INSERT INTO `gen_table_column` VALUES ('8', '1', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', null, '1', '1', null, null, 'EQ', 'datetime', '', '8', '', '2021-08-22 19:29:49', null, '2021-08-22 19:37:33');
INSERT INTO `gen_table_column` VALUES ('9', '1', 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '9', '', '2021-08-22 19:29:49', null, '2021-08-22 19:37:33');
INSERT INTO `gen_table_column` VALUES ('10', '2', 'id', '', 'int(11)', 'Long', 'id', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2021-08-23 23:03:39', null, '2021-08-23 23:14:51');
INSERT INTO `gen_table_column` VALUES ('11', '2', 'form_key', '表单key', 'varchar(100)', 'String', 'formKey', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2021-08-23 23:03:39', null, '2021-08-23 23:14:51');
INSERT INTO `gen_table_column` VALUES ('12', '2', 'form_name', '表单名', 'varchar(200)', 'String', 'formName', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '3', 'admin', '2021-08-23 23:03:39', null, '2021-08-23 23:14:51');
INSERT INTO `gen_table_column` VALUES ('13', '2', 'type', '表单类型', 'varchar(50)', 'String', 'type', '0', '0', null, '1', '1', '1', '1', 'EQ', 'select', 'act_form_type', '4', 'admin', '2021-08-23 23:03:40', null, '2021-08-23 23:14:51');
INSERT INTO `gen_table_column` VALUES ('14', '2', 'content', '表单内容', 'text', 'String', 'content', '0', '0', null, '1', '1', null, null, 'EQ', 'textarea', '', '5', 'admin', '2021-08-23 23:03:40', null, '2021-08-23 23:14:51');
INSERT INTO `gen_table_column` VALUES ('15', '2', 'create_by', '创建人', 'varchar(50)', 'String', 'createBy', '0', '0', null, '1', null, null, null, 'EQ', 'input', '', '6', 'admin', '2021-08-23 23:03:40', null, '2021-08-23 23:14:52');
INSERT INTO `gen_table_column` VALUES ('16', '2', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', null, '1', null, null, null, 'EQ', 'datetime', '', '7', 'admin', '2021-08-23 23:03:40', null, '2021-08-23 23:14:52');
INSERT INTO `gen_table_column` VALUES ('17', '2', 'update_by', '更新人', 'varchar(50)', 'String', 'updateBy', '0', '0', null, '1', '1', null, null, 'EQ', 'input', '', '8', 'admin', '2021-08-23 23:03:40', null, '2021-08-23 23:14:52');
INSERT INTO `gen_table_column` VALUES ('18', '2', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', null, '1', '1', null, null, 'EQ', 'datetime', '', '9', 'admin', '2021-08-23 23:03:40', null, '2021-08-23 23:14:52');
INSERT INTO `gen_table_column` VALUES ('19', '2', 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '10', 'admin', '2021-08-23 23:03:40', null, '2021-08-23 23:14:52');
INSERT INTO `gen_table_column` VALUES ('20', '2', 'status', '状态', 'varchar(50)', 'String', 'status', '0', '0', null, '1', '1', '1', '1', 'EQ', 'radio', 'sys_normal_disable', '11', 'admin', '2021-08-23 23:03:40', null, '2021-08-23 23:14:52');
INSERT INTO `gen_table_column` VALUES ('21', '3', 'id', '', 'int(11)', 'Long', 'id', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2021-08-24 18:00:03', null, '2021-08-27 14:39:20');
INSERT INTO `gen_table_column` VALUES ('22', '3', 'process_key', 'key', 'varchar(255)', 'String', 'processKey', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2021-08-24 18:00:03', null, '2021-08-27 14:39:20');
INSERT INTO `gen_table_column` VALUES ('23', '3', 'dept_id', '部门id', 'bigint(20)', 'Long', 'deptId', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2021-08-24 18:00:03', null, '2021-08-27 14:39:20');
INSERT INTO `gen_table_column` VALUES ('24', '3', 'name', '模型名称', 'varchar(100)', 'String', 'name', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '4', 'admin', '2021-08-24 18:00:03', null, '2021-08-27 14:39:20');
INSERT INTO `gen_table_column` VALUES ('25', '3', 'form_id', '表单id', 'int(11)', 'Long', 'formId', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '5', 'admin', '2021-08-24 18:00:03', null, '2021-08-27 14:39:21');
INSERT INTO `gen_table_column` VALUES ('26', '3', 'create_by', '创建人', 'varchar(50)', 'String', 'createBy', '0', '0', null, '1', null, '1', null, 'EQ', 'input', '', '6', 'admin', '2021-08-24 18:00:03', null, '2021-08-27 14:39:21');
INSERT INTO `gen_table_column` VALUES ('27', '3', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', null, '1', null, '1', null, 'EQ', 'datetime', '', '7', 'admin', '2021-08-24 18:00:03', null, '2021-08-27 14:39:21');
INSERT INTO `gen_table_column` VALUES ('28', '3', 'update_by', '更新人', 'varchar(50)', 'String', 'updateBy', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '8', 'admin', '2021-08-24 18:00:04', null, '2021-08-27 14:39:21');
INSERT INTO `gen_table_column` VALUES ('29', '3', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', null, '1', '1', '1', null, 'EQ', 'datetime', '', '9', 'admin', '2021-08-24 18:00:04', null, '2021-08-27 14:39:21');
INSERT INTO `gen_table_column` VALUES ('30', '3', 'status', '状态', 'varchar(50)', 'String', 'status', '0', '0', null, '1', '1', '1', '1', 'EQ', 'radio', 'sys_normal_disable', '10', 'admin', '2021-08-24 18:00:04', null, '2021-08-27 14:39:21');
INSERT INTO `gen_table_column` VALUES ('31', '3', 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '11', 'admin', '2021-08-24 18:00:04', null, '2021-08-27 14:39:21');
INSERT INTO `gen_table_column` VALUES ('32', '4', 'id', '', 'int(11)', 'Long', 'id', '1', '0', null, '1', null, null, null, 'EQ', 'input', '', '1', 'ttz', '2021-09-01 23:36:58', null, '2021-09-01 23:38:16');
INSERT INTO `gen_table_column` VALUES ('33', '4', 'process_key', '流程key', 'varchar(50)', 'String', 'processKey', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '2', 'ttz', '2021-09-01 23:36:58', null, '2021-09-01 23:38:17');
INSERT INTO `gen_table_column` VALUES ('34', '4', 'instance_id', '流程实例id', 'varchar(50)', 'String', 'instanceId', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '3', 'ttz', '2021-09-01 23:36:58', null, '2021-09-01 23:38:17');
INSERT INTO `gen_table_column` VALUES ('35', '4', 'task_id', '任务节点id', 'varchar(50)', 'String', 'taskId', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '4', 'ttz', '2021-09-01 23:36:58', null, '2021-09-01 23:38:17');
INSERT INTO `gen_table_column` VALUES ('36', '4', 'file_name', '文件名', 'varchar(255)', 'String', 'fileName', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '5', 'ttz', '2021-09-01 23:36:58', null, '2021-09-01 23:38:17');
INSERT INTO `gen_table_column` VALUES ('37', '4', 'real_name', '真实文件名', 'varchar(255)', 'String', 'realName', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '6', 'ttz', '2021-09-01 23:36:58', null, '2021-09-01 23:38:17');
INSERT INTO `gen_table_column` VALUES ('38', '4', 'path', '文件路径', 'varchar(255)', 'String', 'path', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '7', 'ttz', '2021-09-01 23:36:59', null, '2021-09-01 23:38:17');
INSERT INTO `gen_table_column` VALUES ('39', '4', 'create_by', '创建人', 'varchar(50)', 'String', 'createBy', '0', '0', null, '1', null, null, null, 'EQ', 'input', '', '8', 'ttz', '2021-09-01 23:36:59', null, '2021-09-01 23:38:17');
INSERT INTO `gen_table_column` VALUES ('40', '4', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', null, '1', null, null, null, 'EQ', 'datetime', '', '9', 'ttz', '2021-09-01 23:36:59', null, '2021-09-01 23:38:18');
INSERT INTO `gen_table_column` VALUES ('41', '4', 'update_by', '更新人', 'varchar(50)', 'String', 'updateBy', '0', '0', null, '1', '1', null, null, 'EQ', 'input', '', '10', 'ttz', '2021-09-01 23:36:59', null, '2021-09-01 23:38:18');
INSERT INTO `gen_table_column` VALUES ('42', '4', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', null, '1', '1', null, null, 'EQ', 'datetime', '', '11', 'ttz', '2021-09-01 23:36:59', null, '2021-09-01 23:38:18');
INSERT INTO `gen_table_column` VALUES ('43', '4', 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '12', 'ttz', '2021-09-01 23:37:00', null, '2021-09-01 23:38:18');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Blob类型的触发器表';

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='日历信息表';

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Cron类型的触发器表';

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) NOT NULL COMMENT '状态',
  `job_name` varchar(200) DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='已触发的触发器表';

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) NOT NULL COMMENT '任务组名',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='任务详细信息表';

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', null, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017B6C3AE42078707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', null, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017B6C3AE42078707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', null, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017B6C3AE42078707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='存储的悲观锁信息表';

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='暂停的触发器表';

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) NOT NULL COMMENT '之前配置文件中org.quartz.scheduler.instanceId配置的名字，就会写入该字段',
  `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='调度器状态表';

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'DESKTOP-H3LE1SH1631288065279', '1631290409575', '15000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_ name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='简单触发器的信息表';

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_ name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='同步机制的行锁表';

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(13) DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(13) DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(13) NOT NULL COMMENT '开始时间',
  `end_time` bigint(13) DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(2) DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='触发器详细信息表';

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', null, '1631288070000', '-1', '5', 'PAUSED', 'CRON', '1631288066000', '0', null, '2', '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', null, '1631288070000', '-1', '5', 'PAUSED', 'CRON', '1631288067000', '0', null, '2', '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', null, '1631288080000', '-1', '5', 'PAUSED', 'CRON', '1631288068000', '0', null, '2', '');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2021-08-22 13:00:04', '', null, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES ('2', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2021-08-22 13:00:04', '', null, '初始化密码 123456');
INSERT INTO `sys_config` VALUES ('3', '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2021-08-22 13:00:04', '', null, '深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue');
INSERT INTO `sys_config` VALUES ('4', '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2021-08-22 13:00:04', '', null, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES ('5', '用户管理-密码字符范围', 'sys.account.chrtype', '0', 'Y', 'admin', '2021-08-22 13:00:04', '', null, '默认任意字符范围，0任意（密码可以输入任意字符），1数字（密码只能为0-9数字），2英文字母（密码只能为a-z和A-Z字母），3字母和数字（密码必须包含字母，数字）,4字母数字和特殊字符（目前支持的特殊字符包括：~!@#$%^&*()-=_+）');
INSERT INTO `sys_config` VALUES ('6', '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '0', 'Y', 'admin', '2021-08-22 13:00:04', '', null, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES ('7', '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2021-08-22 13:00:04', '', null, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES ('8', '主框架页-菜单导航显示风格', 'sys.index.menuStyle', 'default', 'Y', 'admin', '2021-08-22 13:00:04', '', null, '菜单导航显示风格（default为左侧导航菜单，topnav为顶部导航菜单）');
INSERT INTO `sys_config` VALUES ('9', '主框架页-是否开启页脚', 'sys.index.ignoreFooter', 'true', 'Y', 'admin', '2021-08-22 13:00:04', '', null, '是否开启底部页脚显示（true显示，false隐藏）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('100', '0', '0', '坏猫科技', '0', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-08-22 13:00:03', '', null);
INSERT INTO `sys_dept` VALUES ('101', '100', '0,100', '济南总公司', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-08-22 13:00:03', '', null);
INSERT INTO `sys_dept` VALUES ('102', '100', '0,100', '青岛分公司', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-08-22 13:00:03', '', null);
INSERT INTO `sys_dept` VALUES ('103', '101', '0,100,101', '研发部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-08-22 13:00:03', '', null);
INSERT INTO `sys_dept` VALUES ('104', '101', '0,100,101', '市场部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-08-22 13:00:03', '', null);
INSERT INTO `sys_dept` VALUES ('105', '101', '0,100,101', '测试部门', '3', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-08-22 13:00:03', '', null);
INSERT INTO `sys_dept` VALUES ('106', '101', '0,100,101', '财务部门', '4', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-08-22 13:00:03', '', null);
INSERT INTO `sys_dept` VALUES ('107', '101', '0,100,101', '运维部门', '5', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-08-22 13:00:03', '', null);
INSERT INTO `sys_dept` VALUES ('108', '102', '0,100,102', '市场部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-08-22 13:00:03', '', null);
INSERT INTO `sys_dept` VALUES ('109', '102', '0,100,102', '财务部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-08-22 13:00:03', '', null);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES ('1', '1', '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2021-08-22 13:00:04', '', null, '性别男');
INSERT INTO `sys_dict_data` VALUES ('2', '2', '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-08-22 13:00:04', '', null, '性别女');
INSERT INTO `sys_dict_data` VALUES ('3', '3', '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-08-22 13:00:04', '', null, '性别未知');
INSERT INTO `sys_dict_data` VALUES ('4', '1', '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2021-08-22 13:00:04', '', null, '显示菜单');
INSERT INTO `sys_dict_data` VALUES ('5', '2', '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2021-08-22 13:00:04', '', null, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES ('6', '1', '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2021-08-22 13:00:04', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('7', '2', '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2021-08-22 13:00:04', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('8', '1', '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2021-08-22 13:00:04', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('9', '2', '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2021-08-22 13:00:04', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('10', '1', '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2021-08-22 13:00:04', '', null, '默认分组');
INSERT INTO `sys_dict_data` VALUES ('11', '2', '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2021-08-22 13:00:04', '', null, '系统分组');
INSERT INTO `sys_dict_data` VALUES ('12', '1', '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2021-08-22 13:00:04', '', null, '系统默认是');
INSERT INTO `sys_dict_data` VALUES ('13', '2', '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2021-08-22 13:00:04', '', null, '系统默认否');
INSERT INTO `sys_dict_data` VALUES ('14', '1', '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2021-08-22 13:00:04', '', null, '通知');
INSERT INTO `sys_dict_data` VALUES ('15', '2', '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2021-08-22 13:00:04', '', null, '公告');
INSERT INTO `sys_dict_data` VALUES ('16', '1', '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2021-08-22 13:00:04', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('17', '2', '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2021-08-22 13:00:04', '', null, '关闭状态');
INSERT INTO `sys_dict_data` VALUES ('18', '99', '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-08-22 13:00:04', '', null, '其他操作');
INSERT INTO `sys_dict_data` VALUES ('19', '1', '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-08-22 13:00:04', '', null, '新增操作');
INSERT INTO `sys_dict_data` VALUES ('20', '2', '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-08-22 13:00:04', '', null, '修改操作');
INSERT INTO `sys_dict_data` VALUES ('21', '3', '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-08-22 13:00:04', '', null, '删除操作');
INSERT INTO `sys_dict_data` VALUES ('22', '4', '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2021-08-22 13:00:04', '', null, '授权操作');
INSERT INTO `sys_dict_data` VALUES ('23', '5', '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-08-22 13:00:04', '', null, '导出操作');
INSERT INTO `sys_dict_data` VALUES ('24', '6', '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-08-22 13:00:04', '', null, '导入操作');
INSERT INTO `sys_dict_data` VALUES ('25', '7', '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-08-22 13:00:04', '', null, '强退操作');
INSERT INTO `sys_dict_data` VALUES ('26', '8', '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-08-22 13:00:04', '', null, '生成操作');
INSERT INTO `sys_dict_data` VALUES ('27', '9', '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-08-22 13:00:04', '', null, '清空操作');
INSERT INTO `sys_dict_data` VALUES ('28', '1', '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2021-08-22 13:00:04', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('29', '2', '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2021-08-22 13:00:04', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('100', '10', '流程发起表单', 'act_form_type_001', 'act_form_type', null, null, 'Y', '0', 'admin', '2021-08-23 23:10:29', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('101', '20', '任务表单', 'act_form_type_002', 'act_form_type', null, null, 'Y', '0', 'admin', '2021-08-23 23:11:03', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('102', '10', '未部署', 'act_model_status_001', 'act_model_status', '', 'success', 'Y', '0', 'admin', '2021-08-27 15:09:17', 'admin', '2021-08-27 15:11:48', '');
INSERT INTO `sys_dict_data` VALUES ('103', '20', '已修改未重新部署', 'act_model_status_002', 'act_model_status', null, 'warning', 'N', '0', 'admin', '2021-08-27 15:10:34', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('104', '30', '已部署', 'act_model_status_003', 'act_model_status', '', 'primary', 'N', '0', 'admin', '2021-08-27 15:11:28', 'admin', '2021-08-27 15:11:36', '');
INSERT INTO `sys_dict_data` VALUES ('105', '10', '激活', '1', 'act_suspend_state', '', 'primary', 'Y', '0', 'admin', '2021-08-29 12:45:45', 'admin', '2021-08-29 12:46:12', '');
INSERT INTO `sys_dict_data` VALUES ('106', '20', '挂起', '2', 'act_suspend_state', null, 'warning', 'Y', '0', 'admin', '2021-08-29 12:46:06', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('107', '40', '信息不完整已部署', 'act_model_status_004', 'act_model_status', null, 'danger', 'Y', '0', 'admin', '2021-08-29 21:03:31', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('108', '10', '批准', 'act_common_approve_001', 'act_common_approve', null, null, 'Y', '0', 'admin', '2021-08-31 22:14:27', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('109', '20', '退回', 'act_common_approve_002', 'act_common_approve', null, null, 'Y', '0', 'admin', '2021-08-31 22:22:17', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('110', '10', '已完成', 'act_complete_type_001', 'act_complete_type', null, 'primary', 'Y', '0', 'admin', '2021-09-01 00:50:24', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('111', '20', '未完成', 'act_complete_type_002', 'act_complete_type', null, 'warning', 'Y', '0', 'admin', '2021-09-01 00:50:51', '', null, null);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('1', '用户性别', 'sys_user_sex', '0', 'admin', '2021-08-22 13:00:04', '', null, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES ('2', '菜单状态', 'sys_show_hide', '0', 'admin', '2021-08-22 13:00:04', '', null, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES ('3', '系统开关', 'sys_normal_disable', '0', 'admin', '2021-08-22 13:00:04', '', null, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES ('4', '任务状态', 'sys_job_status', '0', 'admin', '2021-08-22 13:00:04', '', null, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES ('5', '任务分组', 'sys_job_group', '0', 'admin', '2021-08-22 13:00:04', '', null, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES ('6', '系统是否', 'sys_yes_no', '0', 'admin', '2021-08-22 13:00:04', '', null, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES ('7', '通知类型', 'sys_notice_type', '0', 'admin', '2021-08-22 13:00:04', '', null, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES ('8', '通知状态', 'sys_notice_status', '0', 'admin', '2021-08-22 13:00:04', '', null, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES ('9', '操作类型', 'sys_oper_type', '0', 'admin', '2021-08-22 13:00:04', '', null, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES ('10', '系统状态', 'sys_common_status', '0', 'admin', '2021-08-22 13:00:04', '', null, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES ('100', '表单类型', 'act_form_type', '0', 'admin', '2021-08-23 23:09:01', '', null, null);
INSERT INTO `sys_dict_type` VALUES ('101', '流程模型部署状态', 'act_model_status', '0', 'admin', '2021-08-27 15:08:38', '', null, '流程模型部署状态');
INSERT INTO `sys_dict_type` VALUES ('102', '流程激活状态', 'act_suspend_state', '0', 'admin', '2021-08-29 12:45:15', '', null, null);
INSERT INTO `sys_dict_type` VALUES ('103', '通用审批选项', 'act_common_approve', '0', 'admin', '2021-08-31 22:11:52', '', null, '公共审批表单审批选项');
INSERT INTO `sys_dict_type` VALUES ('104', '流程是否完成', 'act_complete_type', '0', 'admin', '2021-09-01 00:49:58', '', null, '流程是否完成');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES ('1', '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2021-08-22 13:00:04', '', null, '');
INSERT INTO `sys_job` VALUES ('2', '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2021-08-22 13:00:04', '', null, '');
INSERT INTO `sys_job` VALUES ('3', '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2021-08-22 13:00:04', '', null, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=498 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES ('100', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-22 13:08:51');
INSERT INTO `sys_logininfor` VALUES ('101', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2021-08-22 13:22:04');
INSERT INTO `sys_logininfor` VALUES ('102', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-22 13:22:07');
INSERT INTO `sys_logininfor` VALUES ('103', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-22 16:00:00');
INSERT INTO `sys_logininfor` VALUES ('104', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-22 16:06:07');
INSERT INTO `sys_logininfor` VALUES ('105', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-22 17:26:08');
INSERT INTO `sys_logininfor` VALUES ('106', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-22 18:16:11');
INSERT INTO `sys_logininfor` VALUES ('107', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-22 19:03:03');
INSERT INTO `sys_logininfor` VALUES ('108', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-22 19:07:52');
INSERT INTO `sys_logininfor` VALUES ('109', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-22 19:11:20');
INSERT INTO `sys_logininfor` VALUES ('110', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-22 19:27:08');
INSERT INTO `sys_logininfor` VALUES ('111', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-22 19:46:13');
INSERT INTO `sys_logininfor` VALUES ('112', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-22 20:19:23');
INSERT INTO `sys_logininfor` VALUES ('113', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-22 20:48:35');
INSERT INTO `sys_logininfor` VALUES ('114', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-22 20:53:23');
INSERT INTO `sys_logininfor` VALUES ('115', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-22 20:59:30');
INSERT INTO `sys_logininfor` VALUES ('116', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-22 21:25:13');
INSERT INTO `sys_logininfor` VALUES ('117', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-22 21:34:13');
INSERT INTO `sys_logininfor` VALUES ('118', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-22 21:59:16');
INSERT INTO `sys_logininfor` VALUES ('119', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-22 22:12:45');
INSERT INTO `sys_logininfor` VALUES ('120', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-23 00:32:04');
INSERT INTO `sys_logininfor` VALUES ('121', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-23 10:32:53');
INSERT INTO `sys_logininfor` VALUES ('122', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-23 12:36:51');
INSERT INTO `sys_logininfor` VALUES ('123', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-23 12:41:19');
INSERT INTO `sys_logininfor` VALUES ('124', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-23 12:47:16');
INSERT INTO `sys_logininfor` VALUES ('125', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-23 12:55:27');
INSERT INTO `sys_logininfor` VALUES ('126', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-23 12:58:48');
INSERT INTO `sys_logininfor` VALUES ('127', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-23 13:12:28');
INSERT INTO `sys_logininfor` VALUES ('128', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-23 17:01:16');
INSERT INTO `sys_logininfor` VALUES ('129', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-23 17:50:37');
INSERT INTO `sys_logininfor` VALUES ('130', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-23 18:20:07');
INSERT INTO `sys_logininfor` VALUES ('131', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-23 20:41:42');
INSERT INTO `sys_logininfor` VALUES ('132', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-23 21:27:09');
INSERT INTO `sys_logininfor` VALUES ('133', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-23 21:42:08');
INSERT INTO `sys_logininfor` VALUES ('134', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-23 21:58:29');
INSERT INTO `sys_logininfor` VALUES ('135', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-23 22:38:37');
INSERT INTO `sys_logininfor` VALUES ('136', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-23 23:03:28');
INSERT INTO `sys_logininfor` VALUES ('137', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-23 23:29:11');
INSERT INTO `sys_logininfor` VALUES ('138', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-23 23:32:04');
INSERT INTO `sys_logininfor` VALUES ('139', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-24 00:12:36');
INSERT INTO `sys_logininfor` VALUES ('140', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-24 00:45:12');
INSERT INTO `sys_logininfor` VALUES ('141', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-24 10:33:31');
INSERT INTO `sys_logininfor` VALUES ('142', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-24 11:05:01');
INSERT INTO `sys_logininfor` VALUES ('143', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-24 11:21:18');
INSERT INTO `sys_logininfor` VALUES ('144', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-24 12:02:25');
INSERT INTO `sys_logininfor` VALUES ('145', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-24 12:10:08');
INSERT INTO `sys_logininfor` VALUES ('146', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-24 12:43:10');
INSERT INTO `sys_logininfor` VALUES ('147', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-24 14:34:40');
INSERT INTO `sys_logininfor` VALUES ('148', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-24 17:56:20');
INSERT INTO `sys_logininfor` VALUES ('149', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-24 18:28:59');
INSERT INTO `sys_logininfor` VALUES ('150', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-24 19:44:16');
INSERT INTO `sys_logininfor` VALUES ('151', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-24 22:25:42');
INSERT INTO `sys_logininfor` VALUES ('152', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-24 22:52:03');
INSERT INTO `sys_logininfor` VALUES ('153', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-24 23:08:30');
INSERT INTO `sys_logininfor` VALUES ('154', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-25 00:15:50');
INSERT INTO `sys_logininfor` VALUES ('155', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-25 01:18:48');
INSERT INTO `sys_logininfor` VALUES ('156', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-25 15:34:17');
INSERT INTO `sys_logininfor` VALUES ('157', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-25 21:05:15');
INSERT INTO `sys_logininfor` VALUES ('158', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-26 13:01:46');
INSERT INTO `sys_logininfor` VALUES ('159', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-26 16:12:09');
INSERT INTO `sys_logininfor` VALUES ('160', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-26 16:22:40');
INSERT INTO `sys_logininfor` VALUES ('161', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-26 16:53:52');
INSERT INTO `sys_logininfor` VALUES ('162', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-26 17:03:35');
INSERT INTO `sys_logininfor` VALUES ('163', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-26 18:22:01');
INSERT INTO `sys_logininfor` VALUES ('164', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-26 19:44:56');
INSERT INTO `sys_logininfor` VALUES ('165', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-26 22:15:43');
INSERT INTO `sys_logininfor` VALUES ('166', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-26 22:32:19');
INSERT INTO `sys_logininfor` VALUES ('167', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-26 23:19:29');
INSERT INTO `sys_logininfor` VALUES ('168', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-26 23:59:47');
INSERT INTO `sys_logininfor` VALUES ('169', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-27 00:38:58');
INSERT INTO `sys_logininfor` VALUES ('170', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-27 11:03:51');
INSERT INTO `sys_logininfor` VALUES ('171', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-27 12:58:12');
INSERT INTO `sys_logininfor` VALUES ('172', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-27 13:04:02');
INSERT INTO `sys_logininfor` VALUES ('173', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-27 13:24:32');
INSERT INTO `sys_logininfor` VALUES ('174', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-27 14:01:53');
INSERT INTO `sys_logininfor` VALUES ('175', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-27 14:21:16');
INSERT INTO `sys_logininfor` VALUES ('176', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-27 14:37:02');
INSERT INTO `sys_logininfor` VALUES ('177', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-27 15:07:37');
INSERT INTO `sys_logininfor` VALUES ('178', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-27 16:11:14');
INSERT INTO `sys_logininfor` VALUES ('179', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-27 17:46:27');
INSERT INTO `sys_logininfor` VALUES ('180', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-27 17:59:56');
INSERT INTO `sys_logininfor` VALUES ('181', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-27 18:16:45');
INSERT INTO `sys_logininfor` VALUES ('182', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-27 18:55:18');
INSERT INTO `sys_logininfor` VALUES ('183', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-27 19:03:25');
INSERT INTO `sys_logininfor` VALUES ('184', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-27 19:44:56');
INSERT INTO `sys_logininfor` VALUES ('185', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-28 08:26:48');
INSERT INTO `sys_logininfor` VALUES ('186', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-28 09:18:03');
INSERT INTO `sys_logininfor` VALUES ('187', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-28 09:26:11');
INSERT INTO `sys_logininfor` VALUES ('188', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-28 09:41:49');
INSERT INTO `sys_logininfor` VALUES ('189', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-28 21:59:42');
INSERT INTO `sys_logininfor` VALUES ('190', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-28 22:24:36');
INSERT INTO `sys_logininfor` VALUES ('191', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-28 22:40:46');
INSERT INTO `sys_logininfor` VALUES ('192', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-28 22:48:39');
INSERT INTO `sys_logininfor` VALUES ('193', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-28 23:11:18');
INSERT INTO `sys_logininfor` VALUES ('194', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-29 10:28:05');
INSERT INTO `sys_logininfor` VALUES ('195', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-29 10:41:22');
INSERT INTO `sys_logininfor` VALUES ('196', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-29 11:19:29');
INSERT INTO `sys_logininfor` VALUES ('197', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-29 11:25:17');
INSERT INTO `sys_logininfor` VALUES ('198', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-29 12:12:24');
INSERT INTO `sys_logininfor` VALUES ('199', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-29 12:40:16');
INSERT INTO `sys_logininfor` VALUES ('200', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-29 14:23:28');
INSERT INTO `sys_logininfor` VALUES ('201', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-29 14:49:35');
INSERT INTO `sys_logininfor` VALUES ('202', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-29 14:58:05');
INSERT INTO `sys_logininfor` VALUES ('203', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-29 15:18:41');
INSERT INTO `sys_logininfor` VALUES ('204', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-29 15:34:46');
INSERT INTO `sys_logininfor` VALUES ('205', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-29 15:51:04');
INSERT INTO `sys_logininfor` VALUES ('206', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-29 19:55:20');
INSERT INTO `sys_logininfor` VALUES ('207', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-29 20:20:31');
INSERT INTO `sys_logininfor` VALUES ('208', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-29 20:53:27');
INSERT INTO `sys_logininfor` VALUES ('209', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-29 20:57:47');
INSERT INTO `sys_logininfor` VALUES ('210', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-29 21:00:53');
INSERT INTO `sys_logininfor` VALUES ('211', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-29 22:21:43');
INSERT INTO `sys_logininfor` VALUES ('212', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-29 23:12:30');
INSERT INTO `sys_logininfor` VALUES ('213', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-29 23:17:30');
INSERT INTO `sys_logininfor` VALUES ('214', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-29 23:24:53');
INSERT INTO `sys_logininfor` VALUES ('215', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-29 23:26:56');
INSERT INTO `sys_logininfor` VALUES ('216', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-29 23:54:12');
INSERT INTO `sys_logininfor` VALUES ('217', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-30 00:02:22');
INSERT INTO `sys_logininfor` VALUES ('218', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-30 00:26:00');
INSERT INTO `sys_logininfor` VALUES ('219', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-30 00:40:42');
INSERT INTO `sys_logininfor` VALUES ('220', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-30 12:59:02');
INSERT INTO `sys_logininfor` VALUES ('221', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-30 13:34:56');
INSERT INTO `sys_logininfor` VALUES ('222', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-30 18:34:34');
INSERT INTO `sys_logininfor` VALUES ('223', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-30 18:47:25');
INSERT INTO `sys_logininfor` VALUES ('224', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-30 18:49:11');
INSERT INTO `sys_logininfor` VALUES ('225', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-30 18:56:21');
INSERT INTO `sys_logininfor` VALUES ('226', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-31 13:02:44');
INSERT INTO `sys_logininfor` VALUES ('227', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-31 13:08:18');
INSERT INTO `sys_logininfor` VALUES ('228', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-31 13:15:14');
INSERT INTO `sys_logininfor` VALUES ('229', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-31 14:19:58');
INSERT INTO `sys_logininfor` VALUES ('230', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-08-31 14:40:24');
INSERT INTO `sys_logininfor` VALUES ('231', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-31 14:40:30');
INSERT INTO `sys_logininfor` VALUES ('232', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-08-31 14:40:45');
INSERT INTO `sys_logininfor` VALUES ('233', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-31 14:40:46');
INSERT INTO `sys_logininfor` VALUES ('234', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-08-31 14:41:35');
INSERT INTO `sys_logininfor` VALUES ('235', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-31 14:41:42');
INSERT INTO `sys_logininfor` VALUES ('236', '唐田震', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2021-08-31 14:46:05');
INSERT INTO `sys_logininfor` VALUES ('237', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-31 14:46:12');
INSERT INTO `sys_logininfor` VALUES ('238', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-31 14:55:02');
INSERT INTO `sys_logininfor` VALUES ('239', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-31 15:37:05');
INSERT INTO `sys_logininfor` VALUES ('240', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-08-31 15:37:14');
INSERT INTO `sys_logininfor` VALUES ('241', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-31 15:37:16');
INSERT INTO `sys_logininfor` VALUES ('242', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-08-31 15:39:40');
INSERT INTO `sys_logininfor` VALUES ('243', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-31 15:39:45');
INSERT INTO `sys_logininfor` VALUES ('244', 'hmxs', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-31 16:12:44');
INSERT INTO `sys_logininfor` VALUES ('245', 'hmxs', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-31 16:31:06');
INSERT INTO `sys_logininfor` VALUES ('246', 'boss', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2021-08-31 16:46:14');
INSERT INTO `sys_logininfor` VALUES ('247', 'hmxs', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-31 16:46:21');
INSERT INTO `sys_logininfor` VALUES ('248', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-31 17:52:34');
INSERT INTO `sys_logininfor` VALUES ('249', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-31 22:08:00');
INSERT INTO `sys_logininfor` VALUES ('250', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-31 22:29:54');
INSERT INTO `sys_logininfor` VALUES ('251', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-31 22:36:00');
INSERT INTO `sys_logininfor` VALUES ('252', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-31 22:55:06');
INSERT INTO `sys_logininfor` VALUES ('253', 'hmxs', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-31 22:56:19');
INSERT INTO `sys_logininfor` VALUES ('254', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-31 23:01:42');
INSERT INTO `sys_logininfor` VALUES ('255', 'hmxs', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-31 23:02:58');
INSERT INTO `sys_logininfor` VALUES ('256', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-01 00:48:17');
INSERT INTO `sys_logininfor` VALUES ('257', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-01 01:09:59');
INSERT INTO `sys_logininfor` VALUES ('258', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-09-01 01:10:04');
INSERT INTO `sys_logininfor` VALUES ('259', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-01 01:10:05');
INSERT INTO `sys_logininfor` VALUES ('260', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-09-01 01:11:50');
INSERT INTO `sys_logininfor` VALUES ('261', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-01 01:11:56');
INSERT INTO `sys_logininfor` VALUES ('262', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-01 01:20:54');
INSERT INTO `sys_logininfor` VALUES ('263', 'hmxs', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-01 01:25:35');
INSERT INTO `sys_logininfor` VALUES ('264', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-01 01:32:17');
INSERT INTO `sys_logininfor` VALUES ('265', 'hmxs', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-01 01:34:23');
INSERT INTO `sys_logininfor` VALUES ('266', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-01 01:43:03');
INSERT INTO `sys_logininfor` VALUES ('267', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-01 01:44:46');
INSERT INTO `sys_logininfor` VALUES ('268', 'hmxs', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-01 01:51:32');
INSERT INTO `sys_logininfor` VALUES ('269', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-01 02:10:13');
INSERT INTO `sys_logininfor` VALUES ('270', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-01 10:39:50');
INSERT INTO `sys_logininfor` VALUES ('271', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-01 12:54:01');
INSERT INTO `sys_logininfor` VALUES ('272', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-09-01 12:54:25');
INSERT INTO `sys_logininfor` VALUES ('273', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-01 12:54:30');
INSERT INTO `sys_logininfor` VALUES ('274', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-01 13:03:39');
INSERT INTO `sys_logininfor` VALUES ('275', 'hmxs', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-01 13:09:48');
INSERT INTO `sys_logininfor` VALUES ('276', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-01 13:16:16');
INSERT INTO `sys_logininfor` VALUES ('277', 'hmxs', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-01 13:17:59');
INSERT INTO `sys_logininfor` VALUES ('278', 'hmxs', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-01 13:29:53');
INSERT INTO `sys_logininfor` VALUES ('279', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-01 13:30:32');
INSERT INTO `sys_logininfor` VALUES ('280', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-01 16:36:17');
INSERT INTO `sys_logininfor` VALUES ('281', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-09-01 16:42:30');
INSERT INTO `sys_logininfor` VALUES ('282', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-01 16:42:35');
INSERT INTO `sys_logininfor` VALUES ('283', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-01 17:02:26');
INSERT INTO `sys_logininfor` VALUES ('284', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-01 17:25:39');
INSERT INTO `sys_logininfor` VALUES ('285', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-01 17:44:27');
INSERT INTO `sys_logininfor` VALUES ('286', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-01 17:52:40');
INSERT INTO `sys_logininfor` VALUES ('287', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-01 17:57:23');
INSERT INTO `sys_logininfor` VALUES ('288', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-01 18:18:00');
INSERT INTO `sys_logininfor` VALUES ('289', 'hmxs', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-01 18:19:15');
INSERT INTO `sys_logininfor` VALUES ('290', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-01 22:25:06');
INSERT INTO `sys_logininfor` VALUES ('291', 'hmxs', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-01 22:25:29');
INSERT INTO `sys_logininfor` VALUES ('292', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-01 23:13:13');
INSERT INTO `sys_logininfor` VALUES ('293', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-02 00:02:47');
INSERT INTO `sys_logininfor` VALUES ('294', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-02 00:10:24');
INSERT INTO `sys_logininfor` VALUES ('295', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-09-02 00:10:27');
INSERT INTO `sys_logininfor` VALUES ('296', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-02 00:10:32');
INSERT INTO `sys_logininfor` VALUES ('297', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-02 00:46:27');
INSERT INTO `sys_logininfor` VALUES ('298', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-02 00:56:57');
INSERT INTO `sys_logininfor` VALUES ('299', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-02 12:53:15');
INSERT INTO `sys_logininfor` VALUES ('300', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-02 13:50:57');
INSERT INTO `sys_logininfor` VALUES ('301', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-02 15:45:37');
INSERT INTO `sys_logininfor` VALUES ('302', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-02 16:07:24');
INSERT INTO `sys_logininfor` VALUES ('303', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-09-02 16:09:19');
INSERT INTO `sys_logininfor` VALUES ('304', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-02 16:09:26');
INSERT INTO `sys_logininfor` VALUES ('305', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-02 17:04:03');
INSERT INTO `sys_logininfor` VALUES ('306', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-02 17:13:05');
INSERT INTO `sys_logininfor` VALUES ('307', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-02 17:55:35');
INSERT INTO `sys_logininfor` VALUES ('308', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-02 18:29:10');
INSERT INTO `sys_logininfor` VALUES ('309', 'hmxs', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-02 18:43:23');
INSERT INTO `sys_logininfor` VALUES ('310', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-02 22:00:27');
INSERT INTO `sys_logininfor` VALUES ('311', 'hmxs', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-02 22:00:42');
INSERT INTO `sys_logininfor` VALUES ('312', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-02 22:22:04');
INSERT INTO `sys_logininfor` VALUES ('313', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-02 22:35:42');
INSERT INTO `sys_logininfor` VALUES ('314', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-02 22:39:03');
INSERT INTO `sys_logininfor` VALUES ('315', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-02 22:50:10');
INSERT INTO `sys_logininfor` VALUES ('316', 'hmxs', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-02 22:51:19');
INSERT INTO `sys_logininfor` VALUES ('317', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-03 00:15:48');
INSERT INTO `sys_logininfor` VALUES ('318', 'hmxs', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-03 00:19:31');
INSERT INTO `sys_logininfor` VALUES ('319', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-03 10:39:16');
INSERT INTO `sys_logininfor` VALUES ('320', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-03 11:17:57');
INSERT INTO `sys_logininfor` VALUES ('321', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-03 12:46:59');
INSERT INTO `sys_logininfor` VALUES ('322', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-03 13:24:06');
INSERT INTO `sys_logininfor` VALUES ('323', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-04 06:47:39');
INSERT INTO `sys_logininfor` VALUES ('324', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-04 08:37:23');
INSERT INTO `sys_logininfor` VALUES ('325', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-04 08:43:20');
INSERT INTO `sys_logininfor` VALUES ('326', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-09-04 08:56:37');
INSERT INTO `sys_logininfor` VALUES ('327', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-04 08:56:42');
INSERT INTO `sys_logininfor` VALUES ('328', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-09-04 08:58:30');
INSERT INTO `sys_logininfor` VALUES ('329', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-04 08:58:33');
INSERT INTO `sys_logininfor` VALUES ('330', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-09-04 08:58:49');
INSERT INTO `sys_logininfor` VALUES ('331', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-04 08:58:54');
INSERT INTO `sys_logininfor` VALUES ('332', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-09-04 09:11:20');
INSERT INTO `sys_logininfor` VALUES ('333', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-04 09:11:23');
INSERT INTO `sys_logininfor` VALUES ('334', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-09-04 09:12:21');
INSERT INTO `sys_logininfor` VALUES ('335', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-04 09:12:26');
INSERT INTO `sys_logininfor` VALUES ('336', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-09-04 09:13:53');
INSERT INTO `sys_logininfor` VALUES ('337', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-04 09:13:55');
INSERT INTO `sys_logininfor` VALUES ('338', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-09-04 09:14:04');
INSERT INTO `sys_logininfor` VALUES ('339', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-04 09:14:09');
INSERT INTO `sys_logininfor` VALUES ('340', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-09-04 09:21:23');
INSERT INTO `sys_logininfor` VALUES ('341', 'hmxs', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-04 09:21:29');
INSERT INTO `sys_logininfor` VALUES ('342', 'hmxs', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-09-04 09:22:06');
INSERT INTO `sys_logininfor` VALUES ('343', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-04 09:22:11');
INSERT INTO `sys_logininfor` VALUES ('344', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-09-04 09:24:34');
INSERT INTO `sys_logininfor` VALUES ('345', 'hmxs', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-04 09:24:38');
INSERT INTO `sys_logininfor` VALUES ('346', 'hmxs', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-09-04 09:25:07');
INSERT INTO `sys_logininfor` VALUES ('347', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-04 09:25:14');
INSERT INTO `sys_logininfor` VALUES ('348', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-09-04 09:37:57');
INSERT INTO `sys_logininfor` VALUES ('349', 'hmxs', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-04 09:38:03');
INSERT INTO `sys_logininfor` VALUES ('350', 'hmxs', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-09-04 09:38:38');
INSERT INTO `sys_logininfor` VALUES ('351', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-04 09:38:42');
INSERT INTO `sys_logininfor` VALUES ('352', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-09-04 09:39:45');
INSERT INTO `sys_logininfor` VALUES ('353', 'hmxs', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-04 09:39:50');
INSERT INTO `sys_logininfor` VALUES ('354', 'hmxs', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-09-04 09:40:38');
INSERT INTO `sys_logininfor` VALUES ('355', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-04 09:40:43');
INSERT INTO `sys_logininfor` VALUES ('356', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-09-04 09:41:34');
INSERT INTO `sys_logininfor` VALUES ('357', 'hmxs', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-04 09:41:39');
INSERT INTO `sys_logininfor` VALUES ('358', 'hmxs', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-09-04 09:42:29');
INSERT INTO `sys_logininfor` VALUES ('359', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-04 09:42:34');
INSERT INTO `sys_logininfor` VALUES ('360', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-04 14:53:11');
INSERT INTO `sys_logininfor` VALUES ('361', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-04 15:12:04');
INSERT INTO `sys_logininfor` VALUES ('362', 'hmxs', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-04 15:14:55');
INSERT INTO `sys_logininfor` VALUES ('363', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-04 15:37:01');
INSERT INTO `sys_logininfor` VALUES ('364', 'hmxs', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-04 15:37:40');
INSERT INTO `sys_logininfor` VALUES ('365', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-09-04 16:06:03');
INSERT INTO `sys_logininfor` VALUES ('366', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-04 16:06:05');
INSERT INTO `sys_logininfor` VALUES ('367', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-04 16:11:44');
INSERT INTO `sys_logininfor` VALUES ('368', 'hmxs', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-04 16:18:19');
INSERT INTO `sys_logininfor` VALUES ('369', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-04 17:10:47');
INSERT INTO `sys_logininfor` VALUES ('370', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-09-04 17:25:49');
INSERT INTO `sys_logininfor` VALUES ('371', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-04 17:26:08');
INSERT INTO `sys_logininfor` VALUES ('372', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-09-04 17:26:46');
INSERT INTO `sys_logininfor` VALUES ('373', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-04 17:26:47');
INSERT INTO `sys_logininfor` VALUES ('374', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-09-04 17:44:07');
INSERT INTO `sys_logininfor` VALUES ('375', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-04 17:44:12');
INSERT INTO `sys_logininfor` VALUES ('376', 'lj', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-04 17:45:35');
INSERT INTO `sys_logininfor` VALUES ('377', 'lj', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-09-04 17:45:55');
INSERT INTO `sys_logininfor` VALUES ('378', 'hmxs', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-04 17:46:00');
INSERT INTO `sys_logininfor` VALUES ('379', 'hmxs', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-09-04 17:46:06');
INSERT INTO `sys_logininfor` VALUES ('380', 'lj', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-04 17:46:12');
INSERT INTO `sys_logininfor` VALUES ('381', 'lj', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-09-04 17:47:29');
INSERT INTO `sys_logininfor` VALUES ('382', 'hmxs', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-04 17:47:34');
INSERT INTO `sys_logininfor` VALUES ('383', 'hmxs', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-04 18:05:24');
INSERT INTO `sys_logininfor` VALUES ('384', 'hmxs', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-04 18:09:31');
INSERT INTO `sys_logininfor` VALUES ('385', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-04 18:11:22');
INSERT INTO `sys_logininfor` VALUES ('386', 'hmxs', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-09-04 18:12:40');
INSERT INTO `sys_logininfor` VALUES ('387', 'lj', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-04 18:12:48');
INSERT INTO `sys_logininfor` VALUES ('388', 'lj', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-04 18:28:30');
INSERT INTO `sys_logininfor` VALUES ('389', 'lj', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-09-04 18:28:37');
INSERT INTO `sys_logininfor` VALUES ('390', 'hmxs', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-04 18:28:43');
INSERT INTO `sys_logininfor` VALUES ('391', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-04 18:29:51');
INSERT INTO `sys_logininfor` VALUES ('392', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-09-04 18:32:49');
INSERT INTO `sys_logininfor` VALUES ('393', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-04 18:32:50');
INSERT INTO `sys_logininfor` VALUES ('394', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-09-04 18:37:59');
INSERT INTO `sys_logininfor` VALUES ('395', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '密码输入错误1次', '2021-09-04 18:38:11');
INSERT INTO `sys_logininfor` VALUES ('396', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-04 18:38:14');
INSERT INTO `sys_logininfor` VALUES ('397', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-09-04 18:39:31');
INSERT INTO `sys_logininfor` VALUES ('398', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-04 18:39:36');
INSERT INTO `sys_logininfor` VALUES ('399', 'hmxs', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-09-04 18:40:38');
INSERT INTO `sys_logininfor` VALUES ('400', 'lj', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-04 18:40:44');
INSERT INTO `sys_logininfor` VALUES ('401', 'lj', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-09-04 18:43:31');
INSERT INTO `sys_logininfor` VALUES ('402', 'hmxs', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-04 18:43:36');
INSERT INTO `sys_logininfor` VALUES ('403', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-04 21:57:21');
INSERT INTO `sys_logininfor` VALUES ('404', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-09-04 22:08:24');
INSERT INTO `sys_logininfor` VALUES ('405', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-04 22:08:29');
INSERT INTO `sys_logininfor` VALUES ('406', 'lj', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-04 22:09:47');
INSERT INTO `sys_logininfor` VALUES ('407', 'lj', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-09-04 22:11:36');
INSERT INTO `sys_logininfor` VALUES ('408', 'hmxs', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-04 22:11:41');
INSERT INTO `sys_logininfor` VALUES ('409', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-04 23:49:05');
INSERT INTO `sys_logininfor` VALUES ('410', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-05 00:04:28');
INSERT INTO `sys_logininfor` VALUES ('411', 'hxms', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2021-09-05 00:06:25');
INSERT INTO `sys_logininfor` VALUES ('412', 'hmxs', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-05 00:06:31');
INSERT INTO `sys_logininfor` VALUES ('413', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-09-05 00:08:37');
INSERT INTO `sys_logininfor` VALUES ('414', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-05 00:08:39');
INSERT INTO `sys_logininfor` VALUES ('415', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-05 00:48:10');
INSERT INTO `sys_logininfor` VALUES ('416', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-09-05 00:49:42');
INSERT INTO `sys_logininfor` VALUES ('417', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-05 00:49:43');
INSERT INTO `sys_logininfor` VALUES ('418', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-05 00:54:27');
INSERT INTO `sys_logininfor` VALUES ('419', 'hmxs', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-05 00:55:31');
INSERT INTO `sys_logininfor` VALUES ('420', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-09-05 01:08:33');
INSERT INTO `sys_logininfor` VALUES ('421', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-05 01:08:35');
INSERT INTO `sys_logininfor` VALUES ('422', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-05 01:11:30');
INSERT INTO `sys_logininfor` VALUES ('423', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-05 01:17:10');
INSERT INTO `sys_logininfor` VALUES ('424', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-05 01:26:15');
INSERT INTO `sys_logininfor` VALUES ('425', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-05 01:35:03');
INSERT INTO `sys_logininfor` VALUES ('426', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-09-05 01:35:11');
INSERT INTO `sys_logininfor` VALUES ('427', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-05 01:35:16');
INSERT INTO `sys_logininfor` VALUES ('428', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-05 01:55:10');
INSERT INTO `sys_logininfor` VALUES ('429', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-05 02:25:38');
INSERT INTO `sys_logininfor` VALUES ('430', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-05 02:32:16');
INSERT INTO `sys_logininfor` VALUES ('431', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-05 02:35:51');
INSERT INTO `sys_logininfor` VALUES ('432', 'hmxs', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-05 02:42:26');
INSERT INTO `sys_logininfor` VALUES ('433', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-05 10:00:11');
INSERT INTO `sys_logininfor` VALUES ('434', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-05 10:14:11');
INSERT INTO `sys_logininfor` VALUES ('435', 'hmxs', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-05 10:15:19');
INSERT INTO `sys_logininfor` VALUES ('436', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-09-05 10:23:42');
INSERT INTO `sys_logininfor` VALUES ('437', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-05 10:23:44');
INSERT INTO `sys_logininfor` VALUES ('438', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-09-05 10:34:26');
INSERT INTO `sys_logininfor` VALUES ('439', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-05 10:34:34');
INSERT INTO `sys_logininfor` VALUES ('440', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-05 10:53:42');
INSERT INTO `sys_logininfor` VALUES ('441', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-05 11:38:27');
INSERT INTO `sys_logininfor` VALUES ('442', 'hmxs', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-05 11:42:54');
INSERT INTO `sys_logininfor` VALUES ('443', 'hmxs', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-09-05 12:11:32');
INSERT INTO `sys_logininfor` VALUES ('444', 'gw', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-05 12:11:36');
INSERT INTO `sys_logininfor` VALUES ('445', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-05 13:57:59');
INSERT INTO `sys_logininfor` VALUES ('446', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-05 15:20:50');
INSERT INTO `sys_logininfor` VALUES ('447', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-05 15:35:49');
INSERT INTO `sys_logininfor` VALUES ('448', 'lj', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-05 15:38:17');
INSERT INTO `sys_logininfor` VALUES ('449', 'lj', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-09-05 15:44:33');
INSERT INTO `sys_logininfor` VALUES ('450', 'gw', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-05 15:44:38');
INSERT INTO `sys_logininfor` VALUES ('451', 'gw', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-09-05 15:44:47');
INSERT INTO `sys_logininfor` VALUES ('452', 'hmxs', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-05 15:44:54');
INSERT INTO `sys_logininfor` VALUES ('453', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-05 15:56:56');
INSERT INTO `sys_logininfor` VALUES ('454', 'lj', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-05 15:58:27');
INSERT INTO `sys_logininfor` VALUES ('455', 'lj', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-09-05 15:59:07');
INSERT INTO `sys_logininfor` VALUES ('456', 'gw', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-05 15:59:12');
INSERT INTO `sys_logininfor` VALUES ('457', 'gw', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-09-05 16:00:52');
INSERT INTO `sys_logininfor` VALUES ('458', 'hmxs', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-05 16:00:57');
INSERT INTO `sys_logininfor` VALUES ('459', 'hmxs', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-09-05 16:02:50');
INSERT INTO `sys_logininfor` VALUES ('460', 'lj', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '密码输入错误1次', '2021-09-05 16:02:53');
INSERT INTO `sys_logininfor` VALUES ('461', 'lj', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-05 16:02:57');
INSERT INTO `sys_logininfor` VALUES ('462', 'lj', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-09-05 16:03:55');
INSERT INTO `sys_logininfor` VALUES ('463', 'gw', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-05 16:04:04');
INSERT INTO `sys_logininfor` VALUES ('464', 'gw', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-09-05 16:04:21');
INSERT INTO `sys_logininfor` VALUES ('465', 'hmxs', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-05 16:04:36');
INSERT INTO `sys_logininfor` VALUES ('466', 'hmxs', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-09-05 16:06:17');
INSERT INTO `sys_logininfor` VALUES ('467', 'lj', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-05 16:06:22');
INSERT INTO `sys_logininfor` VALUES ('468', 'lj', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-09-05 16:07:59');
INSERT INTO `sys_logininfor` VALUES ('469', 'gw', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-05 16:08:03');
INSERT INTO `sys_logininfor` VALUES ('470', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-05 17:14:09');
INSERT INTO `sys_logininfor` VALUES ('471', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-07 10:52:59');
INSERT INTO `sys_logininfor` VALUES ('472', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-07 22:31:34');
INSERT INTO `sys_logininfor` VALUES ('473', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-07 22:43:27');
INSERT INTO `sys_logininfor` VALUES ('474', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-08 13:03:26');
INSERT INTO `sys_logininfor` VALUES ('475', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-08 14:29:51');
INSERT INTO `sys_logininfor` VALUES ('476', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-08 15:26:48');
INSERT INTO `sys_logininfor` VALUES ('477', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-08 16:24:00');
INSERT INTO `sys_logininfor` VALUES ('478', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-09 12:58:19');
INSERT INTO `sys_logininfor` VALUES ('479', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-09 13:33:31');
INSERT INTO `sys_logininfor` VALUES ('480', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-09 14:27:34');
INSERT INTO `sys_logininfor` VALUES ('481', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-10 13:04:55');
INSERT INTO `sys_logininfor` VALUES ('482', 'hmxs', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-10 13:05:39');
INSERT INTO `sys_logininfor` VALUES ('483', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-09-10 13:05:58');
INSERT INTO `sys_logininfor` VALUES ('484', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-10 13:06:09');
INSERT INTO `sys_logininfor` VALUES ('485', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-10 13:37:55');
INSERT INTO `sys_logininfor` VALUES ('486', 'hmxs', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-10 13:40:07');
INSERT INTO `sys_logininfor` VALUES ('487', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-10 13:52:49');
INSERT INTO `sys_logininfor` VALUES ('488', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-09-10 13:52:52');
INSERT INTO `sys_logininfor` VALUES ('489', 'hmxs', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-10 13:53:00');
INSERT INTO `sys_logininfor` VALUES ('490', 'hmxs', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-10 14:04:43');
INSERT INTO `sys_logininfor` VALUES ('491', 'hmxs', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-10 14:16:00');
INSERT INTO `sys_logininfor` VALUES ('492', 'ttz', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-10 14:17:36');
INSERT INTO `sys_logininfor` VALUES ('493', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-10 17:16:10');
INSERT INTO `sys_logininfor` VALUES ('494', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-10 17:19:47');
INSERT INTO `sys_logininfor` VALUES ('495', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-10 18:54:32');
INSERT INTO `sys_logininfor` VALUES ('496', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-10 23:35:08');
INSERT INTO `sys_logininfor` VALUES ('497', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-11 00:07:47');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `url` varchar(200) DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `is_refresh` char(1) DEFAULT '1' COMMENT '是否刷新（0刷新 1不刷新）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2025 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '0', '1', '#', '', 'M', '0', '1', '', 'fa fa-gear', 'admin', '2021-08-22 13:00:03', '', null, '系统管理目录');
INSERT INTO `sys_menu` VALUES ('2', '系统监控', '0', '2', '#', '', 'M', '0', '1', '', 'fa fa-video-camera', 'admin', '2021-08-22 13:00:03', '', null, '系统监控目录');
INSERT INTO `sys_menu` VALUES ('3', '系统工具', '0', '3', '#', '', 'M', '0', '1', '', 'fa fa-bars', 'admin', '2021-08-22 13:00:03', '', null, '系统工具目录');
INSERT INTO `sys_menu` VALUES ('4', '若依官网', '0', '4', 'http://ruoyi.vip', 'menuBlank', 'C', '0', '1', '', 'fa fa-location-arrow', 'admin', '2021-08-22 13:00:03', '', null, '若依官网地址');
INSERT INTO `sys_menu` VALUES ('100', '用户管理', '1', '1', '/system/user', '', 'C', '0', '1', 'system:user:view', 'fa fa-user-o', 'admin', '2021-08-22 13:00:03', '', null, '用户管理菜单');
INSERT INTO `sys_menu` VALUES ('101', '角色管理', '1', '2', '/system/role', '', 'C', '0', '1', 'system:role:view', 'fa fa-user-secret', 'admin', '2021-08-22 13:00:03', '', null, '角色管理菜单');
INSERT INTO `sys_menu` VALUES ('102', '菜单管理', '1', '3', '/system/menu', '', 'C', '0', '1', 'system:menu:view', 'fa fa-th-list', 'admin', '2021-08-22 13:00:03', '', null, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES ('103', '部门管理', '1', '4', '/system/dept', '', 'C', '0', '1', 'system:dept:view', 'fa fa-outdent', 'admin', '2021-08-22 13:00:03', '', null, '部门管理菜单');
INSERT INTO `sys_menu` VALUES ('104', '岗位管理', '1', '5', '/system/post', '', 'C', '0', '1', 'system:post:view', 'fa fa-address-card-o', 'admin', '2021-08-22 13:00:03', '', null, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES ('105', '字典管理', '1', '6', '/system/dict', '', 'C', '0', '1', 'system:dict:view', 'fa fa-bookmark-o', 'admin', '2021-08-22 13:00:03', '', null, '字典管理菜单');
INSERT INTO `sys_menu` VALUES ('106', '参数设置', '1', '7', '/system/config', '', 'C', '0', '1', 'system:config:view', 'fa fa-sun-o', 'admin', '2021-08-22 13:00:03', '', null, '参数设置菜单');
INSERT INTO `sys_menu` VALUES ('107', '通知公告', '1', '8', '/system/notice', '', 'C', '0', '1', 'system:notice:view', 'fa fa-bullhorn', 'admin', '2021-08-22 13:00:03', '', null, '通知公告菜单');
INSERT INTO `sys_menu` VALUES ('108', '日志管理', '1', '9', '#', '', 'M', '0', '1', '', 'fa fa-pencil-square-o', 'admin', '2021-08-22 13:00:03', '', null, '日志管理菜单');
INSERT INTO `sys_menu` VALUES ('109', '在线用户', '2', '1', '/monitor/online', '', 'C', '0', '1', 'monitor:online:view', 'fa fa-user-circle', 'admin', '2021-08-22 13:00:03', '', null, '在线用户菜单');
INSERT INTO `sys_menu` VALUES ('110', '定时任务', '2', '2', '/monitor/job', '', 'C', '0', '1', 'monitor:job:view', 'fa fa-tasks', 'admin', '2021-08-22 13:00:03', '', null, '定时任务菜单');
INSERT INTO `sys_menu` VALUES ('111', '数据监控', '2', '3', '/monitor/data', '', 'C', '0', '1', 'monitor:data:view', 'fa fa-bug', 'admin', '2021-08-22 13:00:03', '', null, '数据监控菜单');
INSERT INTO `sys_menu` VALUES ('112', '服务监控', '2', '4', '/monitor/server', '', 'C', '0', '1', 'monitor:server:view', 'fa fa-server', 'admin', '2021-08-22 13:00:03', '', null, '服务监控菜单');
INSERT INTO `sys_menu` VALUES ('113', '缓存监控', '2', '5', '/monitor/cache', '', 'C', '0', '1', 'monitor:cache:view', 'fa fa-cube', 'admin', '2021-08-22 13:00:03', '', null, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES ('114', '表单构建', '3', '1', '/tool/build', '', 'C', '0', '1', 'tool:build:view', 'fa fa-wpforms', 'admin', '2021-08-22 13:00:03', '', null, '表单构建菜单');
INSERT INTO `sys_menu` VALUES ('115', '代码生成', '3', '2', '/tool/gen', '', 'C', '0', '1', 'tool:gen:view', 'fa fa-code', 'admin', '2021-08-22 13:00:03', '', null, '代码生成菜单');
INSERT INTO `sys_menu` VALUES ('116', '系统接口', '3', '3', '/tool/swagger', '', 'C', '0', '1', 'tool:swagger:view', 'fa fa-gg', 'admin', '2021-08-22 13:00:03', '', null, '系统接口菜单');
INSERT INTO `sys_menu` VALUES ('500', '操作日志', '108', '1', '/monitor/operlog', '', 'C', '0', '1', 'monitor:operlog:view', 'fa fa-address-book', 'admin', '2021-08-22 13:00:03', '', null, '操作日志菜单');
INSERT INTO `sys_menu` VALUES ('501', '登录日志', '108', '2', '/monitor/logininfor', '', 'C', '0', '1', 'monitor:logininfor:view', 'fa fa-file-image-o', 'admin', '2021-08-22 13:00:03', '', null, '登录日志菜单');
INSERT INTO `sys_menu` VALUES ('1000', '用户查询', '100', '1', '#', '', 'F', '0', '1', 'system:user:list', '#', 'admin', '2021-08-22 13:00:03', '', null, '');
INSERT INTO `sys_menu` VALUES ('1001', '用户新增', '100', '2', '#', '', 'F', '0', '1', 'system:user:add', '#', 'admin', '2021-08-22 13:00:03', '', null, '');
INSERT INTO `sys_menu` VALUES ('1002', '用户修改', '100', '3', '#', '', 'F', '0', '1', 'system:user:edit', '#', 'admin', '2021-08-22 13:00:03', '', null, '');
INSERT INTO `sys_menu` VALUES ('1003', '用户删除', '100', '4', '#', '', 'F', '0', '1', 'system:user:remove', '#', 'admin', '2021-08-22 13:00:03', '', null, '');
INSERT INTO `sys_menu` VALUES ('1004', '用户导出', '100', '5', '#', '', 'F', '0', '1', 'system:user:export', '#', 'admin', '2021-08-22 13:00:03', '', null, '');
INSERT INTO `sys_menu` VALUES ('1005', '用户导入', '100', '6', '#', '', 'F', '0', '1', 'system:user:import', '#', 'admin', '2021-08-22 13:00:03', '', null, '');
INSERT INTO `sys_menu` VALUES ('1006', '重置密码', '100', '7', '#', '', 'F', '0', '1', 'system:user:resetPwd', '#', 'admin', '2021-08-22 13:00:03', '', null, '');
INSERT INTO `sys_menu` VALUES ('1007', '角色查询', '101', '1', '#', '', 'F', '0', '1', 'system:role:list', '#', 'admin', '2021-08-22 13:00:03', '', null, '');
INSERT INTO `sys_menu` VALUES ('1008', '角色新增', '101', '2', '#', '', 'F', '0', '1', 'system:role:add', '#', 'admin', '2021-08-22 13:00:03', '', null, '');
INSERT INTO `sys_menu` VALUES ('1009', '角色修改', '101', '3', '#', '', 'F', '0', '1', 'system:role:edit', '#', 'admin', '2021-08-22 13:00:03', '', null, '');
INSERT INTO `sys_menu` VALUES ('1010', '角色删除', '101', '4', '#', '', 'F', '0', '1', 'system:role:remove', '#', 'admin', '2021-08-22 13:00:03', '', null, '');
INSERT INTO `sys_menu` VALUES ('1011', '角色导出', '101', '5', '#', '', 'F', '0', '1', 'system:role:export', '#', 'admin', '2021-08-22 13:00:03', '', null, '');
INSERT INTO `sys_menu` VALUES ('1012', '菜单查询', '102', '1', '#', '', 'F', '0', '1', 'system:menu:list', '#', 'admin', '2021-08-22 13:00:03', '', null, '');
INSERT INTO `sys_menu` VALUES ('1013', '菜单新增', '102', '2', '#', '', 'F', '0', '1', 'system:menu:add', '#', 'admin', '2021-08-22 13:00:03', '', null, '');
INSERT INTO `sys_menu` VALUES ('1014', '菜单修改', '102', '3', '#', '', 'F', '0', '1', 'system:menu:edit', '#', 'admin', '2021-08-22 13:00:03', '', null, '');
INSERT INTO `sys_menu` VALUES ('1015', '菜单删除', '102', '4', '#', '', 'F', '0', '1', 'system:menu:remove', '#', 'admin', '2021-08-22 13:00:03', '', null, '');
INSERT INTO `sys_menu` VALUES ('1016', '部门查询', '103', '1', '#', '', 'F', '0', '1', 'system:dept:list', '#', 'admin', '2021-08-22 13:00:03', '', null, '');
INSERT INTO `sys_menu` VALUES ('1017', '部门新增', '103', '2', '#', '', 'F', '0', '1', 'system:dept:add', '#', 'admin', '2021-08-22 13:00:03', '', null, '');
INSERT INTO `sys_menu` VALUES ('1018', '部门修改', '103', '3', '#', '', 'F', '0', '1', 'system:dept:edit', '#', 'admin', '2021-08-22 13:00:03', '', null, '');
INSERT INTO `sys_menu` VALUES ('1019', '部门删除', '103', '4', '#', '', 'F', '0', '1', 'system:dept:remove', '#', 'admin', '2021-08-22 13:00:03', '', null, '');
INSERT INTO `sys_menu` VALUES ('1020', '岗位查询', '104', '1', '#', '', 'F', '0', '1', 'system:post:list', '#', 'admin', '2021-08-22 13:00:03', '', null, '');
INSERT INTO `sys_menu` VALUES ('1021', '岗位新增', '104', '2', '#', '', 'F', '0', '1', 'system:post:add', '#', 'admin', '2021-08-22 13:00:03', '', null, '');
INSERT INTO `sys_menu` VALUES ('1022', '岗位修改', '104', '3', '#', '', 'F', '0', '1', 'system:post:edit', '#', 'admin', '2021-08-22 13:00:03', '', null, '');
INSERT INTO `sys_menu` VALUES ('1023', '岗位删除', '104', '4', '#', '', 'F', '0', '1', 'system:post:remove', '#', 'admin', '2021-08-22 13:00:03', '', null, '');
INSERT INTO `sys_menu` VALUES ('1024', '岗位导出', '104', '5', '#', '', 'F', '0', '1', 'system:post:export', '#', 'admin', '2021-08-22 13:00:03', '', null, '');
INSERT INTO `sys_menu` VALUES ('1025', '字典查询', '105', '1', '#', '', 'F', '0', '1', 'system:dict:list', '#', 'admin', '2021-08-22 13:00:03', '', null, '');
INSERT INTO `sys_menu` VALUES ('1026', '字典新增', '105', '2', '#', '', 'F', '0', '1', 'system:dict:add', '#', 'admin', '2021-08-22 13:00:03', '', null, '');
INSERT INTO `sys_menu` VALUES ('1027', '字典修改', '105', '3', '#', '', 'F', '0', '1', 'system:dict:edit', '#', 'admin', '2021-08-22 13:00:03', '', null, '');
INSERT INTO `sys_menu` VALUES ('1028', '字典删除', '105', '4', '#', '', 'F', '0', '1', 'system:dict:remove', '#', 'admin', '2021-08-22 13:00:03', '', null, '');
INSERT INTO `sys_menu` VALUES ('1029', '字典导出', '105', '5', '#', '', 'F', '0', '1', 'system:dict:export', '#', 'admin', '2021-08-22 13:00:03', '', null, '');
INSERT INTO `sys_menu` VALUES ('1030', '参数查询', '106', '1', '#', '', 'F', '0', '1', 'system:config:list', '#', 'admin', '2021-08-22 13:00:03', '', null, '');
INSERT INTO `sys_menu` VALUES ('1031', '参数新增', '106', '2', '#', '', 'F', '0', '1', 'system:config:add', '#', 'admin', '2021-08-22 13:00:03', '', null, '');
INSERT INTO `sys_menu` VALUES ('1032', '参数修改', '106', '3', '#', '', 'F', '0', '1', 'system:config:edit', '#', 'admin', '2021-08-22 13:00:03', '', null, '');
INSERT INTO `sys_menu` VALUES ('1033', '参数删除', '106', '4', '#', '', 'F', '0', '1', 'system:config:remove', '#', 'admin', '2021-08-22 13:00:03', '', null, '');
INSERT INTO `sys_menu` VALUES ('1034', '参数导出', '106', '5', '#', '', 'F', '0', '1', 'system:config:export', '#', 'admin', '2021-08-22 13:00:03', '', null, '');
INSERT INTO `sys_menu` VALUES ('1035', '公告查询', '107', '1', '#', '', 'F', '0', '1', 'system:notice:list', '#', 'admin', '2021-08-22 13:00:03', '', null, '');
INSERT INTO `sys_menu` VALUES ('1036', '公告新增', '107', '2', '#', '', 'F', '0', '1', 'system:notice:add', '#', 'admin', '2021-08-22 13:00:03', '', null, '');
INSERT INTO `sys_menu` VALUES ('1037', '公告修改', '107', '3', '#', '', 'F', '0', '1', 'system:notice:edit', '#', 'admin', '2021-08-22 13:00:03', '', null, '');
INSERT INTO `sys_menu` VALUES ('1038', '公告删除', '107', '4', '#', '', 'F', '0', '1', 'system:notice:remove', '#', 'admin', '2021-08-22 13:00:03', '', null, '');
INSERT INTO `sys_menu` VALUES ('1039', '操作查询', '500', '1', '#', '', 'F', '0', '1', 'monitor:operlog:list', '#', 'admin', '2021-08-22 13:00:03', '', null, '');
INSERT INTO `sys_menu` VALUES ('1040', '操作删除', '500', '2', '#', '', 'F', '0', '1', 'monitor:operlog:remove', '#', 'admin', '2021-08-22 13:00:03', '', null, '');
INSERT INTO `sys_menu` VALUES ('1041', '详细信息', '500', '3', '#', '', 'F', '0', '1', 'monitor:operlog:detail', '#', 'admin', '2021-08-22 13:00:03', '', null, '');
INSERT INTO `sys_menu` VALUES ('1042', '日志导出', '500', '4', '#', '', 'F', '0', '1', 'monitor:operlog:export', '#', 'admin', '2021-08-22 13:00:03', '', null, '');
INSERT INTO `sys_menu` VALUES ('1043', '登录查询', '501', '1', '#', '', 'F', '0', '1', 'monitor:logininfor:list', '#', 'admin', '2021-08-22 13:00:03', '', null, '');
INSERT INTO `sys_menu` VALUES ('1044', '登录删除', '501', '2', '#', '', 'F', '0', '1', 'monitor:logininfor:remove', '#', 'admin', '2021-08-22 13:00:03', '', null, '');
INSERT INTO `sys_menu` VALUES ('1045', '日志导出', '501', '3', '#', '', 'F', '0', '1', 'monitor:logininfor:export', '#', 'admin', '2021-08-22 13:00:03', '', null, '');
INSERT INTO `sys_menu` VALUES ('1046', '账户解锁', '501', '4', '#', '', 'F', '0', '1', 'monitor:logininfor:unlock', '#', 'admin', '2021-08-22 13:00:03', '', null, '');
INSERT INTO `sys_menu` VALUES ('1047', '在线查询', '109', '1', '#', '', 'F', '0', '1', 'monitor:online:list', '#', 'admin', '2021-08-22 13:00:03', '', null, '');
INSERT INTO `sys_menu` VALUES ('1048', '批量强退', '109', '2', '#', '', 'F', '0', '1', 'monitor:online:batchForceLogout', '#', 'admin', '2021-08-22 13:00:03', '', null, '');
INSERT INTO `sys_menu` VALUES ('1049', '单条强退', '109', '3', '#', '', 'F', '0', '1', 'monitor:online:forceLogout', '#', 'admin', '2021-08-22 13:00:04', '', null, '');
INSERT INTO `sys_menu` VALUES ('1050', '任务查询', '110', '1', '#', '', 'F', '0', '1', 'monitor:job:list', '#', 'admin', '2021-08-22 13:00:04', '', null, '');
INSERT INTO `sys_menu` VALUES ('1051', '任务新增', '110', '2', '#', '', 'F', '0', '1', 'monitor:job:add', '#', 'admin', '2021-08-22 13:00:04', '', null, '');
INSERT INTO `sys_menu` VALUES ('1052', '任务修改', '110', '3', '#', '', 'F', '0', '1', 'monitor:job:edit', '#', 'admin', '2021-08-22 13:00:04', '', null, '');
INSERT INTO `sys_menu` VALUES ('1053', '任务删除', '110', '4', '#', '', 'F', '0', '1', 'monitor:job:remove', '#', 'admin', '2021-08-22 13:00:04', '', null, '');
INSERT INTO `sys_menu` VALUES ('1054', '状态修改', '110', '5', '#', '', 'F', '0', '1', 'monitor:job:changeStatus', '#', 'admin', '2021-08-22 13:00:04', '', null, '');
INSERT INTO `sys_menu` VALUES ('1055', '任务详细', '110', '6', '#', '', 'F', '0', '1', 'monitor:job:detail', '#', 'admin', '2021-08-22 13:00:04', '', null, '');
INSERT INTO `sys_menu` VALUES ('1056', '任务导出', '110', '7', '#', '', 'F', '0', '1', 'monitor:job:export', '#', 'admin', '2021-08-22 13:00:04', '', null, '');
INSERT INTO `sys_menu` VALUES ('1057', '生成查询', '115', '1', '#', '', 'F', '0', '1', 'tool:gen:list', '#', 'admin', '2021-08-22 13:00:04', '', null, '');
INSERT INTO `sys_menu` VALUES ('1058', '生成修改', '115', '2', '#', '', 'F', '0', '1', 'tool:gen:edit', '#', 'admin', '2021-08-22 13:00:04', '', null, '');
INSERT INTO `sys_menu` VALUES ('1059', '生成删除', '115', '3', '#', '', 'F', '0', '1', 'tool:gen:remove', '#', 'admin', '2021-08-22 13:00:04', '', null, '');
INSERT INTO `sys_menu` VALUES ('1060', '预览代码', '115', '4', '#', '', 'F', '0', '1', 'tool:gen:preview', '#', 'admin', '2021-08-22 13:00:04', '', null, '');
INSERT INTO `sys_menu` VALUES ('1061', '生成代码', '115', '5', '#', '', 'F', '0', '1', 'tool:gen:code', '#', 'admin', '2021-08-22 13:00:04', '', null, '');
INSERT INTO `sys_menu` VALUES ('2000', '测试', '1', '1', '/act/test', '', 'C', '0', '1', 'act:test:view', '#', 'admin', '2021-08-22 19:45:03', '', null, '测试菜单');
INSERT INTO `sys_menu` VALUES ('2001', '测试查询', '2000', '1', '#', '', 'F', '0', '1', 'act:test:list', '#', 'admin', '2021-08-22 19:45:04', '', null, '');
INSERT INTO `sys_menu` VALUES ('2002', '测试新增', '2000', '2', '#', '', 'F', '0', '1', 'act:test:add', '#', 'admin', '2021-08-22 19:45:04', '', null, '');
INSERT INTO `sys_menu` VALUES ('2003', '测试修改', '2000', '3', '#', '', 'F', '0', '1', 'act:test:edit', '#', 'admin', '2021-08-22 19:45:04', '', null, '');
INSERT INTO `sys_menu` VALUES ('2004', '测试删除', '2000', '4', '#', '', 'F', '0', '1', 'act:test:remove', '#', 'admin', '2021-08-22 19:45:04', '', null, '');
INSERT INTO `sys_menu` VALUES ('2005', '测试导出', '2000', '5', '#', '', 'F', '0', '1', 'act:test:export', '#', 'admin', '2021-08-22 19:45:04', '', null, '');
INSERT INTO `sys_menu` VALUES ('2006', '流程', '0', '100', '#', 'menuItem', 'M', '0', '1', null, 'fa fa-cogs', 'admin', '2021-08-23 12:37:42', '', null, '');
INSERT INTO `sys_menu` VALUES ('2007', '发起流程', '2006', '10', '/act/processDefinition/getSysProcessList', 'menuItem', 'C', '0', '0', '', '#', 'admin', '2021-08-23 12:43:01', 'admin', '2021-09-04 07:00:26', '');
INSERT INTO `sys_menu` VALUES ('2008', '流程管理', '0', '50', '#', 'menuItem', 'M', '0', '1', '', 'fa fa-object-ungroup', 'admin', '2021-08-23 17:03:16', 'admin', '2021-09-04 07:00:56', '');
INSERT INTO `sys_menu` VALUES ('2009', '画流程图', '2008', '999', '/bpmnjs/dist/index.html', 'menuItem', 'C', '1', '1', '', '#', 'admin', '2021-08-23 17:04:52', 'admin', '2021-09-04 06:57:18', '');
INSERT INTO `sys_menu` VALUES ('2010', '表单设计', '2008', '10', '/custForm/form', 'menuItem', 'C', '0', '1', 'custForm:form:view', '#', 'admin', '2021-08-23 23:28:52', 'admin', '2021-08-29 11:20:10', '表单设计菜单');
INSERT INTO `sys_menu` VALUES ('2011', '表单设计查询', '2010', '1', '#', '', 'F', '0', '1', 'custForm:form:list', '#', 'admin', '2021-08-23 23:28:52', '', null, '');
INSERT INTO `sys_menu` VALUES ('2012', '表单设计新增', '2010', '2', '#', '', 'F', '0', '1', 'custForm:form:add', '#', 'admin', '2021-08-23 23:28:52', '', null, '');
INSERT INTO `sys_menu` VALUES ('2013', '表单设计修改', '2010', '3', '#', '', 'F', '0', '1', 'custForm:form:edit', '#', 'admin', '2021-08-23 23:28:53', '', null, '');
INSERT INTO `sys_menu` VALUES ('2014', '表单设计删除', '2010', '4', '#', '', 'F', '0', '1', 'custForm:form:remove', '#', 'admin', '2021-08-23 23:28:53', '', null, '');
INSERT INTO `sys_menu` VALUES ('2015', '表单设计导出', '2010', '5', '#', '', 'F', '0', '1', 'custForm:form:export', '#', 'admin', '2021-08-23 23:28:53', '', null, '');
INSERT INTO `sys_menu` VALUES ('2016', '流程模型', '2008', '20', '/act/definition/model', 'menuItem', 'C', '0', '1', 'act/definition:model:view', '#', 'admin', '2021-08-24 18:29:37', 'admin', '2021-08-29 11:20:23', '流程模型菜单');
INSERT INTO `sys_menu` VALUES ('2017', '流程模型查询', '2016', '1', '#', '', 'F', '0', '1', 'act/definition:model:list', '#', 'admin', '2021-08-24 18:29:37', '', null, '');
INSERT INTO `sys_menu` VALUES ('2018', '流程模型新增', '2016', '2', '#', '', 'F', '0', '1', 'act/definition:model:add', '#', 'admin', '2021-08-24 18:29:37', '', null, '');
INSERT INTO `sys_menu` VALUES ('2019', '流程模型修改', '2016', '3', '#', '', 'F', '0', '1', 'act/definition:model:edit', '#', 'admin', '2021-08-24 18:29:37', '', null, '');
INSERT INTO `sys_menu` VALUES ('2020', '流程模型删除', '2016', '4', '#', '', 'F', '0', '1', 'act/definition:model:remove', '#', 'admin', '2021-08-24 18:29:37', '', null, '');
INSERT INTO `sys_menu` VALUES ('2021', '流程模型导出', '2016', '5', '#', '', 'F', '0', '1', 'act/definition:model:export', '#', 'admin', '2021-08-24 18:29:37', '', null, '');
INSERT INTO `sys_menu` VALUES ('2022', '流程管理', '2008', '30', '/act/deployManager/definition', 'menuItem', 'C', '0', '1', '', '#', 'admin', '2021-08-29 11:23:04', 'admin', '2021-08-29 12:17:34', '');
INSERT INTO `sys_menu` VALUES ('2023', '我的待办', '2006', '20', '/act/processTask/myTask', 'menuItem', 'C', '0', '1', null, '#', 'admin', '2021-08-31 15:38:57', '', null, '');
INSERT INTO `sys_menu` VALUES ('2024', '我的发起', '2006', '30', '/act/processInstance/myInstanceList', 'menuItem', 'C', '0', '1', null, '#', 'admin', '2021-09-01 01:11:21', '', null, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) DEFAULT NULL COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('1', '温馨提醒：2018-07-01 若依新版本发布啦', '2', '新版本内容', '0', 'admin', '2021-08-22 13:00:04', '', null, '管理员');
INSERT INTO `sys_notice` VALUES ('2', '维护通知：2018-07-01 若依系统凌晨维护', '1', '维护内容', '0', 'admin', '2021-08-22 13:00:04', '', null, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=285 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES ('100', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"ac_test\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-22 17:30:00');
INSERT INTO `sys_oper_log` VALUES ('101', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"1\"],\"tableName\":[\"ac_test\"],\"tableComment\":[\"测试表\"],\"className\":[\"AcTest\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"1\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"2\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"姓名\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"name\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"3\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"性别\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"sex\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"select\"],\"columns[2].dictType\":[\"sys_user_sex\"],\"columns[3].columnId\":[\"4\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"年龄\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"age\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.system\"],\"moduleName\":[\"system\"],\"businessName\":[\"test\"],\"functionName\":[\"测试\"],\"params[parentMenuId]\":[\"1\"],\"params[parentMenuName]\":[\"系统管理\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-22 17:31:36');
INSERT INTO `sys_oper_log` VALUES ('102', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.download()', 'GET', '1', 'admin', '研发部门', '/tool/gen/download/ac_test', '127.0.0.1', '内网IP', '\"ac_test\"', null, '0', null, '2021-08-22 17:33:49');
INSERT INTO `sys_oper_log` VALUES ('103', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.download()', 'GET', '1', 'admin', '研发部门', '/tool/gen/download/ac_test', '127.0.0.1', '内网IP', '\"ac_test\"', null, '0', null, '2021-08-22 18:16:29');
INSERT INTO `sys_oper_log` VALUES ('104', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"1\"],\"tableName\":[\"ac_test\"],\"tableComment\":[\"测试表\"],\"className\":[\"AcTest\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"1\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"2\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"姓名\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"name\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"3\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"性别\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"sex\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"select\"],\"columns[2].dictType\":[\"sys_user_sex\"],\"columns[3].columnId\":[\"4\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"年龄\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"age\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.system\"],\"moduleName\":[\"test\"],\"businessName\":[\"test\"],\"functionName\":[\"测试\"],\"params[parentMenuId]\":[\"1\"],\"params[parentMenuName]\":[\"系统管理\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-22 19:27:48');
INSERT INTO `sys_oper_log` VALUES ('105', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', '1', 'admin', '研发部门', '/tool/gen/synchDb/ac_test', '127.0.0.1', '内网IP', '\"ac_test\"', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-22 19:29:49');
INSERT INTO `sys_oper_log` VALUES ('106', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"1\"],\"tableName\":[\"ac_test\"],\"tableComment\":[\"测试表\"],\"className\":[\"AcTest\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"1\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"2\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"姓名\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"name\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"3\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"性别\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"sex\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"select\"],\"columns[2].dictType\":[\"sys_user_sex\"],\"columns[3].columnId\":[\"4\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"年龄\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"age\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"5\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"创建人\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"createBy\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"6\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"创建时间\"],\"columns[5].javaType\":[\"Date\"],\"columns[5].javaField\":[\"createTime\"],\"columns[5].isInsert\":[\"1\"],\"columns[5].queryType\":[\"EQ\"],\"columns[5].htmlType\":[\"datetime\"],\"columns[5].dictType\":[\"\"],\"columns', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-22 19:30:33');
INSERT INTO `sys_oper_log` VALUES ('107', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.download()', 'GET', '1', 'admin', '研发部门', '/tool/gen/download/ac_test', '127.0.0.1', '内网IP', '\"ac_test\"', null, '0', null, '2021-08-22 19:30:43');
INSERT INTO `sys_oper_log` VALUES ('108', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"1\"],\"tableName\":[\"ac_test\"],\"tableComment\":[\"测试表\"],\"className\":[\"AcTest\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"1\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"2\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"姓名\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"name\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"3\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"性别\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"sex\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"select\"],\"columns[2].dictType\":[\"sys_user_sex\"],\"columns[3].columnId\":[\"4\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"年龄\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"age\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"5\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"创建人\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"createBy\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"6\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"创建时间\"],\"columns[5].javaType\":[\"Date\"],\"columns[5].javaField\":[\"createTime\"],\"columns[5].isInsert\":[\"1\"],\"columns[5].queryType\":[\"EQ\"],\"columns[5].htmlType\":[\"datetime\"],\"columns[5].dictType\":[\"\"],\"columns', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-22 19:37:34');
INSERT INTO `sys_oper_log` VALUES ('109', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.download()', 'GET', '1', 'admin', '研发部门', '/tool/gen/download/ac_test', '127.0.0.1', '内网IP', '\"ac_test\"', null, '0', null, '2021-08-22 19:37:39');
INSERT INTO `sys_oper_log` VALUES ('110', '测试', '1', 'com.ruoyi.act.controller.AcTestController.addSave()', 'POST', '1', 'admin', '研发部门', '/act/test/add', '127.0.0.1', '内网IP', '{\"name\":[\"test\"],\"sex\":[\"0\"],\"age\":[\"22\"],\"remark\":[\"asdasd\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-22 19:47:04');
INSERT INTO `sys_oper_log` VALUES ('111', '测试', '2', 'com.ruoyi.act.controller.AcTestController.editSave()', 'POST', '1', 'admin', '研发部门', '/act/test/edit', '127.0.0.1', '内网IP', '{\"id\":[\"11\"],\"name\":[\"人2\"],\"sex\":[\"1\"],\"age\":[\"12\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-22 19:48:01');
INSERT INTO `sys_oper_log` VALUES ('112', '测试', '2', 'com.ruoyi.act.controller.AcTestController.editSave()', 'POST', '1', 'admin', '研发部门', '/act/test/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"name\":[\"阿萨德\"],\"sex\":[\"1\"],\"age\":[\"1\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-22 20:21:37');
INSERT INTO `sys_oper_log` VALUES ('113', '测试', '1', 'com.ruoyi.act.controller.AcTestController.addSave()', 'POST', '1', 'admin', '研发部门', '/act/test/add', '127.0.0.1', '内网IP', '{\"name\":[\"唐田震\"],\"sex\":[\"0\"],\"age\":[\"31\"],\"remark\":[\"开发者\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-22 20:22:16');
INSERT INTO `sys_oper_log` VALUES ('114', '测试', '5', 'com.ruoyi.act.controller.AcTestController.export()', 'POST', '1', 'admin', '研发部门', '/act/test/export', '127.0.0.1', '内网IP', '{\"name\":[\"\"],\"sex\":[\"\"],\"age\":[\"\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', '{\r\n  \"msg\" : \"e3e282ec-dbe7-4399-b5d6-e9d85418bce0_测试数据.xlsx\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-22 20:23:29');
INSERT INTO `sys_oper_log` VALUES ('115', '测试', '3', 'com.ruoyi.act.controller.AcTestController.remove()', 'POST', '1', 'admin', '研发部门', '/act/test/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"12,13\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-22 20:24:20');
INSERT INTO `sys_oper_log` VALUES ('116', '测试', '3', 'com.ruoyi.act.controller.AcTestController.remove()', 'POST', '1', 'admin', '研发部门', '/act/test/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"11\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-22 20:24:28');
INSERT INTO `sys_oper_log` VALUES ('117', '测试', '1', 'com.ruoyi.act.controller.AcTestController.addSave()', 'POST', '1', 'admin', '研发部门', '/act/test/add', '127.0.0.1', '内网IP', '{\"name\":[\"test\"],\"sex\":[\"0\"],\"age\":[\"11\"],\"remark\":[\"11\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-22 20:48:48');
INSERT INTO `sys_oper_log` VALUES ('118', '测试', '2', 'com.ruoyi.act.controller.AcTestController.editSave()', 'POST', '1', 'admin', '研发部门', '/act/test/edit', '127.0.0.1', '内网IP', '{\"id\":[\"15\"],\"name\":[\"test2\"],\"sex\":[\"0\"],\"age\":[\"11\"],\"remark\":[\"11\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-22 20:48:58');
INSERT INTO `sys_oper_log` VALUES ('119', '测试', '3', 'com.ruoyi.act.controller.AcTestController.remove()', 'POST', '1', 'admin', '研发部门', '/act/test/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"15\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-22 20:49:18');
INSERT INTO `sys_oper_log` VALUES ('120', '测试', '3', 'com.ruoyi.act.controller.AcTestController.remove()', 'POST', '1', 'admin', '研发部门', '/act/test/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"9,10\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-22 20:49:25');
INSERT INTO `sys_oper_log` VALUES ('121', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.download()', 'GET', '1', 'admin', '研发部门', '/tool/gen/download/ac_test', '127.0.0.1', '内网IP', '\"ac_test\"', null, '0', null, '2021-08-22 20:53:50');
INSERT INTO `sys_oper_log` VALUES ('122', '测试', '1', 'com.ruoyi.act.controller.AcTestController.addSave()', 'POST', '1', 'admin', '研发部门', '/act/test/add', '127.0.0.1', '内网IP', '{\"name\":[\"test\"],\"sex\":[\"0\"],\"age\":[\"11\"],\"remark\":[\"11\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-22 20:59:42');
INSERT INTO `sys_oper_log` VALUES ('123', '测试', '2', 'com.ruoyi.act.controller.AcTestController.editSave()', 'POST', '1', 'admin', '研发部门', '/act/test/edit', '127.0.0.1', '内网IP', '{\"id\":[\"16\"],\"name\":[\"test2\"],\"sex\":[\"0\"],\"age\":[\"11\"],\"remark\":[\"11\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-22 20:59:49');
INSERT INTO `sys_oper_log` VALUES ('124', '测试', '3', 'com.ruoyi.act.controller.AcTestController.remove()', 'POST', '1', 'admin', '研发部门', '/act/test/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"16\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-22 20:59:54');
INSERT INTO `sys_oper_log` VALUES ('125', '测试', '1', 'com.ruoyi.act.controller.AcTestController.addSave()', 'POST', '1', 'admin', '研发部门', '/act/test/add', '127.0.0.1', '内网IP', '{\"name\":[\"唐田震2\"],\"sex\":[\"0\"],\"age\":[\"31\"],\"remark\":[\"222\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-22 22:13:05');
INSERT INTO `sys_oper_log` VALUES ('126', '测试', '2', 'com.ruoyi.act.controller.AcTestController.editSave()', 'POST', '1', 'admin', '研发部门', '/act/test/edit', '127.0.0.1', '内网IP', '{\"id\":[\"17\"],\"name\":[\"唐田震2\"],\"sex\":[\"0\"],\"age\":[\"31\"],\"remark\":[\"呵呵\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-22 22:13:47');
INSERT INTO `sys_oper_log` VALUES ('127', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"流程\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"100\"],\"icon\":[\"fa fa-cogs\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-23 12:37:42');
INSERT INTO `sys_oper_log` VALUES ('128', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2006\"],\"menuType\":[\"C\"],\"menuName\":[\"公司流程\"],\"url\":[\"/act/processDefinition/getDefinitions\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"10\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-23 12:43:01');
INSERT INTO `sys_oper_log` VALUES ('129', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2007\"],\"parentId\":[\"2006\"],\"menuType\":[\"C\"],\"menuName\":[\"新建流程\"],\"url\":[\"/act/processDefinition/getDefinitions\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"10\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-23 17:01:45');
INSERT INTO `sys_oper_log` VALUES ('130', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"流程管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"200\"],\"icon\":[\"fa fa-object-ungroup\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-23 17:03:16');
INSERT INTO `sys_oper_log` VALUES ('131', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2008\"],\"menuType\":[\"C\"],\"menuName\":[\"画流程图\"],\"url\":[\"/bpmnjs/dist/index.html\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"10\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-23 17:04:52');
INSERT INTO `sys_oper_log` VALUES ('132', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"t_cust_form\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-23 23:03:41');
INSERT INTO `sys_oper_log` VALUES ('133', '字典类型', '1', 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"表单类型\"],\"dictType\":[\"act_form_type\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-23 23:09:02');
INSERT INTO `sys_oper_log` VALUES ('134', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"流程发起表单\"],\"dictValue\":[\"act_form_type_001\"],\"dictType\":[\"act_form_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"10\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-23 23:10:30');
INSERT INTO `sys_oper_log` VALUES ('135', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"任务表单\"],\"dictValue\":[\"act_form_type_002\"],\"dictType\":[\"act_form_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"20\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-23 23:11:03');
INSERT INTO `sys_oper_log` VALUES ('136', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"2\"],\"tableName\":[\"t_cust_form\"],\"tableComment\":[\"自定义表单\"],\"className\":[\"TCustForm\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"10\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"11\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"表单key\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"formKey\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"12\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"表单名\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"formName\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"LIKE\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"13\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"表单类型\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"type\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"select\"],\"columns[3].dictType\":[\"act_form_type\"],\"columns[4].columnId\":[\"14\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"表单内容\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"content\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"textarea\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"15\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"创建人\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"createBy\"],\"columns[5].isInsert\":[\"1\"],\"columns[5].queryType\":[\"EQ\"],\"columns[', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-23 23:14:52');
INSERT INTO `sys_oper_log` VALUES ('137', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.download()', 'GET', '1', 'admin', '研发部门', '/tool/gen/download/t_cust_form', '127.0.0.1', '内网IP', '\"t_cust_form\"', null, '0', null, '2021-08-23 23:16:19');
INSERT INTO `sys_oper_log` VALUES ('138', '表单设计', '1', 'com.ruoyi.web.controller.system.TCustFormController.addSave()', 'POST', '1', 'admin', '研发部门', '/custForm/form/add', '127.0.0.1', '内网IP', '{\"formKey\":[\"test\"],\"formName\":[\"测试表单\"],\"type\":[\"act_form_type_001\"],\"remark\":[\"测试\"],\"status\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-24 00:13:01');
INSERT INTO `sys_oper_log` VALUES ('139', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"t_process_model\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-24 18:00:04');
INSERT INTO `sys_oper_log` VALUES ('140', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"3\"],\"tableName\":[\"t_process_model\"],\"tableComment\":[\"流程模型表\"],\"className\":[\"TProcessModel\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"21\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"22\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"key\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"processKey\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"23\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"部门id\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"deptId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"24\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"模型名称\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"name\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"LIKE\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"25\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"表单id\"],\"columns[4].javaType\":[\"Long\"],\"columns[4].javaField\":[\"formId\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"26\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"创建人\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"createBy\"],\"columns[5].isInsert\":[\"1\"],', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-24 18:06:26');
INSERT INTO `sys_oper_log` VALUES ('141', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.download()', 'GET', '1', 'admin', '研发部门', '/tool/gen/download/t_process_model', '127.0.0.1', '内网IP', '\"t_process_model\"', null, '0', null, '2021-08-24 18:06:33');
INSERT INTO `sys_oper_log` VALUES ('142', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"3\"],\"tableName\":[\"t_process_model\"],\"tableComment\":[\"流程模型表\"],\"className\":[\"TProcessModel\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"21\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"22\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"key\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"processKey\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"23\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"部门id\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"deptId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"24\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"模型名称\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"name\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"LIKE\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"25\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"表单id\"],\"columns[4].javaType\":[\"Long\"],\"columns[4].javaField\":[\"formId\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"26\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"创建人\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"createBy\"],\"columns[5].isInsert\":[\"1\"],', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-24 18:13:17');
INSERT INTO `sys_oper_log` VALUES ('143', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.download()', 'GET', '1', 'admin', '研发部门', '/tool/gen/download/t_process_model', '127.0.0.1', '内网IP', '\"t_process_model\"', null, '0', null, '2021-08-24 18:13:55');
INSERT INTO `sys_oper_log` VALUES ('144', '表单设计', '1', 'com.ruoyi.web.controller.system.TCustFormController.addSave()', 'POST', '1', 'admin', '研发部门', '/custForm/form/add', '127.0.0.1', '内网IP', '{\"formKey\":[\"aaaaa\"],\"formName\":[\"aaaaaa\"],\"type\":[\"act_form_type_001\"],\"remark\":[\"aaaaa\"],\"status\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-25 00:21:00');
INSERT INTO `sys_oper_log` VALUES ('145', '表单设计', '3', 'com.ruoyi.web.controller.system.TCustFormController.remove()', 'POST', '1', 'admin', '研发部门', '/custForm/form/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-25 00:21:41');
INSERT INTO `sys_oper_log` VALUES ('146', '表单设计', '1', 'com.ruoyi.web.controller.system.TCustFormController.addSave()', 'POST', '1', 'admin', '研发部门', '/custForm/form/add', '127.0.0.1', '内网IP', '{\"formKey\":[\"aaaaa\"],\"formName\":[\"aaaaaa\"],\"type\":[\"act_form_type_002\"],\"remark\":[\"aaa\"],\"status\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-25 00:22:55');
INSERT INTO `sys_oper_log` VALUES ('147', '表单设计', '3', 'com.ruoyi.web.controller.system.TCustFormController.remove()', 'POST', '1', 'admin', '研发部门', '/custForm/form/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"3\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-25 00:25:18');
INSERT INTO `sys_oper_log` VALUES ('148', '表单设计', '1', 'com.ruoyi.web.controller.system.TCustFormController.addSave()', 'POST', '1', 'admin', '研发部门', '/custForm/form/add', '127.0.0.1', '内网IP', '{\"formKey\":[\"aaaaa\"],\"formName\":[\"aaaaaa\"],\"type\":[\"act_form_type_002\"],\"remark\":[\"aaaaa\"],\"status\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-25 00:27:22');
INSERT INTO `sys_oper_log` VALUES ('149', '表单设计', '3', 'com.ruoyi.web.controller.system.TCustFormController.remove()', 'POST', '1', 'admin', '研发部门', '/custForm/form/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"4\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-25 00:28:31');
INSERT INTO `sys_oper_log` VALUES ('150', '表单设计', '1', 'com.ruoyi.web.controller.system.TCustFormController.addSave()', 'POST', '1', 'admin', '研发部门', '/custForm/form/add', '127.0.0.1', '内网IP', '{\"formKey\":[\"aaaaa\"],\"formName\":[\"aaaaaa\"],\"type\":[\"act_form_type_002\"],\"remark\":[\"aaaaa\"],\"status\":[\"0\"],\"content\":[\"\\n\\n    <div class=\\\"drag-box drag-container drag-container-border drag-single-container-real\\\" style=\\\"display: flex;flex-direction: column;flex: 0 0 auto;\\\" id=\\\"1629822518000\\\"><div class=\\\"drag-box\\\" style=\\\"display: flex;flex: 0 0 auto;\\\" id=\\\"1629822519000\\\">\\n            <div class=\\\"drag-container drag-container-border\\\" style=\\\"display: flex;flex-direction: column;flex: 1;\\\">\\n\\n            <div class=\\\"drag-box drag-item form-group\\\" data-type=\\\"drag_select\\\" style=\\\"display: flex;align-items: baseline;padding-left: 10px;\\\" id=\\\"1629822521000\\\">\\n            <label class=\\\"control-label\\\" style=\\\"width: 80px;text-align: right;\\\">组件名：</label>\\n            <div style=\\\"flex: 1;\\\">\\n                <select class=\\\"form-control real select2-hidden-accessible\\\" id=\\\"real1629822521000\\\" data-select2-id=\\\"real1629822521000\\\" tabindex=\\\"-1\\\" aria-hidden=\\\"true\\\">\\n                    <option value=\\\"\\\" data-select2-id=\\\"2\\\">--请选择--</option>\\n                    <option value=\\\"Java\\\">示例一</option>\\n                    <option value=\\\"PHP\\\">示例二</option>\\n                    <option value=\\\".NET\\\">示例三</option>\\n                </select><span class=\\\"select2 select2-container select2-container--bootstrap\\\" dir=\\\"ltr\\\" data-select2-id=\\\"1\\\" style=\\\"width: 100%;\\\"><span class=\\\"selection\\\"><span class=\\\"select2-selection select2-selection--single\\\" role=\\\"combobox\\\" aria-haspopup=\\\"true\\\" aria-expanded=\\\"false\\\" tabindex=\\\"0\\\" aria-labelledby=\\\"select2-real1629822521000-container\\\"><span class=\\\"select2-selection__rendered\\\" id=\\\"select2-real1629822521000-container\\\" role=\\\"textbox\\\" aria-readonly=\\\"true\\\" title=\\\"--请选择--\\\">--请选择--</span><span class=\\\"select2-selection__arrow\\\" role=\\\"presentation\\\"><b role=\\\"presentation\\\"></b></span></span></span><span class=\\\"dropdown-wrapper\\\" aria-hidden=\\\"true\\\"></span></span>\\n            </div>\\n        </div></d', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-25 00:29:23');
INSERT INTO `sys_oper_log` VALUES ('151', '表单设计', '3', 'com.ruoyi.web.controller.system.TCustFormController.remove()', 'POST', '1', 'admin', '研发部门', '/custForm/form/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"5\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-25 00:29:46');
INSERT INTO `sys_oper_log` VALUES ('152', '表单设计', '1', 'com.ruoyi.web.controller.system.TCustFormController.addSave()', 'POST', '1', 'admin', '研发部门', '/custForm/form/add', '127.0.0.1', '内网IP', '{\"formKey\":[\"aaaaa\"],\"formName\":[\"aaaaaa\"],\"type\":[\"act_form_type_002\"],\"remark\":[\"aaaaa\"],\"status\":[\"0\"],\"content\":[\"\\n\\n    <div class=\\\"drag-box drag-item form-group\\\" data-type=\\\"drag_select\\\" style=\\\"display: flex;align-items: baseline;padding-left: 10px;\\\" id=\\\"1629823573000\\\">\\n            <label class=\\\"control-label\\\" style=\\\"width: 80px;text-align: right;\\\">组件名：</label>\\n            <div style=\\\"flex: 1;\\\">\\n                <select class=\\\"form-control real select2-hidden-accessible\\\" id=\\\"real1629823573000\\\" data-select2-id=\\\"real1629823573000\\\" tabindex=\\\"-1\\\" aria-hidden=\\\"true\\\">\\n                    <option value=\\\"\\\" data-select2-id=\\\"2\\\">--请选择--</option>\\n                    <option value=\\\"Java\\\">示例一</option>\\n                    <option value=\\\"PHP\\\">示例二</option>\\n                    <option value=\\\".NET\\\">示例三</option>\\n                </select><span class=\\\"select2 select2-container select2-container--bootstrap\\\" dir=\\\"ltr\\\" data-select2-id=\\\"1\\\" style=\\\"width: 100%;\\\"><span class=\\\"selection\\\"><span class=\\\"select2-selection select2-selection--single\\\" role=\\\"combobox\\\" aria-haspopup=\\\"true\\\" aria-expanded=\\\"false\\\" tabindex=\\\"0\\\" aria-labelledby=\\\"select2-real1629823573000-container\\\"><span class=\\\"select2-selection__rendered\\\" id=\\\"select2-real1629823573000-container\\\" role=\\\"textbox\\\" aria-readonly=\\\"true\\\" title=\\\"--请选择--\\\">--请选择--</span><span class=\\\"select2-selection__arrow\\\" role=\\\"presentation\\\"><b role=\\\"presentation\\\"></b></span></span></span><span class=\\\"dropdown-wrapper\\\" aria-hidden=\\\"true\\\"></span></span>\\n            </div>\\n        </div>\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-25 00:46:38');
INSERT INTO `sys_oper_log` VALUES ('153', '表单设计', '3', 'com.ruoyi.web.controller.system.TCustFormController.remove()', 'POST', '1', 'admin', '研发部门', '/custForm/form/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"6\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-25 00:47:18');
INSERT INTO `sys_oper_log` VALUES ('154', '表单设计', '1', 'com.ruoyi.web.controller.system.TCustFormController.addSave()', 'POST', '1', 'admin', '研发部门', '/custForm/form/add', '127.0.0.1', '内网IP', '{\"formKey\":[\"aaaaa\"],\"formName\":[\"aaaaaa\"],\"type\":[\"act_form_type_001\"],\"remark\":[\"aaaaa\"],\"status\":[\"0\"],\"content\":[\"\\n\\n    <div class=\\\"drag-box drag-item form-group\\\" data-type=\\\"drag_select\\\" style=\\\"display: flex;align-items: baseline;padding-left: 10px;\\\" id=\\\"1629823645000\\\">\\n            <label class=\\\"control-label\\\" style=\\\"width: 80px;text-align: right;\\\">组件名：</label>\\n            <div style=\\\"flex: 1;\\\">\\n                <select class=\\\"form-control real select2-hidden-accessible\\\" id=\\\"real1629823645000\\\" data-select2-id=\\\"real1629823645000\\\" tabindex=\\\"-1\\\" aria-hidden=\\\"true\\\">\\n                    <option value=\\\"\\\" data-select2-id=\\\"2\\\">--请选择--</option>\\n                    <option value=\\\"Java\\\">示例一</option>\\n                    <option value=\\\"PHP\\\">示例二</option>\\n                    <option value=\\\".NET\\\">示例三</option>\\n                </select><span class=\\\"select2 select2-container select2-container--bootstrap\\\" dir=\\\"ltr\\\" data-select2-id=\\\"1\\\" style=\\\"width: 100%;\\\"><span class=\\\"selection\\\"><span class=\\\"select2-selection select2-selection--single\\\" role=\\\"combobox\\\" aria-haspopup=\\\"true\\\" aria-expanded=\\\"false\\\" tabindex=\\\"0\\\" aria-labelledby=\\\"select2-real1629823645000-container\\\"><span class=\\\"select2-selection__rendered\\\" id=\\\"select2-real1629823645000-container\\\" role=\\\"textbox\\\" aria-readonly=\\\"true\\\" title=\\\"--请选择--\\\">--请选择--</span><span class=\\\"select2-selection__arrow\\\" role=\\\"presentation\\\"><b role=\\\"presentation\\\"></b></span></span></span><span class=\\\"dropdown-wrapper\\\" aria-hidden=\\\"true\\\"></span></span>\\n            </div>\\n        </div>\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-25 00:47:36');
INSERT INTO `sys_oper_log` VALUES ('155', '表单设计', '3', 'com.ruoyi.web.controller.system.TCustFormController.remove()', 'POST', '1', 'admin', '研发部门', '/custForm/form/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"7\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-25 00:48:48');
INSERT INTO `sys_oper_log` VALUES ('156', '表单设计', '1', 'com.ruoyi.web.controller.system.TCustFormController.addSave()', 'POST', '1', 'admin', '研发部门', '/custForm/form/add', '127.0.0.1', '内网IP', '{\"formKey\":[\"aaaaa\"],\"formName\":[\"aaaaaa\"],\"type\":[\"act_form_type_002\"],\"remark\":[\"aaaaa\"],\"status\":[\"0\"],\"content\":[\"\\n\\n    <div class=\\\"drag-box drag-item form-group\\\" data-type=\\\"drag_select\\\" style=\\\"display: flex;align-items: baseline;padding-left: 10px;\\\" id=\\\"1629823737000\\\">\\n            <label class=\\\"control-label\\\" style=\\\"width: 80px;text-align: right;\\\">组件名：</label>\\n            <div style=\\\"flex: 1;\\\">\\n                <select class=\\\"form-control real select2-hidden-accessible\\\" id=\\\"real1629823737000\\\" data-select2-id=\\\"real1629823737000\\\" tabindex=\\\"-1\\\" aria-hidden=\\\"true\\\">\\n                    <option value=\\\"\\\" data-select2-id=\\\"2\\\">--请选择--</option>\\n                    <option value=\\\"Java\\\">示例一</option>\\n                    <option value=\\\"PHP\\\">示例二</option>\\n                    <option value=\\\".NET\\\">示例三</option>\\n                </select><span class=\\\"select2 select2-container select2-container--bootstrap\\\" dir=\\\"ltr\\\" data-select2-id=\\\"1\\\" style=\\\"width: 100%;\\\"><span class=\\\"selection\\\"><span class=\\\"select2-selection select2-selection--single\\\" role=\\\"combobox\\\" aria-haspopup=\\\"true\\\" aria-expanded=\\\"false\\\" tabindex=\\\"0\\\" aria-labelledby=\\\"select2-real1629823737000-container\\\"><span class=\\\"select2-selection__rendered\\\" id=\\\"select2-real1629823737000-container\\\" role=\\\"textbox\\\" aria-readonly=\\\"true\\\" title=\\\"--请选择--\\\">--请选择--</span><span class=\\\"select2-selection__arrow\\\" role=\\\"presentation\\\"><b role=\\\"presentation\\\"></b></span></span></span><span class=\\\"dropdown-wrapper\\\" aria-hidden=\\\"true\\\"></span></span>\\n            </div>\\n        </div>\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-25 00:49:07');
INSERT INTO `sys_oper_log` VALUES ('157', '表单设计', '3', 'com.ruoyi.web.controller.system.TCustFormController.remove()', 'POST', '1', 'admin', '研发部门', '/custForm/form/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"8\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-25 00:52:26');
INSERT INTO `sys_oper_log` VALUES ('158', '表单设计', '1', 'com.ruoyi.web.controller.system.TCustFormController.addSave()', 'POST', '1', 'admin', '研发部门', '/custForm/form/add', '127.0.0.1', '内网IP', '{\"formKey\":[\"aaaaa\"],\"formName\":[\"aaaaaa\"],\"type\":[\"act_form_type_002\"],\"remark\":[\"aaaaa\"],\"status\":[\"0\"],\"content\":[\"\\n\\n    <div class=\\\"drag-box drag-item form-group\\\" data-type=\\\"drag_select\\\" style=\\\"display: flex;align-items: baseline;padding-left: 10px;\\\" id=\\\"1629823953000\\\">\\n            <label class=\\\"control-label\\\" style=\\\"width: 80px;text-align: right;\\\">组件名：</label>\\n            <div style=\\\"flex: 1;\\\">\\n                <select class=\\\"form-control real select2-hidden-accessible\\\" id=\\\"real1629823953000\\\" data-select2-id=\\\"real1629823953000\\\" tabindex=\\\"-1\\\" aria-hidden=\\\"true\\\">\\n                    <option value=\\\"\\\" data-select2-id=\\\"2\\\">--请选择--</option>\\n                    <option value=\\\"Java\\\">示例一</option>\\n                    <option value=\\\"PHP\\\">示例二</option>\\n                    <option value=\\\".NET\\\">示例三</option>\\n                </select><span class=\\\"select2 select2-container select2-container--bootstrap\\\" dir=\\\"ltr\\\" data-select2-id=\\\"1\\\" style=\\\"width: 100%;\\\"><span class=\\\"selection\\\"><span class=\\\"select2-selection select2-selection--single\\\" role=\\\"combobox\\\" aria-haspopup=\\\"true\\\" aria-expanded=\\\"false\\\" tabindex=\\\"0\\\" aria-labelledby=\\\"select2-real1629823953000-container\\\"><span class=\\\"select2-selection__rendered\\\" id=\\\"select2-real1629823953000-container\\\" role=\\\"textbox\\\" aria-readonly=\\\"true\\\" title=\\\"--请选择--\\\">--请选择--</span><span class=\\\"select2-selection__arrow\\\" role=\\\"presentation\\\"><b role=\\\"presentation\\\"></b></span></span></span><span class=\\\"dropdown-wrapper\\\" aria-hidden=\\\"true\\\"></span></span>\\n            </div>\\n        </div>\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-25 00:52:47');
INSERT INTO `sys_oper_log` VALUES ('159', '表单设计', '3', 'com.ruoyi.web.controller.system.TCustFormController.remove()', 'POST', '1', 'admin', '研发部门', '/custForm/form/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"9\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-25 00:56:10');
INSERT INTO `sys_oper_log` VALUES ('160', '表单设计', '1', 'com.ruoyi.web.controller.system.TCustFormController.addSave()', 'POST', '1', 'admin', '研发部门', '/custForm/form/add', '127.0.0.1', '内网IP', '{\"formKey\":[\"aaaaa\"],\"formName\":[\"aaaaaa\"],\"type\":[\"act_form_type_002\"],\"remark\":[\"aaaaa\"],\"status\":[\"0\"],\"content\":[\"\\n\\n    <div class=\\\"drag-box drag-item form-group\\\" data-type=\\\"drag_select\\\" style=\\\"display: flex;align-items: baseline;padding-left: 10px;\\\" id=\\\"1629824177000\\\">\\n            <label class=\\\"control-label\\\" style=\\\"width: 80px;text-align: right;\\\">组件名：</label>\\n            <div style=\\\"flex: 1;\\\">\\n                <select class=\\\"form-control real select2-hidden-accessible\\\" id=\\\"real1629824177000\\\" data-select2-id=\\\"real1629824177000\\\" tabindex=\\\"-1\\\" aria-hidden=\\\"true\\\">\\n                    <option value=\\\"\\\" data-select2-id=\\\"2\\\">--请选择--</option>\\n                    <option value=\\\"Java\\\">示例一</option>\\n                    <option value=\\\"PHP\\\">示例二</option>\\n                    <option value=\\\".NET\\\">示例三</option>\\n                </select><span class=\\\"select2 select2-container select2-container--bootstrap\\\" dir=\\\"ltr\\\" data-select2-id=\\\"1\\\" style=\\\"width: 100%;\\\"><span class=\\\"selection\\\"><span class=\\\"select2-selection select2-selection--single\\\" role=\\\"combobox\\\" aria-haspopup=\\\"true\\\" aria-expanded=\\\"false\\\" tabindex=\\\"0\\\" aria-labelledby=\\\"select2-real1629824177000-container\\\"><span class=\\\"select2-selection__rendered\\\" id=\\\"select2-real1629824177000-container\\\" role=\\\"textbox\\\" aria-readonly=\\\"true\\\" title=\\\"--请选择--\\\">--请选择--</span><span class=\\\"select2-selection__arrow\\\" role=\\\"presentation\\\"><b role=\\\"presentation\\\"></b></span></span></span><span class=\\\"dropdown-wrapper\\\" aria-hidden=\\\"true\\\"></span></span>\\n            </div>\\n        </div>\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-25 00:56:33');
INSERT INTO `sys_oper_log` VALUES ('161', '表单设计', '1', 'com.ruoyi.web.controller.system.TCustFormController.addSave()', 'POST', '1', 'admin', '研发部门', '/custForm/form/add', '127.0.0.1', '内网IP', '{\"formKey\":[\"aaaaa\"],\"formName\":[\"aaaaaa\"],\"type\":[\"act_form_type_002\"],\"remark\":[\"aaaaa\"],\"status\":[\"0\"],\"content\":[\"\\n\\n    <div class=\\\"drag-box drag-item form-group\\\" data-type=\\\"drag_select\\\" style=\\\"display: flex;align-items: baseline;padding-left: 10px;\\\" id=\\\"1629824557000\\\">\\n            <label class=\\\"control-label\\\" style=\\\"width: 80px;text-align: right;\\\">组件名：</label>\\n            <div style=\\\"flex: 1;\\\">\\n                <select class=\\\"form-control real select2-hidden-accessible\\\" id=\\\"real1629824557000\\\" data-select2-id=\\\"real1629824557000\\\" tabindex=\\\"-1\\\" aria-hidden=\\\"true\\\">\\n                    <option value=\\\"\\\" data-select2-id=\\\"2\\\">--请选择--</option>\\n                    <option value=\\\"Java\\\">示例一</option>\\n                    <option value=\\\"PHP\\\">示例二</option>\\n                    <option value=\\\".NET\\\">示例三</option>\\n                </select><span class=\\\"select2 select2-container select2-container--bootstrap\\\" dir=\\\"ltr\\\" data-select2-id=\\\"1\\\" style=\\\"width: 100%;\\\"><span class=\\\"selection\\\"><span class=\\\"select2-selection select2-selection--single\\\" role=\\\"combobox\\\" aria-haspopup=\\\"true\\\" aria-expanded=\\\"false\\\" tabindex=\\\"0\\\" aria-labelledby=\\\"select2-real1629824557000-container\\\"><span class=\\\"select2-selection__rendered\\\" id=\\\"select2-real1629824557000-container\\\" role=\\\"textbox\\\" aria-readonly=\\\"true\\\" title=\\\"--请选择--\\\">--请选择--</span><span class=\\\"select2-selection__arrow\\\" role=\\\"presentation\\\"><b role=\\\"presentation\\\"></b></span></span></span><span class=\\\"dropdown-wrapper\\\" aria-hidden=\\\"true\\\"></span></span>\\n            </div>\\n        </div>\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-25 01:02:49');
INSERT INTO `sys_oper_log` VALUES ('162', '表单设计', '3', 'com.ruoyi.web.controller.system.TCustFormController.remove()', 'POST', '1', 'admin', '研发部门', '/custForm/form/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"10\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-25 01:19:07');
INSERT INTO `sys_oper_log` VALUES ('163', '表单设计', '3', 'com.ruoyi.web.controller.system.TCustFormController.remove()', 'POST', '1', 'admin', '研发部门', '/custForm/form/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"11\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-25 01:19:10');
INSERT INTO `sys_oper_log` VALUES ('164', '表单设计', '1', 'com.ruoyi.web.controller.system.TCustFormController.addSave()', 'POST', '1', 'admin', '研发部门', '/custForm/form/add', '127.0.0.1', '内网IP', '{\"formKey\":[\"aaaaa\"],\"formName\":[\"aaaaaa\"],\"type\":[\"act_form_type_002\"],\"remark\":[\"aaaaa\"],\"status\":[\"0\"],\"content\":[\"\\n\\n    <div class=\\\"drag-box drag-item form-group\\\" data-type=\\\"drag_select\\\" style=\\\"display: flex;align-items: baseline;padding-left: 10px;\\\" id=\\\"1629825735000\\\">\\n            <label class=\\\"control-label\\\" style=\\\"width: 80px;text-align: right;\\\">组件名：</label>\\n            <div style=\\\"flex: 1;\\\">\\n                <select class=\\\"form-control real select2-hidden-accessible\\\" id=\\\"real1629825735000\\\" data-select2-id=\\\"real1629825735000\\\" tabindex=\\\"-1\\\" aria-hidden=\\\"true\\\">\\n                    <option value=\\\"\\\" data-select2-id=\\\"2\\\">--请选择--</option>\\n                    <option value=\\\"Java\\\">示例一</option>\\n                    <option value=\\\"PHP\\\">示例二</option>\\n                    <option value=\\\".NET\\\">示例三</option>\\n                </select><span class=\\\"select2 select2-container select2-container--bootstrap\\\" dir=\\\"ltr\\\" data-select2-id=\\\"1\\\" style=\\\"width: 100%;\\\"><span class=\\\"selection\\\"><span class=\\\"select2-selection select2-selection--single\\\" role=\\\"combobox\\\" aria-haspopup=\\\"true\\\" aria-expanded=\\\"false\\\" tabindex=\\\"0\\\" aria-labelledby=\\\"select2-real1629825735000-container\\\"><span class=\\\"select2-selection__rendered\\\" id=\\\"select2-real1629825735000-container\\\" role=\\\"textbox\\\" aria-readonly=\\\"true\\\" title=\\\"--请选择--\\\">--请选择--</span><span class=\\\"select2-selection__arrow\\\" role=\\\"presentation\\\"><b role=\\\"presentation\\\"></b></span></span></span><span class=\\\"dropdown-wrapper\\\" aria-hidden=\\\"true\\\"></span></span>\\n            </div>\\n        </div>\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-25 01:22:30');
INSERT INTO `sys_oper_log` VALUES ('165', '表单设计', '1', 'com.ruoyi.web.controller.system.TCustFormController.addSave()', 'POST', '1', 'admin', '研发部门', '/custForm/form/add', '127.0.0.1', '内网IP', '{\"formKey\":[\"aaaaa\"],\"formName\":[\"aaaaaa\"],\"type\":[\"act_form_type_001\"],\"remark\":[\"aaaaa\"],\"status\":[\"0\"],\"content\":[\"\\n\\n    <div class=\\\"drag-box drag-item form-group\\\" data-type=\\\"drag_select\\\" style=\\\"display: flex;align-items: baseline;padding-left: 10px;\\\" id=\\\"1629825810000\\\">\\n            <label class=\\\"control-label\\\" style=\\\"width: 80px;text-align: right;\\\">组件名：</label>\\n            <div style=\\\"flex: 1;\\\">\\n                <select class=\\\"form-control real select2-hidden-accessible\\\" id=\\\"real1629825810000\\\" data-select2-id=\\\"real1629825810000\\\" tabindex=\\\"-1\\\" aria-hidden=\\\"true\\\">\\n                    <option value=\\\"\\\" data-select2-id=\\\"2\\\">--请选择--</option>\\n                    <option value=\\\"Java\\\">示例一</option>\\n                    <option value=\\\"PHP\\\">示例二</option>\\n                    <option value=\\\".NET\\\">示例三</option>\\n                </select><span class=\\\"select2 select2-container select2-container--bootstrap\\\" dir=\\\"ltr\\\" data-select2-id=\\\"1\\\" style=\\\"width: 100%;\\\"><span class=\\\"selection\\\"><span class=\\\"select2-selection select2-selection--single\\\" role=\\\"combobox\\\" aria-haspopup=\\\"true\\\" aria-expanded=\\\"false\\\" tabindex=\\\"0\\\" aria-labelledby=\\\"select2-real1629825810000-container\\\"><span class=\\\"select2-selection__rendered\\\" id=\\\"select2-real1629825810000-container\\\" role=\\\"textbox\\\" aria-readonly=\\\"true\\\" title=\\\"--请选择--\\\">--请选择--</span><span class=\\\"select2-selection__arrow\\\" role=\\\"presentation\\\"><b role=\\\"presentation\\\"></b></span></span></span><span class=\\\"dropdown-wrapper\\\" aria-hidden=\\\"true\\\"></span></span>\\n            </div>\\n        </div>\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-25 01:23:38');
INSERT INTO `sys_oper_log` VALUES ('166', '表单设计', '1', 'com.ruoyi.web.controller.system.TCustFormController.addSave()', 'POST', '1', 'admin', '研发部门', '/custForm/form/add', '127.0.0.1', '内网IP', '{\"formKey\":[\"aaaaa\"],\"formName\":[\"aaaaaa\"],\"type\":[\"act_form_type_002\"],\"remark\":[\"aaaaa\"],\"status\":[\"0\"],\"content\":[\"\\n\\n    <div class=\\\"drag-box drag-item form-group\\\" data-type=\\\"drag_select\\\" style=\\\"display: flex;align-items: baseline;padding-left: 10px;\\\" id=\\\"1629825968000\\\">\\n            <label class=\\\"control-label\\\" style=\\\"width: 80px;text-align: right;\\\">组件名：</label>\\n            <div style=\\\"flex: 1;\\\">\\n                <select class=\\\"form-control real select2-hidden-accessible\\\" id=\\\"real1629825968000\\\" data-select2-id=\\\"real1629825968000\\\" tabindex=\\\"-1\\\" aria-hidden=\\\"true\\\">\\n                    <option value=\\\"\\\" data-select2-id=\\\"2\\\">--请选择--</option>\\n                    <option value=\\\"Java\\\">示例一</option>\\n                    <option value=\\\"PHP\\\">示例二</option>\\n                    <option value=\\\".NET\\\">示例三</option>\\n                </select><span class=\\\"select2 select2-container select2-container--bootstrap\\\" dir=\\\"ltr\\\" data-select2-id=\\\"1\\\" style=\\\"width: 100%;\\\"><span class=\\\"selection\\\"><span class=\\\"select2-selection select2-selection--single\\\" role=\\\"combobox\\\" aria-haspopup=\\\"true\\\" aria-expanded=\\\"false\\\" tabindex=\\\"0\\\" aria-labelledby=\\\"select2-real1629825968000-container\\\"><span class=\\\"select2-selection__rendered\\\" id=\\\"select2-real1629825968000-container\\\" role=\\\"textbox\\\" aria-readonly=\\\"true\\\" title=\\\"--请选择--\\\">--请选择--</span><span class=\\\"select2-selection__arrow\\\" role=\\\"presentation\\\"><b role=\\\"presentation\\\"></b></span></span></span><span class=\\\"dropdown-wrapper\\\" aria-hidden=\\\"true\\\"></span></span>\\n            </div>\\n        </div>\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-25 01:26:15');
INSERT INTO `sys_oper_log` VALUES ('167', '表单设计', '1', 'com.ruoyi.web.controller.system.TCustFormController.addSave()', 'POST', '1', 'admin', '研发部门', '/custForm/form/add', '127.0.0.1', '内网IP', '{\"formKey\":[\"sss\"],\"formName\":[\"sss\"],\"type\":[\"act_form_type_002\"],\"remark\":[\"sss\"],\"status\":[\"0\"],\"content\":[\"\\n\\n    <div class=\\\"drag-box drag-item form-group\\\" data-type=\\\"drag_select\\\" style=\\\"display: flex;align-items: baseline;padding-left: 10px;\\\" id=\\\"1629825982000\\\">\\n            <label class=\\\"control-label\\\" style=\\\"width: 80px;text-align: right;\\\">组件名：</label>\\n            <div style=\\\"flex: 1;\\\">\\n                <select class=\\\"form-control real select2-hidden-accessible\\\" id=\\\"real1629825982000\\\" data-select2-id=\\\"real1629825982000\\\" tabindex=\\\"-1\\\" aria-hidden=\\\"true\\\">\\n                    <option value=\\\"\\\" data-select2-id=\\\"2\\\">--请选择--</option>\\n                    <option value=\\\"Java\\\">示例一</option>\\n                    <option value=\\\"PHP\\\">示例二</option>\\n                    <option value=\\\".NET\\\">示例三</option>\\n                </select><span class=\\\"select2 select2-container select2-container--bootstrap\\\" dir=\\\"ltr\\\" data-select2-id=\\\"1\\\" style=\\\"width: 100%;\\\"><span class=\\\"selection\\\"><span class=\\\"select2-selection select2-selection--single\\\" role=\\\"combobox\\\" aria-haspopup=\\\"true\\\" aria-expanded=\\\"false\\\" tabindex=\\\"0\\\" aria-labelledby=\\\"select2-real1629825982000-container\\\"><span class=\\\"select2-selection__rendered\\\" id=\\\"select2-real1629825982000-container\\\" role=\\\"textbox\\\" aria-readonly=\\\"true\\\" title=\\\"--请选择--\\\">--请选择--</span><span class=\\\"select2-selection__arrow\\\" role=\\\"presentation\\\"><b role=\\\"presentation\\\"></b></span></span></span><span class=\\\"dropdown-wrapper\\\" aria-hidden=\\\"true\\\"></span></span>\\n            </div>\\n        </div>\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-25 01:26:31');
INSERT INTO `sys_oper_log` VALUES ('168', '表单设计', '3', 'com.ruoyi.web.controller.system.TCustFormController.remove()', 'POST', '1', 'admin', '研发部门', '/custForm/form/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"12\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-25 15:34:33');
INSERT INTO `sys_oper_log` VALUES ('169', '表单设计', '3', 'com.ruoyi.web.controller.system.TCustFormController.remove()', 'POST', '1', 'admin', '研发部门', '/custForm/form/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"13,14,15\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-25 15:34:39');
INSERT INTO `sys_oper_log` VALUES ('170', '表单设计', '1', 'com.ruoyi.web.controller.system.TCustFormController.addSave()', 'POST', '1', 'admin', '研发部门', '/custForm/form/add', '127.0.0.1', '内网IP', '{\"formKey\":[\"leave\"],\"formName\":[\"请假流程表单\"],\"type\":[\"act_form_type_001\"],\"remark\":[\"\"],\"status\":[\"0\"],\"content\":[\"\\n\\n    <div class=\\\"drag-box drag-container drag-single-container-real\\\" style=\\\"display: flex;flex-direction: column;flex: 0 0 auto;\\\" id=\\\"1629876934000\\\"><div class=\\\"drag-box\\\" style=\\\"display: flex;flex: 0 0 auto;\\\" id=\\\"1629876935000\\\">\\n            <div class=\\\"drag-container\\\" style=\\\"display: flex;flex-direction: column;flex: 1;\\\">\\n\\n            <div class=\\\"drag-box drag-item form-group\\\" data-type=\\\"drag_input\\\" style=\\\"display: flex;align-items: baseline;padding-left: 10px;\\\" id=\\\"1629876938000\\\">\\n            <label class=\\\"control-label\\\" style=\\\"width: 80px;text-align: right;\\\">标题：</label>\\n            <div style=\\\"flex: 1;\\\">\\n                <input type=\\\"text\\\" placeholder=\\\"标题\\\" class=\\\"form-control real\\\" id=\\\"real1629876938000\\\" name=\\\"title\\\">\\n            </div>\\n        </div></div>\\n        </div><div class=\\\"drag-box\\\" style=\\\"display: flex;flex: 0 0 auto;\\\" id=\\\"1629876941000\\\">\\n            <div class=\\\"drag-container\\\" style=\\\"display: flex;flex-direction: column;flex: 1;\\\">\\n            <div class=\\\"drag-box drag-item form-group\\\" data-type=\\\"drag_select\\\" style=\\\"display: flex;align-items: baseline;padding-left: 10px;\\\" id=\\\"1629876943000\\\">\\n            <label class=\\\"control-label\\\" style=\\\"width: 80px;text-align: right;\\\">性别：</label>\\n            <div style=\\\"flex: 1;\\\">\\n                <select class=\\\"form-control real select2-hidden-accessible\\\" id=\\\"real1629876943000\\\" data-select2-id=\\\"real1629876943000\\\" tabindex=\\\"-1\\\" aria-hidden=\\\"true\\\" data-dict=\\\"sys_user_sex\\\" name=\\\"sex\\\"><option value=\\\"\\\" data-select2-id=\\\"18\\\">--请选择--</option><option value=\\\"0\\\" data-select2-id=\\\"19\\\">男</option><option value=\\\"1\\\" data-select2-id=\\\"20\\\">女</option><option value=\\\"2\\\" data-select2-id=\\\"21\\\">未知</option></select><span class=\\\"select2 select2-container select2-container--bootstrap\\\" dir=\\\"ltr\\\" data-select2-id=\\\"22\\\" style=\\', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-25 15:45:07');
INSERT INTO `sys_oper_log` VALUES ('171', '表单设计', '1', 'com.ruoyi.web.controller.system.TCustFormController.addSave()', 'POST', '1', 'admin', '研发部门', '/custForm/form/add', '127.0.0.1', '内网IP', '{\"formKey\":[\"333\"],\"formName\":[\"333\"],\"type\":[\"act_form_type_001\"],\"remark\":[\"33\"],\"status\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-26 20:18:27');
INSERT INTO `sys_oper_log` VALUES ('172', '流程模型', '3', 'com.ruoyi.act.controller.TProcessModelController.remove()', 'POST', '1', 'admin', '研发部门', '/act/definition/model/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-27 14:21:36');
INSERT INTO `sys_oper_log` VALUES ('173', '流程模型', '3', 'com.ruoyi.act.controller.TProcessModelController.remove()', 'POST', '1', 'admin', '研发部门', '/act/definition/model/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-27 14:21:40');
INSERT INTO `sys_oper_log` VALUES ('174', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"3\"],\"tableName\":[\"t_process_model\"],\"tableComment\":[\"流程模型表\"],\"className\":[\"TProcessModel\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"21\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"22\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"key\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"processKey\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"23\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"部门id\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"deptId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"24\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"模型名称\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"name\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"LIKE\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"25\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"表单id\"],\"columns[4].javaType\":[\"Long\"],\"columns[4].javaField\":[\"formId\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"26\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"创建人\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"createBy\"],\"columns[5].isInsert\":[\"1\"],', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-27 14:39:21');
INSERT INTO `sys_oper_log` VALUES ('175', '字典类型', '1', 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"流程模型部署状态\"],\"dictType\":[\"act_model_status\"],\"status\":[\"0\"],\"remark\":[\"流程模型部署状态\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-27 15:08:38');
INSERT INTO `sys_oper_log` VALUES ('176', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"未部署\"],\"dictValue\":[\"act_model_status_001\"],\"dictType\":[\"act_model_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"10\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-27 15:09:17');
INSERT INTO `sys_oper_log` VALUES ('177', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"已修改未重新部署\"],\"dictValue\":[\"act_model_status_002\"],\"dictType\":[\"act_model_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"20\"],\"listClass\":[\"warning\"],\"isDefault\":[\"N\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-27 15:10:34');
INSERT INTO `sys_oper_log` VALUES ('178', '字典数据', '2', 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"102\"],\"dictLabel\":[\"未部署\"],\"dictValue\":[\"act_model_status_001\"],\"dictType\":[\"act_model_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"10\"],\"listClass\":[\"default\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-27 15:10:43');
INSERT INTO `sys_oper_log` VALUES ('179', '字典数据', '2', 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"102\"],\"dictLabel\":[\"未部署\"],\"dictValue\":[\"act_model_status_001\"],\"dictType\":[\"act_model_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"10\"],\"listClass\":[\"info\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-27 15:10:55');
INSERT INTO `sys_oper_log` VALUES ('180', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"已部署\"],\"dictValue\":[\"act_model_status_003\"],\"dictType\":[\"act_model_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"30\"],\"listClass\":[\"success\"],\"isDefault\":[\"N\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-27 15:11:28');
INSERT INTO `sys_oper_log` VALUES ('181', '字典数据', '2', 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"104\"],\"dictLabel\":[\"已部署\"],\"dictValue\":[\"act_model_status_003\"],\"dictType\":[\"act_model_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"30\"],\"listClass\":[\"primary\"],\"isDefault\":[\"N\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-27 15:11:36');
INSERT INTO `sys_oper_log` VALUES ('182', '字典数据', '2', 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"102\"],\"dictLabel\":[\"未部署\"],\"dictValue\":[\"act_model_status_001\"],\"dictType\":[\"act_model_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"10\"],\"listClass\":[\"success\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-27 15:11:48');
INSERT INTO `sys_oper_log` VALUES ('183', '流程模型', '3', 'com.ruoyi.act.controller.TProcessModelController.remove()', 'POST', '1', 'admin', '研发部门', '/act/definition/model/remove', '127.0.0.1', '内网IP', '', null, '1', '', '2021-08-27 17:46:45');
INSERT INTO `sys_oper_log` VALUES ('184', '流程模型', '3', 'com.ruoyi.act.controller.TProcessModelController.remove()', 'POST', '1', 'admin', '研发部门', '/act/definition/model/remove', '127.0.0.1', '内网IP', '', null, '1', '', '2021-08-27 17:48:08');
INSERT INTO `sys_oper_log` VALUES ('185', '流程模型', '3', 'com.ruoyi.act.controller.TProcessModelController.remove()', 'POST', '1', 'admin', '研发部门', '/act/definition/model/remove', '127.0.0.1', '内网IP', '', null, '1', '', '2021-08-27 17:49:11');
INSERT INTO `sys_oper_log` VALUES ('186', '流程模型', '3', 'com.ruoyi.act.controller.TProcessModelController.remove()', 'POST', '1', 'admin', '研发部门', '/act/definition/model/remove', '127.0.0.1', '内网IP', '', null, '1', '', '2021-08-27 17:51:38');
INSERT INTO `sys_oper_log` VALUES ('187', '流程模型', '3', 'com.ruoyi.act.controller.TProcessModelController.remove()', 'POST', '1', 'admin', '研发部门', '/act/definition/model/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"3\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-27 17:53:41');
INSERT INTO `sys_oper_log` VALUES ('188', '流程模型', '3', 'com.ruoyi.act.controller.TProcessModelController.remove()', 'POST', '1', 'admin', '研发部门', '/act/definition/model/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"4\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-27 17:53:44');
INSERT INTO `sys_oper_log` VALUES ('189', '流程模型', '3', 'com.ruoyi.act.controller.TProcessModelController.remove()', 'POST', '1', 'admin', '研发部门', '/act/definition/model/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"5\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-27 17:53:47');
INSERT INTO `sys_oper_log` VALUES ('190', '流程模型', '3', 'com.ruoyi.act.controller.TProcessModelController.remove()', 'POST', '1', 'admin', '研发部门', '/act/definition/model/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"6\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-27 17:53:49');
INSERT INTO `sys_oper_log` VALUES ('191', '流程模型', '3', 'com.ruoyi.act.controller.TProcessModelController.remove()', 'POST', '1', 'admin', '研发部门', '/act/definition/model/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"7\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-27 17:53:52');
INSERT INTO `sys_oper_log` VALUES ('192', '流程模型', '3', 'com.ruoyi.act.controller.TProcessModelController.remove()', 'POST', '1', 'admin', '研发部门', '/act/definition/model/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"8\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-27 17:53:54');
INSERT INTO `sys_oper_log` VALUES ('193', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2007\"],\"parentId\":[\"2006\"],\"menuType\":[\"C\"],\"menuName\":[\"新建流程\"],\"url\":[\"/act/processDefinition/getDefinitions\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"10\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-28 09:54:44');
INSERT INTO `sys_oper_log` VALUES ('194', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2007\"],\"parentId\":[\"2006\"],\"menuType\":[\"C\"],\"menuName\":[\"新建流程\"],\"url\":[\"/act/processDefinition/getSysProcessList\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"10\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-29 10:41:51');
INSERT INTO `sys_oper_log` VALUES ('195', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2010\"],\"parentId\":[\"2008\"],\"menuType\":[\"C\"],\"menuName\":[\"表单设计\"],\"url\":[\"/custForm/form\"],\"target\":[\"menuItem\"],\"perms\":[\"custForm:form:view\"],\"orderNum\":[\"10\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-29 11:20:10');
INSERT INTO `sys_oper_log` VALUES ('196', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2016\"],\"parentId\":[\"2008\"],\"menuType\":[\"C\"],\"menuName\":[\"流程模型\"],\"url\":[\"/act/definition/model\"],\"target\":[\"menuItem\"],\"perms\":[\"act/definition:model:view\"],\"orderNum\":[\"20\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-29 11:20:23');
INSERT INTO `sys_oper_log` VALUES ('197', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2009\"],\"parentId\":[\"2008\"],\"menuType\":[\"C\"],\"menuName\":[\"画流程图\"],\"url\":[\"/bpmnjs/dist/index.html\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"999\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-29 11:20:31');
INSERT INTO `sys_oper_log` VALUES ('198', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2008\"],\"menuType\":[\"C\"],\"menuName\":[\"部署管理\"],\"url\":[\"/act/deployManager/definition\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"30\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-29 11:23:04');
INSERT INTO `sys_oper_log` VALUES ('199', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2022\"],\"parentId\":[\"2008\"],\"menuType\":[\"C\"],\"menuName\":[\"流程管理\"],\"url\":[\"/act/deployManager/definition\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"30\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-29 12:17:34');
INSERT INTO `sys_oper_log` VALUES ('200', '字典类型', '1', 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"流程激活状态\"],\"dictType\":[\"act_suspend_state\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-29 12:45:16');
INSERT INTO `sys_oper_log` VALUES ('201', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"激活\"],\"dictValue\":[\"1\"],\"dictType\":[\"act_suspend_state\"],\"cssClass\":[\"\"],\"dictSort\":[\"10\"],\"listClass\":[\"success\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-29 12:45:45');
INSERT INTO `sys_oper_log` VALUES ('202', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"挂起\"],\"dictValue\":[\"2\"],\"dictType\":[\"act_suspend_state\"],\"cssClass\":[\"\"],\"dictSort\":[\"20\"],\"listClass\":[\"warning\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-29 12:46:06');
INSERT INTO `sys_oper_log` VALUES ('203', '字典数据', '2', 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"105\"],\"dictLabel\":[\"激活\"],\"dictValue\":[\"1\"],\"dictType\":[\"act_suspend_state\"],\"cssClass\":[\"\"],\"dictSort\":[\"10\"],\"listClass\":[\"primary\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-29 12:46:12');
INSERT INTO `sys_oper_log` VALUES ('204', '流程模型', '3', 'com.ruoyi.act.controller.TProcessModelController.remove()', 'POST', '1', 'admin', '研发部门', '/act/definition/model/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"9\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-29 20:28:19');
INSERT INTO `sys_oper_log` VALUES ('205', '流程模型', '3', 'com.ruoyi.act.controller.TProcessModelController.remove()', 'POST', '1', 'admin', '研发部门', '/act/definition/model/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"10\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-29 20:28:23');
INSERT INTO `sys_oper_log` VALUES ('206', '流程模型', '3', 'com.ruoyi.act.controller.TProcessModelController.remove()', 'POST', '1', 'admin', '研发部门', '/act/definition/model/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"11\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-29 20:28:26');
INSERT INTO `sys_oper_log` VALUES ('207', '流程模型', '3', 'com.ruoyi.act.controller.TProcessModelController.remove()', 'POST', '1', 'admin', '研发部门', '/act/definition/model/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"12\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-29 20:28:30');
INSERT INTO `sys_oper_log` VALUES ('208', '流程模型', '3', 'com.ruoyi.act.controller.TProcessModelController.remove()', 'POST', '1', 'admin', '研发部门', '/act/definition/model/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"13\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-29 20:28:33');
INSERT INTO `sys_oper_log` VALUES ('209', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"信息不完整已部署\"],\"dictValue\":[\"act_model_status_004\"],\"dictType\":[\"act_model_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"40\"],\"listClass\":[\"danger\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-29 21:03:31');
INSERT INTO `sys_oper_log` VALUES ('210', '流程模型', '3', 'com.ruoyi.act.controller.TProcessModelController.remove()', 'POST', '1', 'admin', '研发部门', '/act/definition/model/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"17\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-29 21:06:06');
INSERT INTO `sys_oper_log` VALUES ('211', '流程模型', '3', 'com.ruoyi.act.controller.TProcessModelController.remove()', 'POST', '1', 'admin', '研发部门', '/act/definition/model/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"16\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-29 21:06:09');
INSERT INTO `sys_oper_log` VALUES ('212', '流程模型', '3', 'com.ruoyi.act.controller.TProcessModelController.remove()', 'POST', '1', 'admin', '研发部门', '/act/definition/model/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"15\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-29 21:06:15');
INSERT INTO `sys_oper_log` VALUES ('213', '用户管理', '5', 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', '1', 'admin', '研发部门', '/system/user/export', '127.0.0.1', '内网IP', '{\"deptId\":[\"\"],\"parentId\":[\"\"],\"loginName\":[\"\"],\"phonenumber\":[\"\"],\"status\":[\"\"],\"params[beginTime]\":[\"\"],\"params[endTime]\":[\"\"],\"orderByColumn\":[\"createTime\"],\"isAsc\":[\"desc\"]}', '{\r\n  \"msg\" : \"82dc95fb-1ea8-4136-aa12-b1d826697182_用户数据.xlsx\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-29 22:37:02');
INSERT INTO `sys_oper_log` VALUES ('214', '用户管理', '5', 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', '1', 'admin', '研发部门', '/system/user/export', '127.0.0.1', '内网IP', '{\"deptId\":[\"\"],\"parentId\":[\"\"],\"loginName\":[\"\"],\"phonenumber\":[\"\"],\"status\":[\"\"],\"params[beginTime]\":[\"\"],\"params[endTime]\":[\"\"],\"orderByColumn\":[\"createTime\"],\"isAsc\":[\"desc\"]}', '{\r\n  \"msg\" : \"2060e98b-2d43-4791-89d2-267b952e0422_用户数据.xlsx\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-29 23:25:08');
INSERT INTO `sys_oper_log` VALUES ('215', '流程模型', '3', 'com.ruoyi.act.controller.TProcessModelController.remove()', 'POST', '1', 'admin', '研发部门', '/act/definition/model/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"20\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-30 00:27:14');
INSERT INTO `sys_oper_log` VALUES ('216', '流程模型', '3', 'com.ruoyi.act.controller.TProcessModelController.remove()', 'POST', '1', 'admin', '研发部门', '/act/definition/model/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"19\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-30 00:27:18');
INSERT INTO `sys_oper_log` VALUES ('217', '流程模型', '3', 'com.ruoyi.act.controller.TProcessModelController.remove()', 'POST', '1', 'admin', '研发部门', '/act/definition/model/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"18\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-30 00:27:21');
INSERT INTO `sys_oper_log` VALUES ('218', '流程模型', '3', 'com.ruoyi.act.controller.TProcessModelController.remove()', 'POST', '1', 'admin', '研发部门', '/act/definition/model/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"14\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-30 00:27:23');
INSERT INTO `sys_oper_log` VALUES ('219', '流程模型', '3', 'com.ruoyi.act.controller.TProcessModelController.remove()', 'POST', '1', 'admin', '研发部门', '/act/definition/model/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"22\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-30 00:32:41');
INSERT INTO `sys_oper_log` VALUES ('220', '流程模型', '3', 'com.ruoyi.act.controller.TProcessModelController.remove()', 'POST', '1', 'admin', '研发部门', '/act/definition/model/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"23\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-30 13:01:18');
INSERT INTO `sys_oper_log` VALUES ('221', '表单设计', '1', 'com.ruoyi.web.controller.system.TCustFormController.addSave()', 'POST', '1', 'admin', '研发部门', '/custForm/form/add', '127.0.0.1', '内网IP', '{\"formKey\":[\"leave\"],\"formName\":[\"请假流程发起表单\"],\"type\":[\"act_form_type_001\"],\"remark\":[\"\"],\"status\":[\"0\"],\"content\":[\"\\n\\n    <div class=\\\"drag-box drag-container drag-container-border drag-single-container-real\\\" style=\\\"display: flex;flex-direction: column;flex: 0 0 auto;\\\" id=\\\"1630321018000\\\" data-select2-id=\\\"1630321018000\\\"><div class=\\\"drag-box\\\" style=\\\"display: flex;flex: 0 0 auto;\\\" id=\\\"1630321021000\\\">\\n            <div class=\\\"drag-container drag-container-border\\\" style=\\\"display: flex;flex-direction: column;flex: 1;\\\">\\n\\n            <div class=\\\"drag-box drag-item form-group\\\" data-type=\\\"drag_input\\\" style=\\\"display: flex;align-items: baseline;padding-left: 10px;\\\" id=\\\"1630321032000\\\">\\n            <label class=\\\"control-label\\\" style=\\\"width: 80px;text-align: right;\\\">姓名：</label>\\n            <div style=\\\"flex: 1;\\\">\\n                <input type=\\\"text\\\" placeholder=\\\"请输入姓名\\\" class=\\\"form-control real\\\" id=\\\"real1630321032000\\\" name=\\\"name\\\">\\n            </div>\\n        </div></div>\\n        </div><div class=\\\"drag-box\\\" style=\\\"display: flex;flex: 0 0 auto;\\\" id=\\\"1630321023000\\\">\\n            <div class=\\\"drag-container drag-container-border\\\" style=\\\"display: flex;flex-direction: column;flex: 1;\\\">\\n\\n            <div class=\\\"drag-box drag-item form-group\\\" data-type=\\\"drag_input\\\" style=\\\"display: flex;align-items: baseline;padding-left: 10px;\\\" id=\\\"1630321035000\\\">\\n            <label class=\\\"control-label\\\" style=\\\"width: 80px;text-align: right;\\\">事由：</label>\\n            <div style=\\\"flex: 1;\\\">\\n                <input type=\\\"text\\\" placeholder=\\\"请输入请假原因\\\" class=\\\"form-control real\\\" id=\\\"real1630321035000\\\" name=\\\"content\\\">\\n            </div>\\n        </div></div>\\n        </div><div class=\\\"drag-box\\\" style=\\\"display: flex;flex: 0 0 auto;\\\" id=\\\"1630321025000\\\">\\n            <div class=\\\"drag-container drag-container-border\\\" style=\\\"display: flex;flex-direction: column;flex: 1;\\\">\\n            <div class=\\\"drag-box drag-item form-group\\', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-30 19:00:36');
INSERT INTO `sys_oper_log` VALUES ('222', '角色管理', '1', 'com.ruoyi.web.controller.system.SysRoleController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/role/add', '127.0.0.1', '内网IP', '{\"roleName\":[\"部门领导\"],\"roleKey\":[\"sectionLead\"],\"roleSort\":[\"10\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,2000,2001,2002,2003,2004,2005,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,1046,2,109,1047,1048,1049,110,1050,1051,1052,1053,1054,1055,1056,111,112,113,3,114,115,1057,1058,1059,1060,1061,116,2006,2007,2008,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2009\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-31 14:26:25');
INSERT INTO `sys_oper_log` VALUES ('223', '角色管理', '1', 'com.ruoyi.web.controller.system.SysRoleController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/role/add', '127.0.0.1', '内网IP', '{\"roleName\":[\"董事长\"],\"roleKey\":[\"boss\"],\"roleSort\":[\"20\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,2000,2001,2002,2003,2004,2005,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,1046,2,109,1047,1048,1049,110,1050,1051,1052,1053,1054,1055,1056,111,112,113,3,114,115,1057,1058,1059,1060,1061,116,2006,2007,2008,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2009\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-31 14:27:02');
INSERT INTO `sys_oper_log` VALUES ('224', '角色管理', '1', 'com.ruoyi.web.controller.system.SysRoleController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/role/add', '127.0.0.1', '内网IP', '{\"roleName\":[\"人事\"],\"roleKey\":[\"personnel\"],\"roleSort\":[\"30\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,2000,2001,2002,2003,2004,2005,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,1046,2,109,1047,1048,1049,110,1050,1051,1052,1053,1054,1055,1056,111,112,113,3,114,115,1057,1058,1059,1060,1061,116,2006,2007,2008,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2009\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-31 14:27:51');
INSERT INTO `sys_oper_log` VALUES ('225', '用户管理', '1', 'com.ruoyi.web.controller.system.SysUserController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"103\"],\"userName\":[\"唐田震\"],\"deptName\":[\"研发部门\"],\"phonenumber\":[\"15806638897\"],\"email\":[\"\"],\"loginName\":[\"ttz\"],\"sex\":[\"0\"],\"role\":[\"2\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"4\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-31 14:35:42');
INSERT INTO `sys_oper_log` VALUES ('226', '用户管理', '1', 'com.ruoyi.web.controller.system.SysUserController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"103\"],\"userName\":[\"栗健\"],\"deptName\":[\"研发部门\"],\"phonenumber\":[\"15811111111\"],\"email\":[\"\"],\"loginName\":[\"lj\"],\"sex\":[\"0\"],\"role\":[\"100\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"100\"],\"postIds\":[\"2\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-31 14:37:09');
INSERT INTO `sys_oper_log` VALUES ('227', '用户管理', '1', 'com.ruoyi.web.controller.system.SysUserController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"101\"],\"userName\":[\"坏猫先生\"],\"deptName\":[\"济南总公司\"],\"phonenumber\":[\"15822222222\"],\"email\":[\"\"],\"loginName\":[\"hmxs\"],\"sex\":[\"0\"],\"role\":[\"101\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"101\"],\"postIds\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-31 14:37:52');
INSERT INTO `sys_oper_log` VALUES ('228', '重置密码', '2', 'com.ruoyi.web.controller.system.SysUserController.resetPwdSave()', 'POST', '1', 'admin', '研发部门', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"userId\":[\"101\"],\"loginName\":[\"lj\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-31 14:38:05');
INSERT INTO `sys_oper_log` VALUES ('229', '用户管理', '1', 'com.ruoyi.web.controller.system.SysUserController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"101\"],\"userName\":[\"郭闻\"],\"deptName\":[\"济南总公司\"],\"phonenumber\":[\"15833333333\"],\"email\":[\"\"],\"loginName\":[\"gw\"],\"sex\":[\"1\"],\"role\":[\"102\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"102\"],\"postIds\":[\"3\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-31 14:38:53');
INSERT INTO `sys_oper_log` VALUES ('230', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.authDataScopeSave()', 'POST', '1', 'admin', '研发部门', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"102\"],\"roleName\":[\"人事\"],\"roleKey\":[\"personnel\"],\"dataScope\":[\"4\"],\"deptIds\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-31 14:39:36');
INSERT INTO `sys_oper_log` VALUES ('231', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.authDataScopeSave()', 'POST', '1', 'admin', '研发部门', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"101\"],\"roleName\":[\"董事长\"],\"roleKey\":[\"boss\"],\"dataScope\":[\"4\"],\"deptIds\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-31 14:39:47');
INSERT INTO `sys_oper_log` VALUES ('232', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.authDataScopeSave()', 'POST', '1', 'admin', '研发部门', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"部门领导\"],\"roleKey\":[\"sectionLead\"],\"dataScope\":[\"4\"],\"deptIds\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-31 14:39:52');
INSERT INTO `sys_oper_log` VALUES ('233', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.authDataScopeSave()', 'POST', '1', 'admin', '研发部门', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"dataScope\":[\"4\"],\"deptIds\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-31 14:40:14');
INSERT INTO `sys_oper_log` VALUES ('234', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,2000,2001,2002,2003,2004,2005,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,1046,2,109,1047,1048,1049,110,1050,1051,1052,1053,1054,1055,1056,111,112,113,3,114,115,1057,1058,1059,1060,1061,116,4,2006,2007,2008,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2009\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-31 14:41:10');
INSERT INTO `sys_oper_log` VALUES ('235', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"部门领导\"],\"roleKey\":[\"sectionLead\"],\"roleSort\":[\"10\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,2000,2001,2002,2003,2004,2005,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,1046,2,109,1047,1048,1049,110,1050,1051,1052,1053,1054,1055,1056,111,112,113,3,114,115,1057,1058,1059,1060,1061,116,2006,2007,2008,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2009\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-31 14:41:23');
INSERT INTO `sys_oper_log` VALUES ('236', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"101\"],\"roleName\":[\"董事长\"],\"roleKey\":[\"boss\"],\"roleSort\":[\"20\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,2000,2001,2002,2003,2004,2005,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,1046,2,109,1047,1048,1049,110,1050,1051,1052,1053,1054,1055,1056,111,112,113,3,114,115,1057,1058,1059,1060,1061,116,2006,2007,2008,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2009\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-31 14:41:29');
INSERT INTO `sys_oper_log` VALUES ('237', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2006\"],\"menuType\":[\"C\"],\"menuName\":[\"我的待办\"],\"url\":[\"/act/processTask/myTask\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"20\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-31 15:38:58');
INSERT INTO `sys_oper_log` VALUES ('238', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,2000,2001,2002,2003,2004,2005,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,1046,2,109,1047,1048,1049,110,1050,1051,1052,1053,1054,1055,1056,111,112,113,3,114,115,1057,1058,1059,1060,1061,116,4,2006,2007,2023,2008,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2009\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-31 15:39:20');
INSERT INTO `sys_oper_log` VALUES ('239', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"部门领导\"],\"roleKey\":[\"sectionLead\"],\"roleSort\":[\"10\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,2000,2001,2002,2003,2004,2005,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,1046,2,109,1047,1048,1049,110,1050,1051,1052,1053,1054,1055,1056,111,112,113,3,114,115,1057,1058,1059,1060,1061,116,2006,2007,2023,2008,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2009\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-31 15:39:26');
INSERT INTO `sys_oper_log` VALUES ('240', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"101\"],\"roleName\":[\"董事长\"],\"roleKey\":[\"boss\"],\"roleSort\":[\"20\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,2000,2001,2002,2003,2004,2005,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,1046,2,109,1047,1048,1049,110,1050,1051,1052,1053,1054,1055,1056,111,112,113,3,114,115,1057,1058,1059,1060,1061,116,2006,2007,2023,2008,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2009\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-31 15:39:31');
INSERT INTO `sys_oper_log` VALUES ('241', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"102\"],\"roleName\":[\"人事\"],\"roleKey\":[\"personnel\"],\"roleSort\":[\"30\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,2000,2001,2002,2003,2004,2005,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,1046,2,109,1047,1048,1049,110,1050,1051,1052,1053,1054,1055,1056,111,112,113,3,114,115,1057,1058,1059,1060,1061,116,2006,2007,2023,2008,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2009\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-31 15:39:35');
INSERT INTO `sys_oper_log` VALUES ('242', '表单设计', '3', 'com.ruoyi.web.controller.system.TCustFormController.remove()', 'POST', '1', 'admin', '研发部门', '/custForm/form/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"17\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-31 17:52:52');
INSERT INTO `sys_oper_log` VALUES ('243', '表单设计', '3', 'com.ruoyi.web.controller.system.TCustFormController.remove()', 'POST', '1', 'admin', '研发部门', '/custForm/form/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"16\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-31 17:52:57');
INSERT INTO `sys_oper_log` VALUES ('244', '表单设计', '3', 'com.ruoyi.web.controller.system.TCustFormController.remove()', 'POST', '1', 'admin', '研发部门', '/custForm/form/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-31 17:52:59');
INSERT INTO `sys_oper_log` VALUES ('245', '表单设计', '1', 'com.ruoyi.web.controller.system.TCustFormController.addSave()', 'POST', '1', 'admin', '研发部门', '/custForm/form/add', '127.0.0.1', '内网IP', '{\"formKey\":[\"common\"],\"formName\":[\"审批节点公用表单\"],\"type\":[\"act_form_type_002\"],\"remark\":[\"审批节点公用表单\"],\"status\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-31 17:53:49');
INSERT INTO `sys_oper_log` VALUES ('246', '字典类型', '1', 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"通用审批选项\"],\"dictType\":[\"act_common_approve\"],\"status\":[\"0\"],\"remark\":[\"公共审批表单审批选项\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-31 22:11:52');
INSERT INTO `sys_oper_log` VALUES ('247', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"批准\"],\"dictValue\":[\"act_common_approve_001\"],\"dictType\":[\"act_common_approve\"],\"cssClass\":[\"\"],\"dictSort\":[\"10\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-31 22:14:27');
INSERT INTO `sys_oper_log` VALUES ('248', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"退回\"],\"dictValue\":[\"act_common_approve_002\"],\"dictType\":[\"act_common_approve\"],\"cssClass\":[\"\"],\"dictSort\":[\"20\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-31 22:22:17');
INSERT INTO `sys_oper_log` VALUES ('249', '表单设计', '2', 'com.ruoyi.web.controller.system.TCustFormController.editSave()', 'POST', '1', 'admin', '研发部门', '/custForm/form/edit', '127.0.0.1', '内网IP', '{\"id\":[\"19\"],\"formKey\":[\"task_common\"],\"formName\":[\"审批节点公用表单\"],\"type\":[\"act_form_type_002\"],\"remark\":[\"审批节点公用表单\"],\"status\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-31 22:40:16');
INSERT INTO `sys_oper_log` VALUES ('250', '表单设计', '2', 'com.ruoyi.web.controller.system.TCustFormController.editSave()', 'POST', '1', 'admin', '研发部门', '/custForm/form/edit', '127.0.0.1', '内网IP', '{\"id\":[\"19\"],\"formKey\":[\"approveTask_common\"],\"formName\":[\"审批节点公用表单\"],\"type\":[\"act_form_type_002\"],\"remark\":[\"审批节点公用表单\"],\"status\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-08-31 22:40:52');
INSERT INTO `sys_oper_log` VALUES ('251', '字典类型', '1', 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"流程是否完成\"],\"dictType\":[\"act_complete_type\"],\"status\":[\"0\"],\"remark\":[\"流程是否完成\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-09-01 00:49:59');
INSERT INTO `sys_oper_log` VALUES ('252', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"已完成\"],\"dictValue\":[\"act_complete_type_001\"],\"dictType\":[\"act_complete_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"10\"],\"listClass\":[\"primary\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-09-01 00:50:25');
INSERT INTO `sys_oper_log` VALUES ('253', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"未完成\"],\"dictValue\":[\"act_complete_type_002\"],\"dictType\":[\"act_complete_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"20\"],\"listClass\":[\"warning\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-09-01 00:50:51');
INSERT INTO `sys_oper_log` VALUES ('254', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2006\"],\"menuType\":[\"C\"],\"menuName\":[\"我的发起\"],\"url\":[\"/act/processInstance/myInstanceList\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"30\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-09-01 01:11:21');
INSERT INTO `sys_oper_log` VALUES ('255', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,2000,2001,2002,2003,2004,2005,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,1046,2,109,1047,1048,1049,110,1050,1051,1052,1053,1054,1055,1056,111,112,113,3,114,115,1057,1058,1059,1060,1061,116,4,2006,2007,2023,2024,2008,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2009\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-09-01 01:11:35');
INSERT INTO `sys_oper_log` VALUES ('256', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"部门领导\"],\"roleKey\":[\"sectionLead\"],\"roleSort\":[\"10\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,2000,2001,2002,2003,2004,2005,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,1046,2,109,1047,1048,1049,110,1050,1051,1052,1053,1054,1055,1056,111,112,113,3,114,115,1057,1058,1059,1060,1061,116,2006,2007,2023,2024,2008,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2009\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-09-01 01:11:39');
INSERT INTO `sys_oper_log` VALUES ('257', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"101\"],\"roleName\":[\"董事长\"],\"roleKey\":[\"boss\"],\"roleSort\":[\"20\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,2000,2001,2002,2003,2004,2005,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,1046,2,109,1047,1048,1049,110,1050,1051,1052,1053,1054,1055,1056,111,112,113,3,114,115,1057,1058,1059,1060,1061,116,2006,2007,2023,2024,2008,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2009\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-09-01 01:11:44');
INSERT INTO `sys_oper_log` VALUES ('258', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"102\"],\"roleName\":[\"人事\"],\"roleKey\":[\"personnel\"],\"roleSort\":[\"30\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,2000,2001,2002,2003,2004,2005,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,1046,2,109,1047,1048,1049,110,1050,1051,1052,1053,1054,1055,1056,111,112,113,3,114,115,1057,1058,1059,1060,1061,116,2006,2007,2023,2024,2008,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2009\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-09-01 01:11:48');
INSERT INTO `sys_oper_log` VALUES ('259', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', 'POST', '1', 'ttz', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-09-01 17:48:11');
INSERT INTO `sys_oper_log` VALUES ('260', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'ttz', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"t_process_file\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-09-01 23:37:00');
INSERT INTO `sys_oper_log` VALUES ('261', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'ttz', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"4\"],\"tableName\":[\"t_process_file\"],\"tableComment\":[\"流程附件表\"],\"className\":[\"TProcessFile\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"32\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"33\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"流程key\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"processKey\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"34\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"流程实例id\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"instanceId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"35\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"任务节点id\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"taskId\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"36\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"文件名\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"fileName\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"LIKE\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"37\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"真实文件名\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"realName\"],\"columns[5]', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-09-01 23:38:18');
INSERT INTO `sys_oper_log` VALUES ('262', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.download()', 'GET', '1', 'ttz', '研发部门', '/tool/gen/download/t_process_file', '127.0.0.1', '内网IP', '\"t_process_file\"', null, '0', null, '2021-09-01 23:38:32');
INSERT INTO `sys_oper_log` VALUES ('263', '流程模型', '3', 'com.ruoyi.act.controller.TProcessModelController.remove()', 'POST', '1', 'ttz', '研发部门', '/act/definition/model/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"24\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-09-03 10:40:49');
INSERT INTO `sys_oper_log` VALUES ('264', '表单设计', '1', 'com.ruoyi.web.controller.system.TCustFormController.addSave()', 'POST', '1', 'ttz', '研发部门', '/custForm/form/add', '127.0.0.1', '内网IP', '{\"formKey\":[\"\"],\"formName\":[\"\"],\"type\":[\"act_form_type_001\"],\"remark\":[\"\"],\"status\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-09-03 10:58:54');
INSERT INTO `sys_oper_log` VALUES ('265', '表单设计', '3', 'com.ruoyi.web.controller.system.TCustFormController.remove()', 'POST', '1', 'ttz', '研发部门', '/custForm/form/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"20\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-09-03 10:58:59');
INSERT INTO `sys_oper_log` VALUES ('266', '表单设计', '1', 'com.ruoyi.web.controller.system.TCustFormController.addSave()', 'POST', '1', 'ttz', '研发部门', '/custForm/form/add', '127.0.0.1', '内网IP', '{\"formKey\":[\"\"],\"formName\":[\"\"],\"type\":[\"act_form_type_001\"],\"remark\":[\"\"],\"status\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-09-03 10:59:24');
INSERT INTO `sys_oper_log` VALUES ('267', '表单设计', '3', 'com.ruoyi.web.controller.system.TCustFormController.remove()', 'POST', '1', 'ttz', '研发部门', '/custForm/form/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"21\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-09-03 11:00:45');
INSERT INTO `sys_oper_log` VALUES ('268', '表单设计', '1', 'com.ruoyi.web.controller.system.TCustFormController.addSave()', 'POST', '1', 'ttz', '研发部门', '/custForm/form/add', '127.0.0.1', '内网IP', '{\"formKey\":[\"\"],\"formName\":[\"\"],\"type\":[\"act_form_type_001\"],\"remark\":[\"\"],\"status\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-09-03 11:00:49');
INSERT INTO `sys_oper_log` VALUES ('269', '表单设计', '3', 'com.ruoyi.web.controller.system.TCustFormController.remove()', 'POST', '1', 'admin', '研发部门', '/custForm/form/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"22\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-09-03 11:18:06');
INSERT INTO `sys_oper_log` VALUES ('270', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2009\"],\"parentId\":[\"2008\"],\"menuType\":[\"C\"],\"menuName\":[\"画流程图\"],\"url\":[\"/bpmnjs/dist/index.html\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"999\"],\"icon\":[\"#\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-09-04 06:57:18');
INSERT INTO `sys_oper_log` VALUES ('271', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2007\"],\"parentId\":[\"2006\"],\"menuType\":[\"C\"],\"menuName\":[\"发起流程\"],\"url\":[\"/act/processDefinition/getSysProcessList\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"10\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-09-04 07:00:26');
INSERT INTO `sys_oper_log` VALUES ('272', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2008\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"流程管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"50\"],\"icon\":[\"fa fa-object-ungroup\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-09-04 07:00:56');
INSERT INTO `sys_oper_log` VALUES ('273', '表单设计', '1', 'com.ruoyi.web.controller.system.TCustFormController.addSave()', 'POST', '1', 'admin', '研发部门', '/custForm/form/add', '127.0.0.1', '内网IP', '{\"formKey\":[\"1111\"],\"formName\":[\"1111\"],\"type\":[\"act_form_type_001\"],\"remark\":[\"\"],\"status\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-09-04 07:16:44');
INSERT INTO `sys_oper_log` VALUES ('274', '流程模型', '3', 'com.ruoyi.act.controller.TProcessModelController.remove()', 'POST', '1', 'admin', '研发部门', '/act/definition/model/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"26\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-09-04 07:55:39');
INSERT INTO `sys_oper_log` VALUES ('275', '流程模型', '3', 'com.ruoyi.act.controller.TProcessModelController.remove()', 'POST', '1', 'admin', '研发部门', '/act/definition/model/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"25\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-09-04 08:43:28');
INSERT INTO `sys_oper_log` VALUES ('276', '流程模型', '3', 'com.ruoyi.act.controller.TProcessModelController.remove()', 'POST', '1', 'admin', '研发部门', '/act/definition/model/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"27\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-09-04 14:53:46');
INSERT INTO `sys_oper_log` VALUES ('277', '表单设计', '2', 'com.ruoyi.web.controller.system.TCustFormController.editSave()', 'POST', '1', 'admin', '研发部门', '/custForm/form/edit', '127.0.0.1', '内网IP', '{\"id\":[\"23\"],\"formKey\":[\"payoff\"],\"formName\":[\"工资确认表单\"],\"type\":[\"act_form_type_002\"],\"remark\":[\"\"],\"status\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-09-04 17:16:10');
INSERT INTO `sys_oper_log` VALUES ('278', '流程模型', '3', 'com.ruoyi.act.controller.TProcessModelController.remove()', 'POST', '1', 'ttz', '研发部门', '/act/definition/model/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"37\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-09-05 10:37:45');
INSERT INTO `sys_oper_log` VALUES ('279', '流程模型', '3', 'com.ruoyi.act.controller.TProcessModelController.remove()', 'POST', '1', 'admin', '研发部门', '/act/definition/model/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"44\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-09-10 18:58:29');
INSERT INTO `sys_oper_log` VALUES ('280', '流程模型', '3', 'com.ruoyi.act.controller.TProcessModelController.remove()', 'POST', '1', 'admin', '研发部门', '/act/definition/model/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"45\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-09-10 19:00:01');
INSERT INTO `sys_oper_log` VALUES ('281', '流程模型', '3', 'com.ruoyi.act.controller.TProcessModelController.remove()', 'POST', '1', 'admin', '研发部门', '/act/definition/model/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"46\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-09-10 19:26:24');
INSERT INTO `sys_oper_log` VALUES ('282', '流程模型', '3', 'com.ruoyi.act.controller.TProcessModelController.remove()', 'POST', '1', 'admin', '研发部门', '/act/definition/model/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"47\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-09-10 19:26:46');
INSERT INTO `sys_oper_log` VALUES ('283', '流程模型', '3', 'com.ruoyi.act.controller.TProcessModelController.remove()', 'POST', '1', 'admin', '研发部门', '/act/definition/model/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"48\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-09-10 19:28:24');
INSERT INTO `sys_oper_log` VALUES ('284', '流程模型', '3', 'com.ruoyi.act.controller.TProcessModelController.remove()', 'POST', '1', 'admin', '研发部门', '/act/definition/model/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"43\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-09-10 23:35:36');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES ('1', 'ceo', '董事长', '1', '0', 'admin', '2021-08-22 13:00:03', '', null, '');
INSERT INTO `sys_post` VALUES ('2', 'se', '项目经理', '2', '0', 'admin', '2021-08-22 13:00:03', '', null, '');
INSERT INTO `sys_post` VALUES ('3', 'hr', '人力资源', '3', '0', 'admin', '2021-08-22 13:00:03', '', null, '');
INSERT INTO `sys_post` VALUES ('4', 'user', '普通员工', '4', '0', 'admin', '2021-08-22 13:00:03', '', null, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', 'admin', '1', '1', '0', '0', 'admin', '2021-08-22 13:00:03', '', null, '超级管理员');
INSERT INTO `sys_role` VALUES ('2', '普通角色', 'common', '2', '4', '0', '0', 'admin', '2021-08-22 13:00:03', 'admin', '2021-09-01 01:11:34', '普通角色');
INSERT INTO `sys_role` VALUES ('100', '部门领导', 'sectionLead', '10', '4', '0', '0', 'admin', '2021-08-31 14:26:24', 'admin', '2021-09-01 01:11:39', '');
INSERT INTO `sys_role` VALUES ('101', '董事长', 'boss', '20', '4', '0', '0', 'admin', '2021-08-31 14:27:01', 'admin', '2021-09-01 01:11:43', '');
INSERT INTO `sys_role` VALUES ('102', '人事', 'personnel', '30', '4', '0', '0', 'admin', '2021-08-31 14:27:51', 'admin', '2021-09-01 01:11:47', '');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('2', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '2');
INSERT INTO `sys_role_menu` VALUES ('2', '3');
INSERT INTO `sys_role_menu` VALUES ('2', '4');
INSERT INTO `sys_role_menu` VALUES ('2', '100');
INSERT INTO `sys_role_menu` VALUES ('2', '101');
INSERT INTO `sys_role_menu` VALUES ('2', '102');
INSERT INTO `sys_role_menu` VALUES ('2', '103');
INSERT INTO `sys_role_menu` VALUES ('2', '104');
INSERT INTO `sys_role_menu` VALUES ('2', '105');
INSERT INTO `sys_role_menu` VALUES ('2', '106');
INSERT INTO `sys_role_menu` VALUES ('2', '107');
INSERT INTO `sys_role_menu` VALUES ('2', '108');
INSERT INTO `sys_role_menu` VALUES ('2', '109');
INSERT INTO `sys_role_menu` VALUES ('2', '110');
INSERT INTO `sys_role_menu` VALUES ('2', '111');
INSERT INTO `sys_role_menu` VALUES ('2', '112');
INSERT INTO `sys_role_menu` VALUES ('2', '113');
INSERT INTO `sys_role_menu` VALUES ('2', '114');
INSERT INTO `sys_role_menu` VALUES ('2', '115');
INSERT INTO `sys_role_menu` VALUES ('2', '116');
INSERT INTO `sys_role_menu` VALUES ('2', '500');
INSERT INTO `sys_role_menu` VALUES ('2', '501');
INSERT INTO `sys_role_menu` VALUES ('2', '1000');
INSERT INTO `sys_role_menu` VALUES ('2', '1001');
INSERT INTO `sys_role_menu` VALUES ('2', '1002');
INSERT INTO `sys_role_menu` VALUES ('2', '1003');
INSERT INTO `sys_role_menu` VALUES ('2', '1004');
INSERT INTO `sys_role_menu` VALUES ('2', '1005');
INSERT INTO `sys_role_menu` VALUES ('2', '1006');
INSERT INTO `sys_role_menu` VALUES ('2', '1007');
INSERT INTO `sys_role_menu` VALUES ('2', '1008');
INSERT INTO `sys_role_menu` VALUES ('2', '1009');
INSERT INTO `sys_role_menu` VALUES ('2', '1010');
INSERT INTO `sys_role_menu` VALUES ('2', '1011');
INSERT INTO `sys_role_menu` VALUES ('2', '1012');
INSERT INTO `sys_role_menu` VALUES ('2', '1013');
INSERT INTO `sys_role_menu` VALUES ('2', '1014');
INSERT INTO `sys_role_menu` VALUES ('2', '1015');
INSERT INTO `sys_role_menu` VALUES ('2', '1016');
INSERT INTO `sys_role_menu` VALUES ('2', '1017');
INSERT INTO `sys_role_menu` VALUES ('2', '1018');
INSERT INTO `sys_role_menu` VALUES ('2', '1019');
INSERT INTO `sys_role_menu` VALUES ('2', '1020');
INSERT INTO `sys_role_menu` VALUES ('2', '1021');
INSERT INTO `sys_role_menu` VALUES ('2', '1022');
INSERT INTO `sys_role_menu` VALUES ('2', '1023');
INSERT INTO `sys_role_menu` VALUES ('2', '1024');
INSERT INTO `sys_role_menu` VALUES ('2', '1025');
INSERT INTO `sys_role_menu` VALUES ('2', '1026');
INSERT INTO `sys_role_menu` VALUES ('2', '1027');
INSERT INTO `sys_role_menu` VALUES ('2', '1028');
INSERT INTO `sys_role_menu` VALUES ('2', '1029');
INSERT INTO `sys_role_menu` VALUES ('2', '1030');
INSERT INTO `sys_role_menu` VALUES ('2', '1031');
INSERT INTO `sys_role_menu` VALUES ('2', '1032');
INSERT INTO `sys_role_menu` VALUES ('2', '1033');
INSERT INTO `sys_role_menu` VALUES ('2', '1034');
INSERT INTO `sys_role_menu` VALUES ('2', '1035');
INSERT INTO `sys_role_menu` VALUES ('2', '1036');
INSERT INTO `sys_role_menu` VALUES ('2', '1037');
INSERT INTO `sys_role_menu` VALUES ('2', '1038');
INSERT INTO `sys_role_menu` VALUES ('2', '1039');
INSERT INTO `sys_role_menu` VALUES ('2', '1040');
INSERT INTO `sys_role_menu` VALUES ('2', '1041');
INSERT INTO `sys_role_menu` VALUES ('2', '1042');
INSERT INTO `sys_role_menu` VALUES ('2', '1043');
INSERT INTO `sys_role_menu` VALUES ('2', '1044');
INSERT INTO `sys_role_menu` VALUES ('2', '1045');
INSERT INTO `sys_role_menu` VALUES ('2', '1046');
INSERT INTO `sys_role_menu` VALUES ('2', '1047');
INSERT INTO `sys_role_menu` VALUES ('2', '1048');
INSERT INTO `sys_role_menu` VALUES ('2', '1049');
INSERT INTO `sys_role_menu` VALUES ('2', '1050');
INSERT INTO `sys_role_menu` VALUES ('2', '1051');
INSERT INTO `sys_role_menu` VALUES ('2', '1052');
INSERT INTO `sys_role_menu` VALUES ('2', '1053');
INSERT INTO `sys_role_menu` VALUES ('2', '1054');
INSERT INTO `sys_role_menu` VALUES ('2', '1055');
INSERT INTO `sys_role_menu` VALUES ('2', '1056');
INSERT INTO `sys_role_menu` VALUES ('2', '1057');
INSERT INTO `sys_role_menu` VALUES ('2', '1058');
INSERT INTO `sys_role_menu` VALUES ('2', '1059');
INSERT INTO `sys_role_menu` VALUES ('2', '1060');
INSERT INTO `sys_role_menu` VALUES ('2', '1061');
INSERT INTO `sys_role_menu` VALUES ('2', '2000');
INSERT INTO `sys_role_menu` VALUES ('2', '2001');
INSERT INTO `sys_role_menu` VALUES ('2', '2002');
INSERT INTO `sys_role_menu` VALUES ('2', '2003');
INSERT INTO `sys_role_menu` VALUES ('2', '2004');
INSERT INTO `sys_role_menu` VALUES ('2', '2005');
INSERT INTO `sys_role_menu` VALUES ('2', '2006');
INSERT INTO `sys_role_menu` VALUES ('2', '2007');
INSERT INTO `sys_role_menu` VALUES ('2', '2008');
INSERT INTO `sys_role_menu` VALUES ('2', '2009');
INSERT INTO `sys_role_menu` VALUES ('2', '2010');
INSERT INTO `sys_role_menu` VALUES ('2', '2011');
INSERT INTO `sys_role_menu` VALUES ('2', '2012');
INSERT INTO `sys_role_menu` VALUES ('2', '2013');
INSERT INTO `sys_role_menu` VALUES ('2', '2014');
INSERT INTO `sys_role_menu` VALUES ('2', '2015');
INSERT INTO `sys_role_menu` VALUES ('2', '2016');
INSERT INTO `sys_role_menu` VALUES ('2', '2017');
INSERT INTO `sys_role_menu` VALUES ('2', '2018');
INSERT INTO `sys_role_menu` VALUES ('2', '2019');
INSERT INTO `sys_role_menu` VALUES ('2', '2020');
INSERT INTO `sys_role_menu` VALUES ('2', '2021');
INSERT INTO `sys_role_menu` VALUES ('2', '2022');
INSERT INTO `sys_role_menu` VALUES ('2', '2023');
INSERT INTO `sys_role_menu` VALUES ('2', '2024');
INSERT INTO `sys_role_menu` VALUES ('100', '1');
INSERT INTO `sys_role_menu` VALUES ('100', '2');
INSERT INTO `sys_role_menu` VALUES ('100', '3');
INSERT INTO `sys_role_menu` VALUES ('100', '100');
INSERT INTO `sys_role_menu` VALUES ('100', '101');
INSERT INTO `sys_role_menu` VALUES ('100', '102');
INSERT INTO `sys_role_menu` VALUES ('100', '103');
INSERT INTO `sys_role_menu` VALUES ('100', '104');
INSERT INTO `sys_role_menu` VALUES ('100', '105');
INSERT INTO `sys_role_menu` VALUES ('100', '106');
INSERT INTO `sys_role_menu` VALUES ('100', '107');
INSERT INTO `sys_role_menu` VALUES ('100', '108');
INSERT INTO `sys_role_menu` VALUES ('100', '109');
INSERT INTO `sys_role_menu` VALUES ('100', '110');
INSERT INTO `sys_role_menu` VALUES ('100', '111');
INSERT INTO `sys_role_menu` VALUES ('100', '112');
INSERT INTO `sys_role_menu` VALUES ('100', '113');
INSERT INTO `sys_role_menu` VALUES ('100', '114');
INSERT INTO `sys_role_menu` VALUES ('100', '115');
INSERT INTO `sys_role_menu` VALUES ('100', '116');
INSERT INTO `sys_role_menu` VALUES ('100', '500');
INSERT INTO `sys_role_menu` VALUES ('100', '501');
INSERT INTO `sys_role_menu` VALUES ('100', '1000');
INSERT INTO `sys_role_menu` VALUES ('100', '1001');
INSERT INTO `sys_role_menu` VALUES ('100', '1002');
INSERT INTO `sys_role_menu` VALUES ('100', '1003');
INSERT INTO `sys_role_menu` VALUES ('100', '1004');
INSERT INTO `sys_role_menu` VALUES ('100', '1005');
INSERT INTO `sys_role_menu` VALUES ('100', '1006');
INSERT INTO `sys_role_menu` VALUES ('100', '1007');
INSERT INTO `sys_role_menu` VALUES ('100', '1008');
INSERT INTO `sys_role_menu` VALUES ('100', '1009');
INSERT INTO `sys_role_menu` VALUES ('100', '1010');
INSERT INTO `sys_role_menu` VALUES ('100', '1011');
INSERT INTO `sys_role_menu` VALUES ('100', '1012');
INSERT INTO `sys_role_menu` VALUES ('100', '1013');
INSERT INTO `sys_role_menu` VALUES ('100', '1014');
INSERT INTO `sys_role_menu` VALUES ('100', '1015');
INSERT INTO `sys_role_menu` VALUES ('100', '1016');
INSERT INTO `sys_role_menu` VALUES ('100', '1017');
INSERT INTO `sys_role_menu` VALUES ('100', '1018');
INSERT INTO `sys_role_menu` VALUES ('100', '1019');
INSERT INTO `sys_role_menu` VALUES ('100', '1020');
INSERT INTO `sys_role_menu` VALUES ('100', '1021');
INSERT INTO `sys_role_menu` VALUES ('100', '1022');
INSERT INTO `sys_role_menu` VALUES ('100', '1023');
INSERT INTO `sys_role_menu` VALUES ('100', '1024');
INSERT INTO `sys_role_menu` VALUES ('100', '1025');
INSERT INTO `sys_role_menu` VALUES ('100', '1026');
INSERT INTO `sys_role_menu` VALUES ('100', '1027');
INSERT INTO `sys_role_menu` VALUES ('100', '1028');
INSERT INTO `sys_role_menu` VALUES ('100', '1029');
INSERT INTO `sys_role_menu` VALUES ('100', '1030');
INSERT INTO `sys_role_menu` VALUES ('100', '1031');
INSERT INTO `sys_role_menu` VALUES ('100', '1032');
INSERT INTO `sys_role_menu` VALUES ('100', '1033');
INSERT INTO `sys_role_menu` VALUES ('100', '1034');
INSERT INTO `sys_role_menu` VALUES ('100', '1035');
INSERT INTO `sys_role_menu` VALUES ('100', '1036');
INSERT INTO `sys_role_menu` VALUES ('100', '1037');
INSERT INTO `sys_role_menu` VALUES ('100', '1038');
INSERT INTO `sys_role_menu` VALUES ('100', '1039');
INSERT INTO `sys_role_menu` VALUES ('100', '1040');
INSERT INTO `sys_role_menu` VALUES ('100', '1041');
INSERT INTO `sys_role_menu` VALUES ('100', '1042');
INSERT INTO `sys_role_menu` VALUES ('100', '1043');
INSERT INTO `sys_role_menu` VALUES ('100', '1044');
INSERT INTO `sys_role_menu` VALUES ('100', '1045');
INSERT INTO `sys_role_menu` VALUES ('100', '1046');
INSERT INTO `sys_role_menu` VALUES ('100', '1047');
INSERT INTO `sys_role_menu` VALUES ('100', '1048');
INSERT INTO `sys_role_menu` VALUES ('100', '1049');
INSERT INTO `sys_role_menu` VALUES ('100', '1050');
INSERT INTO `sys_role_menu` VALUES ('100', '1051');
INSERT INTO `sys_role_menu` VALUES ('100', '1052');
INSERT INTO `sys_role_menu` VALUES ('100', '1053');
INSERT INTO `sys_role_menu` VALUES ('100', '1054');
INSERT INTO `sys_role_menu` VALUES ('100', '1055');
INSERT INTO `sys_role_menu` VALUES ('100', '1056');
INSERT INTO `sys_role_menu` VALUES ('100', '1057');
INSERT INTO `sys_role_menu` VALUES ('100', '1058');
INSERT INTO `sys_role_menu` VALUES ('100', '1059');
INSERT INTO `sys_role_menu` VALUES ('100', '1060');
INSERT INTO `sys_role_menu` VALUES ('100', '1061');
INSERT INTO `sys_role_menu` VALUES ('100', '2000');
INSERT INTO `sys_role_menu` VALUES ('100', '2001');
INSERT INTO `sys_role_menu` VALUES ('100', '2002');
INSERT INTO `sys_role_menu` VALUES ('100', '2003');
INSERT INTO `sys_role_menu` VALUES ('100', '2004');
INSERT INTO `sys_role_menu` VALUES ('100', '2005');
INSERT INTO `sys_role_menu` VALUES ('100', '2006');
INSERT INTO `sys_role_menu` VALUES ('100', '2007');
INSERT INTO `sys_role_menu` VALUES ('100', '2008');
INSERT INTO `sys_role_menu` VALUES ('100', '2009');
INSERT INTO `sys_role_menu` VALUES ('100', '2010');
INSERT INTO `sys_role_menu` VALUES ('100', '2011');
INSERT INTO `sys_role_menu` VALUES ('100', '2012');
INSERT INTO `sys_role_menu` VALUES ('100', '2013');
INSERT INTO `sys_role_menu` VALUES ('100', '2014');
INSERT INTO `sys_role_menu` VALUES ('100', '2015');
INSERT INTO `sys_role_menu` VALUES ('100', '2016');
INSERT INTO `sys_role_menu` VALUES ('100', '2017');
INSERT INTO `sys_role_menu` VALUES ('100', '2018');
INSERT INTO `sys_role_menu` VALUES ('100', '2019');
INSERT INTO `sys_role_menu` VALUES ('100', '2020');
INSERT INTO `sys_role_menu` VALUES ('100', '2021');
INSERT INTO `sys_role_menu` VALUES ('100', '2022');
INSERT INTO `sys_role_menu` VALUES ('100', '2023');
INSERT INTO `sys_role_menu` VALUES ('100', '2024');
INSERT INTO `sys_role_menu` VALUES ('101', '1');
INSERT INTO `sys_role_menu` VALUES ('101', '2');
INSERT INTO `sys_role_menu` VALUES ('101', '3');
INSERT INTO `sys_role_menu` VALUES ('101', '100');
INSERT INTO `sys_role_menu` VALUES ('101', '101');
INSERT INTO `sys_role_menu` VALUES ('101', '102');
INSERT INTO `sys_role_menu` VALUES ('101', '103');
INSERT INTO `sys_role_menu` VALUES ('101', '104');
INSERT INTO `sys_role_menu` VALUES ('101', '105');
INSERT INTO `sys_role_menu` VALUES ('101', '106');
INSERT INTO `sys_role_menu` VALUES ('101', '107');
INSERT INTO `sys_role_menu` VALUES ('101', '108');
INSERT INTO `sys_role_menu` VALUES ('101', '109');
INSERT INTO `sys_role_menu` VALUES ('101', '110');
INSERT INTO `sys_role_menu` VALUES ('101', '111');
INSERT INTO `sys_role_menu` VALUES ('101', '112');
INSERT INTO `sys_role_menu` VALUES ('101', '113');
INSERT INTO `sys_role_menu` VALUES ('101', '114');
INSERT INTO `sys_role_menu` VALUES ('101', '115');
INSERT INTO `sys_role_menu` VALUES ('101', '116');
INSERT INTO `sys_role_menu` VALUES ('101', '500');
INSERT INTO `sys_role_menu` VALUES ('101', '501');
INSERT INTO `sys_role_menu` VALUES ('101', '1000');
INSERT INTO `sys_role_menu` VALUES ('101', '1001');
INSERT INTO `sys_role_menu` VALUES ('101', '1002');
INSERT INTO `sys_role_menu` VALUES ('101', '1003');
INSERT INTO `sys_role_menu` VALUES ('101', '1004');
INSERT INTO `sys_role_menu` VALUES ('101', '1005');
INSERT INTO `sys_role_menu` VALUES ('101', '1006');
INSERT INTO `sys_role_menu` VALUES ('101', '1007');
INSERT INTO `sys_role_menu` VALUES ('101', '1008');
INSERT INTO `sys_role_menu` VALUES ('101', '1009');
INSERT INTO `sys_role_menu` VALUES ('101', '1010');
INSERT INTO `sys_role_menu` VALUES ('101', '1011');
INSERT INTO `sys_role_menu` VALUES ('101', '1012');
INSERT INTO `sys_role_menu` VALUES ('101', '1013');
INSERT INTO `sys_role_menu` VALUES ('101', '1014');
INSERT INTO `sys_role_menu` VALUES ('101', '1015');
INSERT INTO `sys_role_menu` VALUES ('101', '1016');
INSERT INTO `sys_role_menu` VALUES ('101', '1017');
INSERT INTO `sys_role_menu` VALUES ('101', '1018');
INSERT INTO `sys_role_menu` VALUES ('101', '1019');
INSERT INTO `sys_role_menu` VALUES ('101', '1020');
INSERT INTO `sys_role_menu` VALUES ('101', '1021');
INSERT INTO `sys_role_menu` VALUES ('101', '1022');
INSERT INTO `sys_role_menu` VALUES ('101', '1023');
INSERT INTO `sys_role_menu` VALUES ('101', '1024');
INSERT INTO `sys_role_menu` VALUES ('101', '1025');
INSERT INTO `sys_role_menu` VALUES ('101', '1026');
INSERT INTO `sys_role_menu` VALUES ('101', '1027');
INSERT INTO `sys_role_menu` VALUES ('101', '1028');
INSERT INTO `sys_role_menu` VALUES ('101', '1029');
INSERT INTO `sys_role_menu` VALUES ('101', '1030');
INSERT INTO `sys_role_menu` VALUES ('101', '1031');
INSERT INTO `sys_role_menu` VALUES ('101', '1032');
INSERT INTO `sys_role_menu` VALUES ('101', '1033');
INSERT INTO `sys_role_menu` VALUES ('101', '1034');
INSERT INTO `sys_role_menu` VALUES ('101', '1035');
INSERT INTO `sys_role_menu` VALUES ('101', '1036');
INSERT INTO `sys_role_menu` VALUES ('101', '1037');
INSERT INTO `sys_role_menu` VALUES ('101', '1038');
INSERT INTO `sys_role_menu` VALUES ('101', '1039');
INSERT INTO `sys_role_menu` VALUES ('101', '1040');
INSERT INTO `sys_role_menu` VALUES ('101', '1041');
INSERT INTO `sys_role_menu` VALUES ('101', '1042');
INSERT INTO `sys_role_menu` VALUES ('101', '1043');
INSERT INTO `sys_role_menu` VALUES ('101', '1044');
INSERT INTO `sys_role_menu` VALUES ('101', '1045');
INSERT INTO `sys_role_menu` VALUES ('101', '1046');
INSERT INTO `sys_role_menu` VALUES ('101', '1047');
INSERT INTO `sys_role_menu` VALUES ('101', '1048');
INSERT INTO `sys_role_menu` VALUES ('101', '1049');
INSERT INTO `sys_role_menu` VALUES ('101', '1050');
INSERT INTO `sys_role_menu` VALUES ('101', '1051');
INSERT INTO `sys_role_menu` VALUES ('101', '1052');
INSERT INTO `sys_role_menu` VALUES ('101', '1053');
INSERT INTO `sys_role_menu` VALUES ('101', '1054');
INSERT INTO `sys_role_menu` VALUES ('101', '1055');
INSERT INTO `sys_role_menu` VALUES ('101', '1056');
INSERT INTO `sys_role_menu` VALUES ('101', '1057');
INSERT INTO `sys_role_menu` VALUES ('101', '1058');
INSERT INTO `sys_role_menu` VALUES ('101', '1059');
INSERT INTO `sys_role_menu` VALUES ('101', '1060');
INSERT INTO `sys_role_menu` VALUES ('101', '1061');
INSERT INTO `sys_role_menu` VALUES ('101', '2000');
INSERT INTO `sys_role_menu` VALUES ('101', '2001');
INSERT INTO `sys_role_menu` VALUES ('101', '2002');
INSERT INTO `sys_role_menu` VALUES ('101', '2003');
INSERT INTO `sys_role_menu` VALUES ('101', '2004');
INSERT INTO `sys_role_menu` VALUES ('101', '2005');
INSERT INTO `sys_role_menu` VALUES ('101', '2006');
INSERT INTO `sys_role_menu` VALUES ('101', '2007');
INSERT INTO `sys_role_menu` VALUES ('101', '2008');
INSERT INTO `sys_role_menu` VALUES ('101', '2009');
INSERT INTO `sys_role_menu` VALUES ('101', '2010');
INSERT INTO `sys_role_menu` VALUES ('101', '2011');
INSERT INTO `sys_role_menu` VALUES ('101', '2012');
INSERT INTO `sys_role_menu` VALUES ('101', '2013');
INSERT INTO `sys_role_menu` VALUES ('101', '2014');
INSERT INTO `sys_role_menu` VALUES ('101', '2015');
INSERT INTO `sys_role_menu` VALUES ('101', '2016');
INSERT INTO `sys_role_menu` VALUES ('101', '2017');
INSERT INTO `sys_role_menu` VALUES ('101', '2018');
INSERT INTO `sys_role_menu` VALUES ('101', '2019');
INSERT INTO `sys_role_menu` VALUES ('101', '2020');
INSERT INTO `sys_role_menu` VALUES ('101', '2021');
INSERT INTO `sys_role_menu` VALUES ('101', '2022');
INSERT INTO `sys_role_menu` VALUES ('101', '2023');
INSERT INTO `sys_role_menu` VALUES ('101', '2024');
INSERT INTO `sys_role_menu` VALUES ('102', '1');
INSERT INTO `sys_role_menu` VALUES ('102', '2');
INSERT INTO `sys_role_menu` VALUES ('102', '3');
INSERT INTO `sys_role_menu` VALUES ('102', '100');
INSERT INTO `sys_role_menu` VALUES ('102', '101');
INSERT INTO `sys_role_menu` VALUES ('102', '102');
INSERT INTO `sys_role_menu` VALUES ('102', '103');
INSERT INTO `sys_role_menu` VALUES ('102', '104');
INSERT INTO `sys_role_menu` VALUES ('102', '105');
INSERT INTO `sys_role_menu` VALUES ('102', '106');
INSERT INTO `sys_role_menu` VALUES ('102', '107');
INSERT INTO `sys_role_menu` VALUES ('102', '108');
INSERT INTO `sys_role_menu` VALUES ('102', '109');
INSERT INTO `sys_role_menu` VALUES ('102', '110');
INSERT INTO `sys_role_menu` VALUES ('102', '111');
INSERT INTO `sys_role_menu` VALUES ('102', '112');
INSERT INTO `sys_role_menu` VALUES ('102', '113');
INSERT INTO `sys_role_menu` VALUES ('102', '114');
INSERT INTO `sys_role_menu` VALUES ('102', '115');
INSERT INTO `sys_role_menu` VALUES ('102', '116');
INSERT INTO `sys_role_menu` VALUES ('102', '500');
INSERT INTO `sys_role_menu` VALUES ('102', '501');
INSERT INTO `sys_role_menu` VALUES ('102', '1000');
INSERT INTO `sys_role_menu` VALUES ('102', '1001');
INSERT INTO `sys_role_menu` VALUES ('102', '1002');
INSERT INTO `sys_role_menu` VALUES ('102', '1003');
INSERT INTO `sys_role_menu` VALUES ('102', '1004');
INSERT INTO `sys_role_menu` VALUES ('102', '1005');
INSERT INTO `sys_role_menu` VALUES ('102', '1006');
INSERT INTO `sys_role_menu` VALUES ('102', '1007');
INSERT INTO `sys_role_menu` VALUES ('102', '1008');
INSERT INTO `sys_role_menu` VALUES ('102', '1009');
INSERT INTO `sys_role_menu` VALUES ('102', '1010');
INSERT INTO `sys_role_menu` VALUES ('102', '1011');
INSERT INTO `sys_role_menu` VALUES ('102', '1012');
INSERT INTO `sys_role_menu` VALUES ('102', '1013');
INSERT INTO `sys_role_menu` VALUES ('102', '1014');
INSERT INTO `sys_role_menu` VALUES ('102', '1015');
INSERT INTO `sys_role_menu` VALUES ('102', '1016');
INSERT INTO `sys_role_menu` VALUES ('102', '1017');
INSERT INTO `sys_role_menu` VALUES ('102', '1018');
INSERT INTO `sys_role_menu` VALUES ('102', '1019');
INSERT INTO `sys_role_menu` VALUES ('102', '1020');
INSERT INTO `sys_role_menu` VALUES ('102', '1021');
INSERT INTO `sys_role_menu` VALUES ('102', '1022');
INSERT INTO `sys_role_menu` VALUES ('102', '1023');
INSERT INTO `sys_role_menu` VALUES ('102', '1024');
INSERT INTO `sys_role_menu` VALUES ('102', '1025');
INSERT INTO `sys_role_menu` VALUES ('102', '1026');
INSERT INTO `sys_role_menu` VALUES ('102', '1027');
INSERT INTO `sys_role_menu` VALUES ('102', '1028');
INSERT INTO `sys_role_menu` VALUES ('102', '1029');
INSERT INTO `sys_role_menu` VALUES ('102', '1030');
INSERT INTO `sys_role_menu` VALUES ('102', '1031');
INSERT INTO `sys_role_menu` VALUES ('102', '1032');
INSERT INTO `sys_role_menu` VALUES ('102', '1033');
INSERT INTO `sys_role_menu` VALUES ('102', '1034');
INSERT INTO `sys_role_menu` VALUES ('102', '1035');
INSERT INTO `sys_role_menu` VALUES ('102', '1036');
INSERT INTO `sys_role_menu` VALUES ('102', '1037');
INSERT INTO `sys_role_menu` VALUES ('102', '1038');
INSERT INTO `sys_role_menu` VALUES ('102', '1039');
INSERT INTO `sys_role_menu` VALUES ('102', '1040');
INSERT INTO `sys_role_menu` VALUES ('102', '1041');
INSERT INTO `sys_role_menu` VALUES ('102', '1042');
INSERT INTO `sys_role_menu` VALUES ('102', '1043');
INSERT INTO `sys_role_menu` VALUES ('102', '1044');
INSERT INTO `sys_role_menu` VALUES ('102', '1045');
INSERT INTO `sys_role_menu` VALUES ('102', '1046');
INSERT INTO `sys_role_menu` VALUES ('102', '1047');
INSERT INTO `sys_role_menu` VALUES ('102', '1048');
INSERT INTO `sys_role_menu` VALUES ('102', '1049');
INSERT INTO `sys_role_menu` VALUES ('102', '1050');
INSERT INTO `sys_role_menu` VALUES ('102', '1051');
INSERT INTO `sys_role_menu` VALUES ('102', '1052');
INSERT INTO `sys_role_menu` VALUES ('102', '1053');
INSERT INTO `sys_role_menu` VALUES ('102', '1054');
INSERT INTO `sys_role_menu` VALUES ('102', '1055');
INSERT INTO `sys_role_menu` VALUES ('102', '1056');
INSERT INTO `sys_role_menu` VALUES ('102', '1057');
INSERT INTO `sys_role_menu` VALUES ('102', '1058');
INSERT INTO `sys_role_menu` VALUES ('102', '1059');
INSERT INTO `sys_role_menu` VALUES ('102', '1060');
INSERT INTO `sys_role_menu` VALUES ('102', '1061');
INSERT INTO `sys_role_menu` VALUES ('102', '2000');
INSERT INTO `sys_role_menu` VALUES ('102', '2001');
INSERT INTO `sys_role_menu` VALUES ('102', '2002');
INSERT INTO `sys_role_menu` VALUES ('102', '2003');
INSERT INTO `sys_role_menu` VALUES ('102', '2004');
INSERT INTO `sys_role_menu` VALUES ('102', '2005');
INSERT INTO `sys_role_menu` VALUES ('102', '2006');
INSERT INTO `sys_role_menu` VALUES ('102', '2007');
INSERT INTO `sys_role_menu` VALUES ('102', '2008');
INSERT INTO `sys_role_menu` VALUES ('102', '2009');
INSERT INTO `sys_role_menu` VALUES ('102', '2010');
INSERT INTO `sys_role_menu` VALUES ('102', '2011');
INSERT INTO `sys_role_menu` VALUES ('102', '2012');
INSERT INTO `sys_role_menu` VALUES ('102', '2013');
INSERT INTO `sys_role_menu` VALUES ('102', '2014');
INSERT INTO `sys_role_menu` VALUES ('102', '2015');
INSERT INTO `sys_role_menu` VALUES ('102', '2016');
INSERT INTO `sys_role_menu` VALUES ('102', '2017');
INSERT INTO `sys_role_menu` VALUES ('102', '2018');
INSERT INTO `sys_role_menu` VALUES ('102', '2019');
INSERT INTO `sys_role_menu` VALUES ('102', '2020');
INSERT INTO `sys_role_menu` VALUES ('102', '2021');
INSERT INTO `sys_role_menu` VALUES ('102', '2022');
INSERT INTO `sys_role_menu` VALUES ('102', '2023');
INSERT INTO `sys_role_menu` VALUES ('102', '2024');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) DEFAULT '' COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户 01注册用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) DEFAULT '' COMMENT '密码',
  `salt` varchar(20) DEFAULT '' COMMENT '盐加密',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '103', 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', '2021-09-11 00:07:48', '2021-08-22 13:00:03', 'admin', '2021-08-22 13:00:03', '', '2021-09-11 00:07:47', '管理员');
INSERT INTO `sys_user` VALUES ('2', '105', 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '0', '127.0.0.1', '2021-08-22 13:00:03', '2021-08-22 13:00:03', 'admin', '2021-08-22 13:00:03', '', null, '测试员');
INSERT INTO `sys_user` VALUES ('100', '103', 'ttz', '唐田震', '00', '', '15806638897', '0', '', '969c41fa234d288dc5f58591775ae776', '1e06c3', '0', '0', '127.0.0.1', '2021-09-10 14:17:37', null, 'admin', '2021-08-31 14:35:42', '', '2021-09-10 14:17:36', null);
INSERT INTO `sys_user` VALUES ('101', '103', 'lj', '栗健', '00', '', '15811111111', '0', '', 'b3bf7bb5e943ab006cab5bf32cb0e146', '31defb', '0', '0', '127.0.0.1', '2021-09-05 16:06:23', null, 'admin', '2021-08-31 14:37:09', '', '2021-09-05 16:06:22', null);
INSERT INTO `sys_user` VALUES ('102', '101', 'hmxs', '坏猫先生', '00', '', '15822222222', '0', '', '5728d4b4470f7e05367eed79d283d1a2', 'bf1fa0', '0', '0', '127.0.0.1', '2021-09-10 14:16:00', null, 'admin', '2021-08-31 14:37:52', '', '2021-09-10 14:16:00', null);
INSERT INTO `sys_user` VALUES ('103', '101', 'gw', '郭闻', '00', '', '15833333333', '1', '', '157acb61c7c233d6dbe8beb95050fb90', '50a163', '0', '0', '127.0.0.1', '2021-09-05 16:08:04', null, 'admin', '2021-08-31 14:38:52', '', '2021-09-05 16:08:03', null);

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online` (
  `sessionId` varchar(50) NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) DEFAULT '0' COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='在线用户记录';

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('ab7f0af9-4267-4d71-8aa3-05090f7fb851', 'admin', '研发部门', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', 'on_line', '2021-09-11 00:07:45', '2021-09-11 00:10:39', '1800000');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES ('1', '1');
INSERT INTO `sys_user_post` VALUES ('2', '2');
INSERT INTO `sys_user_post` VALUES ('100', '4');
INSERT INTO `sys_user_post` VALUES ('101', '2');
INSERT INTO `sys_user_post` VALUES ('102', '1');
INSERT INTO `sys_user_post` VALUES ('103', '3');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('2', '2');
INSERT INTO `sys_user_role` VALUES ('100', '2');
INSERT INTO `sys_user_role` VALUES ('101', '100');
INSERT INTO `sys_user_role` VALUES ('102', '101');
INSERT INTO `sys_user_role` VALUES ('103', '102');

-- ----------------------------
-- Table structure for t_cust_form
-- ----------------------------
DROP TABLE IF EXISTS `t_cust_form`;
CREATE TABLE `t_cust_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_key` varchar(100) DEFAULT NULL COMMENT '表单key',
  `form_name` varchar(200) DEFAULT NULL COMMENT '表单名',
  `type` varchar(50) DEFAULT NULL COMMENT '表单类型',
  `content` text COMMENT '表单内容',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  `status` varchar(50) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='自定义表单';

-- ----------------------------
-- Records of t_cust_form
-- ----------------------------
INSERT INTO `t_cust_form` VALUES ('18', 'leave', '请假流程发起表单', 'act_form_type_001', '\n\n    <div class=\"drag-box drag-container drag-single-container-real drag-container-border\" style=\"display: flex;flex-direction: column;flex: 0 0 auto;\" id=\"1630321018000\" data-select2-id=\"1630321018000\"><div class=\"drag-box\" style=\"display: flex;flex: 0 0 auto;\" id=\"1630321021000\">\n            <div class=\"drag-container drag-container-border\" style=\"display: flex;flex-direction: column;flex: 1;\">\n\n            <div class=\"drag-box drag-item form-group\" data-type=\"drag_input\" style=\"display: flex;align-items: baseline;padding-left: 10px;\" id=\"1630321032000\">\n            <label class=\"control-label\" style=\"width: 80px;text-align: right;\">姓名：</label>\n            <div style=\"flex: 1;\">\n                <input type=\"text\" placeholder=\"请输入姓名\" class=\"form-control real\" id=\"real1630321032000\" name=\"name\">\n            </div>\n        </div></div>\n        </div><div class=\"drag-box\" style=\"display: flex;flex: 0 0 auto;\" id=\"1630321023000\">\n            <div class=\"drag-container drag-container-border\" style=\"display: flex;flex-direction: column;flex: 1;\">\n\n            <div class=\"drag-box drag-item form-group\" data-type=\"drag_input\" style=\"display: flex;align-items: baseline;padding-left: 10px;\" id=\"1630321035000\">\n            <label class=\"control-label\" style=\"width: 80px;text-align: right;\">事由：</label>\n            <div style=\"flex: 1;\">\n                <input type=\"text\" placeholder=\"请输入请假原因\" class=\"form-control real\" id=\"real1630321035000\" name=\"content\">\n            </div>\n        </div></div>\n        </div><div class=\"drag-box\" style=\"display: flex;flex: 0 0 auto;\" id=\"1630321025000\">\n            <div class=\"drag-container drag-container-border\" style=\"display: flex;flex-direction: column;flex: 1;\">\n            <div class=\"drag-box drag-item form-group\" data-type=\"drag_datetime\" style=\"display: flex;padding-left: 10px;\" id=\"1630321037000\">\n            <label class=\"control-label\" style=\"flex: 0 1 80px;text-align: right;padding-top: 8px;\">开始时间：</label>\n            <div class=\"input-group date\" style=\"flex: 1;\">\n                <span class=\"input-group-addon\"><i class=\"fa fa-calendar\"></i></span>\n                <input type=\"text\" class=\"form-control real\" id=\"real1630321037000\" placeholder=\"yyyy-MM-dd HH:mm:ss\" lay-key=\"1\" name=\"start_time\">\n            </div>\n        </div></div>\n            <div class=\"drag-container drag-container-border\" style=\"display: flex;flex-direction: column;flex: 1;\">\n            <div class=\"drag-box drag-item form-group\" data-type=\"drag_datetime\" style=\"display: flex;padding-left: 10px;\" id=\"1630321038000\">\n            <label class=\"control-label\" style=\"flex: 0 1 80px;text-align: right;padding-top: 8px;\">结束时间：</label>\n            <div class=\"input-group date\" style=\"flex: 1;\">\n                <span class=\"input-group-addon\"><i class=\"fa fa-calendar\"></i></span>\n                <input type=\"text\" class=\"form-control real\" id=\"real1630321038000\" placeholder=\"yyyy-MM-dd HH:mm:ss\" lay-key=\"2\" name=\"end_time\">\n            </div>\n        </div></div>\n        </div><div class=\"drag-box\" style=\"display: flex;flex: 0 0 auto;\" id=\"1630321028000\">\n            <div class=\"drag-container drag-container-border\" style=\"display: flex;flex-direction: column;flex: 1;\">\n\n            <div class=\"drag-box drag-item form-group\" data-type=\"drag_textarea\" style=\"display: flex;padding-left: 10px;\" id=\"1630321043000\">\n            <label class=\"control-label\" style=\"width: 80px;text-align: right;padding-top: 8px;\">备注：</label>\n            <div style=\"flex: 1;\">\n                <textarea name=\"remark\" class=\"form-control real\" aria-required=\"true\" id=\"real1630321043000\"></textarea>\n            </div>\n        </div></div>\n        </div><div class=\"drag-box\" style=\"display: flex;flex: 0 0 auto;\" id=\"1630321031000\">\n            <div class=\"drag-container drag-container-border\" style=\"display: flex;flex-direction: column;flex: 1;\">\n\n            <div class=\"drag-box drag-item form-group\" data-type=\"drag_upload\" style=\"display: flex;align-items: baseline;padding-left: 10px;\" id=\"1630570074000\">\n            <label class=\"control-label\" style=\"width: 80px;text-align: right;\">附件：</label>\n            <div style=\"flex: 1;\">\n                <input type=\"file\" name=\"\">\n                <input type=\"hidden\" name=\"processFile\" class=\"real upload-file\" id=\"real1630570074000\">\n            </div>\n        </div></div>\n        </div><div class=\"drag-box\" style=\"display: flex;flex: 0 0 auto;\" id=\"1630508912000\">\n            <div class=\"drag-container drag-container-border\" style=\"display: flex;flex-direction: column;flex: 1;\">\n\n            <div class=\"drag-box drag-item form-group\" data-type=\"drag_select\" style=\"display: flex;align-items: baseline;padding-left: 10px;\" id=\"1630508915000\">\n            <label class=\"control-label\" style=\"width: 80px;text-align: right;\">是否提交：</label>\n            <div style=\"flex: 1;\">\n                <select class=\"form-control real select2-hidden-accessible\" id=\"real1630508915000\" data-dict=\"sys_yes_no\" name=\"type\" data-select2-id=\"real1630508915000\" tabindex=\"-1\" aria-hidden=\"true\"><option value=\"\" data-select2-id=\"2\">--请选择--</option><option value=\"Y\" data-select2-id=\"3\">是</option><option value=\"N\" data-select2-id=\"4\">否</option></select><span class=\"select2 select2-container select2-container--bootstrap\" dir=\"ltr\" data-select2-id=\"5\" style=\"width: 100%;\"><span class=\"selection\"><span class=\"select2-selection select2-selection--single\" role=\"combobox\" aria-haspopup=\"true\" aria-expanded=\"false\" tabindex=\"-1\" aria-labelledby=\"select2-real1630508915000-container\"><span class=\"select2-selection__rendered\" id=\"select2-real1630508915000-container\" role=\"textbox\" aria-readonly=\"true\" title=\"--请选择--\">--请选择--</span><span class=\"select2-selection__arrow\" role=\"presentation\"><b role=\"presentation\"></b></span></span></span><span class=\"dropdown-wrapper\" aria-hidden=\"true\"></span></span>\n            </div>\n        </div></div>\n        </div></div>', 'admin', '2021-08-30 19:00:33', 'ttz', '2021-09-02 18:06:23', '', '0');
INSERT INTO `t_cust_form` VALUES ('19', 'approveTask_common', '审批节点公用表单', 'act_form_type_002', '<div class=\"drag-box drag-container drag-single-container-real drag-container-border\" style=\"display: flex;flex-direction: column;flex: 0 0 auto;\" id=\"1630419770000\"><div class=\"drag-box\" style=\"display: flex;flex: 0 0 auto;\" id=\"1630419771000\">\n            <div class=\"drag-container drag-container-border\" style=\"display: flex;flex-direction: column;flex: 1;\">\n\n            <div class=\"drag-box drag-item form-group\" data-type=\"drag_textarea\" style=\"display: flex;padding-left: 10px;\" id=\"1630419783000\">\n            <label class=\"control-label\" style=\"width: 80px;text-align: right;padding-top: 8px;\">意见：</label>\n            <div style=\"flex: 1;\">\n                <textarea name=\"remark\" class=\"form-control real\" aria-required=\"true\" id=\"real1630419783000\"></textarea>\n            </div>\n        </div></div>\n        </div><div class=\"drag-box\" style=\"display: flex;flex: 0 0 auto;\" id=\"1630419786000\">\n            <div class=\"drag-container drag-container-border\" style=\"display: flex;flex-direction: column;flex: 1;\">\n\n            <div class=\"drag-box drag-item form-group\" data-type=\"drag_select\" style=\"display: flex;align-items: baseline;padding-left: 10px;\" id=\"1630419790000\">\n            <label class=\"control-label\" style=\"width: 80px;text-align: right;\">是否批准：</label>\n            <div style=\"flex: 1;\">\n                <select class=\"form-control real select2-hidden-accessible\" id=\"real1630419790000\" data-select2-id=\"real1630419790000\" tabindex=\"-1\" aria-hidden=\"true\" data-dict=\"act_common_approve\" name=\"type\"><option value=\"\" data-select2-id=\"8\">--请选择--</option><option value=\"act_common_approve_001\" data-select2-id=\"9\">批准</option><option value=\"act_common_approve_002\" data-select2-id=\"10\">退回</option></select><span class=\"select2 select2-container select2-container--bootstrap select2-container--below\" dir=\"ltr\" data-select2-id=\"11\" style=\"width: 100%;\"><span class=\"selection\"><span class=\"select2-selection select2-selection--single\" role=\"combobox\" aria-haspopup=\"true\" aria-expanded=\"false\" tabindex=\"0\" aria-labelledby=\"select2-real1630419790000-container\"><span class=\"select2-selection__rendered\" id=\"select2-real1630419790000-container\" role=\"textbox\" aria-readonly=\"true\" title=\"--请选择--\">--请选择--</span><span class=\"select2-selection__arrow\" role=\"presentation\"><b role=\"presentation\"></b></span></span></span><span class=\"dropdown-wrapper\" aria-hidden=\"true\"></span></span>\n            </div>\n        </div></div>\n        </div></div>', 'admin', '2021-08-31 17:53:48', 'admin', '2021-08-31 22:40:53', '审批节点公用表单', '0');
INSERT INTO `t_cust_form` VALUES ('23', 'payoff', '工资确认表单', 'act_form_type_002', '<div class=\"drag-box drag-container drag-single-container-real drag-container-border\" style=\"display: flex;flex-direction: column;flex: 0 0 auto;\" id=\"1630711009000\"><div class=\"drag-box\" style=\"display: flex;flex: 0 0 auto;\" id=\"1630711017000\">\n            <div class=\"drag-container drag-container-border\" style=\"display: flex;flex-direction: column;flex: 1;\">\n\n            <div class=\"drag-box drag-item form-group\" data-type=\"drag_select\" style=\"display: flex;align-items: baseline;padding-left: 10px;\" id=\"1630711019000\">\n            <label class=\"control-label\" style=\"width: 80px;text-align: right;\">确认：</label>\n            <div style=\"flex: 1;\">\n                <select class=\"form-control real select2-hidden-accessible\" id=\"real1630711019000\" data-dict=\"sys_yes_no\" name=\"type\" data-select2-id=\"real1630711019000\" tabindex=\"-1\" aria-hidden=\"true\"><option value=\"\" data-select2-id=\"7\">--请选择--</option><option value=\"Y\" data-select2-id=\"8\">是</option><option value=\"N\" data-select2-id=\"9\">否</option></select><span class=\"select2 select2-container select2-container--bootstrap select2-container--below\" dir=\"ltr\" data-select2-id=\"10\" style=\"width: 100%;\"><span class=\"selection\"><span class=\"select2-selection select2-selection--single\" role=\"combobox\" aria-haspopup=\"true\" aria-expanded=\"false\" tabindex=\"-1\" aria-labelledby=\"select2-real1630711019000-container\"><span class=\"select2-selection__rendered\" id=\"select2-real1630711019000-container\" role=\"textbox\" aria-readonly=\"true\" title=\"--请选择--\">--请选择--</span><span class=\"select2-selection__arrow\" role=\"presentation\"><b role=\"presentation\"></b></span></span></span><span class=\"dropdown-wrapper\" aria-hidden=\"true\"></span></span>\n            </div>\n        </div></div>\n        </div></div>', 'admin', '2021-09-04 07:16:45', 'admin', '2021-09-04 17:17:08', '', '0');

-- ----------------------------
-- Table structure for t_process_file
-- ----------------------------
DROP TABLE IF EXISTS `t_process_file`;
CREATE TABLE `t_process_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `process_key` varchar(50) DEFAULT NULL COMMENT '流程key',
  `instance_id` varchar(50) DEFAULT NULL COMMENT '流程实例id',
  `task_id` varchar(50) DEFAULT NULL COMMENT '任务节点id',
  `file_name` varchar(255) DEFAULT NULL COMMENT '文件名',
  `real_name` varchar(255) DEFAULT NULL COMMENT '真实文件名',
  `path` varchar(255) DEFAULT NULL COMMENT '文件路径',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='流程附件表';

-- ----------------------------
-- Records of t_process_file
-- ----------------------------
INSERT INTO `t_process_file` VALUES ('51', 'leave_process', '97501', '97507', '2.jpg', '39ddd6af-8f93-4679-88fb-1472701a9680.jpg', 'D:/ruoyi/uploadPath/processFile/2021/09/02/39ddd6af-8f93-4679-88fb-1472701a9680.jpg', 'ttz', '2021-09-02 17:59:42', 'ttz', '2021-09-02 17:59:59', null);
INSERT INTO `t_process_file` VALUES ('52', 'leave_process', '97501', '97507', 'diagram (7).bpmn', 'cdfc119e-0383-4c4f-8b3c-f8b3ad827199.bpmn', 'D:/ruoyi/uploadPath/processFile/2021/09/02/cdfc119e-0383-4c4f-8b3c-f8b3ad827199.bpmn', 'ttz', '2021-09-02 17:59:49', 'ttz', '2021-09-02 17:59:59', null);
INSERT INTO `t_process_file` VALUES ('53', 'leave_process', '100001', '100007', 'diagram (7).bpmn', '7a2f8971-5bfc-43b9-af2c-3ba4a7cfc672.bpmn', 'D:/ruoyi/uploadPath/processFile/2021/09/02/7a2f8971-5bfc-43b9-af2c-3ba4a7cfc672.bpmn', 'ttz', '2021-09-02 18:30:55', 'ttz', '2021-09-02 18:31:14', null);
INSERT INTO `t_process_file` VALUES ('54', 'leave_process', '100001', '100007', '2.jpg', '4f25354f-cc8e-4b51-b480-589e4ed75a40.jpg', 'D:/ruoyi/uploadPath/processFile/2021/09/02/4f25354f-cc8e-4b51-b480-589e4ed75a40.jpg', 'ttz', '2021-09-02 18:31:00', 'ttz', '2021-09-02 18:31:14', null);
INSERT INTO `t_process_file` VALUES ('55', 'leave_process', null, null, '2.jpg', '33d52890-c701-4014-840c-6b7fa1270a20.jpg', 'D:/ruoyi/uploadPath/processFile/2021/09/02/33d52890-c701-4014-840c-6b7fa1270a20.jpg', 'ttz', '2021-09-02 18:38:20', null, null, null);
INSERT INTO `t_process_file` VALUES ('56', 'leave_process', null, null, '运维部XX组每日实时疫情沟通反馈表（每日17：00前反馈）.xls', '397b94c7-2949-4922-bfbd-a2b2cb7b5c8a.xls', 'D:/ruoyi/uploadPath/processFile/2021/09/02/397b94c7-2949-4922-bfbd-a2b2cb7b5c8a.xls', 'ttz', '2021-09-02 22:39:26', null, null, null);
INSERT INTO `t_process_file` VALUES ('57', 'leave_process', null, null, '运维部XX组每日实时疫情沟通反馈表（每日17：00前反馈）.xls', 'bdce0fc3-5f25-43cf-ad32-df2aa1f1a93a.xls', 'D:/ruoyi/uploadPath/processFile/2021/09/02/bdce0fc3-5f25-43cf-ad32-df2aa1f1a93a.xls', 'ttz', '2021-09-02 22:50:40', null, null, null);
INSERT INTO `t_process_file` VALUES ('58', 'leave_process', null, null, '1.jpg', '3a6b1c5c-4e85-4c14-920e-fb1156030ae8.jpg', 'D:/ruoyi/uploadPath/processFile/2021/09/04/3a6b1c5c-4e85-4c14-920e-fb1156030ae8.jpg', 'ttz', '2021-09-04 08:57:52', null, null, null);
INSERT INTO `t_process_file` VALUES ('60', 'leave_process', null, null, 'b.txt', '4926eefa-0c97-44ec-ae8c-aeac4f90f1cc.txt', 'D:/ruoyi/uploadPath/processFile/2021/09/04/4926eefa-0c97-44ec-ae8c-aeac4f90f1cc.txt', 'ttz', '2021-09-04 08:58:16', null, null, null);
INSERT INTO `t_process_file` VALUES ('62', 'leave_process', null, null, 'a.txt', '4956852c-35c5-4649-9a51-841591616a54.txt', 'D:/ruoyi/uploadPath/processFile/2021/09/04/4956852c-35c5-4649-9a51-841591616a54.txt', 'ttz', '2021-09-04 08:59:28', null, null, null);
INSERT INTO `t_process_file` VALUES ('64', 'leave_process', null, null, 'a.txt', '79dd5d6a-d4cd-4a79-8b8b-055b5c640f8d.txt', 'D:/ruoyi/uploadPath/processFile/2021/09/04/79dd5d6a-d4cd-4a79-8b8b-055b5c640f8d.txt', 'ttz', '2021-09-04 09:01:48', null, null, null);
INSERT INTO `t_process_file` VALUES ('66', 'leave_process', null, null, 'a.txt', '5ce98d60-d5c8-4d46-b57d-2b72d9863976.txt', 'D:/ruoyi/uploadPath/processFile/2021/09/04/5ce98d60-d5c8-4d46-b57d-2b72d9863976.txt', 'ttz', '2021-09-04 09:03:00', null, null, null);
INSERT INTO `t_process_file` VALUES ('68', 'leave_process', '110094', '110100', 'a.txt', 'dd0222d5-72d5-4a68-bdef-5837d6348a48.txt', 'D:/ruoyi/uploadPath/processFile/2021/09/04/dd0222d5-72d5-4a68-bdef-5837d6348a48.txt', 'ttz', '2021-09-04 09:12:49', 'ttz', '2021-09-04 09:13:07', null);
INSERT INTO `t_process_file` VALUES ('70', 'leave_process', '110123', '110129', 'a.txt', '3bc2b651-69cd-48a1-8924-c8ce18414aeb.txt', 'D:/ruoyi/uploadPath/processFile/2021/09/04/3bc2b651-69cd-48a1-8924-c8ce18414aeb.txt', 'ttz', '2021-09-04 09:14:32', 'ttz', '2021-09-04 09:14:48', null);
INSERT INTO `t_process_file` VALUES ('71', 'leave_process', '110162', '110168', 'a.txt', '2f9a4492-7ec5-498e-a6be-cdd7b17ed0c7.txt', 'D:/ruoyi/uploadPath/processFile/2021/09/04/2f9a4492-7ec5-498e-a6be-cdd7b17ed0c7.txt', 'ttz', '2021-09-04 09:25:55', 'ttz', '2021-09-04 09:26:03', null);
INSERT INTO `t_process_file` VALUES ('72', 'leave_process', null, null, '1.jpg', '25997024-c49d-4463-a408-856cc6067ccb.jpg', 'D:/ruoyi/uploadPath/processFile/2021/09/04/25997024-c49d-4463-a408-856cc6067ccb.jpg', 'ttz', '2021-09-04 09:41:18', null, null, null);
INSERT INTO `t_process_file` VALUES ('73', 'overtime_reassignment', '122536', '122542', '1.jpg', '5071377e-a647-4b80-aa15-31d4e3ae3526.jpg', 'D:/ruoyi/uploadPath/processFile/2021/09/04/5071377e-a647-4b80-aa15-31d4e3ae3526.jpg', 'ttz', '2021-09-04 17:44:36', 'ttz', '2021-09-04 17:44:48', null);
INSERT INTO `t_process_file` VALUES ('74', 'overtime_reassignment', null, null, '2.jpg', 'd63f6e53-73e6-4aea-8d4f-4ec0e5e1f873.jpg', 'D:/ruoyi/uploadPath/processFile/2021/09/04/d63f6e53-73e6-4aea-8d4f-4ec0e5e1f873.jpg', 'ttz', '2021-09-04 18:12:01', null, null, null);
INSERT INTO `t_process_file` VALUES ('75', 'overtime_nothing', '127518', '127524', '1.jpg', '236e40f5-501b-4d55-8438-03e7347390f4.jpg', 'D:/ruoyi/uploadPath/processFile/2021/09/04/236e40f5-501b-4d55-8438-03e7347390f4.jpg', 'ttz', '2021-09-04 18:40:08', 'ttz', '2021-09-04 18:40:18', null);
INSERT INTO `t_process_file` VALUES ('76', 'multInstances_process', null, null, '1.jpg', '635d1565-0069-4458-b3df-7292937f61ce.jpg', 'D:/ruoyi/uploadPath/processFile/2021/09/05/635d1565-0069-4458-b3df-7292937f61ce.jpg', 'ttz', '2021-09-05 16:05:50', null, null, null);
INSERT INTO `t_process_file` VALUES ('77', 'leave_process', '172501', '172507', '1.jpg', '4453273f-ff09-4492-9513-fa3837177cf7.jpg', 'D:/ruoyi/uploadPath/processFile/2021/09/10/4453273f-ff09-4492-9513-fa3837177cf7.jpg', 'ttz', '2021-09-10 13:07:09', 'ttz', '2021-09-10 13:07:22', null);

-- ----------------------------
-- Table structure for t_process_model
-- ----------------------------
DROP TABLE IF EXISTS `t_process_model`;
CREATE TABLE `t_process_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `process_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'key',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门id',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '模型名称',
  `form_id` int(11) DEFAULT NULL COMMENT '表单id',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '状态',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  `model_id` varchar(50) DEFAULT NULL COMMENT '模流程型id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='流程模型表';
