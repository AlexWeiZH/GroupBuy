package com.li.service;

import com.li.pojo.UserOrder;


import java.sql.Timestamp;
import java.util.List;


public interface UserOrderService {

    /**
     * 按页查询订单
     * @return
     */
    List<UserOrder> getOrderByPage( int pageNo, int pageSize);

    /**
     * 查询个人订单
     * @param user_id
     * @return
     */
    List<UserOrder> getUserOrder(int user_id);
    /**
     * 获取订单总数目
     * @return
     */
    int getOrderCount();

    /**
     * 根据Id删除订单
     * @param orderid
     * @return
     */
    int delOrderById(Integer orderid);

    /**
     * 修改订单状态
     * @param groupbuystatus
     * @param orderid
     * @return
     */
    int modifyOrder(boolean groupbuystatus,Integer orderid);




    int InsertIntoTable(Integer user_id, Integer goodsid, String groupbuyid, String orderstatus, int quantity, Double totalprice, Timestamp ordertime);


}
