<%@ page import="com.li.pojo.User" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/6/28
  Time: 15:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>修改密码</title>
    <script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../js/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" type="text/css" href="../css/easyui.css">
    <link rel="stylesheet" type="text/css" href="../css/icon.css">
    <link rel="stylesheet" type="text/css" href="../css/demo.css">
</head>
<body style="background-image:url(../css/images/封面以外.jpg);background-position: center;background-repeat: no-repeat;">
<center>
    <div style="margin:100px 0;"></div>
    <div class="easyui-panel" title="修改密码" style="width:100%;max-width:400px;padding:30px 60px 30px;">
    <form id="ff" method="post">
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" id="oldpwd" type="password" style="width:100%" data-options="label:'原始密码:',required:true" /><br>
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" id="newpwd" type="password" style="width:100%" data-options="label:'新密码:',required:true" /><br>
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" id="pwdagain" type="password" style="width:100%" data-options="label:'确认密码:',required:true" /><br>
        </div>
    </form>
        <div style="margin:25px 0;"></div>
        <div style="text-align:center">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="changepwd()" style="width:80px">确认提交</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="window.history.back()" style="width:80px">返回</a>
        </div>
    </div>
</center>
</body>
<script type="text/javascript">
    function changepwd(){36
        var pwd='<%=session.getAttribute("pwd")%>';
        if($("#oldpwd").val()==null||$("#oldpwd").val()==""){
            alert("原密码不能为空！");
            return;
        }
        if(pwd!=$("#oldpwd").val()){
            alert("原密码不正确！");
            return;
        }
        if($("#newpwd").val()==null||$("#newpwd").val()==""){
            alert("新密码不能为空！");
            return;
        }
        if($("#pwdagain").val()==null||$("#pwdagain").val()==""){
            alert("密码确认不能为空！");
            return;
        }
        if($("#newpwd").val()!=$("#pwdagain").val()){
            alert("两次密码输入不一致！");
            return;
        }
        $.ajax({
            type:"post",
            url:"/changePwd.action",
            data:{"oldpwd":$("#oldpwd").val(),"password":$("#newpwd").val()},
            dataType:'json',
            success:function(data) {
                if(data.data==1){
                    alert("修改成功，请重新登录!");
                    window.location="/user/login.jsp";
                }else{
                    alert("修改失败，请重试!");
                }
            }
        });
    };
</script>
</html>
