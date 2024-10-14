<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/2
  Time: 16:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>欢迎购买！</title>
</head>
<body>
<div>请确认以下信息：</div>
    <div>
    <form action="/confirmPurchase.action" method="post">
        <ul>
            <li>您的账号ID：<input name="id" type="text" value="${sessionScope.person.user_id}"/></li>
            <li>您的姓名：<input name="name" type="text" value="${sessionScope.person.user_name}"/></li>
            <li>您的手机号：<input name="password" type="text" value="${sessionScope.person.user_phone}"/></li>
            <li>收货地址：<input name="address" type="text" value="${sessionScope.person.user_address}"/></li>
            <li>商品名称：<input name="goodsname" type="text" value="${sessionScope.good.goodsname}"/></li>
            <li>应支付金额：<input name="price" type="text" value="${sessionScope.price}"/></li>
            <li><input type="submit"  value="确认支付！"  />
            </li>
        </ul>
    </form>
    </div>
    <a href="showGoods.jsp">点此取消购买</a>
</body>

</html>
