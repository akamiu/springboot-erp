package com.roy.mapper;

import com.roy.entities.Goods;
import com.roy.entities.GoodsStock;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface GoodsStockMapper {

    @Select("select goods.* from goods where id not in(select goods_id from goods_stock where warehouse_id=#{warehouseId}) order by id")
    public List<Goods> selectGoodsNotInWarehouse(Integer warehouseId);

    @Insert("INSERT INTO goods_stock (warehouse_id,goods_id, num)VALUES(#{warehouseId},#{goodsId},#{num})")
    public int insertGoodsStock(GoodsStock goodsStock);

    @Update("update goods_stock set num=#{num} where warehouse_id=#{warehouseId} and goods_id=#{goodsId}")
    public int updateGoodsStock(GoodsStock goodsStock);

    @Delete("delete from goods_stock where warehouse_id = #{warehouseId} and goods_id = #{goodsId}")
    public int deleteGoodsStockById(Integer warehouseId, Integer goodsId);

    @Delete("delete from goods_stock where (warehouse_id,goods_id) in (${ids})")
    public int deleteBatchGoodsStock(String ids);


    List<GoodsStock> selectPage(Integer pageNum, Integer pageSize, Integer warehouseId);

    @Select("select count(*) from goods_stock,warehouse where goods_stock.warehouse_id=warehouse.id")
    public Integer getGoodsStockNum(Integer warehouseId);

    @Select("select count(*) from goods_stock where goods_id=#{goodsId} and warehouse_id=#{warehouseId}")
    public Integer isExistStock(Long goodsId,Long warehouseId);
}
