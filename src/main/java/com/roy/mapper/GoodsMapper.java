package com.roy.mapper;

import com.roy.entities.Goods;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface GoodsMapper {

    // 选择所有商品
    @Select("select goods.*,goods_category.name category from goods,goods_category where goods.category_id=goods_category.id")
    public List<Goods> selectAllGoods();

    @Insert("INSERT INTO goods ( name, unit, selling_price, buying_price, category_id, maxStock, minStock, created_date )VALUES(#{name},#{unit},#{sellingPrice},#{buyingPrice},#{categoryId},#{maxStock},#{minStock},#{createdDate})")
    public int insertGoods(Goods goods);

    public int updateGoods(Goods goods);

    @Delete("delete from goods where id = #{id}")
    public int deleteGoodsById(@Param("id") Integer id);

    @Delete("delete from goods where id in (${id})")
    public int deleteBatchGoods(String ids);

    //    @Select("select goods.*,goods_category.name category from goods,goods_category where goods.category_id=goods_category.id ORDER BY goods.id limit #{pageNum},#{pageSize}")
//    List<Goods> selectPage(Integer pageNum, Integer pageSize);


//    @Select("select goods.*,goods_category.name category from goods,goods_category where goods.category_id=goods_category.id and category_id=#{categoryId} and goods.name like #{name}  ORDER BY goods.id limit #{pageNum},#{pageSize}")
    List<Goods> selectPage(Integer pageNum, Integer pageSize, Integer categoryId, String name);

    @Select("select count(*) from goods")
    public Integer getGoodsNum();
}