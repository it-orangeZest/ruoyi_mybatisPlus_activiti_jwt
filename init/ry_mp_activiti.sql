/*
Navicat MySQL Data Transfer

Source Server         : 阿里云
Source Server Version : 80018
Source Host           : rm-2zeg4yqm712q81gwido.mysql.rds.aliyuncs.com:3306
Source Database       : ry_mp_activiti

Target Server Type    : MYSQL
Target Server Version : 80018
File Encoding         : 65001

Date: 2021-09-29 10:40:35
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
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'iZ2zej1nogjvotuja0ithdZ1631873862972', '1631874110350', '15000');

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
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', null, '1631873870000', '-1', '5', 'PAUSED', 'CRON', '1631873863000', '0', null, '2', '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', null, '1631873865000', '-1', '5', 'PAUSED', 'CRON', '1631873864000', '0', null, '2', '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', null, '1631873880000', '-1', '5', 'PAUSED', 'CRON', '1631873864000', '0', null, '2', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=648 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=2026 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单权限表';

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
INSERT INTO `sys_menu` VALUES ('2000', '测试', '1', '1', '/act/test', 'menuItem', 'C', '1', '1', 'act:test:view', '#', 'admin', '2021-08-22 19:45:03', 'ttz', '2021-09-12 23:37:22', '测试菜单');
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
INSERT INTO `sys_menu` VALUES ('2025', '流程模型案例', '2008', '99', '/act/definition/model/exampleModel', 'menuItem', 'C', '0', '1', 'act/definition:model:view', '#', 'admin', '2021-09-17 17:05:58', '', null, '');

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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------

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
INSERT INTO `sys_role` VALUES ('2', '普通角色', 'common', '2', '4', '0', '0', 'admin', '2021-08-22 13:00:03', 'admin', '2021-09-17 17:16:02', '普通角色');
INSERT INTO `sys_role` VALUES ('100', '部门领导', 'sectionLead', '10', '4', '0', '0', 'admin', '2021-08-31 14:26:24', 'admin', '2021-09-17 17:16:10', '');
INSERT INTO `sys_role` VALUES ('101', '董事长', 'boss', '20', '4', '0', '0', 'admin', '2021-08-31 14:27:01', 'admin', '2021-09-17 17:16:16', '');
INSERT INTO `sys_role` VALUES ('102', '人事', 'personnel', '30', '4', '0', '0', 'admin', '2021-08-31 14:27:51', 'admin', '2021-09-17 17:16:22', '');

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
INSERT INTO `sys_role_menu` VALUES ('2', '2025');
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
INSERT INTO `sys_role_menu` VALUES ('100', '2025');
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
INSERT INTO `sys_role_menu` VALUES ('101', '2025');
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
INSERT INTO `sys_role_menu` VALUES ('102', '2025');

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
INSERT INTO `sys_user` VALUES ('1', '103', 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', 'e179f577af4d8c5d80f56c20aa9189f9', '66c2a0', '0', '0', '127.0.0.1', '2021-09-29 09:59:48', '2021-09-29 09:44:20', 'admin', '2021-08-22 13:00:03', '', '2021-09-29 09:59:49', '管理员');
INSERT INTO `sys_user` VALUES ('2', '105', 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '2844ea6183ad759c841239c48d539723', 'f143b1', '0', '0', '127.0.0.1', '2021-08-22 13:00:03', '2021-08-22 13:00:03', 'admin', '2021-08-22 13:00:03', '', '2021-09-12 22:56:16', '测试员');
INSERT INTO `sys_user` VALUES ('100', '101', 'ttz', '唐田震', '00', '', '15806638897', '0', '', '969c41fa234d288dc5f58591775ae776', '1e06c3', '0', '0', '118.73.211.69', '2021-09-28 18:13:45', null, 'admin', '2021-08-31 14:35:42', 'admin', '2021-09-28 18:13:44', '');
INSERT INTO `sys_user` VALUES ('101', '101', 'lj', '栗健', '00', '', '15811111111', '0', '', 'b3bf7bb5e943ab006cab5bf32cb0e146', '31defb', '0', '0', '118.73.211.69', '2021-09-28 18:15:21', null, 'admin', '2021-08-31 14:37:09', 'admin', '2021-09-28 18:15:21', '');
INSERT INTO `sys_user` VALUES ('102', '101', 'hmxs', '坏猫先生', '00', '', '15822222222', '0', '', '5728d4b4470f7e05367eed79d283d1a2', 'bf1fa0', '0', '0', '59.173.103.6', '2021-09-29 10:20:08', null, 'admin', '2021-08-31 14:37:52', '', '2021-09-29 10:20:08', null);
INSERT INTO `sys_user` VALUES ('103', '101', 'gw', '郭闻', '00', '', '15833333333', '1', '', '157acb61c7c233d6dbe8beb95050fb90', '50a163', '0', '0', '218.240.142.44', '2021-09-28 11:12:44', null, 'admin', '2021-08-31 14:38:52', '', '2021-09-28 11:12:44', null);

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
INSERT INTO `sys_user_online` VALUES ('1fe34c26-1b69-4b79-b256-799ee053da61', 'hmxs', '济南总公司', '59.173.103.6', 'XX XX', 'Chrome 9', 'Windows 10', 'on_line', '2021-09-29 10:19:49', '2021-09-29 10:25:33', '1800000');

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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='自定义表单';

-- ----------------------------
-- Records of t_cust_form
-- ----------------------------
INSERT INTO `t_cust_form` VALUES ('18', 'leave', '请假流程发起表单', 'act_form_type_001', '\n\n    <div class=\"drag-box drag-container drag-single-container-real drag-container-border\" style=\"display: flex;flex-direction: column;flex: 0 0 auto;\" id=\"1630321018000\" data-select2-id=\"1630321018000\"><div class=\"drag-box\" style=\"display: flex;flex: 0 0 auto;\" id=\"1630321021000\">\n            <div class=\"drag-container drag-container-border\" style=\"display: flex;flex-direction: column;flex: 1;\">\n\n            <div class=\"drag-box drag-item form-group\" data-type=\"drag_input\" style=\"display: flex;align-items: baseline;padding-left: 10px;\" id=\"1630321032000\">\n            <label class=\"control-label\" style=\"width: 80px;text-align: right;\">姓名：</label>\n            <div style=\"flex: 1;\">\n                <input type=\"text\" placeholder=\"请输入姓名\" class=\"form-control real\" id=\"real1630321032000\" name=\"name\">\n            </div>\n        </div></div>\n        </div><div class=\"drag-box\" style=\"display: flex;flex: 0 0 auto;\" id=\"1630321023000\">\n            <div class=\"drag-container drag-container-border\" style=\"display: flex;flex-direction: column;flex: 1;\">\n\n            <div class=\"drag-box drag-item form-group\" data-type=\"drag_input\" style=\"display: flex;align-items: baseline;padding-left: 10px;\" id=\"1630321035000\">\n            <label class=\"control-label\" style=\"width: 80px;text-align: right;\">事由：</label>\n            <div style=\"flex: 1;\">\n                <input type=\"text\" placeholder=\"请输入请假原因\" class=\"form-control real\" id=\"real1630321035000\" name=\"content\">\n            </div>\n        </div></div>\n        </div><div class=\"drag-box\" style=\"display: flex;flex: 0 0 auto;\" id=\"1630321025000\">\n            <div class=\"drag-container drag-container-border\" style=\"display: flex;flex-direction: column;flex: 1;\">\n            <div class=\"drag-box drag-item form-group\" data-type=\"drag_datetime\" style=\"display: flex;padding-left: 10px;\" id=\"1630321037000\">\n            <label class=\"control-label\" style=\"flex: 0 1 80px;text-align: right;padding-top: 8px;\">开始时间：</label>\n            <div class=\"input-group date\" style=\"flex: 1;\">\n                <span class=\"input-group-addon\"><i class=\"fa fa-calendar\"></i></span>\n                <input type=\"text\" class=\"form-control real\" id=\"real1630321037000\" placeholder=\"yyyy-MM-dd HH:mm:ss\" lay-key=\"1\" name=\"start_time\">\n            </div>\n        </div></div>\n            <div class=\"drag-container drag-container-border\" style=\"display: flex;flex-direction: column;flex: 1;\">\n            <div class=\"drag-box drag-item form-group\" data-type=\"drag_datetime\" style=\"display: flex;padding-left: 10px;\" id=\"1630321038000\">\n            <label class=\"control-label\" style=\"flex: 0 1 80px;text-align: right;padding-top: 8px;\">结束时间：</label>\n            <div class=\"input-group date\" style=\"flex: 1;\">\n                <span class=\"input-group-addon\"><i class=\"fa fa-calendar\"></i></span>\n                <input type=\"text\" class=\"form-control real\" id=\"real1630321038000\" placeholder=\"yyyy-MM-dd HH:mm:ss\" lay-key=\"2\" name=\"end_time\">\n            </div>\n        </div></div>\n        </div><div class=\"drag-box\" style=\"display: flex;flex: 0 0 auto;\" id=\"1630321028000\">\n            <div class=\"drag-container drag-container-border\" style=\"display: flex;flex-direction: column;flex: 1;\">\n\n            <div class=\"drag-box drag-item form-group\" data-type=\"drag_textarea\" style=\"display: flex;padding-left: 10px;\" id=\"1630321043000\">\n            <label class=\"control-label\" style=\"width: 80px;text-align: right;padding-top: 8px;\">备注：</label>\n            <div style=\"flex: 1;\">\n                <textarea name=\"remark\" class=\"form-control real\" aria-required=\"true\" id=\"real1630321043000\"></textarea>\n            </div>\n        </div></div>\n        </div><div class=\"drag-box\" style=\"display: flex;flex: 0 0 auto;\" id=\"1630321031000\">\n            <div class=\"drag-container drag-container-border\" style=\"display: flex;flex-direction: column;flex: 1;\">\n\n            <div class=\"drag-box drag-item form-group\" data-type=\"drag_upload\" style=\"display: flex;align-items: baseline;padding-left: 10px;\" id=\"1630570074000\">\n            <label class=\"control-label\" style=\"width: 80px;text-align: right;\">附件：</label>\n            <div style=\"flex: 1;\">\n                <input type=\"file\" name=\"\">\n                <input type=\"hidden\" name=\"processFile\" class=\"real upload-file\" id=\"real1630570074000\">\n            </div>\n        </div></div>\n        </div><div class=\"drag-box selected\" style=\"display: flex;flex: 0 0 auto;\" id=\"1630508912000\">\n            <div class=\"drag-container drag-container-border\" style=\"display: flex;flex-direction: column;flex: 1;\">\n\n            <div class=\"drag-box drag-item form-group\" data-type=\"drag_select\" style=\"display: flex;align-items: baseline;padding-left: 10px;\" id=\"1630508915000\">\n            <label class=\"control-label\" style=\"width: 80px;text-align: right;\">是否提交：</label>\n            <div style=\"flex: 1;\">\n                <select class=\"form-control real select2-hidden-accessible\" id=\"real1630508915000\" data-dict=\"sys_yes_no\" name=\"type\" data-select2-id=\"real1630508915000\" tabindex=\"-1\" aria-hidden=\"true\"><option value=\"\" data-select2-id=\"2\">--请选择--</option><option value=\"Y\" data-select2-id=\"3\">是</option><option value=\"N\" data-select2-id=\"4\">否</option></select><span class=\"select2 select2-container select2-container--bootstrap select2-container--above\" dir=\"ltr\" data-select2-id=\"5\" style=\"width: 100%;\"><span class=\"selection\"><span class=\"select2-selection select2-selection--single\" role=\"combobox\" aria-haspopup=\"true\" aria-expanded=\"false\" tabindex=\"-1\" aria-labelledby=\"select2-real1630508915000-container\"><span class=\"select2-selection__rendered\" id=\"select2-real1630508915000-container\" role=\"textbox\" aria-readonly=\"true\" title=\"--请选择--\">--请选择--</span><span class=\"select2-selection__arrow\" role=\"presentation\"><b role=\"presentation\"></b></span></span></span><span class=\"dropdown-wrapper\" aria-hidden=\"true\"></span></span>\n            </div>\n        </div></div>\n        </div></div>', 'admin', '2021-08-30 19:00:33', 'ttz', '2021-09-15 17:48:20', '', '0');
INSERT INTO `t_cust_form` VALUES ('19', 'approveTask_common', '审批节点公用表单', 'act_form_type_002', '<div class=\"drag-box drag-container drag-single-container-real drag-container-border\" style=\"display: flex;flex-direction: column;flex: 0 0 auto;\" id=\"1630419770000\"><div class=\"drag-box\" style=\"display: flex;flex: 0 0 auto;\" id=\"1630419771000\">\n            <div class=\"drag-container drag-container-border\" style=\"display: flex;flex-direction: column;flex: 1;\">\n\n            <div class=\"drag-box drag-item form-group\" data-type=\"drag_textarea\" style=\"display: flex;padding-left: 10px;\" id=\"1630419783000\">\n            <label class=\"control-label\" style=\"width: 80px;text-align: right;padding-top: 8px;\">意见：</label>\n            <div style=\"flex: 1;\">\n                <textarea name=\"remark\" class=\"form-control real\" aria-required=\"true\" id=\"real1630419783000\"></textarea>\n            </div>\n        </div></div>\n        </div><div class=\"drag-box\" style=\"display: flex;flex: 0 0 auto;\" id=\"1630419786000\">\n            <div class=\"drag-container drag-container-border\" style=\"display: flex;flex-direction: column;flex: 1;\">\n\n            <div class=\"drag-box drag-item form-group\" data-type=\"drag_select\" style=\"display: flex;align-items: baseline;padding-left: 10px;\" id=\"1630419790000\">\n            <label class=\"control-label\" style=\"width: 80px;text-align: right;\">是否批准：</label>\n            <div style=\"flex: 1;\">\n                <select class=\"form-control real select2-hidden-accessible\" id=\"real1630419790000\" data-select2-id=\"real1630419790000\" tabindex=\"-1\" aria-hidden=\"true\" data-dict=\"act_common_approve\" name=\"type\"><option value=\"\" data-select2-id=\"8\">--请选择--</option><option value=\"act_common_approve_001\" data-select2-id=\"9\">批准</option><option value=\"act_common_approve_002\" data-select2-id=\"10\">退回</option></select><span class=\"select2 select2-container select2-container--bootstrap select2-container--below\" dir=\"ltr\" data-select2-id=\"11\" style=\"width: 100%;\"><span class=\"selection\"><span class=\"select2-selection select2-selection--single\" role=\"combobox\" aria-haspopup=\"true\" aria-expanded=\"false\" tabindex=\"0\" aria-labelledby=\"select2-real1630419790000-container\"><span class=\"select2-selection__rendered\" id=\"select2-real1630419790000-container\" role=\"textbox\" aria-readonly=\"true\" title=\"--请选择--\">--请选择--</span><span class=\"select2-selection__arrow\" role=\"presentation\"><b role=\"presentation\"></b></span></span></span><span class=\"dropdown-wrapper\" aria-hidden=\"true\"></span></span>\n            </div>\n        </div></div>\n        </div></div>', 'admin', '2021-08-31 17:53:48', 'admin', '2021-08-31 22:40:53', '审批节点公用表单', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='流程附件表';

-- ----------------------------
-- Records of t_process_file
-- ----------------------------

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
  `type` varchar(50) NOT NULL DEFAULT '0' COMMENT '模型类型；0-普通，1-案例',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='流程模型表';