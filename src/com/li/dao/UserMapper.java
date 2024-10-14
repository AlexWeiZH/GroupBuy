package com.li.dao;

import com.li.pojo.Admin;
import com.li.pojo.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMapper {

     Admin admin(@Param("name") String name,@Param("password") String password);
     User login(@Param("name") String name,@Param("password") String password);

     int register(@Param("user")User user);

     int changePwd(@Param("id")int id,@Param("oldpwd")String oldpwd,
                   @Param("password") String password);

     int changeSetting(@Param("id")int id,@Param("phone")String phone,
                       @Param("address")String address);


    /**
     * 查询个人订单
     * @param user_id
     * @return
     */
    /*User getUserOrder(Integer user_id);*/

    /**
     * 按页查询用户信息
     * @param startIndex
     * @return
     */
     List<User> getUserByPage(@Param("startIndex") int startIndex,@Param("pageSize") int pageSize);

    /**
     * 根据姓名模糊查询
     * @param user_name
     * @return
     */
    List<User> getUserByName(String user_name);

    /**
     * 获取用户表中用户总数量，从而确定页数
     * @return
     */
     int getUserCount();

    /**
     * 添加用户信息
     * @param user
     * @return
     */
     int insertUser(@Param("user") User user);

    /**
     * 按id删除学生信息
     * @param userId
     * @return
     */
     int delUserById(Integer userId);

    /**
     * 修改用户密码
     * @param user_id
     * @param newPwd
     * @param oldPwd
     * @return
     */
     int modifyUserPwd(@Param("user_id")Integer user_id,@Param("newPwd")String newPwd,@Param("oldPwd") String oldPwd);

    /**
     * 根据id查询用户
     * @param user_id
     * @return
     */
     User getUserById(Integer user_id);

    /**
     * 修改用户信息
     * @param user
     * @return
     */
     int modifyUser(@Param("user")User user);

}
