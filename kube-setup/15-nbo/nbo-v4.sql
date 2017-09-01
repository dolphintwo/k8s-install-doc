/*
 Navicat Premium Data Transfer

 Source Server         : one5-mysql
 Source Server Type    : MySQL
 Source Server Version : 50716
 Source Host           : www.one5.newtouch.com
 Source Database       : nbo-v4

 Target Server Type    : MySQL
 Target Server Version : 50716
 File Encoding         : utf-8

 Date: 08/03/2017 14:16:23 PM
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `nbo_admin_permission`
-- ----------------------------
DROP TABLE IF EXISTS `nbo_admin_permission`;
CREATE TABLE `nbo_admin_permission` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `ROLE_CODE` varchar(200) DEFAULT NULL COMMENT '角色代码',
  `RESOURCE_CODE` varchar(200) DEFAULT NULL COMMENT '资源代码',
  `DELETED` bigint(20) DEFAULT NULL COMMENT '是否已删除，【1 是，0 否】',
  `FIRST_INSERT` datetime DEFAULT NULL COMMENT '创建时间',
  `LAST_MODIFIED` datetime DEFAULT NULL COMMENT '最后一次修改时间',
  `DELETE_TIME` datetime DEFAULT NULL COMMENT '逻辑删除时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `nbo_admin_resource`
-- ----------------------------
DROP TABLE IF EXISTS `nbo_admin_resource`;
CREATE TABLE `nbo_admin_resource` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `CODE` varchar(200) DEFAULT NULL COMMENT '资源代码',
  `NAME` varchar(200) DEFAULT NULL COMMENT '资源名称',
  `TYPE` varchar(200) DEFAULT NULL COMMENT '资源类型:【全局菜单,业务菜单】',
  `IS_MENU` varchar(20) DEFAULT NULL COMMENT '上级资源 资源代码',
  `PARENT_CODE` varchar(200) DEFAULT NULL COMMENT '上级资源 资源代码',
  `PARENT_NAME` varchar(200) DEFAULT NULL COMMENT '上级资源 资源名称',
  `PERMISSION` varchar(200) DEFAULT NULL COMMENT '资源 URL或权限标识',
  `SORT_NO` bigint(20) DEFAULT NULL COMMENT '排序',
  `DELETED` bigint(20) DEFAULT NULL COMMENT '是否已删除，【1 是，0 否】',
  `FIRST_INSERT` datetime DEFAULT NULL COMMENT '创建时间',
  `LAST_MODIFIED` datetime DEFAULT NULL COMMENT '最后一次修改时间',
  `DELETE_TIME` datetime DEFAULT NULL COMMENT '逻辑删除时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `nbo_admin_resource`
-- ----------------------------
BEGIN;
INSERT INTO `nbo_admin_resource` VALUES ('21', 'RS000021', 'aaaaa', '业务资源', '否', 'RS000220', '产品管理', 'aaaaa', '1', '0', '2017-03-17 16:44:57', null, null), ('23', 'RS000023', 'asda', '业务资源', '否', 'RS000220', '产品管理', 'adas', '2', '0', '2017-03-17 16:44:57', null, null), ('24', 'RS000024', 'sdas', '业务资源', '否', 'RS000220', '产品管理', 'asda', '2', '0', '2017-03-17 16:44:57', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `nbo_admin_role`
-- ----------------------------
DROP TABLE IF EXISTS `nbo_admin_role`;
CREATE TABLE `nbo_admin_role` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `ROLE_CODE` varchar(200) DEFAULT NULL,
  `ROLE_NAME` varchar(200) DEFAULT NULL,
  `REMARK` varchar(2000) DEFAULT NULL,
  `DELETED` bigint(20) DEFAULT NULL,
  `FIRST_INSERT` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `DELETE_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `nbo_admin_role`
-- ----------------------------
BEGIN;
INSERT INTO `nbo_admin_role` VALUES ('25', 'qwfef', 'wf2ef23fe', '2ef23f2e', '0', '2017-03-17 16:44:57', null, null), ('26', 'asved', 'wde3g3', 'dwe3g3', '0', '2017-03-17 16:44:57', null, null), ('27', 'ad', 'asd', 'ad', '0', '2017-03-17 16:44:57', null, null), ('28', 'asd', 'dsa', 'asdf', '0', '2017-03-17 16:44:57', null, null), ('29', 'z', 'z', 'z', '1', '2017-03-17 16:44:57', null, null), ('30', 'z', 'z', 'zzzz', '1', '2017-03-17 16:44:57', '2017-03-17 16:44:57', null), ('31', 'z', 'z', null, '1', '2017-03-17 16:44:57', '2017-03-17 16:44:57', null), ('32', 'z', 'z', 'z', '0', '2017-03-17 16:44:57', null, null), ('33', 'z', 'z', null, '1', '2017-03-17 16:44:57', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `nbo_admin_user`
-- ----------------------------
DROP TABLE IF EXISTS `nbo_admin_user`;
CREATE TABLE `nbo_admin_user` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `INSERT_OPERATOR` varchar(200) DEFAULT NULL,
  `INSERT_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `INSERT_TIME` datetime DEFAULT NULL,
  `MODIFY_OPERATOR` varchar(200) DEFAULT NULL,
  `MODIFY_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `CN_NAME` varchar(200) DEFAULT NULL,
  `EMAIL` varchar(200) DEFAULT NULL,
  `PASSWORD` varchar(200) DEFAULT NULL,
  `STATUS` bigint(20) DEFAULT '0',
  `USER_NAME` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_4knvt2mo08qko70lmvqjvrco1` (`EMAIL`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `nbo_admin_user`
-- ----------------------------
BEGIN;
INSERT INTO `nbo_admin_user` VALUES ('1', null, null, '2017-03-17 16:44:57', null, null, '2017-03-17 16:44:57', 'admin', '23333@qq.com', 'fc2a7fbcfefedf63368acc377a00eea0', '0', 'ookk'), ('81', null, null, '2017-03-17 16:44:57', null, null, null, '测试', 'test01@qq.com', '8af51b6c8f1e872163dd369995d0a7b1', '0', 'test');
COMMIT;

-- ----------------------------
--  Table structure for `nbo_admin_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `nbo_admin_user_role`;
CREATE TABLE `nbo_admin_user_role` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `ROLE_CODE` varchar(200) DEFAULT NULL,
  `USER_ID` bigint(20) DEFAULT NULL,
  `DELETED` bigint(20) DEFAULT NULL,
  `FIRST_INSERT` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `DELETE_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `nbo_app`
-- ----------------------------
DROP TABLE IF EXISTS `nbo_app`;
CREATE TABLE `nbo_app` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `INSERT_OPERATOR` varchar(255) DEFAULT NULL,
  `INSERT_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `INSERT_TIME` datetime DEFAULT NULL,
  `MODIFY_OPERATOR` varchar(255) DEFAULT NULL,
  `MODIFY_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `APP_EN_NAME` varchar(255) DEFAULT NULL,
  `APP_NAME` varchar(255) DEFAULT NULL,
  `BUILD_NUM` bigint(10) DEFAULT NULL,
  `BUILD_TYPE` varchar(255) DEFAULT NULL,
  `CODE_TYPE` varchar(255) DEFAULT NULL,
  `DESC_` varchar(255) DEFAULT NULL,
  `JOB_NUM` bigint(10) DEFAULT NULL,
  `REPS_DEFAULT_BRANCH` varchar(255) DEFAULT NULL,
  `REPS_PASSWORD` varchar(255) DEFAULT NULL,
  `REPS_TYPE` varchar(255) DEFAULT NULL,
  `REPS_URL` varchar(255) DEFAULT NULL,
  `REPS_USER_NAME` varchar(255) DEFAULT NULL,
  `PROJECT_ID` bigint(20) DEFAULT NULL,
  `ENCODING_TYPE` varchar(255) DEFAULT NULL,
  `DELETE_STATUS` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `nbo_app_config_file`
-- ----------------------------
DROP TABLE IF EXISTS `nbo_app_config_file`;
CREATE TABLE `nbo_app_config_file` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `INSERT_OPERATOR` varchar(255) DEFAULT NULL,
  `INSERT_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `INSERT_TIME` datetime DEFAULT NULL,
  `MODIFY_OPERATOR` varchar(255) DEFAULT NULL,
  `MODIFY_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `APP_NAME` varchar(255) DEFAULT NULL,
  `DEPLOY_VERSION_NAME` varchar(255) DEFAULT NULL,
  `PATH` varchar(255) DEFAULT NULL,
  `PROJECT_NAME` varchar(255) DEFAULT NULL,
  `SAVE_PATH` varchar(255) DEFAULT NULL,
  `APP_ID` bigint(20) DEFAULT NULL,
  `DEPLOY_VERSION_ID` bigint(20) DEFAULT NULL,
  `PROJECT_ID` bigint(20) DEFAULT NULL,
  `DESTINATION_ADDRESS` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `nbo_app_deploy`
-- ----------------------------
DROP TABLE IF EXISTS `nbo_app_deploy`;
CREATE TABLE `nbo_app_deploy` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `INSERT_OPERATOR` varchar(255) DEFAULT NULL,
  `INSERT_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `INSERT_TIME` datetime DEFAULT NULL,
  `MODIFY_OPERATOR` varchar(255) DEFAULT NULL,
  `MODIFY_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `VISIT_URL` varchar(255) DEFAULT NULL,
  `APP_NAME` varchar(255) DEFAULT NULL,
  `DOMAIN_URL` varchar(255) DEFAULT NULL,
  `INNER_VISIT_URL` varchar(255) DEFAULT NULL,
  `K8S_CLUSTER_IP` varchar(255) DEFAULT NULL,
  `APP_ID` bigint(20) DEFAULT NULL,
  `PROJECT_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `nbo_app_menu`
-- ----------------------------
DROP TABLE IF EXISTS `nbo_app_menu`;
CREATE TABLE `nbo_app_menu` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `NAME` varchar(20) DEFAULT NULL,
  `ROUTE` varchar(100) DEFAULT NULL,
  `SHOW` bigint(1) DEFAULT '1',
  `DEVELOPING` bigint(1) DEFAULT '0',
  `SORTING` bigint(10) DEFAULT '100',
  `ICON` varchar(20) DEFAULT NULL,
  `CSS_ICON` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `nbo_app_menu`
-- ----------------------------
BEGIN;
INSERT INTO `nbo_app_menu` VALUES ('2', '应用概览', 'platform.app.appDetails.basic', '1', '0', '1', null, null), ('3', '作业配置', 'platform.app.appDetails.job', '1', '0', '2', null, 'glyphicon-stats'), ('4', '代码检查', 'platform.app.appDetails.codeCheck', '1', '0', '3', null, null), ('5', '单元测试', 'platform.app.appDetails.test', '1', '0', '4', null, null), ('6', '应用构建', 'platform.app.appDetails.build', '1', '0', '5', null, null), ('7', '构建物管理', 'platform.app.appDetails.uploadConstructs', '1', '0', '6', null, 'glyphicon-edit'), ('8', '应用部署', 'platform.app.appDetails.autoDeploy', '1', '0', '7', null, null), ('9', '应用监控', ' ', '1', '1', '10', null, null), ('10', '应用测试', 'platform.app.appDetails.applicationTest', '1', '0', '9', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `nbo_app_menu_permission`
-- ----------------------------
DROP TABLE IF EXISTS `nbo_app_menu_permission`;
CREATE TABLE `nbo_app_menu_permission` (
  `FK_APP_MENU_ID` bigint(20) DEFAULT NULL,
  `FK_PERMISSION_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `nbo_app_menu_permission`
-- ----------------------------
BEGIN;
INSERT INTO `nbo_app_menu_permission` VALUES ('2', '100'), ('2', '101'), ('2', '107'), ('3', '100'), ('4', '100'), ('5', '100'), ('6', '100'), ('7', '100'), ('8', '100'), ('8', '101'), ('8', '107'), ('9', '100'), ('10', '101'), ('10', '107'), ('2', '100'), ('2', '101'), ('2', '107'), ('3', '100'), ('4', '100'), ('5', '100'), ('6', '100'), ('7', '100'), ('8', '100'), ('8', '101'), ('8', '107'), ('9', '100'), ('10', '101'), ('10', '107'), ('2', '100'), ('2', '101'), ('2', '107'), ('3', '100'), ('4', '100'), ('5', '100'), ('6', '100'), ('7', '100'), ('8', '100'), ('8', '101'), ('8', '107'), ('9', '100'), ('10', '101'), ('10', '107'), ('2', '100'), ('2', '101'), ('2', '107'), ('3', '100'), ('4', '100'), ('5', '100'), ('6', '100'), ('7', '100'), ('8', '100'), ('8', '101'), ('8', '107'), ('9', '100'), ('10', '101'), ('10', '107'), ('2', '100'), ('2', '101'), ('2', '107'), ('3', '100'), ('4', '100'), ('5', '100'), ('6', '100'), ('7', '100'), ('8', '100'), ('8', '101'), ('8', '107'), ('9', '100'), ('10', '101'), ('10', '107'), ('2', '100'), ('2', '101'), ('2', '107'), ('3', '100'), ('4', '100'), ('5', '100'), ('6', '100'), ('7', '100'), ('8', '100'), ('8', '101'), ('8', '107'), ('9', '100'), ('10', '101'), ('10', '107'), ('2', '100'), ('2', '101'), ('2', '107'), ('3', '100'), ('4', '100'), ('5', '100'), ('6', '100'), ('7', '100'), ('8', '100'), ('8', '101'), ('8', '107'), ('9', '100'), ('10', '101'), ('10', '107'), ('2', '100'), ('2', '101'), ('2', '107'), ('3', '100'), ('4', '100'), ('5', '100'), ('6', '100'), ('7', '100'), ('8', '100'), ('8', '101'), ('8', '107'), ('9', '100'), ('10', '101'), ('10', '107'), ('2', '100'), ('2', '101'), ('2', '107'), ('3', '100'), ('4', '100'), ('5', '100'), ('6', '100'), ('7', '100'), ('8', '100'), ('8', '101'), ('8', '107'), ('9', '100'), ('10', '101'), ('10', '107'), ('2', '100'), ('2', '101'), ('2', '107'), ('3', '100'), ('4', '100'), ('5', '100'), ('6', '100'), ('7', '100'), ('8', '100'), ('8', '101'), ('8', '107'), ('9', '100'), ('10', '101'), ('10', '107'), ('2', '100'), ('2', '101'), ('2', '107'), ('3', '100'), ('4', '100'), ('5', '100'), ('6', '100'), ('7', '100'), ('8', '100'), ('8', '101'), ('8', '107'), ('9', '100'), ('10', '101'), ('10', '107'), ('2', '100'), ('2', '101'), ('2', '107'), ('3', '100'), ('4', '100'), ('5', '100'), ('6', '100'), ('7', '100'), ('8', '100'), ('8', '101'), ('8', '107'), ('9', '100'), ('10', '101'), ('10', '107');
COMMIT;

-- ----------------------------
--  Table structure for `nbo_app_runtime_env`
-- ----------------------------
DROP TABLE IF EXISTS `nbo_app_runtime_env`;
CREATE TABLE `nbo_app_runtime_env` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `INSERT_OPERATOR` varchar(255) DEFAULT NULL,
  `INSERT_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `INSERT_TIME` datetime DEFAULT NULL,
  `MODIFY_OPERATOR` varchar(255) DEFAULT NULL,
  `MODIFY_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `APP_TYPE` varchar(255) DEFAULT NULL,
  `COMMAND` varchar(255) DEFAULT NULL,
  `DEFAULT_PORT` bigint(10) DEFAULT NULL,
  `DOCKER_IMAGE` varchar(255) DEFAULT NULL,
  `RUN_DIR` varchar(255) DEFAULT NULL,
  `RUNTIME_NAME` varchar(255) DEFAULT NULL,
  `VERSION` varchar(255) DEFAULT NULL,
  `HOME_DIR` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=110001 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `nbo_app_runtime_env`
-- ----------------------------
BEGIN;
INSERT INTO `nbo_app_runtime_env` VALUES ('1', null, null, null, null, null, '2017-03-17 16:44:57', 'java', null, '8080', '10.26.7.81:5000/newtouchone/jdk1.8:2.0', '/jar', 'jdk1.8(仅用于部署springboot的jar包项目)', '2.0', null), ('2', null, null, null, null, null, '2017-03-17 16:44:57', 'java', null, '8080', '10.26.7.81:5000/newtouchone/tomcat7-jdk7:v4.2-1.0', '/tomcat/webapps', 'tomcat7 jdk7(仅用于部署war包项目)', '2.0', null), ('3', null, null, null, null, null, '2017-03-17 16:44:57', 'java', null, '8080', '10.26.7.81:5000/newtouchone/tomcat8-jdk7:v4.2-1.0', '/tomcat/webapps', 'tomcat8 jdk7(仅用于部署war包项目)', '2.0', null), ('21', null, null, '2017-03-17 16:44:57', null, null, null, 'php', null, '80', '10.26.4.44:5000/newtouchone/v4-deploy-php:v4.2-1.0.0', '/var/www/html', 'php', '5.6', null);
COMMIT;

-- ----------------------------
--  Table structure for `nbo_app_template`
-- ----------------------------
DROP TABLE IF EXISTS `nbo_app_template`;
CREATE TABLE `nbo_app_template` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `INSERT_OPERATOR` varchar(255) DEFAULT NULL,
  `INSERT_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `INSERT_TIME` datetime DEFAULT NULL,
  `MODIFY_OPERATOR` varchar(255) DEFAULT NULL,
  `MODIFY_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `BUILD_TYPE` varchar(255) DEFAULT NULL,
  `CODE_TYPE` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `ENABLED` bigint(10) DEFAULT NULL,
  `GIT_MODULE_NAME` varchar(255) DEFAULT NULL,
  `GIT_URL` varchar(255) DEFAULT NULL,
  `IMG` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `VERSION` varchar(255) DEFAULT NULL,
  `DESCRIBE_` varchar(255) DEFAULT NULL,
  `ENCODEING_TYPE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=110004 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `nbo_build_task`
-- ----------------------------
DROP TABLE IF EXISTS `nbo_build_task`;
CREATE TABLE `nbo_build_task` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `INSERT_OPERATOR` varchar(255) DEFAULT NULL,
  `INSERT_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `INSERT_TIME` datetime DEFAULT NULL,
  `MODIFY_OPERATOR` varchar(255) DEFAULT NULL,
  `MODIFY_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `MODULE_NAME` varchar(255) DEFAULT NULL,
  `NAME_SPACE` varchar(255) DEFAULT NULL,
  `REPS_BRANCH` varchar(255) DEFAULT NULL,
  `REPS_PASSWORD` varchar(255) DEFAULT NULL,
  `REPS_TYPE` varchar(255) DEFAULT NULL,
  `REPS_URL` varchar(255) DEFAULT NULL,
  `REPS_USER_NAME` varchar(255) DEFAULT NULL,
  `SUPPORT_CODE_TYPE` varchar(255) DEFAULT NULL,
  `TAG_NAME` varchar(255) DEFAULT NULL,
  `TASK_NAME` varchar(255) DEFAULT NULL,
  `ACTION_TYPE` varchar(255) DEFAULT NULL,
  `BUILD_COMMAND` varchar(255) DEFAULT NULL,
  `BUILD_ENV` varchar(255) DEFAULT NULL,
  `BUILD_ENV_VERSION` varchar(255) DEFAULT NULL,
  `BUILD_TOOLS` varchar(255) DEFAULT NULL,
  `BUILD_TOOLS_VERSION` varchar(255) DEFAULT NULL,
  `FILE_DIRECTORY` varchar(255) DEFAULT NULL,
  `JDK_VERSION` varchar(255) DEFAULT NULL,
  `MVN_ID` varchar(255) DEFAULT NULL,
  `MVN_PASSWORD` varchar(255) DEFAULT NULL,
  `MVN_USERNAME` varchar(255) DEFAULT NULL,
  `TARGET_TYPE` varchar(255) DEFAULT NULL,
  `APP_ID` bigint(20) DEFAULT NULL,
  `TASK_ID` bigint(20) DEFAULT NULL,
  `MAVEN_VERSION` varchar(200) DEFAULT NULL,
  `GRADLE_VERSION` varchar(200) DEFAULT NULL,
  `ANT_VERSION` varchar(200) DEFAULT NULL,
  `SCRIPT_TYPE` bigint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `nbo_build_task_exec`
-- ----------------------------
DROP TABLE IF EXISTS `nbo_build_task_exec`;
CREATE TABLE `nbo_build_task_exec` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `INSERT_OPERATOR` varchar(255) DEFAULT NULL,
  `INSERT_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `INSERT_TIME` datetime DEFAULT NULL,
  `MODIFY_OPERATOR` varchar(255) DEFAULT NULL,
  `MODIFY_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `APP_NAME` varchar(255) DEFAULT NULL,
  `COST_TIME` bigint(20) DEFAULT NULL,
  `ERROR_MSG` varchar(255) DEFAULT NULL,
  `EXECUTING_STATUS` varchar(255) DEFAULT NULL,
  `EXECUTING_TYPE` varchar(255) DEFAULT NULL,
  `PROJECT_NAME` varchar(255) DEFAULT NULL,
  `TASK_EXECUTING_PARAMS` varchar(255) DEFAULT NULL,
  `DOCKER_IMAGE_NAME` varchar(255) DEFAULT NULL,
  `FILE_SIZE` bigint(20) DEFAULT NULL,
  `MODULE_NAME` varchar(255) DEFAULT NULL,
  `NAME_SPACE` varchar(255) DEFAULT NULL,
  `PROCESS_STATUS` varchar(255) DEFAULT NULL,
  `REPS_BRANCH` varchar(255) DEFAULT NULL,
  `RESULT_FILE_URL` varchar(255) DEFAULT NULL,
  `RUN_NODE_NAME` varchar(255) DEFAULT NULL,
  `RUN_POD_NAME` varchar(255) DEFAULT NULL,
  `TARGET_TYPE` varchar(255) DEFAULT NULL,
  `VERSION` varchar(255) DEFAULT NULL,
  `APP_ID` bigint(20) DEFAULT NULL,
  `JOB_EXECUTING_ID` bigint(20) DEFAULT NULL,
  `TASK_EXECUTING_ID` bigint(20) DEFAULT NULL,
  `BUILD_TASK_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=110004 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `nbo_build_task_temp`
-- ----------------------------
DROP TABLE IF EXISTS `nbo_build_task_temp`;
CREATE TABLE `nbo_build_task_temp` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `INSERT_OPERATOR` varchar(255) DEFAULT NULL,
  `INSERT_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `INSERT_TIME` datetime DEFAULT NULL,
  `MODIFY_OPERATOR` varchar(255) DEFAULT NULL,
  `MODIFY_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `ACTION_TYPE` varchar(255) DEFAULT NULL,
  `BUILD_COMMAND` varchar(255) DEFAULT NULL,
  `BUILD_ENV` varchar(255) DEFAULT NULL,
  `BUILD_ENV_VERSION` varchar(255) DEFAULT NULL,
  `BUILD_TOOLS` varchar(255) DEFAULT NULL,
  `BUILD_TOOLS_VERSION` varchar(255) DEFAULT NULL,
  `SUPPORT_CODE_TYPE` varchar(255) DEFAULT NULL,
  `TARGET_TYPE` varchar(255) DEFAULT NULL,
  `TASK_TEMPLATE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=110004 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `nbo_build_task_temp`
-- ----------------------------
BEGIN;
INSERT INTO `nbo_build_task_temp` VALUES ('1', null, null, null, null, null, null, 'package', 'mvn package -Dmaven.test.skip=true', 'java', 'jdk1.8', 'maven', null, 'java', 'docker', '1'), ('2', null, null, null, null, null, null, 'package', 'npm run build', 'nodejs', '静态资源6.11.0', 'grunt', null, 'nodejs', 's3', '5'), ('3', null, null, null, null, null, null, 'package', 'npm run build', 'nodejs', '静态资源6.11.0', 'webpack', null, 'nodejs', 's3', '6'), ('4', null, null, null, null, null, null, 'package', 'npm run build', 'nodejs', '静态资源6.11.0', 'gulp', null, 'nodejs', 's3', '7'), ('5', null, null, null, null, null, null, 'package', 'npm run build', 'nodejs', '静态资源6.11.0', 'zip', null, 'nodejs', 's3', '9'), ('10001', null, null, '2017-03-17 16:44:57', null, null, null, 'package', 'mvn package -Dmaven.test.skip=true', 'java', 'jdk1.8', 'maven', 'maven3', 'java', 's3', '100007'), ('20001', null, null, '2017-03-17 16:44:57', null, null, null, 'package', null, 'ios', 'ios', 'xcode', null, 'ios', 'ipa', '100008'), ('30001', null, null, '2017-03-17 16:44:57', null, null, null, 'package', null, 'android', 'android25', 'gradle', '2.5', 'android', 'apk', '100009'), ('40001', null, null, '2017-03-17 16:44:57', null, null, null, 'package', null, 'java', 'jdk1.8', 'ant', null, 'java', 'docker', '100010'), ('50001', null, null, '2017-03-17 16:44:57', null, null, null, 'package', null, 'java', 'jdk1.8', 'ant', null, 'java', 's3', '100011'), ('60001', null, null, '2017-03-17 16:44:57', null, null, null, 'deploy', 'mvn deploy -Dmaven.test.skip=true', 'java', 'jdk1.8', 'maven', 'maven3', 'java', 's3', '100012'), ('80001', null, null, '2017-03-17 16:44:57', null, null, null, 'package', null, 'android', 'android25', 'ant', null, 'android', 'apk', '100014'), ('90001', null, null, '2017-03-17 16:44:57', null, null, null, 'package', null, 'php', 'php', 'tar', null, 'php', 'docker', '100015'), ('110002', null, null, '2017-08-03 10:02:56', null, null, null, 'package', 'aa', 'java', 'jdk1.6.0', 'maven', 'maven3', 'java', 'docker', '110006'), ('110003', null, null, '2017-08-03 11:18:41', null, null, null, 'package', null, 'java', 'jdk1.6.0', 'maven', 'maven3', 'java', 'docker', '110007');
COMMIT;

-- ----------------------------
--  Table structure for `nbo_certificate_conf`
-- ----------------------------
DROP TABLE IF EXISTS `nbo_certificate_conf`;
CREATE TABLE `nbo_certificate_conf` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `INSERT_OPERATOR` varchar(255) DEFAULT NULL,
  `INSERT_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `INSERT_TIME` datetime DEFAULT NULL,
  `MODIFY_OPERATOR` varchar(255) DEFAULT NULL,
  `MODIFY_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `PRODUCT_BUNDLE_IDENTIFIER` varchar(255) DEFAULT NULL,
  `CERTIFICATE_TYPE` varchar(255) DEFAULT NULL,
  `CODE_SIGN_IDENTITY` varchar(255) DEFAULT NULL,
  `CODE_TYPE` varchar(255) DEFAULT NULL,
  `DEVELOPMENT_TEAM` varchar(255) DEFAULT NULL,
  `PROVISIONING_PROFILE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=110001 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `nbo_codecheck_task`
-- ----------------------------
DROP TABLE IF EXISTS `nbo_codecheck_task`;
CREATE TABLE `nbo_codecheck_task` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `INSERT_OPERATOR` varchar(255) DEFAULT NULL,
  `INSERT_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `INSERT_TIME` datetime DEFAULT NULL,
  `MODIFY_OPERATOR` varchar(255) DEFAULT NULL,
  `MODIFY_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `MODULE_NAME` varchar(255) DEFAULT NULL,
  `NAME_SPACE` varchar(255) DEFAULT NULL,
  `REPS_BRANCH` varchar(255) DEFAULT NULL,
  `REPS_PASSWORD` varchar(255) DEFAULT NULL,
  `REPS_TYPE` varchar(255) DEFAULT NULL,
  `REPS_URL` varchar(255) DEFAULT NULL,
  `REPS_USER_NAME` varchar(255) DEFAULT NULL,
  `SUPPORT_CODE_TYPE` varchar(255) DEFAULT NULL,
  `TAG_NAME` varchar(255) DEFAULT NULL,
  `TASK_NAME` varchar(255) DEFAULT NULL,
  `APP_ID` bigint(20) DEFAULT NULL,
  `TASK_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=110003 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `nbo_codecheck_task_exec`
-- ----------------------------
DROP TABLE IF EXISTS `nbo_codecheck_task_exec`;
CREATE TABLE `nbo_codecheck_task_exec` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `INSERT_OPERATOR` varchar(255) DEFAULT NULL,
  `INSERT_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `INSERT_TIME` datetime DEFAULT NULL,
  `MODIFY_OPERATOR` varchar(255) DEFAULT NULL,
  `MODIFY_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `APP_NAME` varchar(255) DEFAULT NULL,
  `COST_TIME` bigint(20) DEFAULT NULL,
  `ERROR_MSG` varchar(255) DEFAULT NULL,
  `EXECUTING_STATUS` varchar(255) DEFAULT NULL,
  `EXECUTING_TYPE` varchar(255) DEFAULT NULL,
  `PROJECT_NAME` varchar(255) DEFAULT NULL,
  `TASK_EXECUTING_PARAMS` varchar(255) DEFAULT NULL,
  `NAME_SPACE` varchar(255) DEFAULT NULL,
  `POD_NAME` varchar(255) DEFAULT NULL,
  `PROCESS_STATUS` varchar(255) DEFAULT NULL,
  `REPS_BRANCH` varchar(255) DEFAULT NULL,
  `RESULT_URL` varchar(255) DEFAULT NULL,
  `APP_ID` bigint(20) DEFAULT NULL,
  `JOB_EXECUTING_ID` bigint(20) DEFAULT NULL,
  `TASK_EXECUTING_ID` bigint(20) DEFAULT NULL,
  `CODE_CHECK_TASK_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=110004 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `nbo_codecheck_task_temp`
-- ----------------------------
DROP TABLE IF EXISTS `nbo_codecheck_task_temp`;
CREATE TABLE `nbo_codecheck_task_temp` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `INSERT_OPERATOR` varchar(255) DEFAULT NULL,
  `INSERT_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `INSERT_TIME` datetime DEFAULT NULL,
  `MODIFY_OPERATOR` varchar(255) DEFAULT NULL,
  `MODIFY_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `CHECK_COMMAND` varchar(255) DEFAULT NULL,
  `CHECK_ENV` varchar(255) DEFAULT NULL,
  `CHECK_ENV_VERSION` varchar(255) DEFAULT NULL,
  `CHECK_TOOLS` varchar(255) DEFAULT NULL,
  `CHECK_TOOLS_VERSION` varchar(255) DEFAULT NULL,
  `SUPPORT_CODE_TYPE` varchar(255) DEFAULT NULL,
  `TARGET_TYPE` varchar(255) DEFAULT NULL,
  `TASK_TEMPLATE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=110001 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `nbo_codecheck_task_temp`
-- ----------------------------
BEGIN;
INSERT INTO `nbo_codecheck_task_temp` VALUES ('1', null, null, null, null, null, '2017-03-17 16:44:57', null, 'java', 'jdk1.8', 'sonar', 'sonar2.4', 'java', 'report', '2'), ('2', null, null, null, null, null, null, null, 'nodejs', '静态资源6.11.0', 'sonar', '2.4', 'nodejs', 'report', '8'), ('3', null, null, '2017-03-17 16:44:57', null, null, null, null, 'ios', 'ios', 'sonar', '2.4', 'ios', 'report', '100003'), ('4', null, null, null, null, null, null, null, 'android', 'android25', 'sonar', '2.4', 'android', 'report', '100002');
COMMIT;

-- ----------------------------
--  Table structure for `nbo_container_spec`
-- ----------------------------
DROP TABLE IF EXISTS `nbo_container_spec`;
CREATE TABLE `nbo_container_spec` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `INSERT_OPERATOR` varchar(255) DEFAULT NULL,
  `INSERT_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `INSERT_TIME` datetime DEFAULT NULL,
  `MODIFY_OPERATOR` varchar(255) DEFAULT NULL,
  `MODIFY_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `CPU` varchar(255) DEFAULT NULL,
  `MEMORY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=110001 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `nbo_container_spec`
-- ----------------------------
BEGIN;
INSERT INTO `nbo_container_spec` VALUES ('1', null, null, '2017-03-17 16:44:57', null, null, null, '1', '1G'), ('2', null, null, '2017-03-17 16:44:57', null, null, '2017-03-17 16:44:57', '4', '1G');
COMMIT;

-- ----------------------------
--  Table structure for `nbo_deploy_host_result`
-- ----------------------------
DROP TABLE IF EXISTS `nbo_deploy_host_result`;
CREATE TABLE `nbo_deploy_host_result` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `INSERT_OPERATOR` varchar(255) DEFAULT NULL,
  `INSERT_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `INSERT_TIME` datetime DEFAULT NULL,
  `MODIFY_OPERATOR` varchar(255) DEFAULT NULL,
  `MODIFY_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `CHECK_STATUS` varchar(255) DEFAULT NULL,
  `INNER_URL` varchar(255) DEFAULT NULL,
  `POD_IMAGE` varchar(255) DEFAULT NULL,
  `POD_NAME` varchar(255) DEFAULT NULL,
  `POD_STATUS` varchar(255) DEFAULT NULL,
  `RUNNING_STATUS` varchar(255) DEFAULT NULL,
  `DEPLOY_VERSION_ID` bigint(20) DEFAULT NULL,
  `PROJECT_HOST_ENV_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `nbo_deploy_task_exec`
-- ----------------------------
DROP TABLE IF EXISTS `nbo_deploy_task_exec`;
CREATE TABLE `nbo_deploy_task_exec` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `INSERT_OPERATOR` varchar(255) DEFAULT NULL,
  `INSERT_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `INSERT_TIME` datetime DEFAULT NULL,
  `MODIFY_OPERATOR` varchar(255) DEFAULT NULL,
  `MODIFY_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `APP_NAME` varchar(255) DEFAULT NULL,
  `COST_TIME` bigint(20) DEFAULT NULL,
  `ERROR_MSG` varchar(255) DEFAULT NULL,
  `EXECUTING_STATUS` varchar(255) DEFAULT NULL,
  `EXECUTING_TYPE` varchar(255) DEFAULT NULL,
  `PROJECT_NAME` varchar(255) DEFAULT NULL,
  `TASK_EXECUTING_PARAMS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_NAME` varchar(255) DEFAULT NULL,
  `OPERATION_TYPE` varchar(255) DEFAULT NULL,
  `OPERATOR_NAME` varchar(255) DEFAULT NULL,
  `APP_ID` bigint(20) DEFAULT NULL,
  `JOB_EXECUTING_ID` bigint(20) DEFAULT NULL,
  `TASK_EXECUTING_ID` bigint(20) DEFAULT NULL,
  `APP_DEPLOY_VERSION_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=110016 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `nbo_deploy_task_temp`
-- ----------------------------
DROP TABLE IF EXISTS `nbo_deploy_task_temp`;
CREATE TABLE `nbo_deploy_task_temp` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `INSERT_OPERATOR` varchar(255) DEFAULT NULL,
  `INSERT_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `INSERT_TIME` datetime DEFAULT NULL,
  `MODIFY_OPERATOR` varchar(255) DEFAULT NULL,
  `MODIFY_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `APP_TYPE` varchar(255) DEFAULT NULL,
  `COMMAND` varchar(255) DEFAULT NULL,
  `DOCKER_IMAGE` varchar(255) DEFAULT NULL,
  `SERVER_NAME` varchar(255) DEFAULT NULL,
  `SERVER_ROOT` varchar(255) DEFAULT NULL,
  `SERVER_VERSION` varchar(255) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `nbo_deploy_version`
-- ----------------------------
DROP TABLE IF EXISTS `nbo_deploy_version`;
CREATE TABLE `nbo_deploy_version` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `INSERT_OPERATOR` varchar(255) DEFAULT NULL,
  `INSERT_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `INSERT_TIME` datetime DEFAULT NULL,
  `MODIFY_OPERATOR` varchar(255) DEFAULT NULL,
  `MODIFY_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `APPLICATION_CLASS_LOADER` varchar(255) DEFAULT NULL,
  `CHECK_UP` varchar(255) DEFAULT NULL,
  `CN_NAME` varchar(255) DEFAULT NULL,
  `CONFIGMAP_NAME` varchar(255) DEFAULT NULL,
  `CONFIGMAP_ROOT_DIR` varchar(255) DEFAULT NULL,
  `CONTEXT_ROOT` varchar(255) DEFAULT NULL,
  `CPU` bigint(10) DEFAULT NULL,
  `CPU_UTILIZATION` bigint(10) DEFAULT NULL,
  `DATA_SOURCE_MARK` varchar(255) DEFAULT NULL,
  `DEPLOY_IMAGE_NAME` varchar(255) DEFAULT NULL,
  `DEPLOY_PATH` varchar(255) DEFAULT NULL,
  `EN_NAME` varchar(255) DEFAULT NULL,
  `ERROR_MSG` varchar(4000) DEFAULT NULL,
  `INNER_VISIT_URL` varchar(255) DEFAULT NULL,
  `IS_DELETE` bigint(1) DEFAULT NULL,
  `K8S_DEPLOYMENT_NAME` varchar(255) DEFAULT NULL,
  `K8S_CLUSTER_IP` varchar(255) DEFAULT NULL,
  `K8S_SERVICE_NAME` varchar(255) DEFAULT NULL,
  `LOG_PATH` varchar(255) DEFAULT NULL,
  `MAX_REPLICAS` bigint(10) DEFAULT NULL,
  `MEMORY` bigint(10) DEFAULT NULL,
  `MEMORY_UTILIZATION` bigint(10) DEFAULT NULL,
  `MIN_REPLICAS` bigint(10) DEFAULT NULL,
  `NAMESPACE` varchar(255) DEFAULT NULL,
  `REPLICAS_COUNT` bigint(10) DEFAULT NULL,
  `RESTART_COUNT` bigint(10) DEFAULT NULL,
  `SCALE_TYPE` varchar(255) DEFAULT NULL,
  `DEPLOY_STATUS` varchar(255) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `VERSION_NAME` varchar(255) DEFAULT NULL,
  `VERSION_NO` varchar(255) DEFAULT NULL,
  `VISIT_URL` varchar(255) DEFAULT NULL,
  `WAR_CLASS_LOADER` varchar(255) DEFAULT NULL,
  `APP_ID` bigint(20) DEFAULT NULL,
  `APP_DEPLOY_ID` bigint(20) DEFAULT NULL,
  `APP_RUNTIME_ENV_ID` bigint(20) DEFAULT NULL,
  `K8S_ENV_ID` bigint(20) DEFAULT NULL,
  `PROJECT_ID` bigint(20) DEFAULT NULL,
  `PROJECT_DOCKER_ENV_ID` bigint(20) DEFAULT NULL,
  `PROJECT_ENV_ID` bigint(20) DEFAULT NULL,
  `PROJECT_HOST_ENV_ID` bigint(20) DEFAULT NULL,
  `JSESSION` varchar(255) DEFAULT NULL,
  `JVM` varchar(200) DEFAULT NULL,
  `CONTAINER_SPEC_ID` bigint(20) DEFAULT NULL,
  `PATTERN_TYPE` bigint(1) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=110003 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `nbo_env_docker`
-- ----------------------------
DROP TABLE IF EXISTS `nbo_env_docker`;
CREATE TABLE `nbo_env_docker` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `INSERT_OPERATOR` varchar(255) DEFAULT NULL,
  `INSERT_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `INSERT_TIME` datetime DEFAULT NULL,
  `MODIFY_OPERATOR` varchar(255) DEFAULT NULL,
  `MODIFY_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `K8S_RUNTIME_ENV_ID` bigint(20) DEFAULT NULL,
  `PROJECT_ID` bigint(20) DEFAULT NULL,
  `PROJECT_ENV_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=110001 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `nbo_env_host`
-- ----------------------------
DROP TABLE IF EXISTS `nbo_env_host`;
CREATE TABLE `nbo_env_host` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `INSERT_OPERATOR` varchar(255) DEFAULT NULL,
  `INSERT_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `INSERT_TIME` datetime DEFAULT NULL,
  `MODIFY_OPERATOR` varchar(255) DEFAULT NULL,
  `MODIFY_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `CLUSTER_NAME` varchar(255) DEFAULT NULL,
  `CONSOLE_PASSWORD` varchar(255) DEFAULT NULL,
  `CONSOLE_PORT` varchar(255) DEFAULT NULL,
  `CONSOLE_USER_NAME` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_DIRECTORY` varchar(255) DEFAULT NULL,
  `HOME_DIRECTORY` varchar(255) DEFAULT NULL,
  `HOST_IP` varchar(255) DEFAULT NULL,
  `HOST_NAME` varchar(255) DEFAULT NULL,
  `HOST_PASSWORD` varchar(255) DEFAULT NULL,
  `HOST_PORT` varchar(255) DEFAULT NULL,
  `HOST_USER_NAME` varchar(255) DEFAULT NULL,
  `IS_CLUSTER` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `WAS_CELL_NAME` varchar(255) DEFAULT NULL,
  `WAS_CLUSTER_NAME` varchar(255) DEFAULT NULL,
  `WAS_NODE_NAME` varchar(255) DEFAULT NULL,
  `WAS_SERVER_NAME` varchar(255) DEFAULT NULL,
  `PROJECT_ID` bigint(20) DEFAULT NULL,
  `PROJECT_ENV_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `nbo_git`
-- ----------------------------
DROP TABLE IF EXISTS `nbo_git`;
CREATE TABLE `nbo_git` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `INSERT_OPERATOR` varchar(255) DEFAULT NULL,
  `INSERT_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `INSERT_TIME` datetime DEFAULT NULL,
  `MODIFY_OPERATOR` varchar(255) DEFAULT NULL,
  `MODIFY_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `GITUSERID` bigint(10) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `USER_NAME` varchar(255) DEFAULT NULL,
  `USER_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `nbo_jndi_config`
-- ----------------------------
DROP TABLE IF EXISTS `nbo_jndi_config`;
CREATE TABLE `nbo_jndi_config` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `INSERT_OPERATOR` varchar(255) DEFAULT NULL,
  `INSERT_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `INSERT_TIME` datetime DEFAULT NULL,
  `MODIFY_OPERATOR` varchar(255) DEFAULT NULL,
  `MODIFY_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `ACQUIRE_INCREMENT` varchar(255) DEFAULT NULL,
  `ACQUIRE_RETRY_ATTEMPTS` varchar(255) DEFAULT NULL,
  `ACQUIRE_RETRY_DELAY` varchar(255) DEFAULT NULL,
  `AUTH` varchar(255) DEFAULT NULL,
  `BREAK_AFTER_ACQUIRE_FAILURE` varchar(255) DEFAULT NULL,
  `DEPLOY_VERSION_ID` bigint(20) DEFAULT NULL,
  `DRIVER_CLASS` varchar(255) DEFAULT NULL,
  `FACTORY` varchar(255) DEFAULT NULL,
  `IDLE_CONNECTION_TEST_PERIOD` varchar(255) DEFAULT NULL,
  `INITIAL_POOLSIZE` varchar(255) DEFAULT NULL,
  `JDBC_URL` varchar(255) DEFAULT NULL,
  `MAX_IDLE_TIME` varchar(255) DEFAULT NULL,
  `MAX_POOL_SIZE` varchar(255) DEFAULT NULL,
  `MIN_POOL_SIZE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `TEST_CONNECTIO_ON_CHECKIN` varchar(255) DEFAULT NULL,
  `TEST_CONNECTION_ON_CHECKOUT` varchar(255) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `nbo_job`
-- ----------------------------
DROP TABLE IF EXISTS `nbo_job`;
CREATE TABLE `nbo_job` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `INSERT_OPERATOR` varchar(255) DEFAULT NULL,
  `INSERT_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `INSERT_TIME` datetime DEFAULT NULL,
  `MODIFY_OPERATOR` varchar(255) DEFAULT NULL,
  `MODIFY_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `APP_NAME` varchar(255) DEFAULT NULL,
  `JOB_EXECUTIONS` bigint(10) DEFAULT NULL,
  `JOB_NAME` varchar(255) DEFAULT NULL,
  `JOB_PARAMS` varchar(255) DEFAULT NULL,
  `PROJECT_NAME` varchar(255) DEFAULT NULL,
  `APP_ID` bigint(20) DEFAULT NULL,
  `PROJECT_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=110004 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `nbo_job_exec`
-- ----------------------------
DROP TABLE IF EXISTS `nbo_job_exec`;
CREATE TABLE `nbo_job_exec` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `INSERT_OPERATOR` varchar(255) DEFAULT NULL,
  `INSERT_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `INSERT_TIME` datetime DEFAULT NULL,
  `MODIFY_OPERATOR` varchar(255) DEFAULT NULL,
  `MODIFY_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `APP_NAME` varchar(255) DEFAULT NULL,
  `COST_TIME` bigint(20) DEFAULT NULL,
  `ERROR_MSG` varchar(255) DEFAULT NULL,
  `EXECUTING_STATUS` varchar(255) DEFAULT NULL,
  `JOB_PARAMS` varchar(255) DEFAULT NULL,
  `PROJECT_NAME` varchar(255) DEFAULT NULL,
  `VERSION` varchar(255) DEFAULT NULL,
  `APP_ID` bigint(20) DEFAULT NULL,
  `JOB_ID` bigint(20) DEFAULT NULL,
  `PROJECT_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=110006 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `nbo_k8s_runtime_env`
-- ----------------------------
DROP TABLE IF EXISTS `nbo_k8s_runtime_env`;
CREATE TABLE `nbo_k8s_runtime_env` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `INSERT_OPERATOR` varchar(255) DEFAULT NULL,
  `INSERT_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `INSERT_TIME` datetime DEFAULT NULL,
  `MODIFY_OPERATOR` varchar(255) DEFAULT NULL,
  `MODIFY_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `APP_INNER_ACCESS_DOMAIN` varchar(255) DEFAULT NULL,
  `APP_INNER_ACCESS_IP` varchar(255) DEFAULT NULL,
  `APP_PUBLIC_ACCESS_DOMAIN` varchar(255) DEFAULT NULL,
  `APP_PUBLIC_ACCESS_IP` varchar(255) DEFAULT NULL,
  `CERT_DATA` varchar(4000) DEFAULT NULL,
  `DEFAULT_ENV` bigint(1) DEFAULT NULL,
  `K8S_URL` varchar(255) DEFAULT NULL,
  `KEY_DATA` varchar(4000) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REGISTRY_URL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `nbo_k8s_runtime_env`
-- ----------------------------
BEGIN;
INSERT INTO `nbo_k8s_runtime_env` VALUES ('1', null, null, null, null, null, '2017-08-01 15:28:10', 'default.svc.newtouch.local', null, 'one5.newtouch.com', null, 'LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUQzVENDQXNXZ0F3SUJBZ0lVZWJ1SjhlY1pSU2tZU0ZNdkRLS1ZlVVlWbUZ3d0RRWUpLb1pJaHZjTkFRRUwKQlFBd1pURUxNQWtHQTFVRUJoTUNRMDR4RURBT0JnTlZCQWdUQjBKbGFVcHBibWN4RURBT0JnTlZCQWNUQjBKbAphVXBwYm1jeEREQUtCZ05WQkFvVEEyczRjekVQTUEwR0ExVUVDeE1HVTNsemRHVnRNUk13RVFZRFZRUURFd3ByCmRXSmxjbTVsZEdWek1CNFhEVEUzTURjeU5EQTJNVGd3TUZvWERURTRNRGN5TkRBMk1UZ3dNRm93YXpFTE1Ba0cKQTFVRUJoTUNRMDR4RURBT0JnTlZCQWdUQjBKbGFVcHBibWN4RURBT0JnTlZCQWNUQjBKbGFVcHBibWN4RnpBVgpCZ05WQkFvVERuTjVjM1JsYlRwdFlYTjBaWEp6TVE4d0RRWURWUVFMRXdaVGVYTjBaVzB4RGpBTUJnTlZCQU1UCkJXRmtiV2x1TUlJQklqQU5CZ2txaGtpRzl3MEJBUUVGQUFPQ0FROEFNSUlCQ2dLQ0FRRUF3cURtaWF6TFZBbVQKS3pvVnpwT0xBalFFc1lFbVRrQkFJYm1YQTVDL1g2MHprOWJTRklKWWFBZC95SXJQV2hhV0tPWkFWNlR0THNYbAovQ2ZFWUZQeVlLUDIwUkJLTTJIWmI0NDdFZHhSRTZPVGtkVS9YMFdIWkhPNzFhVjVFNTB6TERWUHhtVVhlZlluCkpQcG1jYnM5c0d1K3hJRU5mUTQ3eDVNNUpYWFBURzN4ZUM4NXJmayszOTdoZGU0QlNidUxaNGJrMWtETUZDMmIKYlZZRmtOdFp6L0tuWlJ5eCtOSWpGcm1xSmdLZlgxVkJYRHduYnEyT1ZYbTdrcDNVZ2hPT0lzNDdGZkMwZFB6ZApuenpwbFBJKzdxMGNucStiVlNOQ2ZLa0xRbFRGMTRoQXoxbjhXUjFOSnZOZWRuTFk0L1gwclZUTEppcXYwQ0p2CkhNUGxWekEzVXdJREFRQUJvMzh3ZlRBT0JnTlZIUThCQWY4RUJBTUNCYUF3SFFZRFZSMGxCQll3RkFZSUt3WUIKQlFVSEF3RUdDQ3NHQVFVRkJ3TUNNQXdHQTFVZEV3RUIvd1FDTUFBd0hRWURWUjBPQkJZRUZMYjhpWVRqdFdhdgp2R244ZXlSRDUzTk5NWjNiTUI4R0ExVWRJd1FZTUJhQUZJcVBkQ3Jrd0gvay9tb2hxMm5PbjdPRzFmcGJNQTBHCkNTcUdTSWIzRFFFQkN3VUFBNElCQVFDekZkZ0tneFRuTUJiSHZMQlMySkNST05FdTZQS0pyUmVWckQrcUVxWjkKbC9lN0h5QkxaV3BLTlhJZnlGTEFrZmRjSFRGQmx4MWYzbHVQT3hyOUlkTHlEeGxVQlA4azkvS3hCNjJxRUdMRApIZ3hEL3AvY0xMNnhEMWJYNGRwREdDMWg3QllTQXZsM0FuU1E5VXhsb1dLbXhQWGhmSlYrRkg3RHZxZmdSQkQ2CkVRbXdIYlJicGdMckh6RHlDNjlWVWsrM2VKdzJxWUpucjF3TitlTzhodEREOTBzVTFvOE9rZDUyekxSOVRWdmUKdjI2aURWc3padjVSU1l2RUtlQ3NaeGxqRGJST2l1c1BNblByRElyNGlMVzdCM1ZDdkRkZ0VJNEdBSHV1b3VUbAp1aCttUis1T012MXQ3YnVERWFhSCtjajdtdTRzUitVcUdPTUozSzVwaDE0MAotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg==', '1', 'http://www.one5.newtouch.com:6443', 'LS0tLS1CRUdJTiBSU0EgUFJJVkFURSBLRVktLS0tLQpNSUlFb3dJQkFBS0NBUUVBd3FEbWlhekxWQW1US3pvVnpwT0xBalFFc1lFbVRrQkFJYm1YQTVDL1g2MHprOWJTCkZJSllhQWQveUlyUFdoYVdLT1pBVjZUdExzWGwvQ2ZFWUZQeVlLUDIwUkJLTTJIWmI0NDdFZHhSRTZPVGtkVS8KWDBXSFpITzcxYVY1RTUwekxEVlB4bVVYZWZZbkpQcG1jYnM5c0d1K3hJRU5mUTQ3eDVNNUpYWFBURzN4ZUM4NQpyZmsrMzk3aGRlNEJTYnVMWjRiazFrRE1GQzJiYlZZRmtOdFp6L0tuWlJ5eCtOSWpGcm1xSmdLZlgxVkJYRHduCmJxMk9WWG03a3AzVWdoT09JczQ3RmZDMGRQemRuenpwbFBJKzdxMGNucStiVlNOQ2ZLa0xRbFRGMTRoQXoxbjgKV1IxTkp2TmVkbkxZNC9YMHJWVExKaXF2MENKdkhNUGxWekEzVXdJREFRQUJBb0lCQUNxTTh0bjJwUjFpV29LQQoySE9wWGlMRkxLR0NFdFhZeGl5WlhxS3c2cVlJUDlaNmlNTmpHK0RpZ3RWZFE2ZjJlQzNJNlJoQVBucVRXWXlmClJSZXFRcnRPSFkvbmQ5RnordzJna3RsOHlWejV6akY3NWJiMmhIczVzajhyUmlVN29ReHhPMWVza2sxZnUzOGkKSDNPTjlCYTE5NmNPYjl4L1dDSngxWFNUSlJjWU1KenF0T0dtSC9SRUdSS2QyRVNCd0cxK2F2M1Z6cW5Fb29LcgphV3IycUVpdW1iL1N3MFBPMHRUTlptTHpwdGFZd3ZKaHZOTHpUQlNkK1ltS3lISks5RjVrNTdGNlJyOThnRkt4CmlFZHdvMXNmeUQwMDRQNXowN0IxVm0zbjdqdllpNVNVRG92RmdTeFFJVFcvSmlHVHB5RmxYSUJnOWpqQmZrTHoKOUV4STI0RUNnWUVBNkRhMkJVL05kbUNZUzI4K0JlNXZXcXEzVDZ5Z3VSbDFIWlVZVjhIZFB2NFV0WnduVjNCRQp3Z2JjSnB0a0FQRjQ5Umg2S2o5Z2ZIeVFQLzQ1TUNza0hEWkRJNC9NNVJGQ3gvdytKODc1bm5ZUm9HeHJEYi9KCmVNYmI0Y3R4WE1oRnJSVHlDbk1nRkRlRU92cGNZWk1FYVNzN3ZVVklrdHlMZEd5RWU3bkw0R2tDZ1lFQTFwQ1oKNTYwRXU1Y1M0L01mMlpUZGVCT1lIVTR6N3ZlRVl0ZVFPVE41MUlHekJSd1JLOUdPUXRabWlJbTV2ckZWZXhlQgpybnhYaFh3YitQR25XNk1QV0FjLzhQVzlDTkdXV292eSs2VTQ1Z09nLytVaUl5M0hQVVVCZnlzcE80bkhZQzNuCjBVL1ZRVEZ5blFUZk9TQXJrSkJQc1pUaTJrL3VuZnhrdTROdG9sc0NnWUJGcTd5YkJXR0E1ZVJycFptM1Q5MkwKRjNOZWJVM2ZtMXEvSUcrb1ROc2p2am5hYjFxQ2FvWEdyU1k2VXg4REJYQWtJVTd1QkF2ZjdjT2QzNW1xOFJhcApmRUpTbGgrRWp0UTVpbDNmdGNMQkgyMlVjMUwvVWc2UnRTQmRzNXQwbWdZRnN5WVhxb2p5WitHOWpFWlJaRG5MCmtCUWhhbnNtelJMdVFHelRibUJVR1FLQmdRQ2IvMFhtU3NUR0huQjlpcVg5YTE0Wmp5VnBLUkpaQzF3VkFPUzYKc2RKQnpvcDVqSTV2YlV3aERBQkFCT0ltNG9kamx4T1I2SlU1VjZKK3ZETVJUTnc3QkFwWkJsRUp1RmU0UFVmTAo3YlFRaDFMbXVaQzRRdkE0ZTVNN0FnWllZek94bWE2Ulg1bU1iSWNINGlMcFJacG00SVVRZDA3M3FtV3lOMjZGClptaXZRUUtCZ0R4MGNNa0xDMEF6cElvNFlYcHM5RVpTdHFhRkxDM3VrOGd2cVFodDlHNi9jR2ZNbGNVVXp4Z1IKNkxQaytsWkdPYnA1ZUJkWXVtdUZrVDEwcmFEai8zZDRUTGttQWo1WC8zNGUzYjZxc0VlMDNYTEliYlZ1YndKRAp0SWFsVm1NSXRCSDk2eFBzencvWkVrUFJDeGdTQ2tMWXNEMldtREc2azhPdmFDL3JWY2wzCi0tLS0tRU5EIFJTQSBQUklWQVRFIEtFWS0tLS0tCg==', 'ONE5开发测试环境', '10.26.7.81:5000');
COMMIT;

-- ----------------------------
--  Table structure for `nbo_mac`
-- ----------------------------
DROP TABLE IF EXISTS `nbo_mac`;
CREATE TABLE `nbo_mac` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `INSERT_OPERATOR` varchar(255) DEFAULT NULL,
  `INSERT_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `INSERT_TIME` datetime DEFAULT NULL,
  `MODIFY_OPERATOR` varchar(255) DEFAULT NULL,
  `MODIFY_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `MAC_HOST` varchar(255) DEFAULT NULL,
  `MAC_PORT` varchar(255) DEFAULT NULL,
  `MAC_USERNAME` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `MAC_PASSWORD` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `nbo_maven_conf`
-- ----------------------------
DROP TABLE IF EXISTS `nbo_maven_conf`;
CREATE TABLE `nbo_maven_conf` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `INSERT_OPERATOR` varchar(255) DEFAULT NULL,
  `INSERT_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `INSERT_TIME` datetime DEFAULT NULL,
  `MODIFY_OPERATOR` varchar(255) DEFAULT NULL,
  `MODIFY_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REPOSITORY_ID` varchar(255) DEFAULT NULL,
  `REPOSITORY_URL` varchar(255) DEFAULT NULL,
  `SERVER_PASSWORD` varchar(255) DEFAULT NULL,
  `SERVER_USER_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=110001 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `nbo_mirrors`
-- ----------------------------
DROP TABLE IF EXISTS `nbo_mirrors`;
CREATE TABLE `nbo_mirrors` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `INSERT_OPERATOR` varchar(255) DEFAULT NULL,
  `INSERT_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `INSERT_TIME` datetime DEFAULT NULL,
  `MODIFY_OPERATOR` varchar(255) DEFAULT NULL,
  `MODIFY_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `MVNID` varchar(255) DEFAULT NULL,
  `MVNUSERNAME` varchar(255) DEFAULT NULL,
  `MVNPASSWORD` varchar(255) DEFAULT NULL,
  `MVNREPOSITORYURL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `nbo_mount_directory`
-- ----------------------------
DROP TABLE IF EXISTS `nbo_mount_directory`;
CREATE TABLE `nbo_mount_directory` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `INSERT_OPERATOR` varchar(200) DEFAULT NULL,
  `INSERT_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `INSERT_TIME` datetime DEFAULT NULL,
  `MODIFY_OPERATOR` varchar(200) DEFAULT NULL,
  `MODIFY_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `HOST_DIR` varchar(200) DEFAULT NULL,
  `CONTAINER_DIR` varchar(200) DEFAULT NULL,
  `DEPLOY_VERSION_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `nbo_mount_directory`
-- ----------------------------
BEGIN;
INSERT INTO `nbo_mount_directory` VALUES ('6', null, null, '2017-03-17 16:44:57', null, null, '2017-03-17 16:44:57', '/root', '/opt', '10');
COMMIT;

-- ----------------------------
--  Table structure for `nbo_opt_permission`
-- ----------------------------
DROP TABLE IF EXISTS `nbo_opt_permission`;
CREATE TABLE `nbo_opt_permission` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `CODE` varchar(20) DEFAULT NULL,
  `NAME` varchar(30) DEFAULT NULL,
  `TYPE` varchar(10) DEFAULT NULL,
  `INSERT_TIME` datetime DEFAULT NULL,
  `INSERT_OPERATOR` varchar(100) DEFAULT NULL,
  `INSERT_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `MODIFY_OPERATOR` varchar(100) DEFAULT NULL,
  `MODIFY_OPERATOR_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `nbo_opt_permission`
-- ----------------------------
BEGIN;
INSERT INTO `nbo_opt_permission` VALUES ('100', 'APP_DEV', '应用开发', 'APP', null, null, null, null, null, null), ('101', 'APP_TEST', '应用测试', 'APP', null, null, null, null, null, null), ('102', 'ENV_DEV_ENV', '开发环境', 'ENV', null, null, null, null, null, null), ('103', 'ENV_FUN_ENV', '功能测试环境(FT)', 'ENV', null, null, null, null, null, null), ('104', 'ENV_SYSTEM_TEST_ENV', '系统测试环境(ST)', 'ENV', null, null, null, null, null, null), ('105', 'ENV_USER_VALID_ENV', '用户验证环境(UAT)', 'ENV', null, null, null, null, null, null), ('107', 'APP_TEST_APPLY', '测试申请', 'APP', null, null, null, null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `nbo_org_tree`
-- ----------------------------
DROP TABLE IF EXISTS `nbo_org_tree`;
CREATE TABLE `nbo_org_tree` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `INSERT_OPERATOR` varchar(255) DEFAULT NULL,
  `INSERT_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `INSERT_TIME` date DEFAULT NULL,
  `MODIFY_OPERATOR` varchar(255) DEFAULT NULL,
  `MODIFY_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `MODIFY_TIME` date DEFAULT NULL,
  `ORG_NAME` varchar(255) DEFAULT NULL,
  `ORG_CODE` varchar(255) DEFAULT NULL,
  `PARENTID` varchar(255) DEFAULT NULL,
  `STATUS` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `nbo_org_tree`
-- ----------------------------
BEGIN;
INSERT INTO `nbo_org_tree` VALUES ('1', null, null, '2017-07-29', null, null, null, '集团', '001', null, '0'), ('2', null, null, '2017-07-29', null, null, '2017-08-03', '开发一部', '0012', '1', '0'), ('3', null, null, '2017-08-02', null, null, null, '开发二部', '002', '2', '0'), ('4', null, null, '2017-08-02', null, null, null, '测试机构', '009999', '3', '0');
COMMIT;

-- ----------------------------
--  Table structure for `nbo_parameters`
-- ----------------------------
DROP TABLE IF EXISTS `nbo_parameters`;
CREATE TABLE `nbo_parameters` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `INSERT_OPERATOR` varchar(255) DEFAULT NULL,
  `INSERT_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `INSERT_TIME` datetime DEFAULT NULL,
  `MODIFY_OPERATOR` varchar(255) DEFAULT NULL,
  `MODIFY_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `DESC_` varchar(255) DEFAULT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `VALUE_` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `nbo_parameters`
-- ----------------------------
BEGIN;
INSERT INTO `nbo_parameters` VALUES ('1', null, null, null, null, null, '2017-08-02 18:01:34', 'Kubernetes访问地址，可以是域名访问地址也可以是http://ip+port', 'k8s.url', null, null, 'http://www.one5.newtouch.com:6443'), ('2', null, null, null, null, null, '2017-08-02 18:01:34', 'k8s证书', 'k8s.cert.data', null, null, 'LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUQzVENDQXNXZ0F3SUJBZ0lVZWJ1SjhlY1pSU2tZU0ZNdkRLS1ZlVVlWbUZ3d0RRWUpLb1pJaHZjTkFRRUwKQlFBd1pURUxNQWtHQTFVRUJoTUNRMDR4RURBT0JnTlZCQWdUQjBKbGFVcHBibWN4RURBT0JnTlZCQWNUQjBKbAphVXBwYm1jeEREQUtCZ05WQkFvVEEyczRjekVQTUEwR0ExVUVDeE1HVTNsemRHVnRNUk13RVFZRFZRUURFd3ByCmRXSmxjbTVsZEdWek1CNFhEVEUzTURjeU5EQTJNVGd3TUZvWERURTRNRGN5TkRBMk1UZ3dNRm93YXpFTE1Ba0cKQTFVRUJoTUNRMDR4RURBT0JnTlZCQWdUQjBKbGFVcHBibWN4RURBT0JnTlZCQWNUQjBKbGFVcHBibWN4RnpBVgpCZ05WQkFvVERuTjVjM1JsYlRwdFlYTjBaWEp6TVE4d0RRWURWUVFMRXdaVGVYTjBaVzB4RGpBTUJnTlZCQU1UCkJXRmtiV2x1TUlJQklqQU5CZ2txaGtpRzl3MEJBUUVGQUFPQ0FROEFNSUlCQ2dLQ0FRRUF3cURtaWF6TFZBbVQKS3pvVnpwT0xBalFFc1lFbVRrQkFJYm1YQTVDL1g2MHprOWJTRklKWWFBZC95SXJQV2hhV0tPWkFWNlR0THNYbAovQ2ZFWUZQeVlLUDIwUkJLTTJIWmI0NDdFZHhSRTZPVGtkVS9YMFdIWkhPNzFhVjVFNTB6TERWUHhtVVhlZlluCkpQcG1jYnM5c0d1K3hJRU5mUTQ3eDVNNUpYWFBURzN4ZUM4NXJmayszOTdoZGU0QlNidUxaNGJrMWtETUZDMmIKYlZZRmtOdFp6L0tuWlJ5eCtOSWpGcm1xSmdLZlgxVkJYRHduYnEyT1ZYbTdrcDNVZ2hPT0lzNDdGZkMwZFB6ZApuenpwbFBJKzdxMGNucStiVlNOQ2ZLa0xRbFRGMTRoQXoxbjhXUjFOSnZOZWRuTFk0L1gwclZUTEppcXYwQ0p2CkhNUGxWekEzVXdJREFRQUJvMzh3ZlRBT0JnTlZIUThCQWY4RUJBTUNCYUF3SFFZRFZSMGxCQll3RkFZSUt3WUIKQlFVSEF3RUdDQ3NHQVFVRkJ3TUNNQXdHQTFVZEV3RUIvd1FDTUFBd0hRWURWUjBPQkJZRUZMYjhpWVRqdFdhdgp2R244ZXlSRDUzTk5NWjNiTUI4R0ExVWRJd1FZTUJhQUZJcVBkQ3Jrd0gvay9tb2hxMm5PbjdPRzFmcGJNQTBHCkNTcUdTSWIzRFFFQkN3VUFBNElCQVFDekZkZ0tneFRuTUJiSHZMQlMySkNST05FdTZQS0pyUmVWckQrcUVxWjkKbC9lN0h5QkxaV3BLTlhJZnlGTEFrZmRjSFRGQmx4MWYzbHVQT3hyOUlkTHlEeGxVQlA4azkvS3hCNjJxRUdMRApIZ3hEL3AvY0xMNnhEMWJYNGRwREdDMWg3QllTQXZsM0FuU1E5VXhsb1dLbXhQWGhmSlYrRkg3RHZxZmdSQkQ2CkVRbXdIYlJicGdMckh6RHlDNjlWVWsrM2VKdzJxWUpucjF3TitlTzhodEREOTBzVTFvOE9rZDUyekxSOVRWdmUKdjI2aURWc3padjVSU1l2RUtlQ3NaeGxqRGJST2l1c1BNblByRElyNGlMVzdCM1ZDdkRkZ0VJNEdBSHV1b3VUbAp1aCttUis1T012MXQ3YnVERWFhSCtjajdtdTRzUitVcUdPTUozSzVwaDE0MAotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg=='), ('3', null, null, null, null, null, '2017-08-02 18:01:34', 'k8s密钥', 'k8s.key.data', null, null, 'LS0tLS1CRUdJTiBSU0EgUFJJVkFURSBLRVktLS0tLQpNSUlFb3dJQkFBS0NBUUVBd3FEbWlhekxWQW1US3pvVnpwT0xBalFFc1lFbVRrQkFJYm1YQTVDL1g2MHprOWJTCkZJSllhQWQveUlyUFdoYVdLT1pBVjZUdExzWGwvQ2ZFWUZQeVlLUDIwUkJLTTJIWmI0NDdFZHhSRTZPVGtkVS8KWDBXSFpITzcxYVY1RTUwekxEVlB4bVVYZWZZbkpQcG1jYnM5c0d1K3hJRU5mUTQ3eDVNNUpYWFBURzN4ZUM4NQpyZmsrMzk3aGRlNEJTYnVMWjRiazFrRE1GQzJiYlZZRmtOdFp6L0tuWlJ5eCtOSWpGcm1xSmdLZlgxVkJYRHduCmJxMk9WWG03a3AzVWdoT09JczQ3RmZDMGRQemRuenpwbFBJKzdxMGNucStiVlNOQ2ZLa0xRbFRGMTRoQXoxbjgKV1IxTkp2TmVkbkxZNC9YMHJWVExKaXF2MENKdkhNUGxWekEzVXdJREFRQUJBb0lCQUNxTTh0bjJwUjFpV29LQQoySE9wWGlMRkxLR0NFdFhZeGl5WlhxS3c2cVlJUDlaNmlNTmpHK0RpZ3RWZFE2ZjJlQzNJNlJoQVBucVRXWXlmClJSZXFRcnRPSFkvbmQ5RnordzJna3RsOHlWejV6akY3NWJiMmhIczVzajhyUmlVN29ReHhPMWVza2sxZnUzOGkKSDNPTjlCYTE5NmNPYjl4L1dDSngxWFNUSlJjWU1KenF0T0dtSC9SRUdSS2QyRVNCd0cxK2F2M1Z6cW5Fb29LcgphV3IycUVpdW1iL1N3MFBPMHRUTlptTHpwdGFZd3ZKaHZOTHpUQlNkK1ltS3lISks5RjVrNTdGNlJyOThnRkt4CmlFZHdvMXNmeUQwMDRQNXowN0IxVm0zbjdqdllpNVNVRG92RmdTeFFJVFcvSmlHVHB5RmxYSUJnOWpqQmZrTHoKOUV4STI0RUNnWUVBNkRhMkJVL05kbUNZUzI4K0JlNXZXcXEzVDZ5Z3VSbDFIWlVZVjhIZFB2NFV0WnduVjNCRQp3Z2JjSnB0a0FQRjQ5Umg2S2o5Z2ZIeVFQLzQ1TUNza0hEWkRJNC9NNVJGQ3gvdytKODc1bm5ZUm9HeHJEYi9KCmVNYmI0Y3R4WE1oRnJSVHlDbk1nRkRlRU92cGNZWk1FYVNzN3ZVVklrdHlMZEd5RWU3bkw0R2tDZ1lFQTFwQ1oKNTYwRXU1Y1M0L01mMlpUZGVCT1lIVTR6N3ZlRVl0ZVFPVE41MUlHekJSd1JLOUdPUXRabWlJbTV2ckZWZXhlQgpybnhYaFh3YitQR25XNk1QV0FjLzhQVzlDTkdXV292eSs2VTQ1Z09nLytVaUl5M0hQVVVCZnlzcE80bkhZQzNuCjBVL1ZRVEZ5blFUZk9TQXJrSkJQc1pUaTJrL3VuZnhrdTROdG9sc0NnWUJGcTd5YkJXR0E1ZVJycFptM1Q5MkwKRjNOZWJVM2ZtMXEvSUcrb1ROc2p2am5hYjFxQ2FvWEdyU1k2VXg4REJYQWtJVTd1QkF2ZjdjT2QzNW1xOFJhcApmRUpTbGgrRWp0UTVpbDNmdGNMQkgyMlVjMUwvVWc2UnRTQmRzNXQwbWdZRnN5WVhxb2p5WitHOWpFWlJaRG5MCmtCUWhhbnNtelJMdVFHelRibUJVR1FLQmdRQ2IvMFhtU3NUR0huQjlpcVg5YTE0Wmp5VnBLUkpaQzF3VkFPUzYKc2RKQnpvcDVqSTV2YlV3aERBQkFCT0ltNG9kamx4T1I2SlU1VjZKK3ZETVJUTnc3QkFwWkJsRUp1RmU0UFVmTAo3YlFRaDFMbXVaQzRRdkE0ZTVNN0FnWllZek94bWE2Ulg1bU1iSWNINGlMcFJacG00SVVRZDA3M3FtV3lOMjZGClptaXZRUUtCZ0R4MGNNa0xDMEF6cElvNFlYcHM5RVpTdHFhRkxDM3VrOGd2cVFodDlHNi9jR2ZNbGNVVXp4Z1IKNkxQaytsWkdPYnA1ZUJkWXVtdUZrVDEwcmFEai8zZDRUTGttQWo1WC8zNGUzYjZxc0VlMDNYTEliYlZ1YndKRAp0SWFsVm1NSXRCSDk2eFBzencvWkVrUFJDeGdTQ2tMWXNEMldtREc2azhPdmFDL3JWY2wzCi0tLS0tRU5EIFJTQSBQUklWQVRFIEtFWS0tLS0tCg=='), ('4', null, null, null, null, null, '2017-08-02 18:01:34', 'Docker仓库地址，格式 ip+port', 'docker.registry', null, null, '10.26.7.81:5000'), ('5', null, null, null, null, null, '2017-08-02 18:01:35', '构建Java项目所需的基础镜像，目前仅支持jdk1.7、jdk1.8', 'docker.images.taskRunImage', null, null, '10.26.7.81:5000/newtouchone/v4-build-java:v4.2-1.0.1'), ('6', null, null, null, null, null, '2017-08-02 18:01:35', 'Ceph访问地址，是代理服务器的ip或者节点服务器的IP加端口', 'ceph.innerUrl', null, null, '10.26.7.86:7480'), ('7', null, null, null, null, null, '2017-08-02 18:01:35', 'Ceph外网访问地址，查看构建和测试的结果文件时使用', 'ceph.url', null, null, 'http://ceph.one5.newtouch.com'), ('8', null, null, null, null, null, '2017-08-02 18:01:36', 'Ceph的访问key值', 'ceph.accesskey', null, null, 'P8JUQ0E22YHSMC3G4Y1D'), ('9', null, null, null, null, null, '2017-08-02 18:01:36', 'Ceph认证key值', 'ceph.secretkey', null, null, 'kt2RS5CwFug28siGwOPZBAIVJDnmaLfTj5jEK36W'), ('10', null, null, null, null, null, '2017-08-02 18:01:36', 'Ceph默认桶名称', 'ceph.bucketName', null, null, 'newtouchone'), ('11', null, null, null, null, null, '2017-08-02 18:01:36', 'Sonar访问地址，是代理服务器的ip或者节点服务器的IP加端口', 'sonar.innerUrl', null, null, 'http://10.254.39.76:9000'), ('12', null, null, null, null, null, '2017-08-02 18:01:37', 'Sonar外网地址', 'sonar.url', null, null, 'http://sonar.one5.newtouch.com'), ('13', null, null, null, null, null, '2017-08-02 18:01:37', 'Sonar用户名', 'sonar.username', null, null, 'admin'), ('14', null, null, null, null, null, '2017-08-02 18:01:37', 'Sonar密码', 'sonar.password', null, null, 'admin'), ('15', null, null, null, null, null, null, null, 'mac.mac1.host', null, null, null), ('16', null, null, null, null, null, null, null, 'mac.mac1.port', null, null, null), ('17', null, null, null, null, null, null, null, 'mac.mac1.username', null, null, null), ('18', null, null, null, null, null, null, null, 'mac.mac1.password', null, null, null), ('19', null, null, null, null, null, '2017-08-02 18:01:35', 'Asibale部署镜像', 'docker.images.ansibleRunImage', null, null, '10.26.7.81:5000/newtouchone/v4-base-centos-ansible:base'), ('20', null, null, null, null, null, '2017-08-02 18:01:36', 'AzureBlob地址', 'azure.blob.url', null, null, 'https://xiqing.blob.core.chinacloudapi.cn/callcenter/'), ('21', null, null, null, null, null, '2017-08-02 18:01:36', 'AzureBlob账号', 'azure.blob.account.name', null, null, 'xiqing'), ('22', null, null, null, null, null, '2017-08-02 18:01:36', 'AzureBlobKey', 'azure.blob.account.key', null, null, 'NEbUcwHWChzwj0B4y3RHi7I6WTVwRsIvjzVNY9Rc/y6WDVFK58w93pKHWYpc9wHhIfvOltOEAsxwRVXvIX9DDw=='), ('23', null, null, null, null, null, '2017-08-02 18:01:36', 'AzureBlobContainerName', 'azure.blob.container.name', null, null, 'callcenter'), ('24', null, null, null, null, null, '2017-08-02 18:01:36', 'Elasticsearch地址', 'es.hosts', null, null, '[\"172.21.9.86:9200\"]'), ('25', null, null, null, null, null, '2017-08-02 18:01:37', '文档地址', 'doc.url', null, null, 'doc.ONE34.newtouch.com'), ('26', null, null, null, null, null, '2017-08-02 18:01:35', null, 'docker.images.androidRunImage', null, null, null), ('27', null, null, null, null, null, '2017-08-02 18:01:35', null, 'docker.images.iosRunImage', null, null, null), ('28', null, null, null, null, null, '2017-08-02 18:01:35', 'PHP构建镜像', 'docker.images.phpRunImage', null, null, '10.26.7.81:5000/newtouchone/v4-build-php:v4.2-1.0.1'), ('29', null, null, null, null, null, '2017-08-02 18:01:35', '静态资源构建镜像', 'docker.images.staticResourceRunImage', null, null, '10.26.7.81:5000/newtouchone/v4-build-nodejs:v4.2-1.0.1'), ('30', null, null, null, null, null, '2017-08-02 18:01:37', null, 'git.app.template.limits', null, null, '10'), ('31', null, null, null, null, null, '2017-08-02 18:01:37', null, 'git.master.url', null, null, 'http://183.66.65.205:10080/'), ('32', null, null, null, null, null, '2017-08-02 18:01:37', null, 'git.master.inner.url', null, null, 'http://183.66.65.205:10080/'), ('33', null, null, null, null, null, '2017-08-02 18:01:37', null, 'git.master.token', null, null, 'xUAQW_H5ZVCYTdVtzTrE');
COMMIT;

-- ----------------------------
--  Table structure for `nbo_project`
-- ----------------------------
DROP TABLE IF EXISTS `nbo_project`;
CREATE TABLE `nbo_project` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `INSERT_OPERATOR` varchar(255) DEFAULT NULL,
  `INSERT_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `INSERT_TIME` datetime DEFAULT NULL,
  `MODIFY_OPERATOR` varchar(255) DEFAULT NULL,
  `MODIFY_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `APP_NUMS` bigint(10) DEFAULT NULL,
  `CREATE_USER_NAME` varchar(255) DEFAULT NULL,
  `DELETE_TIME` datetime DEFAULT NULL,
  `DESC_` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `NAME_SPACE` varchar(255) DEFAULT NULL,
  `STATUS` varchar(255) DEFAULT NULL,
  `CREATE_USER_ID` bigint(20) DEFAULT NULL,
  `ORG_NAME` varchar(200) DEFAULT NULL,
  `ORG_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=110001 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `nbo_project_env`
-- ----------------------------
DROP TABLE IF EXISTS `nbo_project_env`;
CREATE TABLE `nbo_project_env` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `INSERT_OPERATOR` varchar(255) DEFAULT NULL,
  `INSERT_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `INSERT_TIME` datetime DEFAULT NULL,
  `MODIFY_OPERATOR` varchar(255) DEFAULT NULL,
  `MODIFY_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `ENV_NAME` varchar(255) DEFAULT NULL,
  `ENV_TYPE` varchar(255) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `PROJECT_ID` bigint(20) DEFAULT NULL,
  `ENV_LABEL_CODE` varchar(200) DEFAULT NULL,
  `ENV_LABEL` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=110001 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `nbo_project_env`
-- ----------------------------
BEGIN;
INSERT INTO `nbo_project_env` VALUES ('1', null, null, '2017-07-31 19:07:47', null, null, null, 'ONE5开发测试环境', 'DOCKER', null, '1', 'ENV_DEV_ENV', ' 开发环境'), ('2', null, null, '2017-08-01 18:43:43', null, null, null, 'ONE5开发测试环境', 'DOCKER', null, '2', 'ENV_DEV_ENV', ' 开发环境'), ('3', null, null, '2017-08-01 18:47:33', null, null, null, 'ONE5开发测试环境', 'DOCKER', null, '3', 'ENV_DEV_ENV', ' 开发环境'), ('4', null, null, null, null, null, '2017-08-02 16:01:06', 'Apache1', 'HOST', 'Tomcat', '3', 'ENV_DEV_ENV,ENV_FUN_ENV,ENV_SYSTEM_TEST_ENV,ENV_USER_VALID_ENV', '开发环境,功能测试环境(FT),系统测试环境(ST),用户验证环境(UAT)'), ('5', null, null, '2017-08-02 15:58:21', null, null, null, 'ONE5开发测试环境', 'DOCKER', null, '4', 'ENV_DEV_ENV', ' 开发环境'), ('143', null, null, '2017-03-17 16:44:57', null, null, null, 'ONE5开发测试环境', 'DOCKER', null, '123', 'ENV_DEV_ENV', ' 开发环境'), ('110000', null, null, '2017-08-03 09:54:01', null, null, null, 'ONE5开发测试环境', 'DOCKER', null, '110000', 'ENV_DEV_ENV', ' 开发环境');
COMMIT;

-- ----------------------------
--  Table structure for `nbo_project_role`
-- ----------------------------
DROP TABLE IF EXISTS `nbo_project_role`;
CREATE TABLE `nbo_project_role` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `PROJECT_ID` bigint(20) DEFAULT NULL,
  `ROLE_NAME` varchar(30) DEFAULT NULL,
  `INSERT_TIME` datetime DEFAULT NULL,
  `INSERT_OPERATOR` varchar(100) DEFAULT NULL,
  `INSERT_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `MODIFY_OPERATOR` varchar(100) DEFAULT NULL,
  `MODIFY_OPERATOR_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=110005 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `nbo_project_service`
-- ----------------------------
DROP TABLE IF EXISTS `nbo_project_service`;
CREATE TABLE `nbo_project_service` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `INSERT_OPERATOR` varchar(255) DEFAULT NULL,
  `INSERT_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `INSERT_TIME` datetime DEFAULT NULL,
  `MODIFY_OPERATOR` varchar(255) DEFAULT NULL,
  `MODIFY_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `ACCOUNT_NAME` varchar(255) DEFAULT NULL,
  `ACCOUNT_PASSWORD` varchar(255) DEFAULT NULL,
  `DB_NAME` varchar(255) DEFAULT NULL,
  `ENVIRONMENT_NAME` varchar(255) DEFAULT NULL,
  `EXTEND_ATTR1` varchar(255) DEFAULT NULL,
  `EXTEND_ATTR2` varchar(255) DEFAULT NULL,
  `EXTEND_ATTR3` varchar(255) DEFAULT NULL,
  `INSTANCE_ID` varchar(255) DEFAULT NULL,
  `INSTANCE_URL` varchar(255) DEFAULT NULL,
  `MESSAGE` varchar(255) DEFAULT NULL,
  `PORT` varchar(255) DEFAULT NULL,
  `STATUS` varchar(255) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `PROJECT_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `nbo_project_test`
-- ----------------------------
DROP TABLE IF EXISTS `nbo_project_test`;
CREATE TABLE `nbo_project_test` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `APP_ID` bigint(20) DEFAULT NULL,
  `FK_BUILD_EXEC_ID` bigint(20) DEFAULT NULL,
  `TEST_FLOW` varchar(200) DEFAULT NULL,
  `FT_STATUS` varchar(200) DEFAULT NULL,
  `FT_NOPASS_REASON` varchar(200) DEFAULT NULL,
  `ST_STATUS` varchar(200) DEFAULT NULL,
  `ST_NOPASS_REASON` varchar(200) DEFAULT NULL,
  `UAT_STATUS` varchar(200) DEFAULT NULL,
  `UAT_NOPASS_REASON` varchar(200) DEFAULT NULL,
  `CURRENT_NODE` varchar(200) DEFAULT NULL,
  `INSERT_OPERATOR` varchar(255) DEFAULT NULL,
  `INSERT_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `INSERT_TIME` datetime DEFAULT NULL,
  `MODIFY_OPERATOR` varchar(255) DEFAULT NULL,
  `MODIFY_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `FT_OPERATOR` varchar(200) DEFAULT NULL,
  `ST_OPERATOR` varchar(200) DEFAULT NULL,
  `UAT_OPERATOR` varchar(200) DEFAULT '',
  `FT_OP_TIME` datetime DEFAULT NULL,
  `ST_OP_TIME` datetime DEFAULT NULL,
  `UAT_OP_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `nbo_project_user`
-- ----------------------------
DROP TABLE IF EXISTS `nbo_project_user`;
CREATE TABLE `nbo_project_user` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `INSERT_OPERATOR` varchar(255) DEFAULT NULL,
  `INSERT_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `INSERT_TIME` datetime DEFAULT NULL,
  `MODIFY_OPERATOR` varchar(255) DEFAULT NULL,
  `MODIFY_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `PROJECT_NAME` varchar(255) DEFAULT NULL,
  `ROLE_NAME` varchar(255) DEFAULT NULL,
  `USER_CNNAME` varchar(255) DEFAULT NULL,
  `USER_NAME` varchar(255) DEFAULT NULL,
  `PROJECT_ID` bigint(20) DEFAULT NULL,
  `ROLE_ID` bigint(20) DEFAULT NULL,
  `USER_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=110006 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `nbo_role`
-- ----------------------------
DROP TABLE IF EXISTS `nbo_role`;
CREATE TABLE `nbo_role` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `INSERT_OPERATOR` varchar(255) DEFAULT NULL,
  `INSERT_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `INSERT_TIME` datetime DEFAULT NULL,
  `MODIFY_OPERATOR` varchar(255) DEFAULT NULL,
  `MODIFY_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `ROLE_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `nbo_role`
-- ----------------------------
BEGIN;
INSERT INTO `nbo_role` VALUES ('1', null, null, null, null, null, null, '创建人'), ('2', null, null, null, null, null, null, '开发人员');
COMMIT;

-- ----------------------------
--  Table structure for `nbo_role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `nbo_role_permission`;
CREATE TABLE `nbo_role_permission` (
  `FK_ROLE_ID` bigint(20) DEFAULT NULL,
  `FK_PERMISSION_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `nbo_role_permission`
-- ----------------------------
BEGIN;
INSERT INTO `nbo_role_permission` VALUES ('41', '100'), ('41', '102'), ('42', '100'), ('42', '102'), ('43', '100'), ('43', '102'), ('44', '100'), ('44', '102'), ('45', '100'), ('45', '102'), ('46', '100'), ('46', '102'), ('47', '100'), ('47', '102'), ('48', '100'), ('48', '102'), ('49', '100'), ('49', '102'), ('50', '100'), ('50', '102'), ('51', '100'), ('51', '102'), ('52', '100'), ('52', '102'), ('53', '100'), ('53', '102'), ('54', '100'), ('54', '102'), ('55', '100'), ('55', '102'), ('56', '100'), ('56', '102'), ('57', '100'), ('57', '102'), ('58', '100'), ('58', '102'), ('59', '100'), ('59', '102'), ('60', '100'), ('60', '102'), ('61', '100'), ('61', '102'), ('62', '100'), ('62', '102'), ('63', '100'), ('63', '102'), ('64', '100'), ('64', '102'), ('65', '100'), ('65', '102'), ('66', '100'), ('66', '102'), ('67', '100'), ('67', '102'), ('68', '100'), ('68', '102'), ('69', '100'), ('69', '102'), ('70', '100'), ('70', '102'), ('71', '100'), ('71', '102'), ('72', '100'), ('72', '102'), ('73', '100'), ('73', '102'), ('73', '107'), ('74', '100'), ('74', '102'), ('74', '107'), ('75', '101'), ('75', '103'), ('76', '101'), ('76', '104'), ('77', '101'), ('77', '105'), ('78', '100'), ('78', '102'), ('78', '107'), ('79', '100'), ('79', '102'), ('79', '107'), ('80', '101'), ('80', '103'), ('81', '101'), ('81', '104'), ('82', '101'), ('82', '105'), ('83', '100'), ('83', '102'), ('83', '107'), ('84', '100'), ('84', '102'), ('84', '107'), ('85', '101'), ('85', '103'), ('86', '101'), ('86', '104'), ('87', '101'), ('87', '105'), ('101', '100'), ('101', '102'), ('101', '107'), ('102', '100'), ('102', '102'), ('102', '107'), ('103', '101'), ('103', '103'), ('104', '101'), ('104', '104'), ('105', '101'), ('105', '105'), ('106', '100'), ('106', '102'), ('106', '107'), ('107', '100'), ('107', '102'), ('107', '107'), ('108', '101'), ('108', '103'), ('109', '101'), ('109', '104'), ('110', '101'), ('110', '105'), ('111', '100'), ('111', '102'), ('111', '107'), ('112', '100'), ('112', '102'), ('112', '107'), ('113', '101'), ('113', '103'), ('114', '101'), ('114', '104'), ('115', '101'), ('115', '105'), ('41', '100'), ('41', '102'), ('42', '100'), ('42', '102'), ('43', '100'), ('43', '102'), ('44', '100'), ('44', '102'), ('45', '100'), ('45', '102'), ('46', '100'), ('46', '102'), ('47', '100'), ('47', '102'), ('48', '100'), ('48', '102'), ('49', '100'), ('49', '102'), ('50', '100'), ('50', '102'), ('51', '100'), ('51', '102'), ('52', '100'), ('52', '102'), ('53', '100'), ('53', '102'), ('54', '100'), ('54', '102'), ('55', '100'), ('55', '102'), ('56', '100'), ('56', '102'), ('57', '100'), ('57', '102'), ('58', '100'), ('58', '102'), ('59', '100'), ('59', '102'), ('60', '100'), ('60', '102'), ('61', '100'), ('61', '102'), ('62', '100'), ('62', '102'), ('63', '100'), ('63', '102'), ('64', '100'), ('64', '102'), ('65', '100'), ('65', '102'), ('66', '100'), ('66', '102'), ('67', '100'), ('67', '102'), ('68', '100'), ('68', '102'), ('69', '100'), ('69', '102'), ('70', '100'), ('70', '102'), ('71', '100'), ('71', '102'), ('72', '100'), ('72', '102'), ('73', '100'), ('73', '102'), ('73', '107'), ('74', '100'), ('74', '102'), ('74', '107'), ('75', '101'), ('75', '103'), ('76', '101'), ('76', '104'), ('77', '101'), ('77', '105'), ('78', '100'), ('78', '102'), ('78', '107'), ('79', '100'), ('79', '102'), ('79', '107'), ('80', '101'), ('80', '103'), ('81', '101'), ('81', '104'), ('82', '101'), ('82', '105'), ('83', '100'), ('83', '102'), ('83', '107'), ('84', '100'), ('84', '102'), ('84', '107'), ('85', '101'), ('85', '103'), ('86', '101'), ('86', '104'), ('87', '101'), ('87', '105'), ('101', '100'), ('101', '102'), ('101', '107'), ('102', '100'), ('102', '102'), ('102', '107'), ('103', '101'), ('103', '103'), ('104', '101'), ('104', '104'), ('105', '101'), ('105', '105'), ('106', '100'), ('106', '102'), ('106', '107'), ('107', '100'), ('107', '102'), ('107', '107'), ('108', '101'), ('108', '103'), ('109', '101'), ('109', '104'), ('110', '101'), ('110', '105'), ('111', '100'), ('111', '102'), ('111', '107'), ('112', '100'), ('112', '102'), ('112', '107'), ('113', '101'), ('113', '103'), ('114', '101'), ('114', '104'), ('115', '101'), ('115', '105'), ('41', '100'), ('41', '102'), ('42', '100'), ('42', '102'), ('43', '100'), ('43', '102'), ('44', '100'), ('44', '102'), ('45', '100'), ('45', '102'), ('46', '100'), ('46', '102'), ('47', '100'), ('47', '102'), ('48', '100'), ('48', '102'), ('49', '100'), ('49', '102'), ('50', '100'), ('50', '102'), ('51', '100'), ('51', '102'), ('52', '100'), ('52', '102'), ('53', '100'), ('53', '102'), ('54', '100'), ('54', '102'), ('55', '100'), ('55', '102'), ('56', '100'), ('56', '102'), ('57', '100'), ('57', '102'), ('58', '100'), ('58', '102'), ('59', '100'), ('59', '102'), ('60', '100'), ('60', '102'), ('61', '100'), ('61', '102'), ('62', '100'), ('62', '102'), ('63', '100'), ('63', '102'), ('64', '100'), ('64', '102'), ('65', '100'), ('65', '102'), ('66', '100'), ('66', '102'), ('67', '100'), ('67', '102'), ('68', '100'), ('68', '102'), ('69', '100'), ('69', '102'), ('70', '100'), ('70', '102'), ('71', '100'), ('71', '102'), ('72', '100'), ('72', '102'), ('73', '100'), ('73', '102'), ('73', '107'), ('74', '100'), ('74', '102'), ('74', '107'), ('75', '101'), ('75', '103'), ('76', '101'), ('76', '104'), ('77', '101'), ('77', '105'), ('78', '100'), ('78', '102'), ('78', '107'), ('79', '100'), ('79', '102'), ('79', '107'), ('80', '101'), ('80', '103'), ('81', '101'), ('81', '104'), ('82', '101'), ('82', '105'), ('83', '100'), ('83', '102'), ('83', '107'), ('84', '100'), ('84', '102'), ('84', '107'), ('85', '101'), ('85', '103'), ('86', '101'), ('86', '104'), ('87', '101'), ('87', '105'), ('101', '100'), ('101', '102'), ('101', '107'), ('102', '100'), ('102', '102'), ('102', '107'), ('103', '101'), ('103', '103'), ('104', '101'), ('104', '104'), ('105', '101'), ('105', '105'), ('106', '100'), ('106', '102'), ('106', '107'), ('107', '100'), ('107', '102'), ('107', '107'), ('108', '101'), ('108', '103'), ('109', '101'), ('109', '104'), ('110', '101'), ('110', '105'), ('111', '100'), ('111', '102'), ('111', '107'), ('112', '100'), ('112', '102'), ('112', '107'), ('113', '101'), ('113', '103'), ('114', '101'), ('114', '104'), ('115', '101'), ('115', '105'), ('41', '100'), ('41', '102'), ('42', '100'), ('42', '102'), ('43', '100'), ('43', '102'), ('44', '100'), ('44', '102'), ('45', '100'), ('45', '102'), ('46', '100'), ('46', '102'), ('47', '100'), ('47', '102'), ('48', '100'), ('48', '102'), ('49', '100'), ('49', '102'), ('50', '100'), ('50', '102'), ('51', '100'), ('51', '102'), ('52', '100'), ('52', '102'), ('53', '100'), ('53', '102'), ('54', '100'), ('54', '102'), ('55', '100'), ('55', '102'), ('56', '100'), ('56', '102'), ('57', '100'), ('57', '102'), ('58', '100'), ('58', '102'), ('59', '100'), ('59', '102'), ('60', '100'), ('60', '102'), ('61', '100'), ('61', '102'), ('62', '100'), ('62', '102'), ('63', '100'), ('63', '102'), ('64', '100'), ('64', '102'), ('65', '100'), ('65', '102'), ('66', '100'), ('66', '102'), ('67', '100'), ('67', '102'), ('68', '100'), ('68', '102'), ('69', '100'), ('69', '102'), ('70', '100'), ('70', '102'), ('71', '100'), ('71', '102'), ('72', '100'), ('72', '102'), ('73', '100'), ('73', '102'), ('73', '107'), ('74', '100'), ('74', '102'), ('74', '107'), ('75', '101'), ('75', '103'), ('76', '101'), ('76', '104'), ('77', '101'), ('77', '105'), ('78', '100'), ('78', '102'), ('78', '107'), ('79', '100'), ('79', '102'), ('79', '107'), ('80', '101'), ('80', '103'), ('81', '101'), ('81', '104'), ('82', '101'), ('82', '105'), ('83', '100'), ('83', '102'), ('83', '107'), ('84', '100'), ('84', '102'), ('84', '107'), ('85', '101'), ('85', '103'), ('86', '101'), ('86', '104'), ('87', '101'), ('87', '105'), ('101', '100'), ('101', '102'), ('101', '107'), ('102', '100'), ('102', '102'), ('102', '107'), ('103', '101'), ('103', '103'), ('104', '101'), ('104', '104'), ('105', '101'), ('105', '105'), ('106', '100'), ('106', '102'), ('106', '107'), ('107', '100'), ('107', '102'), ('107', '107'), ('108', '101'), ('108', '103'), ('109', '101'), ('109', '104'), ('110', '101'), ('110', '105'), ('111', '100'), ('111', '102'), ('111', '107'), ('112', '100'), ('112', '102'), ('112', '107'), ('113', '101'), ('113', '103'), ('114', '101'), ('114', '104'), ('115', '101'), ('115', '105'), ('41', '100'), ('41', '102'), ('42', '100'), ('42', '102'), ('43', '100'), ('43', '102'), ('44', '100'), ('44', '102'), ('45', '100'), ('45', '102'), ('46', '100'), ('46', '102'), ('47', '100'), ('47', '102'), ('48', '100'), ('48', '102'), ('49', '100'), ('49', '102'), ('50', '100'), ('50', '102'), ('51', '100'), ('51', '102'), ('52', '100'), ('52', '102'), ('53', '100'), ('53', '102'), ('54', '100'), ('54', '102'), ('55', '100'), ('55', '102'), ('56', '100'), ('56', '102'), ('57', '100'), ('57', '102'), ('58', '100'), ('58', '102'), ('59', '100'), ('59', '102'), ('60', '100'), ('60', '102'), ('61', '100'), ('61', '102'), ('62', '100'), ('62', '102'), ('63', '100'), ('63', '102'), ('64', '100'), ('64', '102'), ('65', '100'), ('65', '102'), ('66', '100'), ('66', '102'), ('67', '100'), ('67', '102'), ('68', '100'), ('68', '102'), ('69', '100'), ('69', '102'), ('70', '100'), ('70', '102'), ('71', '100'), ('71', '102'), ('72', '100'), ('72', '102'), ('73', '100'), ('73', '102'), ('73', '107'), ('74', '100'), ('74', '102'), ('74', '107'), ('75', '101'), ('75', '103'), ('76', '101'), ('76', '104'), ('77', '101'), ('77', '105'), ('78', '100'), ('78', '102'), ('78', '107'), ('79', '100'), ('79', '102'), ('79', '107'), ('80', '101'), ('80', '103'), ('81', '101'), ('81', '104'), ('82', '101'), ('82', '105'), ('83', '100'), ('83', '102'), ('83', '107'), ('84', '100'), ('84', '102'), ('84', '107'), ('85', '101'), ('85', '103'), ('86', '101'), ('86', '104'), ('87', '101'), ('87', '105'), ('101', '100'), ('101', '102'), ('101', '107'), ('102', '100'), ('102', '102'), ('102', '107'), ('103', '101'), ('103', '103'), ('104', '101'), ('104', '104'), ('105', '101'), ('105', '105'), ('106', '100'), ('106', '102'), ('106', '107'), ('107', '100'), ('107', '102'), ('107', '107'), ('108', '101'), ('108', '103'), ('109', '101'), ('109', '104'), ('110', '101'), ('110', '105'), ('111', '100'), ('111', '102'), ('111', '107'), ('112', '100'), ('112', '102'), ('112', '107'), ('113', '101'), ('113', '103'), ('114', '101'), ('114', '104'), ('115', '101'), ('115', '105'), ('41', '100'), ('41', '102'), ('42', '100'), ('42', '102'), ('43', '100'), ('43', '102'), ('44', '100'), ('44', '102'), ('45', '100'), ('45', '102'), ('46', '100'), ('46', '102'), ('47', '100'), ('47', '102'), ('48', '100'), ('48', '102'), ('49', '100'), ('49', '102'), ('50', '100'), ('50', '102'), ('51', '100'), ('51', '102'), ('52', '100'), ('52', '102'), ('53', '100'), ('53', '102'), ('54', '100'), ('54', '102'), ('55', '100'), ('55', '102'), ('56', '100'), ('56', '102'), ('57', '100'), ('57', '102'), ('58', '100'), ('58', '102'), ('59', '100'), ('59', '102'), ('60', '100'), ('60', '102'), ('61', '100'), ('61', '102'), ('62', '100'), ('62', '102'), ('63', '100'), ('63', '102'), ('64', '100'), ('64', '102'), ('65', '100'), ('65', '102'), ('66', '100'), ('66', '102'), ('67', '100'), ('67', '102'), ('68', '100'), ('68', '102'), ('69', '100'), ('69', '102'), ('70', '100'), ('70', '102'), ('71', '100'), ('71', '102'), ('72', '100'), ('72', '102'), ('73', '100'), ('73', '102'), ('73', '107'), ('74', '100'), ('74', '102'), ('74', '107'), ('75', '101'), ('75', '103'), ('76', '101'), ('76', '104'), ('77', '101'), ('77', '105'), ('78', '100'), ('78', '102'), ('78', '107'), ('79', '100'), ('79', '102'), ('79', '107'), ('80', '101'), ('80', '103'), ('81', '101'), ('81', '104'), ('82', '101'), ('82', '105'), ('83', '100'), ('83', '102'), ('83', '107'), ('84', '100'), ('84', '102'), ('84', '107'), ('85', '101'), ('85', '103'), ('86', '101'), ('86', '104'), ('87', '101'), ('87', '105'), ('101', '100'), ('101', '102'), ('101', '107'), ('102', '100'), ('102', '102'), ('102', '107'), ('103', '101'), ('103', '103'), ('104', '101'), ('104', '104'), ('105', '101'), ('105', '105'), ('106', '100'), ('106', '102'), ('106', '107'), ('107', '100'), ('107', '102'), ('107', '107'), ('108', '101'), ('108', '103'), ('109', '101'), ('109', '104'), ('110', '101'), ('110', '105'), ('111', '100'), ('111', '102'), ('111', '107'), ('112', '100'), ('112', '102'), ('112', '107'), ('113', '101'), ('113', '103'), ('114', '101'), ('114', '104'), ('115', '101'), ('115', '105'), ('41', '100'), ('41', '102'), ('42', '100'), ('42', '102'), ('43', '100'), ('43', '102'), ('44', '100'), ('44', '102'), ('45', '100'), ('45', '102'), ('46', '100'), ('46', '102'), ('47', '100'), ('47', '102'), ('48', '100'), ('48', '102'), ('49', '100'), ('49', '102'), ('50', '100'), ('50', '102'), ('51', '100'), ('51', '102'), ('52', '100'), ('52', '102'), ('53', '100'), ('53', '102'), ('54', '100'), ('54', '102'), ('55', '100'), ('55', '102'), ('56', '100'), ('56', '102'), ('57', '100'), ('57', '102'), ('58', '100'), ('58', '102'), ('59', '100'), ('59', '102'), ('60', '100'), ('60', '102'), ('61', '100'), ('61', '102'), ('62', '100'), ('62', '102'), ('63', '100'), ('63', '102'), ('64', '100'), ('64', '102'), ('65', '100'), ('65', '102'), ('66', '100'), ('66', '102'), ('67', '100'), ('67', '102'), ('68', '100'), ('68', '102'), ('69', '100'), ('69', '102'), ('70', '100'), ('70', '102'), ('71', '100'), ('71', '102'), ('72', '100'), ('72', '102'), ('73', '100'), ('73', '102'), ('73', '107'), ('74', '100'), ('74', '102'), ('74', '107'), ('75', '101'), ('75', '103'), ('76', '101'), ('76', '104'), ('77', '101'), ('77', '105'), ('78', '100'), ('78', '102'), ('78', '107'), ('79', '100'), ('79', '102'), ('79', '107'), ('80', '101'), ('80', '103'), ('81', '101'), ('81', '104'), ('82', '101'), ('82', '105'), ('83', '100'), ('83', '102'), ('83', '107'), ('84', '100'), ('84', '102'), ('84', '107'), ('85', '101'), ('85', '103'), ('86', '101'), ('86', '104'), ('87', '101'), ('87', '105'), ('101', '100'), ('101', '102'), ('101', '107'), ('102', '100'), ('102', '102'), ('102', '107'), ('103', '101'), ('103', '103'), ('104', '101'), ('104', '104'), ('105', '101'), ('105', '105'), ('106', '100'), ('106', '102'), ('106', '107'), ('107', '100'), ('107', '102'), ('107', '107'), ('108', '101'), ('108', '103'), ('109', '101'), ('109', '104'), ('110', '101'), ('110', '105'), ('111', '100'), ('111', '102'), ('111', '107'), ('112', '100'), ('112', '102'), ('112', '107'), ('113', '101'), ('113', '103'), ('114', '101'), ('114', '104'), ('115', '101'), ('115', '105'), ('41', '100'), ('41', '102'), ('42', '100'), ('42', '102'), ('43', '100'), ('43', '102'), ('44', '100'), ('44', '102'), ('45', '100'), ('45', '102'), ('46', '100'), ('46', '102'), ('47', '100'), ('47', '102'), ('48', '100'), ('48', '102'), ('49', '100'), ('49', '102'), ('50', '100'), ('50', '102'), ('51', '100'), ('51', '102'), ('52', '100'), ('52', '102'), ('53', '100'), ('53', '102'), ('54', '100'), ('54', '102'), ('55', '100'), ('55', '102'), ('56', '100'), ('56', '102'), ('57', '100'), ('57', '102'), ('58', '100'), ('58', '102'), ('59', '100'), ('59', '102'), ('60', '100'), ('60', '102'), ('61', '100'), ('61', '102'), ('62', '100'), ('62', '102'), ('63', '100'), ('63', '102'), ('64', '100'), ('64', '102'), ('65', '100'), ('65', '102'), ('66', '100'), ('66', '102'), ('67', '100'), ('67', '102'), ('68', '100'), ('68', '102'), ('69', '100'), ('69', '102'), ('70', '100'), ('70', '102'), ('71', '100'), ('71', '102'), ('72', '100'), ('72', '102'), ('73', '100'), ('73', '102'), ('73', '107'), ('74', '100'), ('74', '102'), ('74', '107'), ('75', '101'), ('75', '103'), ('76', '101'), ('76', '104'), ('77', '101'), ('77', '105'), ('78', '100'), ('78', '102'), ('78', '107'), ('79', '100'), ('79', '102'), ('79', '107'), ('80', '101'), ('80', '103'), ('81', '101'), ('81', '104'), ('82', '101'), ('82', '105'), ('83', '100'), ('83', '102'), ('83', '107'), ('84', '100'), ('84', '102'), ('84', '107'), ('85', '101'), ('85', '103'), ('86', '101'), ('86', '104'), ('87', '101'), ('87', '105'), ('101', '100'), ('101', '102'), ('101', '107'), ('102', '100'), ('102', '102'), ('102', '107'), ('103', '101'), ('103', '103'), ('104', '101'), ('104', '104'), ('105', '101'), ('105', '105'), ('106', '100'), ('106', '102'), ('106', '107'), ('107', '100'), ('107', '102'), ('107', '107'), ('108', '101'), ('108', '103'), ('109', '101'), ('109', '104'), ('110', '101'), ('110', '105'), ('111', '100'), ('111', '102'), ('111', '107'), ('112', '100'), ('112', '102'), ('112', '107'), ('113', '101'), ('113', '103'), ('114', '101'), ('114', '104'), ('115', '101'), ('115', '105'), ('41', '100'), ('41', '102'), ('42', '100'), ('42', '102'), ('43', '100'), ('43', '102'), ('44', '100'), ('44', '102'), ('45', '100'), ('45', '102'), ('46', '100'), ('46', '102'), ('47', '100'), ('47', '102'), ('48', '100'), ('48', '102'), ('49', '100'), ('49', '102'), ('50', '100'), ('50', '102'), ('51', '100'), ('51', '102'), ('52', '100'), ('52', '102'), ('53', '100'), ('53', '102'), ('54', '100'), ('54', '102'), ('55', '100'), ('55', '102'), ('56', '100'), ('56', '102'), ('57', '100'), ('57', '102'), ('58', '100'), ('58', '102'), ('59', '100'), ('59', '102'), ('60', '100'), ('60', '102'), ('61', '100'), ('61', '102'), ('62', '100'), ('62', '102'), ('63', '100'), ('63', '102'), ('64', '100'), ('64', '102'), ('65', '100'), ('65', '102'), ('66', '100'), ('66', '102'), ('67', '100'), ('67', '102'), ('68', '100'), ('68', '102'), ('69', '100'), ('69', '102'), ('70', '100'), ('70', '102'), ('71', '100'), ('71', '102'), ('72', '100'), ('72', '102'), ('73', '100'), ('73', '102'), ('73', '107'), ('74', '100'), ('74', '102'), ('74', '107'), ('75', '101'), ('75', '103'), ('76', '101'), ('76', '104'), ('77', '101'), ('77', '105'), ('78', '100'), ('78', '102'), ('78', '107'), ('79', '100'), ('79', '102'), ('79', '107'), ('80', '101'), ('80', '103'), ('81', '101'), ('81', '104'), ('82', '101'), ('82', '105'), ('83', '100'), ('83', '102'), ('83', '107'), ('84', '100'), ('84', '102'), ('84', '107'), ('85', '101'), ('85', '103'), ('86', '101'), ('86', '104'), ('87', '101'), ('87', '105'), ('101', '100'), ('101', '102'), ('101', '107'), ('102', '100'), ('102', '102'), ('102', '107'), ('103', '101'), ('103', '103'), ('104', '101'), ('104', '104'), ('105', '101'), ('105', '105'), ('106', '100'), ('106', '102'), ('106', '107'), ('107', '100'), ('107', '102'), ('107', '107'), ('108', '101'), ('108', '103'), ('109', '101'), ('109', '104'), ('110', '101'), ('110', '105'), ('111', '100'), ('111', '102'), ('111', '107'), ('112', '100'), ('112', '102'), ('112', '107'), ('113', '101'), ('113', '103'), ('114', '101'), ('114', '104'), ('115', '101'), ('115', '105'), ('41', '100'), ('41', '102'), ('42', '100'), ('42', '102'), ('43', '100'), ('43', '102'), ('44', '100'), ('44', '102'), ('45', '100'), ('45', '102'), ('46', '100'), ('46', '102'), ('47', '100'), ('47', '102'), ('48', '100'), ('48', '102'), ('49', '100'), ('49', '102'), ('50', '100'), ('50', '102'), ('51', '100'), ('51', '102'), ('52', '100'), ('52', '102'), ('53', '100'), ('53', '102'), ('54', '100'), ('54', '102'), ('55', '100'), ('55', '102'), ('56', '100'), ('56', '102'), ('57', '100'), ('57', '102'), ('58', '100'), ('58', '102'), ('59', '100'), ('59', '102'), ('60', '100'), ('60', '102'), ('61', '100'), ('61', '102'), ('62', '100'), ('62', '102'), ('63', '100'), ('63', '102'), ('64', '100'), ('64', '102'), ('65', '100'), ('65', '102'), ('66', '100'), ('66', '102'), ('67', '100'), ('67', '102'), ('68', '100'), ('68', '102'), ('69', '100'), ('69', '102'), ('70', '100'), ('70', '102'), ('71', '100'), ('71', '102'), ('72', '100'), ('72', '102'), ('73', '100'), ('73', '102'), ('73', '107'), ('74', '100'), ('74', '102'), ('74', '107'), ('75', '101'), ('75', '103'), ('76', '101'), ('76', '104'), ('77', '101'), ('77', '105'), ('78', '100'), ('78', '102'), ('78', '107'), ('79', '100'), ('79', '102'), ('79', '107'), ('80', '101'), ('80', '103'), ('81', '101'), ('81', '104'), ('82', '101'), ('82', '105'), ('83', '100'), ('83', '102'), ('83', '107'), ('84', '100'), ('84', '102'), ('84', '107'), ('85', '101'), ('85', '103'), ('86', '101'), ('86', '104'), ('87', '101'), ('87', '105'), ('101', '100'), ('101', '102'), ('101', '107'), ('102', '100'), ('102', '102'), ('102', '107'), ('103', '101'), ('103', '103'), ('104', '101'), ('104', '104'), ('105', '101'), ('105', '105'), ('106', '100'), ('106', '102'), ('106', '107'), ('107', '100'), ('107', '102'), ('107', '107'), ('108', '101'), ('108', '103'), ('109', '101'), ('109', '104'), ('110', '101'), ('110', '105'), ('111', '100'), ('111', '102'), ('111', '107'), ('112', '100'), ('112', '102'), ('112', '107'), ('113', '101'), ('113', '103'), ('114', '101'), ('114', '104'), ('115', '101'), ('115', '105'), ('1', '100'), ('1', '102'), ('1', '107'), ('2', '100'), ('2', '102'), ('2', '107'), ('3', '101'), ('3', '103'), ('4', '101'), ('4', '104'), ('5', '101'), ('5', '105'), ('6', '100'), ('6', '102'), ('6', '107'), ('7', '100'), ('7', '102'), ('7', '107'), ('8', '101'), ('8', '103'), ('9', '101'), ('9', '104'), ('10', '101'), ('10', '105'), ('11', '100'), ('11', '102'), ('11', '107'), ('12', '100'), ('12', '102'), ('12', '107'), ('13', '101'), ('13', '103'), ('14', '101'), ('14', '104'), ('15', '101'), ('15', '105'), ('16', '101'), ('16', '102'), ('16', '103'), ('16', '104'), ('16', '105'), ('17', '100'), ('17', '102'), ('17', '107'), ('18', '100'), ('18', '102'), ('18', '107'), ('19', '101'), ('19', '103'), ('20', '101'), ('20', '104'), ('21', '101'), ('21', '105'), ('110000', '100'), ('110000', '102'), ('110000', '107'), ('110001', '100'), ('110001', '102'), ('110001', '107'), ('110002', '101'), ('110002', '103'), ('110003', '101'), ('110003', '104'), ('110004', '101'), ('110004', '105');
COMMIT;

-- ----------------------------
--  Table structure for `nbo_sequence`
-- ----------------------------
DROP TABLE IF EXISTS `nbo_sequence`;
CREATE TABLE `nbo_sequence` (
  `SEQUENCE_NAME` varchar(200) DEFAULT NULL,
  `NEXT_VAL` bigint(20) DEFAULT NULL,
  KEY `IDX_NBO_SEQUENCE_NAME` (`SEQUENCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `nbo_sequence`
-- ----------------------------
BEGIN;
INSERT INTO `nbo_sequence` VALUES ('SEQ_NBO_PROJECT', '110001'), ('SEQ_NBO_PROJECT_ROLE', '110005'), ('SEQ_NBO_PROJECT_USER', '110006'), ('SEQ_NBO_PROJECT_ENV', '110001'), ('SEQ_NBO_ENV_DOCKER', '110001'), ('SEQ_NBO_APP_RUNTIME_ENV', '110001'), ('SEQ_NBO_APP', '110000'), ('SEQ_NBO_JOB', '110004'), ('SEQ_NBO_STEP', '110004'), ('SEQ_NBO_TASK', '110004'), ('SEQ_NBO_BUILD_TASK', '110000'), ('SEQ_NBO_UNITTEST_TASK', '110001'), ('SEQ_NBO_CODECHECK_TASK', '110003'), ('SEQ_NBO_JOB_EXEC', '110006'), ('SEQ_NBO_STEP_EXEC', '110006'), ('SEQ_NBO_TASK_EXEC', '110009'), ('SEQ_NBO_CODECHECK_TASK_EXEC', '110004'), ('SEQ_NBO_UNITTEST_TASK_EXEC', '110001'), ('SEQ_NBO_BUILD_TASK_EXEC', '110004'), ('SEQ_NBO_DEPLOY_VERSION', '110003'), ('SEQ_NBO_DEPLOY_TASK_EXEC', '110016'), ('SEQ_NBO_USER', '110001'), ('SEQ_NBO_ADMIN_USER', '110000'), ('SEQ_NBO_ENV_HOST', '110000'), ('SEQ_NBO_PROJECT_TEST', '110000'), ('SEQ_NBO_ORG_TREE', '110000'), ('SEQ_NBO_CERTIFICATE_CONF', '110001'), ('SEQ_NBO_MAVEN_CONF', '110001'), ('SEQ_NBO_CONTAINER_SPEC', '110001'), ('SEQ_NBO_TASK_TEMP', '110008'), ('SEQ_NBO_APP_TEMPLATE', '110004'), ('SEQ_NBO_UNITTEST_TASK_TEMP', '110001'), ('SEQ_NBO_CODECHECK_TASK_TEMP', '110001'), ('SEQ_NBO_K8S_RUNTIME_ENV', '110000'), ('SEQ_NBO_MIRRORS', '110000'), ('SEQ_NBO_MAC', '110000'), ('SEQ_NBO_BUILD_TASK_TEMP', '110004'), ('SEQ_NBO_SERVICE_LIST_CONF', '110000');
COMMIT;

-- ----------------------------
--  Table structure for `nbo_service_list_conf`
-- ----------------------------
DROP TABLE IF EXISTS `nbo_service_list_conf`;
CREATE TABLE `nbo_service_list_conf` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `INSERT_OPERATOR` varchar(255) DEFAULT NULL,
  `INSERT_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `INSERT_TIME` datetime DEFAULT NULL,
  `MODIFY_OPERATOR` varchar(255) DEFAULT NULL,
  `MODIFY_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `DESCRIBE` varchar(255) DEFAULT NULL,
  `IMG_URL` varchar(255) DEFAULT NULL,
  `MAIN_TYPE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `VERSION` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `nbo_service_list_conf`
-- ----------------------------
BEGIN;
INSERT INTO `nbo_service_list_conf` VALUES ('1', null, null, null, null, null, '2017-03-17 16:44:57', '最流行的开源关系型数据库', '../resources/image/mysql.svg', 'mysql', 'MySQL', 'paas', '5.6.0'), ('2', null, null, '2017-03-17 16:44:57', null, null, null, '高性能的key-value内存数据库', '../resources/image/redis.svg', 'redis', 'Redis', 'paas', '1.0.0');
COMMIT;

-- ----------------------------
--  Table structure for `nbo_step`
-- ----------------------------
DROP TABLE IF EXISTS `nbo_step`;
CREATE TABLE `nbo_step` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `INSERT_OPERATOR` varchar(255) DEFAULT NULL,
  `INSERT_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `INSERT_TIME` datetime DEFAULT NULL,
  `MODIFY_OPERATOR` varchar(255) DEFAULT NULL,
  `MODIFY_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `ORDER_` bigint(10) DEFAULT NULL,
  `STEP_NAME` varchar(255) DEFAULT NULL,
  `STEP_PARAMS` varchar(255) DEFAULT NULL,
  `JOB_ID` bigint(20) DEFAULT NULL,
  `PREV_STEP_ID` bigint(20) DEFAULT NULL,
  `TASK_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=110004 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `nbo_step_exec`
-- ----------------------------
DROP TABLE IF EXISTS `nbo_step_exec`;
CREATE TABLE `nbo_step_exec` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `INSERT_OPERATOR` varchar(255) DEFAULT NULL,
  `INSERT_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `INSERT_TIME` datetime DEFAULT NULL,
  `MODIFY_OPERATOR` varchar(255) DEFAULT NULL,
  `MODIFY_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `COST_TIME` bigint(20) DEFAULT NULL,
  `ERROR_MSG` varchar(255) DEFAULT NULL,
  `EXECUTING_STATUS` varchar(255) DEFAULT NULL,
  `ORDER_` bigint(10) DEFAULT NULL,
  `STEP_PARAMS` varchar(255) DEFAULT NULL,
  `JOB_EXECUTING_ID` bigint(20) DEFAULT NULL,
  `PREV_STEP_EXECUTING_ID` bigint(20) DEFAULT NULL,
  `STEP_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=110006 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `nbo_task`
-- ----------------------------
DROP TABLE IF EXISTS `nbo_task`;
CREATE TABLE `nbo_task` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `INSERT_OPERATOR` varchar(255) DEFAULT NULL,
  `INSERT_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `INSERT_TIME` datetime DEFAULT NULL,
  `MODIFY_OPERATOR` varchar(255) DEFAULT NULL,
  `MODIFY_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `TASK_NAME` varchar(255) DEFAULT NULL,
  `TASK_PARAMS` varchar(255) DEFAULT NULL,
  `TASK_TYPE` varchar(255) DEFAULT NULL,
  `APP_ID` bigint(20) DEFAULT NULL,
  `JOB_ID` bigint(20) DEFAULT NULL,
  `PROJECT_ID` bigint(20) DEFAULT NULL,
  `STEP_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=110004 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `nbo_task_exec`
-- ----------------------------
DROP TABLE IF EXISTS `nbo_task_exec`;
CREATE TABLE `nbo_task_exec` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `INSERT_OPERATOR` varchar(255) DEFAULT NULL,
  `INSERT_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `INSERT_TIME` datetime DEFAULT NULL,
  `MODIFY_OPERATOR` varchar(255) DEFAULT NULL,
  `MODIFY_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `COST_TIME` bigint(20) DEFAULT NULL,
  `ERROR_MSG` varchar(4000) DEFAULT NULL,
  `EXECUTING_STATUS` varchar(255) DEFAULT NULL,
  `EXECUTING_TYPE` varchar(255) DEFAULT NULL,
  `TASK_NAME` varchar(255) DEFAULT NULL,
  `TASK_PARAMS` varchar(255) DEFAULT NULL,
  `TASK_TYPE` varchar(255) DEFAULT NULL,
  `APP_ID` bigint(20) DEFAULT NULL,
  `JOB_ID` bigint(20) DEFAULT NULL,
  `JOB_EXECUTING_ID` bigint(20) DEFAULT NULL,
  `PROJECT_ID` bigint(20) DEFAULT NULL,
  `STEP_ID` bigint(20) DEFAULT NULL,
  `STEP_EXECUTING_ID` bigint(20) DEFAULT NULL,
  `TASK_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=110009 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `nbo_task_temp`
-- ----------------------------
DROP TABLE IF EXISTS `nbo_task_temp`;
CREATE TABLE `nbo_task_temp` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `INSERT_OPERATOR` varchar(255) DEFAULT NULL,
  `INSERT_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `INSERT_TIME` datetime DEFAULT NULL,
  `MODIFY_OPERATOR` varchar(255) DEFAULT NULL,
  `MODIFY_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `CODE_TYPE` varchar(255) DEFAULT NULL,
  `DESC_` varchar(255) DEFAULT NULL,
  `IMAGE_URL` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=110008 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `nbo_task_temp`
-- ----------------------------
BEGIN;
INSERT INTO `nbo_task_temp` VALUES ('1', null, null, null, null, null, null, 'java', '使用maven构建出war或jar的docker镜像', '{\"environmentImg\":\"../resources/image/task/java_md.png\",\"toolImg\":\"../resources/image/task/maven_md.png\",\"resultsImg\":\"../resources/image/task/docker_md.png\"}', 'maven构建', 'build'), ('2', null, null, null, null, null, '2017-03-17 16:44:57', 'java', '使用sonar检查代码并生成报告', '{\"environmentImg\":\"../resources/image/task/java_md.png\",\"toolImg\":\"../resources/image/task/sonar_md.png\",\"resultsImg\":\"../resources/image/task/baogao_md.png\"}', 'java代码检查', 'codeCheck'), ('5', null, null, null, null, null, null, 'nodejs', '使用grunt将应用打包', '{\"environmentImg\":\"../resources/image/task/static_md.png\",\"toolImg\":\"../resources/image/task/grunt_md.png\",\"resultsImg\":\"../resources/image/task/zip_md.png\"}', 'grunt构建', 'build'), ('6', null, null, null, null, null, null, 'nodejs', '使用webpack将应用打包', '{\"environmentImg\":\"../resources/image/task/static_md.png\",\"toolImg\":\"../resources/image/task/webpack_md.png\",\"resultsImg\":\"../resources/image/task/zip_md.png\"}', 'webpack构建', 'build'), ('7', null, null, null, null, null, null, 'nodejs', '使用gulp将应用打包', '{\"environmentImg\":\"../resources/image/task/static_md.png\",\"toolImg\":\"../resources/image/task/gulp_md.png\",\"resultsImg\":\"../resources/image/task/zip_md.png\"}', 'gulp构建', 'build'), ('8', null, null, null, null, null, null, 'nodejs', '使用sonar检查代码', '{\"environmentImg\":\"../resources/image/task/static_md.png\",\"toolImg\":\"../resources/image/task/sonar_md.png\",\"resultsImg\":\"../resources/image/task/baogao_md.png\"}', 'NodeJS代码检查', 'codeCheck'), ('9', null, null, null, null, null, null, 'nodejs', '使用zip将应用打包', '{\"environmentImg\":\"../resources/image/task/static_md.png\",\"toolImg\":\"../resources/image/task/ziptool_md.png\",\"resultsImg\":\"../resources/image/task/zip_md.png\"}', 'zip构建', 'build'), ('100002', null, null, '2017-03-17 16:44:57', null, null, null, 'android', '使用sonar检查代码', '{\"environmentImg\":\"../resources/image/task/android_md.png\",\"toolImg\":\"../resources/image/task/sonar_md.png\",\"resultsImg\":\"../resources/image/task/baogao_md.png\"}', 'Android代码检查', 'codeCheck'), ('100003', null, null, '2017-03-17 16:44:57', null, null, null, 'ios', '使用sonar检查代码', '{\"environmentImg\":\"../resources/image/task/ios_md.png\",\"toolImg\":\"../resources/image/task/sonar_md.png\",\"resultsImg\":\"../resources/image/task/baogao_md.png\"}', 'iOS代码检查', 'codeCheck'), ('100004', null, null, '2017-03-17 16:44:57', null, null, null, 'java', 'maven进行单元测试', '{\"environmentImg\":\"../resources/image/task/java_md.png\",\"toolImg\":\"../resources/image/task/maven_md.png\",\"resultsImg\":\"../resources/image/task/baogao_md.png\"}', 'java单元测试', 'unitTest'), ('100007', null, null, '2017-03-17 16:44:57', null, null, null, 'java', '使用maven将应用打包', '{\"environmentImg\":\"../resources/image/task/java_md.png\",\"toolImg\":\"../resources/image/task/maven_md.png\",\"resultsImg\":\"../resources/image/task/warjar_md.png\"}', 'maven构建', 'build'), ('100008', null, null, '2017-03-17 16:44:57', null, null, null, 'ios', '使用xcode将iOS应用构建成api', '{\"environmentImg\":\"../resources/image/task/ios_md.png\",\"toolImg\":\"../resources/image/task/xcode_md.png\",\"resultsImg\":\"../resources/image/task/ipa_md.png\"}', 'iOS代码构建', 'build'), ('100009', null, null, '2017-03-17 16:44:57', null, null, null, 'android', '使用xcode将android应用构建成apk', '{\"environmentImg\":\"../resources/image/task/android_md.png\",\"toolImg\":\"../resources/image/task/gradle_md.png\",\"resultsImg\":\"../resources/image/task/apk_md.png\"}', 'Android代码构建', 'build'), ('100010', null, null, '2017-03-17 16:44:57', null, null, null, 'java', '使用ant将相应的应用构建成镜像', '{\"environmentImg\":\"../resources/image/task/java_md.png\",\"toolImg\":\"../resources/image/task/ant_md.png\",\"resultsImg\":\"../resources/image/task/docker_md.png\"}', 'Ant构建', 'build'), ('100011', null, null, '2017-03-17 16:44:57', null, null, null, 'java', '使用ant将应用打包', '{\"environmentImg\":\"../resources/image/task/java_md.png\",\"toolImg\":\"../resources/image/task/ant_md.png\",\"resultsImg\":\"../resources/image/task/warjar_md.png\"}', 'Ant构建', 'build'), ('100012', null, null, '2017-03-17 16:44:57', null, null, null, 'java', '使用maven将应用部署', '{\"environmentImg\":\"../resources/image/task/java_md.png\",\"toolImg\":\"../resources/image/task/maven_md.png\",\"resultsImg\":\"../resources/image/task/warjar_md.png\"}', 'maven部署', 'build'), ('100014', null, null, '2017-03-17 16:44:57', null, null, null, 'android', '使用ant将android应用构建', '{\"environmentImg\":\"../resources/image/task/android_md.png\",\"toolImg\":\"../resources/image/task/ant_md.png\",\"resultsImg\":\"../resources/image/task/apk_md.png\"}', 'Android的ant构建', 'build'), ('100015', null, null, '2017-03-17 16:44:57', null, null, null, 'php', '将php项目打成tar包', '{\"environmentImg\":\"../resources/image/task/android_md.png\",\"toolImg\":\"../resources/image/task/ant_md.png\",\"resultsImg\":\"../resources/image/task/apk_md.png\"}', 'php构建', 'build'), ('110006', null, null, '2017-08-03 10:02:55', null, null, null, 'java', 'aaa', null, 'test', 'build'), ('110007', null, null, '2017-08-03 11:18:17', null, null, null, 'java', null, null, 'testaa', 'build');
COMMIT;

-- ----------------------------
--  Table structure for `nbo_unittest_task`
-- ----------------------------
DROP TABLE IF EXISTS `nbo_unittest_task`;
CREATE TABLE `nbo_unittest_task` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `INSERT_OPERATOR` varchar(255) DEFAULT NULL,
  `INSERT_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `INSERT_TIME` datetime DEFAULT NULL,
  `MODIFY_OPERATOR` varchar(255) DEFAULT NULL,
  `MODIFY_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `MODULE_NAME` varchar(255) DEFAULT NULL,
  `NAME_SPACE` varchar(255) DEFAULT NULL,
  `REPS_BRANCH` varchar(255) DEFAULT NULL,
  `REPS_PASSWORD` varchar(255) DEFAULT NULL,
  `REPS_TYPE` varchar(255) DEFAULT NULL,
  `REPS_URL` varchar(255) DEFAULT NULL,
  `REPS_USER_NAME` varchar(255) DEFAULT NULL,
  `SUPPORT_CODE_TYPE` varchar(255) DEFAULT NULL,
  `TAG_NAME` varchar(255) DEFAULT NULL,
  `TASK_NAME` varchar(255) DEFAULT NULL,
  `TEST_COMMAND` varchar(255) DEFAULT NULL,
  `TEST_ENV` varchar(255) DEFAULT NULL,
  `TEST_ENV_VERSION` varchar(255) DEFAULT NULL,
  `TEST_TOOLS` varchar(255) DEFAULT NULL,
  `TEST_TOOLS_VERSION` varchar(255) DEFAULT NULL,
  `APP_ID` bigint(20) DEFAULT NULL,
  `TASK_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=110001 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `nbo_unittest_task_exec`
-- ----------------------------
DROP TABLE IF EXISTS `nbo_unittest_task_exec`;
CREATE TABLE `nbo_unittest_task_exec` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `INSERT_OPERATOR` varchar(255) DEFAULT NULL,
  `INSERT_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `INSERT_TIME` datetime DEFAULT NULL,
  `MODIFY_OPERATOR` varchar(255) DEFAULT NULL,
  `MODIFY_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `APP_NAME` varchar(255) DEFAULT NULL,
  `COST_TIME` bigint(20) DEFAULT NULL,
  `ERROR_MSG` varchar(255) DEFAULT NULL,
  `EXECUTING_STATUS` varchar(255) DEFAULT NULL,
  `EXECUTING_TYPE` varchar(255) DEFAULT NULL,
  `PROJECT_NAME` varchar(255) DEFAULT NULL,
  `TASK_EXECUTING_PARAMS` varchar(255) DEFAULT NULL,
  `NAME_SPACE` varchar(255) DEFAULT NULL,
  `POD_NAME` varchar(255) DEFAULT NULL,
  `PROCESS_STATUS` varchar(255) DEFAULT NULL,
  `REPS_BRANCH` varchar(255) DEFAULT NULL,
  `RESULT_FILE_URL` varchar(255) DEFAULT NULL,
  `TEST_RESULT` varchar(255) DEFAULT NULL,
  `APP_ID` bigint(20) DEFAULT NULL,
  `JOB_EXECUTING_ID` bigint(20) DEFAULT NULL,
  `TASK_EXECUTING_ID` bigint(20) DEFAULT NULL,
  `UNIT_TEST_TASK_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=110001 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `nbo_unittest_task_temp`
-- ----------------------------
DROP TABLE IF EXISTS `nbo_unittest_task_temp`;
CREATE TABLE `nbo_unittest_task_temp` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `INSERT_OPERATOR` varchar(255) DEFAULT NULL,
  `INSERT_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `INSERT_TIME` datetime DEFAULT NULL,
  `MODIFY_OPERATOR` varchar(255) DEFAULT NULL,
  `MODIFY_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `SUPPORT_CODE_TYPE` varchar(255) DEFAULT NULL,
  `TEST_COMMAND` varchar(255) DEFAULT NULL,
  `TEST_ENV` varchar(255) DEFAULT NULL,
  `TEST_ENV_VERSION` varchar(255) DEFAULT NULL,
  `TEST_TOOLS` varchar(255) DEFAULT NULL,
  `TEST_TOOLS_VERSION` varchar(255) DEFAULT NULL,
  `TASK_TEMPLATE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=110001 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `nbo_unittest_task_temp`
-- ----------------------------
BEGIN;
INSERT INTO `nbo_unittest_task_temp` VALUES ('1', null, null, '2017-03-17 16:44:57', null, null, null, 'java', 'mvn test -Dmaven.test.failure.ignore=true', 'java', 'jdk1.8', 'maven', 'maven3', '100004');
COMMIT;

-- ----------------------------
--  Table structure for `nbo_user`
-- ----------------------------
DROP TABLE IF EXISTS `nbo_user`;
CREATE TABLE `nbo_user` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `INSERT_OPERATOR` varchar(255) DEFAULT NULL,
  `INSERT_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `INSERT_TIME` datetime DEFAULT NULL,
  `MODIFY_OPERATOR` varchar(255) DEFAULT NULL,
  `MODIFY_OPERATOR_ID` bigint(20) DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `CN_NAME` varchar(255) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `EXPIRY_DATE` datetime DEFAULT NULL,
  `GIT_PWD` varchar(255) DEFAULT NULL,
  `GIT_USER_ID` bigint(10) DEFAULT NULL,
  `GIT_USER_NAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `STATUS` bigint(20) DEFAULT NULL,
  `USER_NAME` varchar(255) DEFAULT NULL,
  `DEPARTMENT` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_7lq5myn8lxqay5lkldqt72br3` (`EMAIL`)
) ENGINE=InnoDB AUTO_INCREMENT=110001 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `nbo_user`
-- ----------------------------
BEGIN;
INSERT INTO `nbo_user` VALUES ('1', null, null, null, null, null, '2017-08-03 09:58:05', '测试', 'test@qq.com', null, null, null, 'test', '8af51b6c8f1e872163dd369995d0a7b1', '0', 'test', null);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
