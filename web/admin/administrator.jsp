<%--
  Created by IntelliJ IDEA.
  User: 99631
  Date: 2019/7/2 0002
  Time: 18:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员界面</title>
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
<div <%--style="margin:20px 0 10px 0;"--%>>
    <a href="/user/login.jsp" class="easyui-linkbutton" data-options="toggle:true,group:'g2',plain:true">返回</a>
</div>
  <div id="admin-tabs" class="easyui-tabs" data-options="title:'管理员界面'" style="width: 100%;height:100%">
    <div title="商品管理">
        <iframe scrolling="yes" frameborder="0" src="../goods.jsp" style="width:100%;height:100%;"></iframe>
    </div>
    <div title="用户管理" style="overflow: hidden">
    <iframe scrolling="yes" frameborder="0" src="../user.jsp" style="width:100%;height:100%;"></iframe>
    </div>
    <div title="商品分类管理" >
        <div id="goods-category-tabs" class="easyui-tabs" data-options="fit:true,plain:true">
            <div title="食品" >
                <iframe scrolling="yes" frameborder="0" src="food.jsp" style="width:100%;height:100%;"></iframe>
            </div>
            <div title="饮品" >
                <iframe scrolling="yes" frameborder="0" src="drink.jsp" style="width:100%;height:100%;"></iframe>
            </div>
            <div title="服装" >
                <iframe scrolling="yes" frameborder="0" src="cloth.jsp" style="width:100%;height:100%;"></iframe>
            </div>
            <div title="文具" >
                <iframe scrolling="yes" frameborder="0" src="stationery.jsp" style="width:100%;height:100%;"></iframe>
            </div>


        </div>
    </div>
    <div title="订单管理" style="padding:10px;overflow: hidden">
        <iframe scrolling="yes" frameborder="0" src="../order.jsp" style="width:100%;height:100%;"></iframe>
    </div>


  </div>

<script type="text/javascript">
    $("#admin-tabs").tabs({tabPosition:'left'});
    $("#goods-category-tabs").tabs({pill:true});



</script>

</body>
</html>
