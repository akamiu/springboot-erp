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

 Date: 07/06/2022 22:50:01
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
  INDEX `owner_foreign`(`owner_id`) USING BTREE,
  CONSTRAINT `owner_foreign` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户信息表' ROW_FORMAT = Dynamic;

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
  INDEX `category_id`(`category_id`) USING BTREE,
  CONSTRAINT `goods_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `goods_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品信息表' ROW_FORMAT = Dynamic;

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
INSERT INTO `goods` VALUES (21, '白菜', '箱', 12.00, 11.00, 10, NULL, NULL, 0, '2022-06-07 00:00:00');

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
  CONSTRAINT `goods_stock_ibfk_1` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `goods_stock_ibfk_2` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品库存信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_stock
-- ----------------------------
INSERT INTO `goods_stock` VALUES (1, 1, 477);
INSERT INTO `goods_stock` VALUES (2, 1, 223);
INSERT INTO `goods_stock` VALUES (3, 1, 300);
INSERT INTO `goods_stock` VALUES (5, 1, 3);
INSERT INTO `goods_stock` VALUES (1, 2, 195);
INSERT INTO `goods_stock` VALUES (2, 2, 155);
INSERT INTO `goods_stock` VALUES (1, 3, 3993);
INSERT INTO `goods_stock` VALUES (2, 3, 5);
INSERT INTO `goods_stock` VALUES (1, 5, 191);
INSERT INTO `goods_stock` VALUES (2, 5, 9);

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
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '采购入库单信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stock_in
-- ----------------------------
INSERT INTO `stock_in` VALUES (7, 1, '2022-06-01 00:00:00', 1, 15.00);

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '销售出库单信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stock_out
-- ----------------------------
INSERT INTO `stock_out` VALUES (1, 1, '2022-06-01 00:00:00', 1, 12.00);

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
  INDEX `order_id`(`order_id`) USING BTREE,
  INDEX `goods_id`(`goods_id`) USING BTREE,
  INDEX `warehouse_id`(`warehouse_id`) USING BTREE,
  CONSTRAINT `stockin_goods_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `stock_in` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `stockin_goods_ibfk_2` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `stockin_goods_ibfk_3` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '入库单据商品明细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stockin_goods
-- ----------------------------
INSERT INTO `stockin_goods` VALUES (8, 7, 1, 15, 1.00, 1, NULL);

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
  INDEX `order_id`(`order_id`) USING BTREE,
  INDEX `goods_id`(`goods_id`) USING BTREE,
  INDEX `warehouse_id`(`warehouse_id`) USING BTREE,
  CONSTRAINT `stockout_goods_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `stock_out` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `stockout_goods_ibfk_2` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `stockout_goods_ibfk_3` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '出库单据商品明细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stockout_goods
-- ----------------------------
INSERT INTO `stockout_goods` VALUES (1, 1, 1, 12, 1.00, 1, NULL);

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
  INDEX `owner`(`owner_id`) USING BTREE,
  CONSTRAINT `owner` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '供应商信息表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '转仓信息表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '仓库信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of warehouse
-- ----------------------------
INSERT INTO `warehouse` VALUES (1, '广州一仓', '花城大道777号', 1, '2022-06-05 00:00:00', '护肤美妆用品仓');
INSERT INTO `warehouse` VALUES (2, '广州总仓', '天河员村西街2号', 1, '2021-03-03 09:39:00', '大客户群体仓');
INSERT INTO `warehouse` VALUES (3, '恒旺仓库', '天水南路777号', 1, '2021-03-03 09:39:00', '');
INSERT INTO `warehouse` VALUES (4, '快捷1仓', '广州市天河区黄埔大道西118号', 1, '2022-06-05 00:00:00', 'hh');
INSERT INTO `warehouse` VALUES (5, '仓库1', '宣城', 1, '2022-06-05 00:00:00', 'xc');

-- ----------------------------
-- Triggers structure for table stockin_goods
-- ----------------------------
DROP TRIGGER IF EXISTS `updateStockInGoods`;
delimiter ;;
CREATE TRIGGER `updateStockInGoods` AFTER INSERT ON `stockin_goods` FOR EACH ROW UPDATE goods_stock SET num=num+NEW.goods_num 
    WHERE NEW.goods_id=goods_stock.goods_id
		AND NEW.warehouse_id=goods_stock.warehouse_id
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table stockout_goods
-- ----------------------------
DROP TRIGGER IF EXISTS `updateStockOutGoods`;
delimiter ;;
CREATE TRIGGER `updateStockOutGoods` AFTER INSERT ON `stockout_goods` FOR EACH ROW UPDATE goods_stock SET num=num-NEW.goods_num
    WHERE NEW.goods_id=goods_stock.goods_id
      AND NEW.warehouse_id=goods_stock.warehouse_id
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table transfer_goods
-- ----------------------------
DROP TRIGGER IF EXISTS `transferGoods`;
delimiter ;;
CREATE TRIGGER `transferGoods` AFTER INSERT ON `transfer_goods` FOR EACH ROW begin
    UPDATE goods_stock
    SET num=num - NEW.goods_num
    WHERE NEW.from_id = goods_stock.warehouse_id
      and NEW.goods_id = goods_stock.goods_id;
    UPDATE goods_stock
    SET num=num + NEW.goods_num
    WHERE NEW.to_id = goods_stock.warehouse_id
      and NEW.goods_id = goods_stock.goods_id;
end
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
