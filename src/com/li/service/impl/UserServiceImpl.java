package com.li.service.impl;

import com.li.dao.UserMapper;
import com.li.pojo.Admin;
import com.li.pojo.User;
import com.li.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("userService")
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;


    @Override
    public Admin admin(String name, String password) {
        return userMapper.admin(name, password);
    }

    public User login(String name, String password){
        return userMapper.login(name,password);
    }
    public int register(User user){ return userMapper.register(user);}
    public int changePwd(int id,String oldpwd, String password) {
        return userMapper.changePwd(id,oldpwd,password);
    }
    public int changeSetting(int id,String phone,String address){return userMapper.changeSetting(id,phone,address);}

    @Override
    public List<User> getUserByName(String user_name) {
        return userMapper.getUserByName(user_name);
    }



    /*@Override
    public User getUserOrder(Integer user_id) {
        return userMapper.getUserOrder(user_id);
    }*/

    @Override
    public List<User> getUserByPage(int pageNo,int pageSize) {
        return userMapper.getUserByPage((pageNo -1)*pageSize,pageSize);
    }

    @Override
    public int getUserCount() {
        return userMapper.getUserCount();
    }



    @Override
    public int insertUser(User user) {
        return userMapper.insertUser(user);
    }

    @Override
    public int delUserById(Integer userId) {
        return userMapper.delUserById(userId);
    }

    @Override
    public int modifyUserPwd(Integer user_id, String newPwd, String oldPwd) {
        return userMapper.modifyUserPwd(user_id,newPwd,oldPwd);
    }

    @Override
    public User getUserById(Integer user_id) {
        return userMapper.getUserById(user_id);
    }

    @Override
    public int modifyUser(User user) {
        return userMapper.modifyUser(user);
    }
}
