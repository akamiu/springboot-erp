package com.roy.mapper;

import com.roy.entities.StockOutGoods;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StockOutGoodsMapper {
    @Insert("insert into stockout_goods(id, order_id, goods_id, goods_num, goods_price, warehouse_id, msg) value (null,#{orderId},#{goodsId},#{goodsNum},#{goodsPrice},#{warehouseId},#{msg})")
    public Integer insertGoods(StockOutGoods stockOutGoods);
}
