<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/6/27
  Time: 16:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>会员注册</title>
    <script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../js/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" type="text/css" href="../css/easyui.css">
    <link rel="stylesheet" type="text/css" href="../css/icon.css">
    <link rel="stylesheet" type="text/css" href="../css/demo.css">
</head>
<body style="background-image:url(../css/images/封面以外.jpg);background-position: center;background-repeat: no-repeat;">
<center>
    <div style="margin:70px 0;"></div>
    <div class="easyui-panel" title="会员注册" style="width:100%;max-width:400px;padding:30px 60px;">
        <form id="ff" method="post">
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" id="name" style="width:100%" data-options="label:'用户名:',required:true" /><br>
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" id="pwd"  style="width:100%" data-options="label:'密码:',required:true"/><br>
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" id="confirm"  style="width:100%" data-options="label:'确认密码:',required:true"/><br>
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" id="phone"  style="width:100%" data-options="label:'联系电话:',required:true"/><br>
            </div>
        </form>
        <div style="text-align:center;padding:5px 0">
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="onRegister()" style="width:80px">注册</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="window.history.back()" style="width:80px">返回</a>
        </div>
    </div>
</center>
</body>
<script type="text/javascript">
    function onRegister(){
        if($('#name').val()==null||$('#name').val()==""){
                alert("用户名不能为空！");
                return;
        }
        if($("#pwd").val()==null||$("#pwd").val()==""){
            alert("密码不能为空！");
            return;
        }
        if($("#confirm").val()==null||$("#confirm").val()==""){
            alert("请确认密码！");
            return;
        }
        if($("#phone").val()==null||$("#phone").val()==""){
            alert("联系电话不能为空！");
            return;
        }
        if($("#pwd").val()!=$("#confirm").val()){
            alert("两次密码输入不一致！");
            return;
        }
        $.ajax({
            type:"post",
            url:"/register.action",
            data:{"user_name":$("#name").val(),"user_password":$("#pwd").val(),
                "user_phone":$("#phone").val()},
            dataType:'json',
            success:function(data) {
                if(data.data==1){
                    alert("添加成功!");
                    closeDispatch();
                }else{
                    alert("添加失败，请重试!");
                }
            }
        });
    };
    function closeDispatch(){
        $("#name").val("");
        $("#pwd").val("");
        $("#confirm").val("");
        $("#phone").val("");
    };
</script>
</html>
