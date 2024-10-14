<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>欢迎选购！</title>
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
	<link rel="stylesheet" type="text/css" href="../css/easyui.css">
	<link rel="stylesheet" type="text/css" href="../css/icon.css">
</head>
<body>
<div class="easyui-panel" style="padding:5px;">
    <a href="javascript:void(0)" onclick="window.location='/user/personinfo.jsp'" class="easyui-linkbutton" data-options="plain:true">${person.user_name}</a>
    <a href="javascript:void(0)" onclick="window.location='/user/personal-order.jsp'" class="easyui-linkbutton" data-options="plain:true">个人订单</a>
    <a href="javascript:void(0)" onclick="window.location='/user/personal-bonus.jsp'" class="easyui-linkbutton" data-options="plain:true">我的积分</a>
    <a href="/logout.action" class="easyui-linkbutton" data-options="plain:true">注销</a>
</div>
	
	<table id="tb1" class="easyui-datagrid" title="浏览商品"  border="1px" style="width:100%;height:80%"
		   data-options="
                fitColumns:true,
				iconCls: 'icon-edit',
				singleSelect: true,
				toolbar: '#tb',
				url: '/getGoodsList.action',
				method: 'get',
                striped:'true',
                pageNumber:1,
                pageSize:15,
                pageList:[10,15,20,25,30]
			" pagination="true">
		<thead>
			<tr>
				<th data-options="field:'goodsid',align:'center',width:150">商品编号：</th>
				<th data-options="field:'goodsname',align:'center',width:150">商品名称：</th>
				<th data-options="field:'price',width:150,align:'center'">商品价格：</th>
				<th data-options="field:'goods_gbpeople_number',width:150,align:'center'">发起团购人数：</th>
				<th data-options="field:'goodsdiscount',align:'center',width:150">团购折扣：</th>
				<th data-options="field:'_operate',width:150,align:'center',formatter:formatOper">商品详情</th>

			</tr>
		</thead>
	</table>
</body>
<script type="text/javascript">
    function formatOper(val,row,index){

        return "<a href='#' onclick='getGoodsDetail("+index+")'>查看详情</a>";
    }
    function getGoodsDetail(index) {

        var rows = $('#tb1').datagrid('getRows');//获得所有行
        var row = rows[index];//根据index获得其中一行。
        $.ajax({
            type:"get",
            url:"/getGoodById.action",
            data:{goodsid:row.goodsid},
            success:function(data){
              if (data.success=1)
                window.location = "/goods/goodsDetail.jsp";
              else window.location = "/user/login.jsp";

            }
        });
	}

</script>
</html>