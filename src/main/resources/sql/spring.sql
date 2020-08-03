/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50147
 Source Host           : localhost:3306
 Source Schema         : spring

 Target Server Type    : MySQL
 Target Server Version : 50147
 File Encoding         : 65001

 Date: 03/08/2020 19:49:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `money` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES (1, 'jack', 1000);
INSERT INTO `account` VALUES (2, 'rose', 1000);

-- ----------------------------
-- Table structure for items
-- ----------------------------
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `price` float(10, 1) NOT NULL COMMENT '商品定价',
  `detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品描述',
  `pic` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `createtime` datetime NOT NULL COMMENT '生产日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of items
-- ----------------------------
INSERT INTO `items` VALUES (1, 'Aline超极本', 10000.0, '该电脑质量非常好！！！！', '530774e3-66c9-4dc8-8fc4-79b24011660c.jpg', '2017-08-06 21:12:27');
INSERT INTO `items` VALUES (2, '笔记本', 6000.0, '笔记本性能好，质量好！！！！！', NULL, '2015-02-09 13:22:57');
INSERT INTO `items` VALUES (3, '背包', 200.0, '名牌背包，容量大质量好！！！！', NULL, '2015-02-06 13:23:02');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '下单用户id',
  `number` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `createtime` datetime NOT NULL COMMENT '创建订单时间',
  `note` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_orders_1`(`user_id`) USING BTREE,
  CONSTRAINT `FK_orders_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (3, 1, '1000010', '2015-02-04 13:22:35', NULL);
INSERT INTO `orders` VALUES (4, 1, '1000011', '2015-02-03 13:22:41', NULL);
INSERT INTO `orders` VALUES (5, 10, '1000012', '2015-02-12 16:13:23', NULL);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, '接客', '998');
INSERT INTO `t_user` VALUES (2, 'rose', '5678');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名称',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `address` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '王五', NULL, '2', NULL);
INSERT INTO `user` VALUES (10, '张三', '2014-07-10', '2', '北京市');
INSERT INTO `user` VALUES (16, '张小明', NULL, '1', '河南郑州');
INSERT INTO `user` VALUES (22, 'sherry', '2018-01-02', '1', '浙江杭州');
INSERT INTO `user` VALUES (24, '张三丰', NULL, '1', '河南郑州');
INSERT INTO `user` VALUES (26, '王五', NULL, NULL, NULL);
INSERT INTO `user` VALUES (29, '张飞', '2017-08-04', '1', '四川成都');
INSERT INTO `user` VALUES (30, '关羽', '2017-08-04', '1', '四川');
INSERT INTO `user` VALUES (31, '刘备', '2017-08-04', '1', '四川');
INSERT INTO `user` VALUES (36, 'hassan', '2018-01-02', '1', '浙江杭州');

SET FOREIGN_KEY_CHECKS = 1;
