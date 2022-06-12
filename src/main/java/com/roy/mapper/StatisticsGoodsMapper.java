package com.roy.mapper;

import com.roy.entities.StatisticsGoods;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.sql.Time;
import java.sql.Timestamp;
import java.util.List;

@Mapper
public interface StatisticsGoodsMapper {
    @Select("call statistics_goods(#{start},#{end})")
    List<StatisticsGoods> getStatistics(String start, String end);
}
