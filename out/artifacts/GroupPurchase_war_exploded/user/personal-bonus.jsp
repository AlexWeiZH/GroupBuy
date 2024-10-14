<%--
  Created by IntelliJ IDEA.
  User: 99631
  Date: 2019/7/4 0004
  Time: 19:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的积分</title>
    <!-- jquery核心库 -->
    <script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>

    <!-- easyui核心库 -->
    <script type="text/javascript" src="../js/jquery.easyui.min.js"></script>

    <!-- easyui中文包 -->
    <script type="text/javascript" src="../js/easyui-lang-zh_CN.js"></script>

    <!-- easyui核心UI文件 css -->
    <link href="../css/easyui.css" rel="stylesheet" type="text/css"/>

    <!-- easyui图标 -->
    <link href="../css/icon.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<table id="table1" class="easyui-datagrid" title="个人积分管理" style="width:700px;height:auto"
       data-options="
                fit:true,
                fitColumns:true,
				singleSelect: true,
				toolbar: '#tb',
				url: '/getBonus.action',
				method: 'get',
                striped:'true',
                pageNumber:1,
                pageSize:15,
                pageList:[15,20,25,30]
			"  pagination="true">
    <thead>
    <tr>

        <th data-options="field:'goodsname',width:100,align:'center'">商品名称</th>
        <th data-options="field:'totalprice',width:100,align:'center'">价格</th>
        <th data-options="field:'time',formatter:getTime,width:80,align:'center'">购买时间</th>
        <th data-options="field:'bonus',width:80,align:'center'">个人积分</th>
    </tr>
    </thead>
</table>
<label>总积分：${sessionScope.totalBonus}</label>

<script type="text/javascript">
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

</script>

</body>
</html>
