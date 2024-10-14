package com.li.controller;

import com.li.pojo.User;
import com.li.pojo.UserOrder;
import com.li.service.UserOrderService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
public class UserOrderController {

    @Autowired
    UserOrderService userOrderService;



    /**
     * 获取个人订单
     * @param session
     * @param response
     * @return
     * @throws IOException
     */
    @RequestMapping("getUserOrder")
    public void getUserOrder(HttpSession session, HttpServletResponse response) throws IOException{
        response.setContentType("application/json;charset=utf-8");

        User user=(User) session.getAttribute("person");
        List<UserOrder> orders=userOrderService.getUserOrder(user.getUser_id());
        int total=orders.size();
        JSONObject json=new JSONObject();
        json.put("total",total);
        json.put("rows",orders);
        response.getWriter().write(json.toString());
    }

    /**
     * 获取所有订单
     * @param page
     * @param rows
     * @param response
     * @throws IOException
     */
    @RequestMapping("getOrderList")
    @ResponseBody
    public void getOrderList(@RequestParam("page") Integer page,
                             @RequestParam("rows") Integer rows,HttpServletResponse response) throws IOException {
        response.setContentType("application/json;charset=utf-8");
        List<UserOrder> userOrders=userOrderService.getOrderByPage(page,rows);

        int total=userOrderService.getOrderCount();
        JSONObject json=new JSONObject();
        json.put("total",total);
        json.put("rows",userOrders);
        //System.out.println(json);
        response.getWriter().write(json.toString());
    }

    /**
     *
     * 删除订单
     * @param orderid
     * @param response
     * @throws IOException
     */
    @RequestMapping("delOrderById")
    @ResponseBody
    public void delOrderById(Integer orderid,HttpServletResponse response)
            throws IOException{
        response.setContentType("text/html;charset=utf-8");

        // System.out.println(user_id);
        int rst=userOrderService.delOrderById(orderid);

        String result;
        if(rst==1){
            result="删除订单成功！";
        }else result="删除订单失败！";
        //System.out.println(result);
        response.getWriter().write(result);
    }

    /**
     * 修改订单状态
     * @param orderid
     * @param groupbuystatus
     * @param response
     * @throws IOException
     */
    @RequestMapping("updateOrder")
    @ResponseBody
    public void updateOrder(@RequestParam("orderid") Integer orderid,
                            @RequestParam("groupbuystatus") boolean groupbuystatus,
                            HttpServletResponse response)throws IOException{
        response.setContentType("text/html;charset=utf-8");

        String result="";
        if(userOrderService.modifyOrder(groupbuystatus,orderid)==1) {
            result = "修改订单状态成功！";
        }else {
            result="修改订单状态失败！";

        }
        response.getWriter().write(result);
    }

}
