package com.roy.mapper;

import com.roy.entities.StockInOrder;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StockInOrderMapper {
    public Integer insertOrder(StockInOrder stockInOrder);
}
