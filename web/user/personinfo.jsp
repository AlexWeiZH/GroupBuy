<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/6/27
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>注册</title>
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
    <div class="easyui-panel" title="个人信息" style="width:100%;max-width:450px;padding:30px 30px 30px;">
    <table  style="width:390px;height:180px;" bgcolor="#f8f8ff" border="2px" border-radius="5px">
        <tr>
            <td align="center">用户名</td>
            <td align="center">${person.user_name}</td>
        </tr>
        <tr>
            <td align="center">用户密码</td>
            <td align="center">${person.user_password}</td>
        </tr>
        <tr>
            <td align="center">手机绑定</td>
            <td align="center"> ${person.user_phone}</td>
        </tr>
        <tr>
            <td align="center"> 配送地址</td>
            <td align="center"> ${person.user_address}</td>
        </tr>
    </table>
        <div style="margin:22px 0;"></div>
        <div style="text-align:center">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="window.location='/user/changepwd.jsp'" style="width:80px">修改密码</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="window.location='/user/rebind.jsp'" style="width:80px">收货信息</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="window.location='/goods/showGoods.jsp'" style="width:80px">返回</a>
        </div>
        </div>
</center>
</body>
</html>
