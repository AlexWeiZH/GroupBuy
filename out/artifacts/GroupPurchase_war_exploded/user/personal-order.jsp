<%--
  Created by IntelliJ IDEA.
  User: 99631
  Date: 2019/7/2 0002
  Time: 20:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../js/easyui-lang-zh_CN.js"></script>
    <link href="../css/easyui.css" rel="stylesheet" type="text/css"/>
    <link href="../css/icon.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div ><a href="javascript:void(0)" class="easyui-linkbutton" onclick="window.location='/goods/showGoods.jsp'" style="width:80px">返回</a></div>
<table id="tabel1" class="easyui-datagrid" title="个人订单" style="width:100%;height:80%"
       data-options="
                fit:true,
                fitColumns:true,
				singleSelect: true,
				url: '/getUserOrder.action',
				method: 'get',
                striped:'true'">
    <thead>
    <tr>
        <th data-options="field:'orderid',width:100,align:'center'">订单号</th>
        <th data-options="field:'userphone',formatter:getUserPhone,width:80,align:'center'">手机号码</th>
        <th data-options="field:'useraddress',formatter:getUserAddress,width:80,align:'center'">配送地址</th>
        <th data-options="field:'goods',
                          formatter:function(value,row,index){
                            if (row.goods){ return row.goods.goodsname; }
                            else {return value;}},width:80,align:'center'">商品名</th>
        <th data-options="field:'orderstatus',width:100,align:'center'">支付状态</th>
        <th data-options="field:'ordertime',formatter:getTime,width:80,align:'center'">订单时间</th>
        <th data-options="field:'quantity',width:80,align:'center'">商品数量</th>
        <th data-options="field:'totalprice',width:100,align:'center'">价格</th>
        <th data-options="field:'groupbuystatus',
                          formatter:status,width:80,align:'center'">订单状态</th>
    </tr>
    </thead>
</table>

<script type="text/javascript">

    function getUserName(value,row,index) {
        if (row.user){ return row.user.user_name; }

    }
    function getUserPhone(value,row,index) {
        if (row.user){ return row.user.user_phone; }
    }
    function getUserAddress(value,row,index) {
        if (row.user){ return row.user.user_address; }
    }
    function getTime(value,row,index) {
        if (row.ordertime) {
            var year = row.ordertime.year + 1900;
            var month = row.ordertime.month + 1;
            var day = row.ordertime.day;
            var hours = row.ordertime.hours - 8;
            var minutes = row.ordertime.minutes;
            var seconds = row.ordertime.seconds;

            return year + "-" + month + "-" + day + " " + hours + ":" + minutes + ":" + seconds;
        }
    }
    function status(value,row,index){
        if (row.groupBuy){
            if(row.groupBuy.groupbuystatus==1){
                return "已拼单成功";

            }else return "正在拼单中";
        }
        else {return value;}
    }





</script>
</body>
</html>
