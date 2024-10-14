package com.li.service;

import com.li.pojo.Admin;
import com.li.pojo.User;

import java.util.List;

public interface UserService {


     Admin admin(String name,String password);

     User login(String name,String password);

     int register(User user);

     int changePwd(int id,String oldpwd, String password);

     int changeSetting(int id,String phone,String address);


    /**
     * 根据姓名模糊查询
     * @param user_name
     * @return
     */
    List<User> getUserByName(String user_name);

    /**
     * 按页查询用户信息
     * @param pageNo
     * @return
     */
    List<User> getUserByPage(int pageNo,int pageSize);

    /**
     * 获取用户数
     * @return
     */
    int getUserCount();



    /**
     * 添加用户信息
     * @param user
     * @return
     */
    int insertUser(User user);

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
    int modifyUserPwd(Integer user_id,String newPwd,String oldPwd);

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
    int modifyUser(User user);

}
