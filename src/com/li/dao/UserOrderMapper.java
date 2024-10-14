package com.li.dao;

import com.li.pojo.UserOrder;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.sql.Timestamp;
import java.util.List;

@Repository
public interface UserOrderMapper {

    /**
     * 按页查询订单
     * @return
     */
    List<UserOrder> getOrderByPage(@Param("startIndex") int startIndex, @Param("pageSize") int pageSize);

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
    int modifyOrder(@Param("groupbuystatus") boolean groupbuystatus,
                    @Param("orderid")Integer orderid);


    /**
     * 插入一条订单记录
     * @param user_id
     * @param goodsid
     * @param groupbuyid
     * @param orderstatus
     * @param quantity
     * @param toatalprice
     * @param ordertime
     * @return
     */
    public int InsertIntoTable(@Param("user_id")Integer user_id,
                               @Param("goodsid")Integer goodsid,
                               @Param("groupbuyid")String  groupbuyid,
                               @Param("orderstatus")String orderstatus,
                               @Param("quantity")int quantity,
                               @Param("toatalprice")Double toatalprice,
                               @Param("ordertime") Timestamp ordertime);


}
