/*
 Navicat Premium Data Transfer

 Source Server         : DBcourse
 Source Server Type    : MySQL
 Source Server Version : 50735
 Source Host           : localhost:3306
 Source Schema         : my_erp

 Target Server Type    : MySQL
 Target Server Version : 50735
 File Encoding         : 65001

 Date: 12/06/2022 14:17:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '客户编号',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '客户名称',
  `type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客户类型',
  `owner_id` bigint(20) NOT NULL COMMENT '负责人',
  `contact_name` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系人',
  `contact_phone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系人手机',
  `debt` decimal(20, 2) NOT NULL DEFAULT 0.00 COMMENT '欠款',
  `created_date` datetime NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '创建日期',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `owner_foreign`(`owner_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES (1, '周建昌', '普通客户', 1, '周建昌', '13421450124', 0.00, '2021-03-03 09:39:00');
INSERT INTO `customer` VALUES (2, '大地公司', '大客户', 1, '徐导', '13423450124', 0.00, '2021-03-03 09:39:00');
INSERT INTO `customer` VALUES (3, '天水南路揽投部', '大客户', 1, '洪合力', '18521450124', 0.00, '2021-03-03 09:39:00');
INSERT INTO `customer` VALUES (4, '齐洁', '大客户', 1, '张强', '18326470124', 0.00, '2021-03-03 09:39:00');
INSERT INTO `customer` VALUES (5, '田总', '大客户', 1, '郭杰', '17812450124', 0.00, '2021-03-03 09:39:00');
INSERT INTO `customer` VALUES (6, '讯栖科瑞客户', '批发客户', 1, '徐畅', '18421450124', 0.00, '2021-03-03 09:39:00');
INSERT INTO `customer` VALUES (7, '爱玛', '普通客户', 1, '林琳', '17421450124', 0.00, '2021-03-03 09:39:00');
INSERT INTO `customer` VALUES (8, '周述', '普通客户', 1, '陈飞达', '13521450124', 0.00, '2021-03-03 09:39:00');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品编号',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `unit` enum('只','件','箱') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品单位',
  `selling_price` decimal(10, 2) NOT NULL COMMENT '标准卖价',
  `buying_price` decimal(10, 2) NOT NULL COMMENT '标准买价',
  `category_id` bigint(20) NOT NULL COMMENT '商品分类',
  `maxStock` int(20) NULL DEFAULT NULL COMMENT '最高库存',
  `minStock` int(20) NULL DEFAULT NULL COMMENT '最低库存',
  `goodsDisabled` tinyint(1) NULL DEFAULT 0 COMMENT '是否被禁用',
  `created_date` datetime NOT NULL COMMENT '创建日期',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `category_id`(`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (1, '老坛酸菜牛肉面', '箱', 25.00, 20.00, 2, 10000, 10, 0, '2022-06-05 00:00:00');
INSERT INTO `goods` VALUES (2, '铅笔', '只', 4.00, 3.00, 1, 10000, 10, 0, '2022-06-05 00:00:00');
INSERT INTO `goods` VALUES (3, '笔记本', '只', 10.00, 6.00, 1, 10000, 10, 0, '2022-06-05 00:00:00');
INSERT INTO `goods` VALUES (4, '火腿肠', '箱', 40.00, 35.00, 1, 1000, 10, 0, '2022-06-05 00:00:00');
INSERT INTO `goods` VALUES (5, '苹果', '箱', 45.00, 30.00, 8, 500, 50, 0, '2022-06-05 00:00:00');
INSERT INTO `goods` VALUES (6, '香蕉', '箱', 30.00, 25.00, 2, 400, 20, 0, '2022-06-02 14:53:08');
INSERT INTO `goods` VALUES (7, '葡萄', '箱', 30.00, 24.00, 8, 300, 20, 0, '2022-06-06 00:00:00');
INSERT INTO `goods` VALUES (8, 'T-shirt', '件', 69.00, 30.00, 3, 400, 10, 0, '2022-06-02 14:55:28');
INSERT INTO `goods` VALUES (9, '芒果', '箱', 40.00, 30.00, 2, NULL, NULL, 0, '2022-06-04 00:00:00');
INSERT INTO `goods` VALUES (10, 'scf', '只', 0.00, 0.00, 1, NULL, NULL, 0, '2022-06-04 00:00:00');
INSERT INTO `goods` VALUES (11, '薯片', '件', 10.00, 7.00, 2, NULL, NULL, 0, '2022-06-04 00:00:00');
INSERT INTO `goods` VALUES (13, '牛奶', '箱', 80.00, 60.00, 2, NULL, NULL, 0, '2022-06-05 00:00:00');
INSERT INTO `goods` VALUES (20, '饼干', '件', 10.00, 8.00, 2, NULL, NULL, 0, '2022-06-06 00:00:00');
INSERT INTO `goods` VALUES (22, 'a', '只', 1111.00, 1111.00, 9, NULL, NULL, 0, '2022-06-09 00:00:00');

-- ----------------------------
-- Table structure for goods_category
-- ----------------------------
DROP TABLE IF EXISTS `goods_category`;
CREATE TABLE `goods_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_category
-- ----------------------------
INSERT INTO `goods_category` VALUES (1, '文具', '2022-06-02 21:07:39');
INSERT INTO `goods_category` VALUES (2, '食品', '2022-06-02 21:07:58');
INSERT INTO `goods_category` VALUES (3, '衣服', '2022-06-02 14:54:57');
INSERT INTO `goods_category` VALUES (8, '水果', '2022-06-05 00:00:00');
INSERT INTO `goods_category` VALUES (9, '洗护', '2022-06-05 00:00:00');
INSERT INTO `goods_category` VALUES (10, '蔬菜', '2022-06-05 00:00:00');
INSERT INTO `goods_category` VALUES (13, '数码', '2022-06-06 00:00:00');

-- ----------------------------
-- Table structure for goods_stock
-- ----------------------------
DROP TABLE IF EXISTS `goods_stock`;
CREATE TABLE `goods_stock`  (
  `warehouse_id` bigint(20) NOT NULL COMMENT '仓库编号',
  `goods_id` bigint(20) NOT NULL COMMENT '商品编号',
  `num` int(20) NOT NULL COMMENT '当前库存',
  PRIMARY KEY (`goods_id`, `warehouse_id`) USING BTREE,
  INDEX `warehouse_id`(`warehouse_id`) USING BTREE,
  CONSTRAINT `goods_stock_ibfk_1` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品库存信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_stock
-- ----------------------------
INSERT INTO `goods_stock` VALUES (1, 1, 990);
INSERT INTO `goods_stock` VALUES (2, 1, 218);
INSERT INTO `goods_stock` VALUES (3, 1, 278);
INSERT INTO `goods_stock` VALUES (5, 1, 3);
INSERT INTO `goods_stock` VALUES (1, 2, 185);
INSERT INTO `goods_stock` VALUES (2, 2, 150);
INSERT INTO `goods_stock` VALUES (5, 2, 10);
INSERT INTO `goods_stock` VALUES (1, 3, 3994);
INSERT INTO `goods_stock` VALUES (2, 3, 6);
INSERT INTO `goods_stock` VALUES (5, 3, 300);
INSERT INTO `goods_stock` VALUES (1, 5, 182);
INSERT INTO `goods_stock` VALUES (2, 5, 9);
INSERT INTO `goods_stock` VALUES (5, 5, 1);
INSERT INTO `goods_stock` VALUES (1, 6, 10);
INSERT INTO `goods_stock` VALUES (5, 6, 3);
INSERT INTO `goods_stock` VALUES (4, 7, 1);
INSERT INTO `goods_stock` VALUES (2, 8, 100);
INSERT INTO `goods_stock` VALUES (3, 9, 200);

-- ----------------------------
-- Table structure for stock_in
-- ----------------------------
DROP TABLE IF EXISTS `stock_in`;
CREATE TABLE `stock_in`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '采购入库单编号',
  `owner_id` bigint(20) NOT NULL COMMENT '采购人员',
  `stock_date` datetime NOT NULL COMMENT '商品入库日期',
  `supplier_id` bigint(20) NOT NULL COMMENT '供应商编号',
  `amount` decimal(30, 2) NOT NULL COMMENT '总金额',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `owner_id`(`owner_id`) USING BTREE,
  INDEX `supplier_id`(`supplier_id`) USING BTREE,
  CONSTRAINT `stock_in_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `stock_in_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '采购入库单信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stock_in
-- ----------------------------
INSERT INTO `stock_in` VALUES (7, 1, '2022-06-01 00:00:00', 1, 15.00);
INSERT INTO `stock_in` VALUES (8, 1, '2022-05-30 00:00:00', 1, 105.00);
INSERT INTO `stock_in` VALUES (10, 3, '2022-06-06 00:00:00', 2, 9130.00);
INSERT INTO `stock_in` VALUES (11, 1, '2022-06-07 00:00:00', 1, 3.00);
INSERT INTO `stock_in` VALUES (12, 1, '2022-06-10 00:00:00', 1, 3.00);

-- ----------------------------
-- Table structure for stock_out
-- ----------------------------
DROP TABLE IF EXISTS `stock_out`;
CREATE TABLE `stock_out`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '销售出库单编号',
  `owner_id` bigint(20) NOT NULL COMMENT '销售人员',
  `delivery_date` datetime NOT NULL COMMENT '商品出库日期',
  `customer_id` bigint(20) NOT NULL COMMENT '客户编号',
  `amount` decimal(30, 2) NOT NULL COMMENT '总金额',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `owner_id`(`owner_id`) USING BTREE,
  INDEX `customer_id`(`customer_id`) USING BTREE,
  CONSTRAINT `stock_out_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `stock_out_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '销售出库单信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stock_out
-- ----------------------------
INSERT INTO `stock_out` VALUES (1, 1, '2022-06-01 00:00:00', 1, 12.00);
INSERT INTO `stock_out` VALUES (2, 1, '2022-06-02 00:00:00', 1, 30000.00);
INSERT INTO `stock_out` VALUES (3, 1, '2022-06-05 00:00:00', 1, 19.00);
INSERT INTO `stock_out` VALUES (4, 1, '2022-06-05 00:00:00', 1, 130.00);
INSERT INTO `stock_out` VALUES (5, 1, '2022-06-02 00:00:00', 1, 12.00);

-- ----------------------------
-- Table structure for stockin_goods
-- ----------------------------
DROP TABLE IF EXISTS `stockin_goods`;
CREATE TABLE `stockin_goods`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '单据商品明细编号',
  `order_id` bigint(20) NOT NULL COMMENT '相关单据编号',
  `goods_id` bigint(20) NOT NULL COMMENT '商品编号',
  `goods_num` int(8) NOT NULL COMMENT '商品数量',
  `goods_price` decimal(10, 2) NOT NULL COMMENT '商品价格',
  `warehouse_id` bigint(20) NOT NULL COMMENT '仓库编号',
  `msg` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `stockin_goods_ibfk_1`(`order_id`) USING BTREE,
  INDEX `stockin_goods_ibfk_2`(`goods_id`) USING BTREE,
  INDEX `stockin_goods_ibfk_3`(`warehouse_id`) USING BTREE,
  CONSTRAINT `stockin_goods_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `stock_in` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `stockin_goods_ibfk_2` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '入库单据商品明细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stockin_goods
-- ----------------------------
INSERT INTO `stockin_goods` VALUES (8, 7, 1, 15, 1.00, 1, NULL);
INSERT INTO `stockin_goods` VALUES (9, 8, 3, 1, 10.00, 1, NULL);
INSERT INTO `stockin_goods` VALUES (10, 8, 2, 1, 5.00, 2, NULL);
INSERT INTO `stockin_goods` VALUES (11, 8, 5, 1, 30.00, 3, NULL);
INSERT INTO `stockin_goods` VALUES (12, 8, 4, 1, 40.00, 4, NULL);
INSERT INTO `stockin_goods` VALUES (13, 8, 11, 1, 20.00, 5, NULL);
INSERT INTO `stockin_goods` VALUES (15, 10, 6, 13, 10.00, 1, NULL);
INSERT INTO `stockin_goods` VALUES (16, 10, 8, 100, 20.00, 2, NULL);
INSERT INTO `stockin_goods` VALUES (17, 10, 9, 200, 20.00, 3, NULL);
INSERT INTO `stockin_goods` VALUES (18, 10, 3, 300, 10.00, 5, NULL);
INSERT INTO `stockin_goods` VALUES (19, 11, 5, 1, 1.00, 1, NULL);
INSERT INTO `stockin_goods` VALUES (20, 11, 3, 1, 1.00, 2, NULL);
INSERT INTO `stockin_goods` VALUES (21, 11, 7, 1, 1.00, 4, NULL);
INSERT INTO `stockin_goods` VALUES (22, 12, 1, 3, 1.00, 1, NULL);

-- ----------------------------
-- Table structure for stockout_goods
-- ----------------------------
DROP TABLE IF EXISTS `stockout_goods`;
CREATE TABLE `stockout_goods`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '单据商品明细编号',
  `order_id` bigint(20) NOT NULL COMMENT '相关单据编号',
  `goods_id` bigint(20) NOT NULL COMMENT '商品编号',
  `goods_num` int(8) NOT NULL COMMENT '商品数量',
  `goods_price` decimal(10, 2) NOT NULL COMMENT '商品价格',
  `warehouse_id` bigint(20) NOT NULL COMMENT '仓库编号',
  `msg` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `stockout_goods_ibfk_1`(`order_id`) USING BTREE,
  INDEX `stockout_goods_ibfk_2`(`goods_id`) USING BTREE,
  INDEX `stockout_goods_ibfk_3`(`warehouse_id`) USING BTREE,
  CONSTRAINT `stockout_goods_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `stock_out` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `stockout_goods_ibfk_2` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `stockout_goods_ibfk_3` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '出库单据商品明细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stockout_goods
-- ----------------------------
INSERT INTO `stockout_goods` VALUES (1, 1, 1, 12, 1.00, 1, NULL);
INSERT INTO `stockout_goods` VALUES (2, 2, 1, 1000, 30.00, 1, NULL);
INSERT INTO `stockout_goods` VALUES (3, 3, 1, 5, 1.00, 3, NULL);
INSERT INTO `stockout_goods` VALUES (4, 3, 1, 5, 1.00, 2, NULL);
INSERT INTO `stockout_goods` VALUES (5, 3, 5, 9, 1.00, 1, NULL);
INSERT INTO `stockout_goods` VALUES (6, 4, 1, 5, 20.00, 3, NULL);
INSERT INTO `stockout_goods` VALUES (7, 4, 2, 6, 5.00, 2, NULL);
INSERT INTO `stockout_goods` VALUES (8, 5, 1, 12, 1.00, 3, NULL);

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '供应商编号',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '供应商名称',
  `type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '供应商类型',
  `owner_id` bigint(20) NOT NULL COMMENT '负责人',
  `contact_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系人',
  `contact_phone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系人手机',
  `address` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '供应商地址',
  `debt` decimal(20, 2) NOT NULL DEFAULT 0.00 COMMENT '欠款',
  `created_date` datetime NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '创建日期',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `owner`(`owner_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '供应商信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES (1, '周建昌', '个体', 1, '周建昌', '13421450124', '花城大道777号', 0.00, '2021-03-03 09:39:00');
INSERT INTO `supplier` VALUES (2, '大地公司', '一级供应商', 2, '徐导', '13423450124', '天河员村西街2号', 0.00, '2022-06-05 00:00:00');
INSERT INTO `supplier` VALUES (3, '天水南路揽投部', '二级供应商', 1, '天水南路揽投部', '18465741248', '天水南路777号', 0.00, '2021-03-03 09:39:00');
INSERT INTO `supplier` VALUES (4, '齐洁', '批发', 1, '张强', '18326470124', '广州市天河区黄埔大道西118号', 0.00, '2021-03-03 09:39:00');
INSERT INTO `supplier` VALUES (5, '田总', '个体', 1, '郭杰', '17812450124', '广东省广州市天河区兴盛路10号135铺', 0.00, '2021-03-03 09:39:00');
INSERT INTO `supplier` VALUES (6, '讯栖科瑞客户', '一级供应商', 1, '徐畅', '18421450124', '广东省广州市越秀区中山四路', 0.00, '2021-03-03 09:39:00');
INSERT INTO `supplier` VALUES (7, '爱玛', '个体', 2, '林琳', '17421450124', '深圳市光明区油麻岗路68号', 0.00, '2021-03-03 09:39:00');
INSERT INTO `supplier` VALUES (8, '周述', '个体', 1, '陈飞达', '13521450124', '深圳市光明区粤宝工业区37号', 0.00, '2021-03-03 09:39:00');

-- ----------------------------
-- Table structure for transfer_goods
-- ----------------------------
DROP TABLE IF EXISTS `transfer_goods`;
CREATE TABLE `transfer_goods`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主码',
  `from_id` bigint(20) NOT NULL COMMENT '来源仓库',
  `to_id` bigint(20) NOT NULL COMMENT '目标仓库',
  `goods_id` bigint(20) NOT NULL COMMENT '商品id',
  `goods_num` int(8) NOT NULL COMMENT '商品数量',
  `msg` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `from_id`(`from_id`) USING BTREE,
  INDEX `to_id`(`to_id`) USING BTREE,
  INDEX `goods_id`(`goods_id`) USING BTREE,
  CONSTRAINT `transfer_goods_ibfk_1` FOREIGN KEY (`from_id`) REFERENCES `warehouse` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `transfer_goods_ibfk_2` FOREIGN KEY (`to_id`) REFERENCES `warehouse` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `transfer_goods_ibfk_3` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '转仓信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of transfer_goods
-- ----------------------------
INSERT INTO `transfer_goods` VALUES (1, 1, 2, 1, 5, '');
INSERT INTO `transfer_goods` VALUES (2, 1, 2, 2, 5, '');
INSERT INTO `transfer_goods` VALUES (3, 1, 2, 1, 3, '');
INSERT INTO `transfer_goods` VALUES (4, 1, 2, 1, 2, '');
INSERT INTO `transfer_goods` VALUES (5, 1, 2, 3, 2, '');
INSERT INTO `transfer_goods` VALUES (6, 1, 2, 3, 5, '');
INSERT INTO `transfer_goods` VALUES (7, 1, 2, 5, 6, '');
INSERT INTO `transfer_goods` VALUES (8, 1, 2, 1, 4, '');
INSERT INTO `transfer_goods` VALUES (9, 1, 2, 1, 3, '');
INSERT INTO `transfer_goods` VALUES (10, 1, 2, 1, 3, '');
INSERT INTO `transfer_goods` VALUES (11, 1, 2, 1, 3, '');
INSERT INTO `transfer_goods` VALUES (12, 1, 2, 5, 3, '');
INSERT INTO `transfer_goods` VALUES (13, 1, 5, 1, 3, '');
INSERT INTO `transfer_goods` VALUES (14, 1, 5, 2, 6, '');
INSERT INTO `transfer_goods` VALUES (15, 1, 5, 2, 4, '');
INSERT INTO `transfer_goods` VALUES (16, 1, 5, 5, 1, '');
INSERT INTO `transfer_goods` VALUES (17, 1, 5, 6, 3, '');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名称',
  `role` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户角色',
  `phone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户手机',
  `account` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码',
  `created_date` datetime NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '创建日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '李海杰', '超级管理员', '14502347841', 'admin', '123456', '2022-06-05 00:00:00');
INSERT INTO `user` VALUES (2, '张述', '超级管理员', '14502347841', 'role1', 'role1', '2021-03-04 16:10:00');
INSERT INTO `user` VALUES (3, '周强', '超级管理员', '14502347841', 'role2', 'role2', '2021-03-04 16:10:00');
INSERT INTO `user` VALUES (4, '徐立', '超级管理员', '14502347841', 'role3', 'role3', '2021-03-04 16:10:00');
INSERT INTO `user` VALUES (6, 'wsdsdsd', 'ww', 'wq', 'wq', 'wq1', '2022-06-05 00:00:00');
INSERT INTO `user` VALUES (7, 'wsdsdsd', 'ww', 'wq', 'wq', 'wq11', '2022-06-05 00:00:00');
INSERT INTO `user` VALUES (8, 'wsdsdsd', 'ww', 'wq', 'wq', 'wq11', '2022-06-05 00:00:00');
INSERT INTO `user` VALUES (11, 'sa', 'hjh', 'hh', 'hh', 'hh', '2022-06-05 00:00:00');

-- ----------------------------
-- Table structure for warehouse
-- ----------------------------
DROP TABLE IF EXISTS `warehouse`;
CREATE TABLE `warehouse`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '仓库编号',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '仓库名称',
  `address` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '仓库地址',
  `owner_id` bigint(20) NOT NULL COMMENT '负责人id',
  `created_date` datetime NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '创建日期',
  `msg` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `owner`(`owner_id`) USING BTREE,
  CONSTRAINT `warehouse_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '仓库信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of warehouse
-- ----------------------------
INSERT INTO `warehouse` VALUES (1, '广州一仓', '花城大道777号', 1, '2022-06-05 00:00:00', '护肤美妆用品仓');
INSERT INTO `warehouse` VALUES (2, '广州总仓', '天河员村西街2号', 1, '2021-03-03 09:39:00', '大客户群体仓');
INSERT INTO `warehouse` VALUES (3, '恒旺仓库', '天水南路777号', 1, '2021-03-03 09:39:00', '');
INSERT INTO `warehouse` VALUES (4, '快捷1仓', '广州市天河区黄埔大道西118号', 1, '2022-06-05 00:00:00', 'hh');
INSERT INTO `warehouse` VALUES (5, '仓库1', '宣城', 1, '2022-06-05 00:00:00', 'xc');

-- ----------------------------
-- View structure for statistics_in
-- ----------------------------
DROP VIEW IF EXISTS `statistics_in`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `statistics_in` AS (select `goods`.`id` AS `id`,`goods`.`name` AS `name`,`goods`.`unit` AS `unit`,`stockin_goods`.`goods_num` AS `in_num`,`stock_in`.`stock_date` AS `stock_date` from ((`goods` join `stockin_goods`) join `stock_in`) where ((`goods`.`id` = `stockin_goods`.`goods_id`) and (`stock_in`.`id` = `stockin_goods`.`order_id`)));

-- ----------------------------
-- View structure for statistics_out
-- ----------------------------
DROP VIEW IF EXISTS `statistics_out`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `statistics_out` AS (select `goods`.`id` AS `id`,`goods`.`name` AS `name`,`goods`.`unit` AS `unit`,`stockout_goods`.`goods_num` AS `out_num`,`stock_out`.`delivery_date` AS `delivery_date` from ((`goods` join `stockout_goods`) join `stock_out`) where ((`goods`.`id` = `stockout_goods`.`goods_id`) and (`stock_out`.`id` = `stockout_goods`.`order_id`)));

-- ----------------------------
-- Procedure structure for statistics_goods
-- ----------------------------
DROP PROCEDURE IF EXISTS `statistics_goods`;
delimiter ;;
CREATE PROCEDURE `statistics_goods`(IN start_date datetime, IN end_date datetime)
BEGIN
    -- 创建进货临时表
    DROP TEMPORARY TABLE IF EXISTS in_goods1;
    CREATE TEMPORARY TABLE in_goods1 AS
        (SELECT id, name, SUM(in_num) in_sum
         FROM statistics_in
         WHERE stock_date >= start_date
           AND stock_date <= end_date
         GROUP BY id);
    DROP TEMPORARY TABLE IF EXISTS in_goods2;
    CREATE TEMPORARY TABLE in_goods2 AS
        (SELECT id, name, SUM(in_num) in_sum
         FROM statistics_in
         WHERE stock_date >= start_date
           AND stock_date <= end_date
         GROUP BY id);
    DROP TEMPORARY TABLE IF EXISTS out_goods1;
    CREATE TEMPORARY TABLE out_goods1 AS
        (SELECT id, name, SUM(out_num) out_sum
         FROM statistics_out
         WHERE statistics_out.delivery_date >= start_date
           AND statistics_out.delivery_date <= end_date
         GROUP BY id);
    DROP TEMPORARY TABLE IF EXISTS out_goods2;
    CREATE TEMPORARY TABLE out_goods2 AS
        (SELECT id, name, SUM(out_num) out_sum
         FROM statistics_out
         WHERE statistics_out.delivery_date >= start_date
           AND statistics_out.delivery_date <= end_date
         GROUP BY id);
    SELECT in_goods1.id, in_goods1.name, in_sum, out_sum
    from in_goods1
             left join out_goods1 on in_goods1.id = out_goods1.id
    union
    SELECT out_goods2.id, out_goods2.name, in_sum, out_sum
    from in_goods2
             right join out_goods2 on in_goods2.id = out_goods2.id;
    DROP TEMPORARY TABLE in_goods1,out_goods1,in_goods2,out_goods2;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table stockin_goods
-- ----------------------------
DROP TRIGGER IF EXISTS `updateStockInGoods`;
delimiter ;;
CREATE TRIGGER `updateStockInGoods` AFTER INSERT ON `stockin_goods` FOR EACH ROW BEGIN
    DECLARE is_exist INTEGER DEFAULT 0;
    SET is_exist = (select count(*)
                    from goods_stock
                    WHERE NEW.goods_id = goods_stock.goods_id
                      AND NEW.warehouse_id = goods_stock.warehouse_id);
    IF is_exist = 0 THEN
        INSERT INTO goods_stock(goods_id, warehouse_id, num)
        values (NEW.goods_id, NEW.warehouse_id, NEW.goods_num);
    ELSE
        UPDATE goods_stock
        SET num=num + NEW.goods_num
        WHERE NEW.goods_id = goods_stock.goods_id
          AND NEW.warehouse_id = goods_stock.warehouse_id;
    END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table stockout_goods
-- ----------------------------
DROP TRIGGER IF EXISTS `updateStockOutGoods`;
delimiter ;;
CREATE TRIGGER `updateStockOutGoods` AFTER INSERT ON `stockout_goods` FOR EACH ROW BEGIN
    DECLARE is_exist INTEGER DEFAULT 0;
    SET is_exist = (select count(*)
                    from goods_stock
                    WHERE NEW.goods_id = goods_stock.goods_id
                      AND NEW.warehouse_id = goods_stock.warehouse_id);
    IF is_exist = 0 THEN
        INSERT INTO goods_stock(goods_id, warehouse_id, num)
        values (NEW.goods_id, NEW.warehouse_id, NEW.goods_num);
    ELSE
        UPDATE goods_stock
        SET num=num - NEW.goods_num
        WHERE NEW.goods_id = goods_stock.goods_id
          AND NEW.warehouse_id = goods_stock.warehouse_id;
    END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table transfer_goods
-- ----------------------------
DROP TRIGGER IF EXISTS `transferGoods`;
delimiter ;;
CREATE TRIGGER `transferGoods` AFTER INSERT ON `transfer_goods` FOR EACH ROW BEGIN
    DECLARE is_exist INTEGER DEFAULT 0;
    SET is_exist = (select count(*)
                    from goods_stock
                    WHERE NEW.goods_id = goods_stock.goods_id
                      AND NEW.to_id = goods_stock.warehouse_id);
    IF is_exist = 0 THEN
        INSERT INTO goods_stock(goods_id, warehouse_id, num)
        values (NEW.goods_id, NEW.to_id, NEW.goods_num);
    ELSE
        UPDATE goods_stock
        SET num=num + NEW.goods_num
        WHERE NEW.to_id = goods_stock.warehouse_id
          and NEW.goods_id = goods_stock.goods_id;
    END IF;
    UPDATE goods_stock
    SET num=num - NEW.goods_num
    WHERE NEW.from_id = goods_stock.warehouse_id
      and NEW.goods_id = goods_stock.goods_id;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
