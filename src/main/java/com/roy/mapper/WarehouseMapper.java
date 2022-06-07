package com.roy.mapper;

import com.roy.entities.Goods;
import com.roy.entities.User;
import com.roy.entities.Warehouse;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface WarehouseMapper {
    @Select("select * from warehouse where id = #{id}")
    public Warehouse selectNameById(String id);

    @Select("select * from warehouse")
    public List<Warehouse> selectAllWarehouse();

    @Insert("INSERT INTO warehouse ( name,address,owner_id,created_date,msg )VALUES(#{name},#{address},#{ownerId},#{createdDate},#{msg})")
    public int insertWarehouse(Warehouse warehouse);

    public int updateWarehouse(Warehouse warehouse);

    @Delete("delete from warehouse where id = #{id}")
    public int deleteWarehouseById(@Param("id") Integer id);

    @Delete("delete from warehouse where id in (${ids})")
    public int deleteBatchWarehouse(String ids);

    @Select("select warehouse.*,user.name owner from warehouse,user where warehouse.owner_id=user.id order by warehouse.id limit #{pageNum},#{pageSize}")
    List<Warehouse> selectPage(Integer pageNum, Integer pageSize);

    @Select("select count(*) from warehouse")
    public Integer getWarehouseNum();
}
