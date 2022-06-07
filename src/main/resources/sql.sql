# 进销存管理系统数据库设计
DROP TABLE IF EXISTS `goods_category`;
CREATE TABLE `goods_category`
(
    `id`          bigint(20)  NOT NULL AUTO_INCREMENT,
    `name`        varchar(20) NOT NULL DEFAULT '',
    `create_time` datetime    NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 7
  DEFAULT CHARSET = utf8 COMMENT ='商品分类表';

DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`
(
    `id`            bigint(20)           NOT NULL AUTO_INCREMENT COMMENT '商品编号',
    `name`          varchar(50)          NOT NULL COMMENT '商品名称',
    `unit`          ENUM ('只', '件', '箱') NOT NULL COMMENT '商品单位',
    `selling_price` decimal(10, 2)       NOT NULL COMMENT '标准卖价',
    `buying_price`  decimal(10, 2)       NOT NULL COMMENT '标准买价',
    `category_id`   bigint(20)           NOT NULL COMMENT '商品分类',
    `maxStock`      int(20)              NOT NULL COMMENT '最高库存',
    `minStock`      int(20)              NOT NULL COMMENT '最低库存',
    `goodsDisabled` tinyint(1) DEFAULT false COMMENT '是否被禁用',
    `created_date`  datetime             NOT NULL COMMENT '创建日期',
    PRIMARY KEY (`id`),
    FOREIGN KEY (category_id) REFERENCES goods_category (id)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8 COMMENT ='商品信息表';


#
# Structure for table "customer_info"
#
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`
(
    `id`                bigint(20)     NOT NULL AUTO_INCREMENT COMMENT '客户编号',
    `name`              varchar(20)    NOT NULL DEFAULT '' COMMENT '客户名称',
    `type`              varchar(8)     NOT NULL COMMENT '客户类型',
    `owner`             varchar(5)     NOT NULL COMMENT '负责人',
    `contact_name`      varchar(5)     NOT NULL COMMENT '联系人',
    `contact_phone`     char(11)       NOT NULL COMMENT '联系人手机',
    `recipient_name`    varchar(20)    NOT NULL COMMENT '收件人姓名',
    `recipient_phone`   char(11)       NOT NULL COMMENT '收件人手机',
    `recipient_address` varchar(40)    NOT NULL COMMENT '收件人地址',
    `debt`              decimal(20, 2) NOT NULL DEFAULT 0 COMMENT '欠款',
    `created_date`      datetime       NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '创建日期',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8 COMMENT ='客户信息表';

#
# Data for table "customer_info"
#

INSERT INTO `customer` (`id`, `name`, `type`, `owner`, `contact_name`, `contact_phone`, `recipient_name`,
                        `recipient_phone`, `recipient_address`, `debt`, `created_date`)
VALUES ('1', '周建昌', '普通客户', '李海杰', '周建昌', '13421450124', '刘希', '18465741248', '花城大道777号', 0, '2021-03-03 09:39:00'),
       ('2', '大地公司', '大客户', '李海杰', '徐导', '13423450124', '大地公司', '18465741248', '天河员村西街2号', 0, '2021-03-03 09:39:00'),
       ('3', '天水南路揽投部', '大客户', '李海杰', '洪合力', '18521450124', '天水南路揽投部', '18465741248', '天水南路777号', 0,
        '2021-03-03 09:39:00'),
       ('4', '齐洁', '大客户', '李海杰', '张强', '18326470124', '齐洁', '18465741248', '广州市天河区黄埔大道西118号', 0, '2021-03-03 09:39:00'),
       ('5', '田总', '大客户', '李海杰', '郭杰', '17812450124', '田福祥', '18465741248', '广东省广州市天河区兴盛路10号135铺', 0,
        '2021-03-03 09:39:00'),
       ('6', '讯栖科瑞客户', '批发客户', '李海杰', '徐畅', '18421450124', '刘晓玲', '18465741248', '广东省广州市越秀区中山四路', 0,
        '2021-03-03 09:39:00'),
       ('7', '爱玛', '普通客户', '李海杰', '林琳', '17421450124', '赖响晴', '18465741248', '深圳市光明区油麻岗路68号', 0, '2021-03-03 09:39:00'),
       ('8', '周述', '普通客户', '李海杰', '陈飞达', '13521450124', '周周', '18465741248', '深圳市光明区粤宝工业区37号', 0,
        '2021-03-03 09:39:00');

#
#
#
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier`
(
    `id`            bigint(20)     NOT NULL AUTO_INCREMENT COMMENT '供应商编号',
    `name`          varchar(20)    NOT NULL DEFAULT '' COMMENT '供应商名称',
    `type`          varchar(8)     NOT NULL COMMENT '供应商类型',
    `owner`         bigint(20)     NOT NULL COMMENT '负责人',
    `contact_name`  varchar(10)    NOT NULL COMMENT '联系人',
    `contact_phone` char(11)       NOT NULL COMMENT '联系人手机',
    `address`       varchar(40)    NOT NULL COMMENT '供应商地址',
    `debt`          decimal(20, 2) NOT NULL DEFAULT 0 COMMENT '欠款',
    `created_date`  datetime       NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '创建日期',
    PRIMARY KEY (id),
    FOREIGN KEY (owner) REFERENCES user (id)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8 COMMENT ='供应商信息表';

INSERT INTO `supplier` (`id`, `name`, `type`, `owner`, `contact_name`, `contact_phone`, `address`, `debt`,
                        `created_date`)
VALUES ('1', '周建昌', '个体', '李海杰', '周建昌', '13421450124', '花城大道777号', 0, '2021-03-03 09:39:00'),
       ('2', '大地公司', '一级供应商', '李海杰', '徐导', '13423450124', '天河员村西街2号', 0, '2021-03-03 09:39:00'),
       ('3', '天水南路揽投部', '二级供应商', '李海杰', '天水南路揽投部', '18465741248', '天水南路777号', 0, '2021-03-03 09:39:00'),
       ('4', '齐洁', '批发', '李海杰', '张强', '18326470124', '广州市天河区黄埔大道西118号', 0, '2021-03-03 09:39:00'),
       ('5', '田总', '个体', '李海杰', '郭杰', '17812450124', '广东省广州市天河区兴盛路10号135铺', 0, '2021-03-03 09:39:00'),
       ('6', '讯栖科瑞客户', '一级供应商', '李海杰', '徐畅', '18421450124', '广东省广州市越秀区中山四路', 0, '2021-03-03 09:39:00'),
       ('7', '爱玛', '个体', '周述', '林琳', '17421450124', '深圳市光明区油麻岗路68号', 0, '2021-03-03 09:39:00'),
       ('8', '周述', '个体', '李海杰', '陈飞达', '13521450124', '深圳市光明区粤宝工业区37号', 0, '2021-03-03 09:39:00');

#
# Structure for table
#


DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`
(
    `id`           bigint(20)    NOT NULL AUTO_INCREMENT COMMENT '用户编号',
    `name`         varchar(20)   NOT NULL DEFAULT '' COMMENT '用户名称',
    `permission`   varchar(3000) NOT NULL COMMENT '用户权限',
    `role`         varchar(20)   NOT NULL COMMENT '用户角色',
    `phone`        char(11)      NOT NULL COMMENT '用户手机',
    `account`      varchar(12)   NOT NULL COMMENT '用户账号',
    `password`     varchar(50)   NOT NULL COMMENT '用户密码',
    `created_date` datetime      NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '创建日期',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8 COMMENT ='用户信息表';

INSERT INTO `user` (`id`, `name`, `permission`, `role`, `phone`, `account`, `password`, `created_date`)
VALUES ('1', '李海杰',
        'sp_read,sp_edit,sp_del,kh_read,kh_edit,ck_read,ck_edit,ck_del,gys_read,gys_edit,gys_del,yh_edit,yh_read,yh_del',
        '超级管理员', '14502347841', 'admin', '91fe0e80d07390750d46ab6ed3a99316', '2021-03-04 16:10:00'),
       ('2', '张述',
        'sp_read,sp_edit,sp_del,kh_read,kh_edit,ck_read,ck_edit,ck_del,gys_read,gys_edit,gys_del,yh_edit,yh_read,yh_del',
        '超级管理员', '14502347841', 'role1', 'role1', '2021-03-04 16:10:00'),
       ('3', '周强',
        'sp_read,sp_edit,sp_del,kh_read,kh_edit,ck_read,ck_edit,ck_del,gys_read,gys_edit,gys_del,yh_edit,yh_read,yh_del',
        '超级管理员', '14502347841', 'role2', 'role2', '2021-03-04 16:10:00'),
       ('4', '徐立',
        'sp_read,sp_edit,sp_del,kh_read,kh_edit,ck_read,ck_edit,ck_del,gys_read,gys_edit,gys_del,yh_edit,yh_read,yh_del',
        '超级管理员', '14502347841', 'role3', 'role3', '2021-03-04 16:10:00');

DROP TABLE IF EXISTS `warehouse`;
CREATE TABLE `warehouse`
(
    `id`           bigint(20)  NOT NULL AUTO_INCREMENT COMMENT '仓库编号',
    `name`         varchar(20) NOT NULL DEFAULT '' COMMENT '仓库名称',
    `address`      varchar(40) NOT NULL COMMENT '仓库地址',
    `owner`        bigint(20)  NOT NULL COMMENT '负责人id',
    `created_date` datetime    NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '创建日期',
    `msg`          varchar(50) NOT NULL COMMENT '备注',
    PRIMARY KEY (`id`),
    FOREIGN KEY (owner) REFERENCES user (id)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8 COMMENT ='仓库信息表';

INSERT INTO `warehouse` (`id`, `name`, `address`, `owner`, `created_date`, `msg`)
VALUES ('1', '广州一仓', '花城大道777号', 1, '2021-03-03 09:39:00', '护肤美妆用品仓'),
       ('2', '广州总仓', '天河员村西街2号', 1, '2021-03-03 09:39:00', '大客户群体仓'),
       ('3', '恒旺仓库', '天水南路777号', 1, '2021-03-03 09:39:00', ''),
       ('4', '快捷1仓', '广州市天河区黄埔大道西118号', 1, '2021-03-03 09:39:00', '');


DROP TABLE IF EXISTS `goods_stock`;
CREATE TABLE `goods_stock`
(
    `goods_id`     bigint(20) NOT NULL COMMENT '商品编号',
    `warehouse_id` bigint(20) NOT NULL COMMENT '仓库编号',
    `current_num`  int(20)    NOT NULL COMMENT '当前库存',
    PRIMARY KEY (goods_id, warehouse_id),
    FOREIGN KEY (goods_id) REFERENCES goods (id),
    FOREIGN KEY (warehouse_id) REFERENCES warehouse (id)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8 COMMENT ='商品库存信息表';
######################################################################

DROP TABLE IF EXISTS `stock_in`;
CREATE TABLE `stock_in`
(
    `id`              bigint(20)     NOT NULL AUTO_INCREMENT COMMENT '采购入库单编号',
    `owner_id`        bigint(20)     NOT NULL COMMENT '采购人员',
    `stock_date`      datetime       NOT NULL COMMENT '商品入库日期',
    `approval_status` int(1)         NOT NULL DEFAULT 0 COMMENT '审核状态',
    `supplier_id`     bigint(20)     NOT NULL COMMENT '供应商编号',
    `amount`          decimal(30, 2) NOT NULL COMMENT '总金额',
    PRIMARY KEY (`id`),
    FOREIGN KEY (`owner_id`) REFERENCES user (`id`),
    FOREIGN KEY (`supplier_id`) REFERENCES supplier (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8 COMMENT ='采购入库单信息表';


DROP TABLE IF EXISTS `stockin_goods`;
CREATE TABLE `stockin_goods`
(
    `id`           bigint(20)     NOT NULL AUTO_INCREMENT COMMENT '单据商品明细编号',
    `order_id`     bigint(20)     NOT NULL COMMENT '相关单据编号',
    `goods_id`     bigint(20)     NOT NULL COMMENT '商品编号',
    `goods_num`    int(8)         NOT NULL COMMENT '商品数量',
    `goods_price`  decimal(10, 2) NOT NULL COMMENT '商品价格',
    `warehouse_id` bigint(20)     NOT NULL COMMENT '仓库编号',
    `msg`          varchar(100) DEFAULT '' COMMENT '备注',
    PRIMARY KEY (id),
    FOREIGN KEY (order_id) REFERENCES stock_in (id),
    FOREIGN KEY (goods_id) REFERENCES goods (id),
    FOREIGN KEY (warehouse_id) REFERENCES warehouse (id)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8 COMMENT ='入库单据商品明细信息表';


DROP TABLE IF EXISTS `stock_out`;
CREATE TABLE `stock_out`
(
    `id`              bigint(20)     NOT NULL AUTO_INCREMENT COMMENT '销售出库单编号',
    `owner_id`        bigint(20)     NOT NULL COMMENT '销售人员',
    `delivery_date`   datetime       NOT NULL COMMENT '商品出库日期',
    `customer_id`     bigint(20)     NOT NULL COMMENT '客户编号',
    `amount`          decimal(30, 2) NOT NULL COMMENT '总金额',
    `approval_status` int(1)         NOT NULL DEFAULT 0 COMMENT '审核状态',
    PRIMARY KEY (`id`),
    FOREIGN KEY (owner_id) REFERENCES user (id),
    FOREIGN KEY (customer_id) REFERENCES customer (id)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8 COMMENT ='销售出库单信息表';

DROP TABLE IF EXISTS `stockout_goods`;
CREATE TABLE `stockout_goods`
(
    `id`           bigint(20)     NOT NULL AUTO_INCREMENT COMMENT '单据商品明细编号',
    `order_id`     bigint(20)     NOT NULL COMMENT '相关单据编号',
    `goods_id`     bigint(20)     NOT NULL COMMENT '商品编号',
    `goods_num`    int(8)         NOT NULL COMMENT '商品数量',
    `goods_price`  decimal(10, 2) NOT NULL COMMENT '商品价格',
    `warehouse_id` bigint(20)     NOT NULL COMMENT '仓库编号',
    `msg`          varchar(100) DEFAULT '' COMMENT '备注',
    PRIMARY KEY (id),
    FOREIGN KEY (order_id) REFERENCES stock_out (id),
    FOREIGN KEY (goods_id) REFERENCES goods (id),
    FOREIGN KEY (warehouse_id) REFERENCES warehouse (id)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8 COMMENT ='出库单据商品明细信息表';


DROP TABLE IF EXISTS `transfer_goods`;
CREATE TABLE `transfer_goods`
(
    `id`        bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主码',
    `from_id`   bigint(20) NOT NULL COMMENT '来源仓库',
    `to_id`     bigint(20) NOT NULL COMMENT '目标仓库',
    `goods_id`  bigint(20) NOT NULL COMMENT '商品id',
    `goods_num` int(8)     NOT NULL COMMENT '商品数量',
    `msg`       varchar(100) DEFAULT '' COMMENT '备注',
    PRIMARY KEY (id),
    FOREIGN KEY (from_id) REFERENCES warehouse (id),
    FOREIGN KEY (to_id) REFERENCES warehouse (id),
    FOREIGN KEY (goods_id) REFERENCES goods (id)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8 COMMENT ='转仓信息表';
# 商品验收入库触发器
CREATE TRIGGER updateStockInGoods
    AFTER INSERT
    ON stockin_goods
    FOR EACH ROW
    UPDATE goods_stock
    SET num=num + NEW.goods_num
    WHERE NEW.goods_id = goods_stock.goods_id
      AND NEW.warehouse_id = goods_stock.warehouse_id;
# 商品销售出库触发器
CREATE TRIGGER updateStockOutGoods
    AFTER INSERT
    ON stockout_goods
    FOR EACH ROW
    UPDATE goods_stock
    SET num=num - NEW.goods_num
    WHERE NEW.goods_id = goods_stock.goods_id
      AND NEW.warehouse_id = goods_stock.warehouse_id;

# 商品转仓触发器
CREATE TRIGGER transferGoods
    AFTER INSERT
    ON transfer_goods
    FOR EACH ROW
begin
    UPDATE goods_stock
    SET num=num - NEW.goods_num
    WHERE NEW.from_id = goods_stock.warehouse_id
      and NEW.goods_id = goods_stock.goods_id;
    UPDATE goods_stock
    SET num=num + NEW.goods_num
    WHERE NEW.to_id = goods_stock.warehouse_id
      and NEW.goods_id = goods_stock.goods_id;
end





