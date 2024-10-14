package com.li.controller;

import com.li.dao.BonusMapper;
import com.li.pojo.Bonus;
import com.li.pojo.Goods;
import com.li.pojo.GroupBuy;
import com.li.pojo.User;
import com.li.service.BonusService;
import com.li.service.GoodsService;
import com.li.service.GroupBuyService;
import com.li.service.UserOrderService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;

@Controller("goodsController")
public class GoodsController {

    @Autowired
    GoodsService goodsService;

    @Autowired
    GroupBuyService groupBuyService;

    @Autowired
    UserOrderService userOrderService;

    @Autowired
    BonusService bonusService;

    /**
     * 获取用户数
     * @param page
     * @param rows
     * @param response
     * @throws IOException
     */
    @RequestMapping("getGoodsList")
    @ResponseBody
    public void getGoodsList(@RequestParam("page") Integer page,
                             @RequestParam("rows") Integer rows,
                             @RequestParam(value ="category",defaultValue ="")String category,
                             HttpServletResponse response) throws IOException{
        response.setContentType("application/json;charset=utf-8");
        ArrayList<Goods> goodsList=(ArrayList<Goods>)goodsService.
                                       getGoodsByPage(page,rows,category);

        int total=goodsService.getGoodsCount(category);

        JSONObject json=new JSONObject();
        json.put("total",total);
        json.put("rows",goodsList);
       // System.out.println("1"+json);
        response.getWriter().write(json.toString());
    }

    /**
     * 删除用户
     * @param goodsid
     * @param response
     * @throws IOException
     */
    @RequestMapping("delGoodsById")
    @ResponseBody
    public void delGoodsById(Integer goodsid,HttpServletResponse response) throws IOException{
        response.setContentType("text/html;charset=utf-8");
        // System.out.println(user_id);
        int rst=goodsService.delGoodsById(goodsid);

        String result;
        if(rst==1){
            result="删除成功！";
        }else result="删除失败！";
        //System.out.println(result);
        response.getWriter().write(result);
    }

    /**
     * 添加新商品或修改商品信息
     * @param goods
     * @param response
     * @throws IOException
     */
    @RequestMapping("addOrUpdateGoods")
    @ResponseBody
    public void addOrUpdateGoods(Goods goods, HttpServletResponse response)throws IOException{
        response.setContentType("text/html;charset=utf-8");
        String result="";

        //System.out.println(goods);

        Goods goods1=goodsService.getGoodsById(goods.getGoodsid());
           // System.out.println(goods1.getGoodsid());

        //确定是添加新用户还是修改用户信息
        if(goods1==null){
            int rst=goodsService.addGoods(goods);
            if(rst==1) {
                result = "添加商品成功！";
            }else {
                result="添加商品失败！";
            }
        }else {
            if(goods.equals(goods1)){
                result="请输入要修改的内容！";
            }else{
                if(goodsService.modifyGoods(goods)==1) {
                    result = "修改商品信息成功！";
                }else {
                    result="修改商品信息失败！";
                }
            }

        }
        //System.out.println(result);
        response.getWriter().write(result);
    }




    /**
     * 按ID获取good
     */
    @RequestMapping("getGoodById")
    @ResponseBody
    public void getGoodById(Integer goodsid,HttpServletResponse response, HttpSession session){
        HashMap<String, Object> map=new HashMap<String, Object>();


            map.put("success", 1);


        response.setContentType("text/html;charset=utf-8");

        session.setAttribute("goodsid",goodsid);
        Goods g = goodsService.getGoodsById(goodsid);
        session.setAttribute("good",g);
        map.put("data", "1");
        try {
            JSONObject.fromObject(map).write(response.getWriter());
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }


    }


    @RequestMapping("getQuantity")
    @ResponseBody
    public void getQuantity(int quantity,HttpServletResponse response, HttpSession session){
        int bonus;
        Goods g= (Goods)session.getAttribute("good");

        Double price=g.getPrice()*g.getGoodsdiscount()*quantity;
        session.setAttribute("price",price);
        session.setAttribute("quantity",quantity);

        //计算个人积分：
        if(price<=50){bonus=5;}
        else if(price>50&&price<=150){bonus=10;}
        else if(price>150&&price<=500){bonus=25;}
        else if(price>500&&price<=1000){bonus=45;}
        else {bonus=100;}
        session.setAttribute("bonus",bonus);


        HashMap<String, Object> map=new HashMap<String, Object>();
        map.put("success", true);
        map.put("data", "1");
        try {
            JSONObject.fromObject(map).write(response.getWriter());
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }

    /**
     * 核心功能：团购功能的实现

     *
     * @param session
     */
    @RequestMapping("confirmPurchase")

    public ModelAndView confirmPurchase(HttpSession session){
        String orderstatus="已支付";//支付结果
        /**
         * c为groupbuy表的groupbuystatus属性
         */
        boolean c=true;

        /**
         * b为goods表的goods_gbpeople_number属性：团购需凑够的人数
         */
        Goods g = (Goods)session.getAttribute("good");
        int b = g.getGoods_gbpeople_number();
        /**
         * a为groupbuy的people_acquired属性，初始为0
         */
        int a = 0;

        Integer goodsid = (Integer)session.getAttribute("goodsid");
        System.out.println(goodsid);

        Integer user_id= ((User)session.getAttribute("person")).getUser_id();
        int quantity=(int)session.getAttribute("quantity");
        Double price = (Double)session.getAttribute("price");
        Timestamp ordertime=new Timestamp(System.currentTimeMillis());
        //userorder的各项参数

        //写入个人积分表：
        int bonus = (int)session.getAttribute("bonus");
        String goodsname = goodsService.getGoodsById(goodsid).getGoodsname();
        bonusService.InsertBonus(goodsname,price,ordertime,bonus,user_id);

        if(groupBuyService.getGroupBuyByGoodId(goodsid)==null){//没有查到符合条件的团购表的项
            //新建一项纪录：
            String groupbuyid = groupBuyService.idGenerator();//产生一个团购的id
            while(groupBuyService.getGroupBuyById(groupbuyid)!=null){
                groupbuyid=groupBuyService.idGenerator();//若产生了重复的id则产生一个新的
            }
            a = 1;
            groupBuyService.InsertToGroupBuy(groupbuyid,a,goodsid); //将团购信息插入表中


            //将订单信息插入到用户订单表中
            userOrderService.InsertIntoTable(user_id,goodsid,groupbuyid,orderstatus,quantity,price,ordertime);

            if(a==b){//单人成团
                groupBuyService.UpdateGroupBuyStatus(groupbuyid,c);
            }
        }
        else {//查到到了符合条件的团购表的项
            GroupBuy groupBuy=groupBuyService.getGroupBuyByGoodId(goodsid);
            String groupbuyid = groupBuy.getGroupbuyid();
//              System.out.println(groupbuyid);
//            System.out.println(groupBuy.getPeople_acquired());

            a =groupBuy.getPeople_acquired();//a一定小于b，否则不符合条件，不会查到
            a = a+1;
            groupBuyService.UpdateGroupBuyPeople(groupbuyid,a);//增加一个人，更新团购表

            //将订单信息插入到用户订单表中
            userOrderService.InsertIntoTable(user_id,goodsid,groupbuyid,orderstatus,quantity,price,ordertime);

            if(a==b){//团购人数凑够，拼单成功
                groupBuyService.UpdateGroupBuyStatus(groupbuyid,c);
            }
        }
        ModelAndView view=new ModelAndView();

        view.setViewName("user/personal-order");
        return view;

    }
    @RequestMapping("getBonus")
    @ResponseBody
    public void getBonus(@RequestParam("page") Integer page,
                         @RequestParam("rows") Integer rows,HttpSession session,HttpServletResponse response) throws IOException{
        response.setContentType("application/json;charset=utf-8");
        Integer user_id= ((User)session.getAttribute("person")).getUser_id();
        ArrayList<Bonus> bonusList=(ArrayList<Bonus>)bonusService.
                getAllBonusByPage(page,rows,user_id);

        int total=bonusService.getBonusCount(user_id);
        int totalBonus = bonusService.getBonusSum(user_id);
        session.setAttribute("totalBonus",totalBonus);
        JSONObject json=new JSONObject();
        json.put("total",total);
        json.put("rows",bonusList);
        response.getWriter().write(json.toString());

    }


}
