package com.roy.mapper;

import com.roy.entities.StockInGoods;
import com.roy.entities.StockInOrder;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StockInGoodsMapper {
    @Insert("insert into stockin_goods(order_id, goods_id, goods_num, goods_price, warehouse_id, msg) values (#{orderId}, #{goodsId}, #{goodsNum}, #{goodsPrice}, #{warehouseId}, #{msg})")
    Integer insertGoods(StockInGoods stockInGoods);
}
