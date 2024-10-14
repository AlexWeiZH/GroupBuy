<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/6/27
  Time: 14:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>欢迎登陆</title>
    <script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../js/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" type="text/css" href="../css/easyui.css">
    <link rel="stylesheet" type="text/css" href="../css/icon.css">
    <link rel="stylesheet" type="text/css" href="../css/demo.css">
</head>
<body style="background-image:url(../css/images/bg5.jpg);background-position: center;background-repeat: no-repeat;">
<center>
<div style="margin:100px 0;"></div>
<div class="easyui-panel" title="会员登陆" style="width:100%;max-width:400px;padding:20px 60px;">
<form id="ff" action="/login.action" method="post">
    <div style="margin-bottom:20px">
        <input class="easyui-textbox"  name="name"  style="width:100%" data-options="label:'用户名:',required:true" /><br>
    </div>
    <div style="margin-bottom:20px">
        <input class="easyui-textbox"  name="password" type="password" style="width:100%" data-options="label:'密码:',required:true"/><br>
    </div>
    <div style="margin-bottom:20px">
        管理员:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <input class="easyui-switchbutton"  name="type"/>
    </div>

</form>
    <div style="text-align:center;padding:5px 0">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="test()" style="width:80px">登陆</a>
        <a href="javascript:void(0)" onclick="window.location='/user/register.jsp'" class="easyui-linkbutton"  style="width:80px">注册</a>
    </div>
    <div style="text-align:center;padding:1px 0"> ${errinfo}
</center>
</body>
<script type="text/javascript">
    function test() {
        $("#ff").submit();
    }
</script>
</html>
