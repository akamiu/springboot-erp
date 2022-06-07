package com.roy.mapper;

import com.roy.entities.StockOutOrder;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StockOutOrderMapper {
    public Integer insertOrder(StockOutOrder stockOutOrder);
}
