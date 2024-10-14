<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/1
  Time: 21:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品详细信息</title>
    <!-- jquery核心库 -->
    <script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
</head>
<body>
<table border="1px" align="center" width="90%">
    <thead>
    <th width="15%">商品编号：</th>
    <th width="15%">商品名称：</th>
    <th width="15%">商品类别：</th>
    <th width="15%">商品价格：</th>
    <th width="15%">发起团购人数：</th>
    <th width="15%">备注信息：</th>
    <th width="10%">团购折扣：</th>
    </thead>
    <tbody id="userBody">
        <tr align="center">
            <td>${sessionScope.good.goodsid}</td>
            <td>${sessionScope.good.goodsname}</td>
            <td>${sessionScope.good.goodscategory }</td>
            <td>${sessionScope.good.price}</td>
            <td>${sessionScope.good.goods_gbpeople_number}</td>
            <td>${sessionScope.good.goods_extra_info}</td>
            <td>${sessionScope.good.goodsdiscount}</td>
        </tr>
    </tbody>
</table>
<div><a href="/goods/showGoods.jsp">点此返回</a></div>
<div>
    请输入购买数量：<input type="number" value="1" autocomplete="on" id="purchaseNumber" onkeypress="return (/[\d]/.test(String.fromCharCode(event.keyCode)))" >
    <input type="button" onclick="buyGood() " value="我要购买！"/>
</div>
</body>
<script type="text/javascript">
    var quantity=1;

    function buyGood() {
        if($('#purchaseNumber').val()!=null&&$('#purchaseNumber').val()!="") {
            quantity =$('#purchaseNumber').val();
            $.ajax({
                type: "get",
                url: "/getQuantity.action",
                data:{quantity:quantity},
                success:function (data) {
                    window.location = "/goods/buyGood.jsp";
                }
            });

        }
        else {alert("数量不得为空！")}
    }

    /**
     * 将购买数量传到后台
     */
</script>
</html>
