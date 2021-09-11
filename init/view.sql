-- 先删除activiti初始换表格时创建的用户相关的三张表
DROP TABLE IF EXISTS act_id_membership;
DROP TABLE IF EXISTS act_id_group;
DROP TABLE IF EXISTS act_id_user;

-- 如果之前存在视图则删除
DROP VIEW IF EXISTS act_id_membership;
DROP VIEW IF EXISTS act_id_user;
DROP VIEW IF EXISTS act_id_group;

-- 创建用户试图
CREATE OR REPLACE VIEW act_id_user AS
  SELECT
    u.login_name AS ID_,
    0 AS REV_,
    u.user_name AS FIRST_,
    '' AS LAST_,
    u.email AS EMAIL_,
    u.password AS PWD_,
    '' AS PICTURE_ID_
  FROM sys_user u;

-- 创建角色试图
CREATE VIEW act_id_group AS
  SELECT
    r.role_key AS ID_,
    NULL AS REV_,
    r.role_name AS NAME_,
    'assignment' AS TYPE_
  FROM sys_role r;

-- 创建用户、角色关系试图
CREATE VIEW act_id_membership AS
  SELECT
    (SELECT u.login_name FROM sys_user u WHERE u.user_id=ur.user_id) AS USER_ID_,
    (SELECT r.role_key FROM sys_role r WHERE r.role_id=ur.role_id) AS GROUP_ID_
  FROM sys_user_role ur;