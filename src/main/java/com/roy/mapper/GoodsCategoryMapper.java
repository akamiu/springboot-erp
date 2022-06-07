package com.roy.mapper;

import com.roy.entities.Goods;
import com.roy.entities.GoodsCategory;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface GoodsCategoryMapper {
    @Select("select * from goods_category where name=#{name}")
    public GoodsCategory selectByName(String name);

    @Select("select * from goods_category")
    public List<GoodsCategory> getGoodsCategory();

    @Select("select * from goods_category where id = #{id}")
    public Goods getCategoryName(Long id);


    @Insert("INSERT INTO goods_category ( name,create_time )VALUES(#{name},#{createTime})")
    public int insertCategory(GoodsCategory category);

    @Update("update goods_category set name=#{name} where id = #{id}")
    public int updateCategory(GoodsCategory category);

    @Delete("delete from goods_category where id = #{id}")
    public int deleteCategoryById(@Param("id") Integer id);

    @Delete("delete from goods_category where id in (${ids})")
    public int deleteBatchCategory(String ids);

    @Select("select * from goods_category limit #{pageNum},#{pageSize}")
    List<GoodsCategory> selectPage(Integer pageNum, Integer pageSize);

    @Select("select count(*) from goods_category")
    public Integer getCategoryNum();
}
