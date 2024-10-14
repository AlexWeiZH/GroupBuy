package com.li.controller;

import com.li.pojo.Admin;
import com.li.pojo.User;
import com.li.service.UserService;
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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


@Controller("userController")
public class UserController {

    @Autowired
    UserService userService;



    /**
     * 登陆
     *
     * @param name
     * @param password
     * @param session
     * @param resp
     * @return
     */
    @RequestMapping("login")
    public ModelAndView login(@RequestParam("name") String name, @RequestParam("password") String password,
                              @RequestParam(value="type",defaultValue ="off") String type,
                              HttpSession session, HttpServletResponse resp) {
        System.out.println(type);
        ModelAndView view = new ModelAndView();

        //判断是会员还是管理员登录
       if(type.equals("off")){
            User p = userService.login(name, password);
            if (p == null) {
                view.setViewName("user/login");
                view.addObject("errinfo", "用户名或密码错误!");
            } else {
                view.setViewName("goods/showGoods");
                session.setAttribute("person", p);
                session.setAttribute("pwd",p.getUser_password());

            }
        }else {

               Admin admin=userService.admin(name,password);
               if (admin == null) {
                   view.setViewName("user/login");
                   view.addObject("errinfo", "用户名或密码错误!");
               } else {
                   view.setViewName("admin/administrator");
                   session.setAttribute("admin", admin);
           }
       }
        return view;
    }

    /**
     * 注销
     * @param session
     * @return
     */
    @RequestMapping("logout")
    public ModelAndView logout(HttpSession session) {
        session.removeAttribute("person");
        ModelAndView view = new ModelAndView("user/login");
        return view;
    }

    /**
     * 注册
     * @param user
     * @param resp
     */
    @RequestMapping("register")
    @ResponseBody
    public void addUser(User user, HttpServletResponse resp) {
        resp.setContentType("text/html;charset=utf-8");
        int res = userService.register(user);
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("success", "true");
        map.put("data", res);

        try {
            JSONObject.fromObject(map).write(resp.getWriter());
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    /**
     * 修改密码
     * @param oldpwd
     * @param password
     * @param session
     * @param resp
     */
    @RequestMapping("changePwd")
    @ResponseBody
    public void changePwd(String oldpwd,String password,HttpSession session,HttpServletResponse resp){
        User u = (User)session.getAttribute("person");
        int res = userService.changePwd(u.getUser_id(),oldpwd, password);
        HashMap<String, Object> map=new HashMap<String, Object>();
        map.put("success", "true");
        map.put("data", res);
        try {
            JSONObject.fromObject(map).write(resp.getWriter());
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    /**
     * 手机绑定&配送地址
     * @param phone
     * @param address
     * @param session
     * @param resp
     */
    @RequestMapping("changeSetting")
    @ResponseBody
    public void changeSetting(String phone,String address,HttpSession session,HttpServletResponse resp){
        User u=(User)session.getAttribute("person");
        int res=userService.changeSetting(u.getUser_id(),phone,address);
        HashMap<String, Object> map=new HashMap<String, Object>();
        map.put("success", "true");
        map.put("data", res);
        try {
            JSONObject.fromObject(map).write(resp.getWriter());
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    @RequestMapping("refreshinfo")
    public ModelAndView refreshinfo(HttpSession session, HttpServletResponse resp){
        User u=(User)session.getAttribute("person");
        User v = userService.login(u.getUser_name(), u.getUser_password());
        System.out.println(v.getUser_address());
        session.setAttribute("person", v);
        ModelAndView view = new ModelAndView();
        if (v != null) {
            view.setViewName("user/personinfo");
        }
        return view;
    }



    /**
     * 获取用户数
     * @param page
     * @param rows
     * @param response
     * @throws IOException
     */
    @RequestMapping("getUserList")
    @ResponseBody
    public void getUserList(@RequestParam("page") Integer page,@RequestParam("rows") Integer rows,
                            HttpServletResponse response) throws IOException{
        response.setContentType("application/json;charset=utf-8");
          ArrayList<User> users=(ArrayList<User>)userService.getUserByPage(page,rows);

        int total=userService.getUserCount();
        JSONObject json=new JSONObject();
        json.put("total",total);
        json.put("rows",users);
          //System.out.println(json);
        response.getWriter().write(json.toString());
    }

    /**
     * 删除用户
     * @param user_id
     * @param response
     * @throws IOException
     */
    @RequestMapping("delUserById")
    @ResponseBody
    public void delUserById(Integer user_id,HttpServletResponse response) throws IOException{
        response.setContentType("text/html;charset=utf-8");
        // System.out.println(user_id);
        int rst=userService.delUserById(user_id);

        String result;
        if(rst==1){
            result="删除成功！";
        }else result="删除失败！";
        //System.out.println(result);
        response.getWriter().write(result);
    }

    /**
     * 添加新用户或修改用户信息
     * @param user
     * @param response
     * @throws IOException
     */
    @RequestMapping("addOrUpdateUser")
    @ResponseBody
    public void addOrUpdateUser(User user, HttpServletResponse response)throws IOException{
        response.setContentType("text/html;charset=utf-8");
        //System.out.println(user.getUser_password());
        User user1=userService.getUserById(user.getUser_id());
        //System.out.println(user1.getUser_password());
        String result="";
        //确定是添加新用户还是修改用户信息
        if(user1==null){
            if(userService.insertUser(user)==1) {
                result = "添加用户成功！";
            }else {
                result="添加用户失败！";
            }
        }else {
            if(userService.modifyUser(user)==1) {
                result = "修改用户信息成功！";
            }else {
                result="修改用户信息失败！";
            }
        }
         //System.out.println(result);
        response.getWriter().write(result);
    }

    @RequestMapping("getUserByName")
    @ResponseBody
    public void getUserByName(@RequestParam("user_name") String user_name,
                            HttpServletResponse response) throws IOException{
        response.setContentType("application/json;charset=utf-8");
        List<User> users=userService.getUserByName(user_name);
        int total=userService.getUserCount();
        JSONObject json=new JSONObject();
        json.put("total",total);
        json.put("rows",users);
        //System.out.println(json);
        response.getWriter().write(json.toString());
    }


}
