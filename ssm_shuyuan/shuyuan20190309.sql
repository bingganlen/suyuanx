/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : shuyuan

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2019-03-09 13:27:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_id` int(11) DEFAULT '0' COMMENT '部门id  默认0未分组',
  `dept_name` varchar(30) DEFAULT NULL COMMENT '部门、分组名称',
  `company` varchar(30) DEFAULT NULL COMMENT '企业',
  `num_emp_count` int(11) DEFAULT NULL,
  `admin_user_id` int(11) DEFAULT NULL COMMENT '部门管理员ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES ('1', '0', '未分组', null, null, null);
INSERT INTO `dept` VALUES ('2', '3', '研发部', null, null, null);
INSERT INTO `dept` VALUES ('3', '4', '后勤部', null, null, null);
INSERT INTO `dept` VALUES ('4', '5', '人事部', null, null, null);

-- ----------------------------
-- Table structure for dervice_status_his
-- ----------------------------
DROP TABLE IF EXISTS `dervice_status_his`;
CREATE TABLE `dervice_status_his` (
  `id` int(11) NOT NULL,
  `device_id` int(11) DEFAULT NULL COMMENT '设备id',
  `power` float(11,0) DEFAULT NULL COMMENT '设备电压',
  `record_time` datetime DEFAULT NULL COMMENT 'record_time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备状态历史';

-- ----------------------------
-- Records of dervice_status_his
-- ----------------------------

-- ----------------------------
-- Table structure for device
-- ----------------------------
DROP TABLE IF EXISTS `device`;
CREATE TABLE `device` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dev_id` bigint(20) NOT NULL COMMENT '设备ID_终端绑定用',
  `video` int(11) DEFAULT NULL COMMENT '设备名称',
  `d_image` varchar(500) DEFAULT NULL COMMENT '设备图 URL相对路径',
  `d_detail` text COMMENT '设备详情',
  `d_ip` varchar(200) DEFAULT NULL COMMENT '链接摄像头等用的',
  `device_ip` varchar(20) DEFAULT NULL COMMENT '设备的IP地址',
  `d_status` int(6) DEFAULT NULL COMMENT '设备状态 1-启动 2-下架 3-删除',
  `nickname` varchar(50) DEFAULT NULL COMMENT '设备别名',
  `dev_type` varchar(255) DEFAULT NULL COMMENT '设备类型',
  `csq` int(4) DEFAULT NULL COMMENT '信号强度',
  `create_time` datetime DEFAULT NULL COMMENT '设备添加时间',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='终端管理';

-- ----------------------------
-- Records of device
-- ----------------------------
INSERT INTO `device` VALUES ('1', '100000213', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `device` VALUES ('2', '100000214', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `device` VALUES ('3', '100000215', null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for device_config_his
-- ----------------------------
DROP TABLE IF EXISTS `device_config_his`;
CREATE TABLE `device_config_his` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `config_identifier` varchar(20) DEFAULT NULL COMMENT '配置标识符',
  `device_id` bigint(20) DEFAULT NULL,
  `data_upload_interval` int(11) NOT NULL COMMENT '数据上传间隔  min',
  `data_samp_interval` int(11) DEFAULT NULL COMMENT '数据采集间隔min',
  `is_enable_locate` int(1) DEFAULT '1' COMMENT '定位功能  开启1  关闭0',
  `config_time` datetime DEFAULT NULL COMMENT '配置时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='终端配置';

-- ----------------------------
-- Records of device_config_his
-- ----------------------------

-- ----------------------------
-- Table structure for device_record_his
-- ----------------------------
DROP TABLE IF EXISTS `device_record_his`;
CREATE TABLE `device_record_his` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dev_id` bigint(20) DEFAULT NULL,
  `video` int(11) DEFAULT NULL COMMENT '存在设备',
  `light` int(11) DEFAULT '0' COMMENT '光照  lux',
  `rain` int(11) DEFAULT '0' COMMENT '33     日降雨量3.3 mm',
  `air_temp` int(11) DEFAULT NULL COMMENT '空气温度  236   23.6 度',
  `air_humi` int(11) DEFAULT NULL COMMENT '空气湿度  384    38.4',
  `soil_temp` int(11) DEFAULT NULL COMMENT '土壤温度272    27.2度',
  `soil_humi` int(11) DEFAULT NULL COMMENT '土壤湿度275  27.5',
  `soil_electric` int(4) DEFAULT NULL COMMENT '土壤电导率  122 uS/cm   与光照不用除10',
  `soil_salt` int(11) DEFAULT NULL COMMENT '土壤盐分  69 mg/L',
  `air_pressure` int(11) DEFAULT NULL COMMENT '空气气压',
  `wind_speed` int(4) DEFAULT NULL COMMENT '风速',
  `wind` int(4) DEFAULT NULL COMMENT '风向',
  `longtitude` int(11) DEFAULT NULL COMMENT '经度',
  `latitude` int(11) DEFAULT NULL COMMENT '纬度',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`,`update_time`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8 COMMENT='设备的历史记录';

-- ----------------------------
-- Records of device_record_his
-- ----------------------------
INSERT INTO `device_record_his` VALUES ('1', '100000213', null, '1459', '33', '236', '384', '275', '273', '122', '69', null, null, null, null, null, '2019-02-20 17:02:39', '2019-02-21 17:02:43');
INSERT INTO `device_record_his` VALUES ('2', '100000214', null, '1569', '44', '146', '262', '353', '423', '110', '60', null, null, null, null, null, '2019-02-22 10:14:01', '2019-02-22 10:14:09');
INSERT INTO `device_record_his` VALUES ('4', '100000215', null, '1560', '44', '146', '262', '353', '423', '59', '110', null, null, null, null, null, '2019-02-21 09:16:23', '2019-02-21 09:16:23');
INSERT INTO `device_record_his` VALUES ('5', '100000215', null, '1560', '44', '146', '262', '353', '423', '59', '110', null, null, null, null, null, '2019-02-21 09:20:00', '2019-02-21 09:20:00');
INSERT INTO `device_record_his` VALUES ('6', '100000213', null, '1569', '44', '146', '262', '353', '423', '110', '60', null, null, null, null, null, '2019-02-21 09:23:41', '2019-02-21 09:23:41');
INSERT INTO `device_record_his` VALUES ('7', '100000213', null, '1560', '39', '146', '263', '300', '434', '59', '111', null, null, null, null, null, '2019-02-18 09:30:20', '2019-02-21 09:30:20');
INSERT INTO `device_record_his` VALUES ('8', '100000213', null, '1569', '44', '146', '262', '353', '423', '110', '60', null, null, null, null, null, '2019-02-17 09:34:24', '2019-02-21 09:34:24');
INSERT INTO `device_record_his` VALUES ('9', '100000213', null, '2016', '11', '245', '262', '465', '455', '54', '15', null, null, null, null, null, '2019-02-16 09:34:57', '2019-02-21 09:44:57');
INSERT INTO `device_record_his` VALUES ('10', '100000213', null, '899', '0', '240', '300', '353', '423', '110', '60', null, null, null, null, null, '2019-02-15 09:33:19', '2019-02-21 09:53:23');
INSERT INTO `device_record_his` VALUES ('11', '100000213', null, '933', '21', '263', '323', '280', '412', '111', '56', null, null, null, null, null, '2019-02-14 09:33:43', '2019-02-21 09:54:43');
INSERT INTO `device_record_his` VALUES ('12', '100000214', null, '1432', '21', '35', '453', '351', '533', '136', '45', null, null, null, null, null, '2019-02-21 10:18:03', '2019-02-22 10:18:10');
INSERT INTO `device_record_his` VALUES ('13', '100000214', null, '1465', '33', '33', '534', '455', '323', '102', '55', null, null, null, null, null, '2019-02-20 10:19:12', '2019-02-22 10:19:21');
INSERT INTO `device_record_his` VALUES ('14', '100000214', null, '1456', '45', '245', '262', '353', '434', '54', '132', null, null, null, null, null, '2019-02-19 10:21:47', '2019-02-22 10:21:47');
INSERT INTO `device_record_his` VALUES ('15', '100000214', null, '1456', '45', '245', '262', '353', '434', '54', '132', null, null, null, null, null, '2019-02-18 10:22:32', '2019-02-22 10:22:32');
INSERT INTO `device_record_his` VALUES ('16', '100000214', null, '1222', '10', '245', '100', '190', '360', '55', '145', null, null, null, null, null, '2019-02-17 10:24:35', '2019-02-22 10:24:35');
INSERT INTO `device_record_his` VALUES ('17', '100000214', null, '1222', '10', '245', '100', '190', '360', '55', '145', null, null, null, null, null, '2019-02-16 10:24:43', '2019-02-22 10:24:43');
INSERT INTO `device_record_his` VALUES ('18', '100000213', null, '1240', '0', '164', '110', '110', '102', '121', '45', null, null, null, null, null, '2019-02-22 11:11:36', '2019-02-22 11:11:48');
INSERT INTO `device_record_his` VALUES ('19', '100000213', null, '1690', '0', '213', '154', '453', '345', '41', '99', null, null, null, null, null, '2019-02-23 09:13:29', '2019-02-23 09:13:31');
INSERT INTO `device_record_his` VALUES ('20', '100000213', null, '2033', '0', '141', '241', '299', '304', '56', '45', null, null, null, null, null, '2019-02-24 08:49:26', '2019-02-25 08:49:36');
INSERT INTO `device_record_his` VALUES ('21', '100000213', null, '2013', '0', '242', '121', '425', '423', '113', '69', null, null, null, null, null, '2019-02-25 08:50:34', '2019-02-25 08:50:36');
INSERT INTO `device_record_his` VALUES ('22', '100000213', null, '998', '45', '146', '262', '353', '423', '59', '110', null, null, null, null, null, '2019-02-27 10:12:13', '2019-02-28 10:12:18');
INSERT INTO `device_record_his` VALUES ('23', '100000213', null, '1222', '10', '146', '353', '323', '304', '55', '44', null, null, null, null, null, '2019-02-28 13:32:45', '2019-03-06 13:32:51');
INSERT INTO `device_record_his` VALUES ('24', '100000213', null, '38047', '0', '228', '799', '238', '346', '146', '89', null, null, null, null, null, '2019-03-01 15:00:02', '2019-03-01 15:00:02');
INSERT INTO `device_record_his` VALUES ('25', '100000213', null, '21217', '0', '221', '827', '240', '338', '146', '89', null, null, null, null, null, '2019-03-01 16:00:01', '2019-03-01 16:00:01');
INSERT INTO `device_record_his` VALUES ('26', '100000213', null, '10621', '0', '214', '853', '237', '340', '144', '88', null, null, null, null, null, '2019-03-01 17:00:01', '2019-03-01 17:00:01');
INSERT INTO `device_record_his` VALUES ('27', '100000213', null, '3025', '0', '210', '880', '232', '339', '143', '88', null, null, null, null, null, '2019-03-01 18:00:01', '2019-03-01 18:00:01');
INSERT INTO `device_record_his` VALUES ('28', '100000213', null, '14141', '0', '206', '932', '216', '342', '141', '90', null, null, null, null, null, '2019-03-02 09:00:01', '2019-03-02 09:00:01');
INSERT INTO `device_record_his` VALUES ('29', '100000213', null, '23399', '0', '217', '877', '221', '342', '143', '90', null, null, null, null, null, '2019-03-02 10:00:01', '2019-03-02 10:00:01');
INSERT INTO `device_record_his` VALUES ('30', '100000213', null, '28288', '0', '224', '848', '229', '340', '145', '90', null, null, null, null, null, '2019-03-02 11:00:01', '2019-03-02 11:00:01');
INSERT INTO `device_record_his` VALUES ('31', '100000213', null, '25652', '0', '210', '755', '199', '364', '124', '82', null, null, null, null, null, '2019-03-04 10:00:01', '2019-03-04 10:00:01');
INSERT INTO `device_record_his` VALUES ('32', '100000213', null, '30600', '0', '222', '719', '211', '358', '126', '81', null, null, null, null, null, '2019-03-04 11:00:01', '2019-03-04 11:00:01');
INSERT INTO `device_record_his` VALUES ('33', '100000213', null, '54531', '0', '227', '704', '222', '358', '129', '81', null, null, null, null, null, '2019-03-04 12:00:00', '2019-03-04 12:00:00');
INSERT INTO `device_record_his` VALUES ('34', '100000213', null, '26548', '0', '226', '725', '234', '357', '132', '81', null, null, null, null, null, '2019-03-04 13:00:00', '2019-03-04 13:00:00');
INSERT INTO `device_record_his` VALUES ('35', '100000213', null, '17835', '0', '217', '775', '239', '354', '133', '81', null, null, null, null, null, '2019-03-04 14:00:00', '2019-03-04 14:00:00');
INSERT INTO `device_record_his` VALUES ('36', '100000213', null, '12007', '0', '209', '790', '238', '357', '132', '81', null, null, null, null, null, '2019-03-04 15:00:00', '2019-03-04 15:00:00');
INSERT INTO `device_record_his` VALUES ('37', '100000213', null, '5314', '0', '207', '812', '235', '357', '132', '81', null, null, null, null, null, '2019-03-04 16:00:01', '2019-03-04 16:00:01');
INSERT INTO `device_record_his` VALUES ('38', '100000213', null, '8170', '0', '205', '824', '230', '358', '131', '81', null, null, null, null, null, '2019-03-04 17:00:00', '2019-03-04 17:00:00');
INSERT INTO `device_record_his` VALUES ('39', '100000213', null, '6945', '8', '207', '984', '203', '372', '45', '29', null, null, null, null, null, '2019-03-05 09:00:02', '2019-03-05 09:00:02');
INSERT INTO `device_record_his` VALUES ('40', '100000213', null, '10149', '8', '225', '933', '212', '369', '47', '30', null, null, null, null, null, '2019-03-05 10:00:01', '2019-03-05 10:00:01');
INSERT INTO `device_record_his` VALUES ('41', '100000213', null, '32268', '8', '241', '855', '223', '366', '49', '30', null, null, null, null, null, '2019-03-05 11:00:01', '2019-03-05 11:00:01');
INSERT INTO `device_record_his` VALUES ('42', '100000213', null, '16394', '8', '247', '820', '235', '366', '52', '32', null, null, null, null, null, '2019-03-05 12:00:00', '2019-03-05 12:00:00');
INSERT INTO `device_record_his` VALUES ('43', '100000213', null, '33027', '8', '253', '811', '239', '362', '53', '32', null, null, null, null, null, '2019-03-05 13:00:00', '2019-03-05 13:00:00');
INSERT INTO `device_record_his` VALUES ('44', '100000213', null, '17446', '8', '250', '792', '247', '366', '56', '33', null, null, null, null, null, '2019-03-05 14:00:01', '2019-03-05 14:00:01');
INSERT INTO `device_record_his` VALUES ('45', '100000213', null, '13502', '8', '246', '810', '251', '361', '57', '34', null, null, null, null, null, '2019-03-05 15:00:00', '2019-03-05 15:00:00');
INSERT INTO `device_record_his` VALUES ('46', '100000213', null, '17452', '8', '245', '820', '251', '362', '58', '34', null, null, null, null, null, '2019-03-05 16:00:01', '2019-03-05 16:00:01');
INSERT INTO `device_record_his` VALUES ('47', '100000213', null, '6234', '8', '240', '872', '250', '363', '59', '35', null, null, null, null, null, '2019-03-05 17:00:01', '2019-03-05 17:00:01');
INSERT INTO `device_record_his` VALUES ('48', '100000213', null, '3102', '8', '236', '879', '246', '362', '60', '36', null, null, null, null, null, '2019-03-05 18:00:02', '2019-03-05 18:00:02');
INSERT INTO `device_record_his` VALUES ('49', '100000213', null, '6880', '18', '193', '989', '209', '371', '62', '40', null, null, null, null, null, '2019-03-06 10:00:01', '2019-03-06 10:00:01');
INSERT INTO `device_record_his` VALUES ('50', '100000213', null, '5923', '28', '198', '970', '210', '374', '61', '39', null, null, null, null, null, '2019-03-06 11:00:01', '2019-03-06 11:00:01');
INSERT INTO `device_record_his` VALUES ('51', '100000213', null, '11625', '150', '188', '996', '201', '377', '43', '28', null, null, null, null, null, '2019-03-06 12:10:02', '2019-03-06 14:10:02');
INSERT INTO `device_record_his` VALUES ('52', '100000213', null, '11332', '150', '189', '995', '202', '377', '42', '27', null, null, null, null, null, '2019-03-06 14:11:01', '2019-03-06 14:11:01');
INSERT INTO `device_record_his` VALUES ('53', '100000213', null, '7866', '162', '190', '979', '204', '376', '38', '24', null, null, null, null, null, '2019-03-06 15:00:00', '2019-03-06 15:00:00');
INSERT INTO `device_record_his` VALUES ('54', '100000213', null, '3413', '164', '191', '986', '204', '380', '40', '26', null, null, null, null, null, '2019-03-06 16:00:01', '2019-03-06 16:00:01');
INSERT INTO `device_record_his` VALUES ('55', '100000213', null, '1530', '164', '191', '978', '205', '378', '41', '26', null, null, null, null, null, '2019-03-06 17:00:01', '2019-03-06 17:00:01');
INSERT INTO `device_record_his` VALUES ('56', '100000213', null, '520', '164', '184', '977', '204', '374', '41', '26', null, null, null, null, null, '2019-03-06 18:00:01', '2019-03-06 18:00:01');
INSERT INTO `device_record_his` VALUES ('57', '100000213', null, '3598', '56', '147', '986', '161', '385', '36', '25', null, null, null, null, null, '2019-03-07 09:00:01', '2019-03-07 09:00:01');
INSERT INTO `device_record_his` VALUES ('58', '100000213', null, '2331', '56', '153', '957', '162', '384', '37', '26', null, null, null, null, null, '2019-03-07 10:00:01', '2019-03-07 10:00:01');
INSERT INTO `device_record_his` VALUES ('59', '100000213', null, '2039', '56', '153', '962', '166', '384', '37', '26', null, null, null, null, null, '2019-03-07 11:00:02', '2019-03-07 11:00:02');
INSERT INTO `device_record_his` VALUES ('60', '100000213', null, '3491', '78', '151', '978', '163', '384', '35', '25', null, null, null, null, null, '2019-03-07 12:00:00', '2019-03-07 12:00:00');
INSERT INTO `device_record_his` VALUES ('61', '100000213', null, '6909', '88', '154', '977', '163', '386', '36', '25', null, null, null, null, null, '2019-03-07 13:00:00', '2019-03-07 13:00:00');
INSERT INTO `device_record_his` VALUES ('62', '100000213', null, '8153', '90', '160', '973', '166', '380', '36', '25', null, null, null, null, null, '2019-03-07 14:00:01', '2019-03-07 14:00:01');
INSERT INTO `device_record_his` VALUES ('63', '100000213', null, '9354', '114', '158', '978', '169', '384', '36', '25', null, null, null, null, null, '2019-03-07 15:00:01', '2019-03-07 15:00:01');
INSERT INTO `device_record_his` VALUES ('64', '100000213', null, '4549', '114', '154', '971', '170', '384', '36', '25', null, null, null, null, null, '2019-03-07 16:00:01', '2019-03-07 16:00:01');
INSERT INTO `device_record_his` VALUES ('65', '100000213', null, '2391', '128', '149', '976', '165', '386', '35', '25', null, null, null, null, null, '2019-03-07 17:00:01', '2019-03-07 17:00:01');
INSERT INTO `device_record_his` VALUES ('66', '100000213', null, '951', '142', '151', '974', '164', '384', '35', '25', null, null, null, null, null, '2019-03-07 18:00:01', '2019-03-07 18:00:01');
INSERT INTO `device_record_his` VALUES ('67', '100000213', null, '2373', '0', '154', '956', '160', '389', '28', '20', null, null, null, null, null, '2019-03-08 09:00:01', '2019-03-08 09:00:01');
INSERT INTO `device_record_his` VALUES ('68', '100000213', null, '7967', '0', '157', '946', '163', '389', '29', '20', null, null, null, null, null, '2019-03-08 10:00:00', '2019-03-08 10:00:00');
INSERT INTO `device_record_his` VALUES ('69', '100000213', null, '5463', '0', '162', '930', '167', '388', '29', '20', null, null, null, null, null, '2019-03-08 11:00:01', '2019-03-08 11:00:01');
INSERT INTO `device_record_his` VALUES ('70', '100000213', null, '8661', '0', '163', '933', '169', '389', '30', '21', null, null, null, null, null, '2019-03-08 12:00:01', '2019-03-08 12:00:01');
INSERT INTO `device_record_his` VALUES ('71', '100000213', null, '4495', '0', '166', '926', '173', '391', '29', '20', null, null, null, null, null, '2019-03-08 13:00:01', '2019-03-08 13:00:01');
INSERT INTO `device_record_his` VALUES ('72', '100000213', null, '6144', '0', '165', '946', '173', '388', '31', '21', null, null, null, null, null, '2019-03-08 14:00:03', '2019-03-08 14:00:03');
INSERT INTO `device_record_his` VALUES ('73', '100000213', null, '2690', '0', '161', '976', '174', '387', '31', '21', null, null, null, null, null, '2019-03-08 15:00:07', '2019-03-08 15:00:07');
INSERT INTO `device_record_his` VALUES ('74', '100000213', null, '2899', '2', '160', '989', '174', '391', '31', '21', null, null, null, null, null, '2019-03-08 16:00:01', '2019-03-08 16:00:01');
INSERT INTO `device_record_his` VALUES ('75', '100000213', null, '951', '4', '161', '976', '172', '386', '32', '22', null, null, null, null, null, '2019-03-08 17:00:04', '2019-03-08 17:00:04');
INSERT INTO `device_record_his` VALUES ('76', '100000213', null, '216', '4', '156', '989', '171', '388', '32', '22', null, null, null, null, null, '2019-03-08 18:00:01', '2019-03-08 18:00:01');
INSERT INTO `device_record_his` VALUES ('77', '100000213', null, '3873', '0', '164', '991', '174', '391', '37', '25', null, null, null, null, null, '2019-03-09 10:00:02', '2019-03-09 10:00:02');
INSERT INTO `device_record_his` VALUES ('78', '100000213', null, '5039', '0', '158', '997', '175', '392', '37', '25', null, null, null, null, null, '2019-03-09 11:00:01', '2019-03-09 11:00:01');
INSERT INTO `device_record_his` VALUES ('79', '100000213', null, '5523', '0', '162', '997', '173', '389', '37', '26', null, null, null, null, null, '2019-03-09 12:00:01', '2019-03-09 12:00:01');
INSERT INTO `device_record_his` VALUES ('80', '100000213', null, '7131', '0', '164', '984', '174', '388', '38', '26', null, null, null, null, null, '2019-03-09 13:00:01', '2019-03-09 13:00:01');

-- ----------------------------
-- Table structure for device_record_his_avg
-- ----------------------------
DROP TABLE IF EXISTS `device_record_his_avg`;
CREATE TABLE `device_record_his_avg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dev_id` bigint(20) DEFAULT NULL,
  `video` varchar(11) DEFAULT NULL COMMENT '存在设备',
  `light` double(11,0) DEFAULT '0' COMMENT '光照  lux',
  `rain` double(11,0) DEFAULT '0' COMMENT '33     日降雨量3.3 mm',
  `air_temp` double(11,0) DEFAULT NULL COMMENT '空气温度  236   23.6 度',
  `air_humi` double(11,0) DEFAULT NULL COMMENT '空气湿度  384    38.4',
  `soil_temp` double(11,0) DEFAULT NULL COMMENT '土壤温度272    27.2度',
  `soil_humi` double(11,0) DEFAULT NULL COMMENT '土壤湿度275  27.5',
  `soil_electric` double(4,0) DEFAULT NULL COMMENT '土壤电导率  122 uS/cm   与光照不用除10',
  `soil_salt` double(11,0) DEFAULT NULL COMMENT '土壤盐分  69 mg/L',
  `air_pressure` double(11,0) DEFAULT NULL COMMENT '空气气压',
  `wind_speed` double(4,0) DEFAULT NULL COMMENT '风速',
  `wind` varchar(4) DEFAULT NULL COMMENT '风向',
  `create_time` date DEFAULT NULL,
  `update_time` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='设备的历史记录日平均值';

-- ----------------------------
-- Records of device_record_his_avg
-- ----------------------------
INSERT INTO `device_record_his_avg` VALUES ('1', '100000213', null, '1459', '33', '236', '384', '275', '273', '122', '69', null, null, null, '2019-02-27', null);
INSERT INTO `device_record_his_avg` VALUES ('2', '100000213', null, '1560', '39', '146', '263', '300', '434', '59', '111', null, null, null, '2019-02-28', null);
INSERT INTO `device_record_his_avg` VALUES ('3', '100000213', null, '1560', '44', '146', '262', '353', '423', '59', '110', null, null, null, '2019-03-01', null);
INSERT INTO `device_record_his_avg` VALUES ('4', '100000213', null, '1222', '10', '245', '100', '190', '360', '55', '145', null, null, null, '2019-03-02', null);
INSERT INTO `device_record_his_avg` VALUES ('5', '100000213', null, '1560', '44', '146', '262', '353', '423', '59', '110', null, null, null, '2019-03-03', null);
INSERT INTO `device_record_his_avg` VALUES ('6', '100000213', null, '1459', '33', '236', '384', '275', '273', '122', '69', null, null, null, '2019-03-04', null);
INSERT INTO `device_record_his_avg` VALUES ('7', '100000213', null, '15651', '80', '239', '857', '235', '364', '53', '32', null, null, null, '2019-03-05', null);

-- ----------------------------
-- Table structure for device_user
-- ----------------------------
DROP TABLE IF EXISTS `device_user`;
CREATE TABLE `device_user` (
  `id` int(11) DEFAULT NULL,
  `device_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of device_user
-- ----------------------------
INSERT INTO `device_user` VALUES ('1001', '100000213');
INSERT INTO `device_user` VALUES ('1001', '100000214');
INSERT INTO `device_user` VALUES ('1001', '100000215');
INSERT INTO `device_user` VALUES ('1020', '100000206');

-- ----------------------------
-- Table structure for device_warning
-- ----------------------------
DROP TABLE IF EXISTS `device_warning`;
CREATE TABLE `device_warning` (
  `id` int(11) NOT NULL,
  `dev_id` bigint(20) DEFAULT NULL COMMENT '设备id',
  `light_max_warning` int(11) DEFAULT NULL COMMENT '光照强度最大值报警',
  `light_min_warning` int(11) DEFAULT NULL COMMENT '光照强度最小值报警',
  `rain_max_warning` int(11) DEFAULT NULL COMMENT '降雨量最大值报警',
  `rain_min_warning` int(11) DEFAULT NULL COMMENT '降雨量最小值报警',
  `air_temp_max_warning` int(11) DEFAULT NULL COMMENT '空气温度最大值报警',
  `air_temp_min_warning` int(11) DEFAULT NULL COMMENT '空气温度最小值报警',
  `air_humi_max_warning` int(11) DEFAULT NULL COMMENT '空气湿度最大值报警',
  `air_humi_min_warning` int(11) DEFAULT NULL COMMENT '空气湿度最小值报警',
  `soil_temp_max_warning` int(11) DEFAULT NULL COMMENT '土壤温度最大值报警',
  `soil_temp_min_warning` int(11) DEFAULT NULL COMMENT '土壤温度最小值报警',
  `soil_humi_max_warning` int(11) DEFAULT NULL COMMENT '土壤湿度最大值报警',
  `soil_humi_min_warning` int(11) DEFAULT NULL COMMENT '土壤湿度最小值报警',
  `soil_electric_max_warning` int(11) DEFAULT NULL COMMENT '土壤电导率最大值报警',
  `soil_electric_min_warning` int(11) DEFAULT NULL COMMENT '土壤电导率最小值报警',
  `soil_salt_max_warning` int(11) DEFAULT NULL COMMENT '土壤盐分最大值报警',
  `soil_salt_min_warning` int(11) DEFAULT NULL COMMENT '土壤盐分最小值报警',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of device_warning
-- ----------------------------

-- ----------------------------
-- Table structure for mounting
-- ----------------------------
DROP TABLE IF EXISTS `mounting`;
CREATE TABLE `mounting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` int(11) DEFAULT NULL COMMENT '设备id',
  `mounting_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备挂载的传感器表';

-- ----------------------------
-- Records of mounting
-- ----------------------------

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` int(4) NOT NULL COMMENT '权限id',
  `p_Name` varchar(20) DEFAULT NULL COMMENT '权限名称',
  `detail` varchar(100) DEFAULT NULL COMMENT '权限说明',
  `status` int(4) DEFAULT '1' COMMENT '状态，1：正常，0：冻结',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', '浏览实时视频', 'view', null);
INSERT INTO `permission` VALUES ('2', '浏览实时数据历史数据', 'viewdata', null);
INSERT INTO `permission` VALUES ('3', '远程控制', 'add', null);
INSERT INTO `permission` VALUES ('4', '添加修改删除二三级用户', 'edit', null);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` int(4) NOT NULL COMMENT '角色id',
  `roleName` varchar(10) DEFAULT NULL COMMENT '角色名称',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '超级管理员');
INSERT INTO `role` VALUES ('2', '管理员用户');
INSERT INTO `role` VALUES ('3', '普通用户');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `roleid` int(4) DEFAULT NULL COMMENT '角色id',
  `p_id` int(4) DEFAULT NULL COMMENT '权限id',
  KEY `permissionid` (`p_id`),
  KEY `role_permissionid` (`roleid`),
  CONSTRAINT `permissionid` FOREIGN KEY (`p_id`) REFERENCES `permission` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `role_permissionid` FOREIGN KEY (`roleid`) REFERENCES `role` (`role_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('1', '1');
INSERT INTO `role_permission` VALUES ('1', '2');
INSERT INTO `role_permission` VALUES ('1', '3');
INSERT INTO `role_permission` VALUES ('1', '4');
INSERT INTO `role_permission` VALUES ('2', '1');
INSERT INTO `role_permission` VALUES ('2', '2');
INSERT INTO `role_permission` VALUES ('2', '3');
INSERT INTO `role_permission` VALUES ('3', '1');
INSERT INTO `role_permission` VALUES ('3', '2');

-- ----------------------------
-- Table structure for tbl_emp
-- ----------------------------
DROP TABLE IF EXISTS `tbl_emp`;
CREATE TABLE `tbl_emp` (
  `emp_id` int(11) NOT NULL COMMENT '职工id',
  `emp_name` varchar(50) DEFAULT NULL,
  `gender` char(1) DEFAULT '0' COMMENT '男0女1',
  `email` varchar(50) DEFAULT NULL,
  `d_id` int(11) DEFAULT '0' COMMENT '部门编号',
  PRIMARY KEY (`emp_id`),
  KEY `deptid` (`d_id`),
  KEY `emp_name` (`emp_name`),
  KEY `emp_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_emp
-- ----------------------------
INSERT INTO `tbl_emp` VALUES ('1001', 'admin', 'M', 'e123456@qq.com', '4');
INSERT INTO `tbl_emp` VALUES ('1020', 'jun', '0', 'megain@megain.com', '3');

-- ----------------------------
-- Table structure for update_terminal
-- ----------------------------
DROP TABLE IF EXISTS `update_terminal`;
CREATE TABLE `update_terminal` (
  `up_id` bigint(50) NOT NULL COMMENT '可升级更新的设备ID',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `up_status` int(4) DEFAULT NULL COMMENT '状态1-已更新  2-可更新 3-删除',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`up_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='固件远程升级';

-- ----------------------------
-- Records of update_terminal
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户表id',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '用户密码，MD5加密',
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `question` varchar(100) DEFAULT NULL COMMENT '找回密码问题',
  `answer` varchar(100) DEFAULT NULL COMMENT '找回密码答案',
  `status` int(4) DEFAULT '1' COMMENT '''状态，1：正常，0：冻结状态，2：删除',
  `dept_id` int(11) DEFAULT NULL COMMENT '组织编号',
  `role_id` int(4) NOT NULL COMMENT '角色1-普通用户,2-管理员，3-超级用户',
  `d_id` int(11) DEFAULT NULL COMMENT '所属组织编号   -1无部门，≥1有部门',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '最后一次更新时间',
  `login_time` datetime DEFAULT NULL COMMENT '登录时间',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `num_admin_devices` int(11) DEFAULT NULL COMMENT '用户拥有管理员权限的设备数',
  `num_watch_device` int(11) DEFAULT NULL COMMENT '用户可以浏览的设备数',
  `gender` char(1) DEFAULT '0' COMMENT '性别，0男，1女',
  `dep_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name_unique` (`username`) USING BTREE,
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=1036 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1001', 'admin', 'V10BYZ3949NB59BNNV56V057A20A883V', 'e123456@qq.com', '1323456789', '问题', '答案', '1', '0', '1', null, '2019-02-20 17:28:11', '2019-02-20 17:28:11', '2019-02-20 17:28:11', '2019-02-20 17:28:11', null, null, '0', '0');
INSERT INTO `user` VALUES ('1020', 'jun', 'V10BYZ3949NB59BNNV56V057A20A883V', 'megain@megain.com', '13434568765', '好问题', '没答案', '1', '3', '1', null, '2019-01-18 11:13:44', '2019-01-18 11:13:51', '2019-01-18 11:13:53', '2019-01-18 11:13:56', null, null, '0', null);
INSERT INTO `user` VALUES ('1033', 'junhao', 'V10BYZ3949NB59BNNV56V057A20A883V', 'email@163.com', '12345678911', null, null, '1', '0', '3', null, '2019-01-22 14:22:23', '2019-01-22 14:22:23', '2019-01-22 14:22:23', '2019-01-22 14:22:23', null, null, '0', null);
INSERT INTO `user` VALUES ('1034', 'xungui', '21232A297B57B5B743894B0V4B801AZ3', 'email@163.com', '12345678911', null, null, '1', '0', '3', null, '2019-01-22 14:25:16', '2019-01-22 14:25:16', '2019-01-22 14:25:16', '2019-01-22 14:25:16', null, null, '0', null);
INSERT INTO `user` VALUES ('1035', 'jun1', 'V10BYZ3949NB59BNNV56V057A20A883V', 'emailemail@163.com', '12345678911', null, null, null, '3', '3', null, '2019-02-20 17:07:24', '2019-02-20 17:07:24', '2019-02-20 17:07:24', '2019-02-20 17:07:24', null, null, null, null);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `userid` int(11) NOT NULL COMMENT '用户id',
  `roleid` int(4) NOT NULL COMMENT '角色id',
  KEY `userid` (`userid`),
  KEY `roleid` (`roleid`),
  CONSTRAINT `roleid` FOREIGN KEY (`roleid`) REFERENCES `role` (`role_id`) ON UPDATE CASCADE,
  CONSTRAINT `userid` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1001', '1');

-- ----------------------------
-- Table structure for user_watch_device
-- ----------------------------
DROP TABLE IF EXISTS `user_watch_device`;
CREATE TABLE `user_watch_device` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `device_id` int(11) DEFAULT NULL,
  `is_admin` int(1) DEFAULT '0' COMMENT '0不是管理员，1管理员(一个设备一个管理员',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_watch_device
-- ----------------------------
