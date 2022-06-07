package com.roy.mapper;

import com.roy.entities.Goods;
import com.roy.entities.Supplier;
import com.roy.entities.User;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface SupplierMapper {
    @Select("select * from supplier where id = #{id}")
    public User selectNameById(String id);

    @Select("select * from supplier")
    public List<Supplier> selectAllSupplier();

    @Insert("INSERT INTO supplier ( name,type,owner_id,contact_name,contact_phone,address,debt,created_date )VALUES(#{name},#{type},#{ownerId},#{contactName},#{contactPhone},#{address},#{debt},#{createdDate})")
    public int insertSupplier(Supplier supplier);

    public int updateSupplier(Supplier supplier);

    @Delete("delete from supplier where id = #{id}")
    public int deleteSupplierById(@Param("id") Integer id);

    @Delete("delete from supplier where id in (${ids})")
    public int deleteBatchSupplier(String ids);

    @Select("select supplier.*,user.name owner from supplier,user where supplier.owner_id=user.id order by supplier.id limit #{pageNum},#{pageSize}")
    List<Supplier> selectPage(Integer pageNum, Integer pageSize);

    @Select("select count(*) from supplier")
    public Integer getSupplierNum();
}
