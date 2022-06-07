package com.roy.mapper;

import com.roy.entities.TransferGoods;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TransferGoodsMapper {
    @Insert("insert into transfer_goods(from_id, to_id, goods_id, goods_num) values (#{fromId},#{toId},#{goodsId},#{goodsNum})")
    public Integer insert(TransferGoods transferGoods);
}
