package com.roy.mapper;

import com.roy.entities.Customer;
import com.roy.entities.Supplier;
import com.roy.entities.User;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface CustomerMapper {
    @Select("select * from customer where id = #{id}")
    public User selectNameById(String id);

    @Select("select * from customer")
    public List<Customer> selectAllCustomer();

    @Insert("INSERT INTO customer ( name,type,owner_id,contact_name,contact_phone,debt,created_date )VALUES(#{name},#{type},#{ownerId},#{contactName},#{contactPhone},#{debt},#{createdDate})")
    public int insertCustomer(Customer customer);

    public int updateCustomer(Customer customer);

    @Delete("delete from customer where id = #{id}")
    public int deleteCustomerById(@Param("id") Integer id);

    @Delete("delete from customer where id in (${ids})")
    public int deleteBatchCustomer(String ids);

    @Select("select customer.*,user.name owner from customer,user where customer.owner_id=user.id order by customer.id limit #{pageNum},#{pageSize}")
    List<Customer> selectPage(Integer pageNum, Integer pageSize);

    @Select("select count(*) from customer")
    public Integer getCustomerNum();
}
