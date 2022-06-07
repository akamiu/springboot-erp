package com.roy.mapper;

import com.roy.entities.Goods;
import com.roy.entities.User;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface UserMapper {
    @Select("select * from user where id = #{id}")
    public User selectNameById(String id);

    @Select("select * from user")
    public List<Goods> selectAllUser();

    @Insert("INSERT INTO user ( name,role,phone,account,password,created_date )VALUES(#{name},#{role},#{phone},#{account},#{password},#{createdDate})")
    public int insertUser(User user);

    public int updateUser(User user);

    @Delete("delete from user where id = #{id}")
    public int deleteUserById(@Param("id") Integer id);

    @Delete("delete from user where id in (${ids})")
    public int deleteBatchUser(String ids);

    @Select("select * from user limit #{pageNum},#{pageSize}")
    List<User> selectPage(Integer pageNum, Integer pageSize);

    @Select("select count(*) from user")
    public Integer getUserNum();
}
