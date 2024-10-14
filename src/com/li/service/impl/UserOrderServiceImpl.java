package com.li.service.impl;

import com.li.dao.UserOrderMapper;
import com.li.pojo.UserOrder;
import com.li.service.UserOrderService;
import com.li.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.List;
@Service
public class UserOrderServiceImpl implements UserOrderService {
    @Autowired
    UserOrderMapper userOrderMapper;

    @Override
    public List<UserOrder> getOrderByPage(int pageNo, int pageSize) {
        return userOrderMapper.getOrderByPage((pageNo-1)*pageSize,pageSize);
    }

    @Override
    public List<UserOrder> getUserOrder(int user_id) {
        return userOrderMapper.getUserOrder(user_id);
    }

    @Override
    public int getOrderCount() {
        return userOrderMapper.getOrderCount();
    }

    @Override
    public int delOrderById(Integer orderid) {
        return userOrderMapper.delOrderById(orderid);
    }

    @Override
    public int modifyOrder(boolean groupbuystatus, Integer orderid) {
        return userOrderMapper.modifyOrder(groupbuystatus,orderid);
    }

    @Override
    public int InsertIntoTable(Integer user_id, Integer goodsid, String groupbuyid, String orderstatus, int quantity, Double totalprice, Timestamp ordertime) {
            return (userOrderMapper.InsertIntoTable(user_id, goodsid, groupbuyid, orderstatus, quantity, totalprice, ordertime));

    }
}
