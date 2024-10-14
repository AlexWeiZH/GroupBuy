<%--
  Created by IntelliJ IDEA.
  User: 99631
  Date: 2019/7/1 0001
  Time: 8:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订单信息管理界面</title>
    <!-- jquery核心库 -->
    <script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
    <!-- easyui核心库 -->
    <script type="text/javascript" src="js/jquery.easyui.min.js"></script>
    <!-- easyui中文包 -->
    <script type="text/javascript" src="js/easyui-lang-zh_CN.js"></script>
    <!-- easyui核心UI文件 css -->
    <link href="css/easyui.css" rel="stylesheet" type="text/css"/>
    <!-- easyui图标 -->
    <link href="css/icon.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<table id="table1" class="easyui-datagrid" title="订单信息管理" style="width:700px;height:auto"
       data-options="
                fit:true,
                fitColumns:true,
				iconCls: 'icon-edit',
				singleSelect: true,
				toolbar: '#tb',
				url: '/getOrderList.action',
				method: 'get',
				onClickCell: onClickCell,
                striped:'true',
                pageNumber:1,
                pageSize:15,
                pageList:[15,20,25,30]
			"  pagination="true">
    <thead>
    <tr>

        <th data-options="field:'orderid',width:100,align:'center'">订单号</th>
        <th data-options="field:'username',formatter:getUserName,width:100,align:'center'">用户名</th>
        <th data-options="field:'userphone',formatter:getUserPhone,width:80,align:'center'">手机号码</th>
        <th data-options="field:'useraddress',formatter:getUserAddress,width:80,align:'center'">配送地址</th>
        <th data-options="field:'goods',
                          formatter:function(value,row,index){
                            if (row.goods){ return row.goods.goodsname; }
                            else {return value;}},width:80,align:'center'">商品名</th>
        <th data-options="field:'orderstatus',width:100,align:'center'">支付状态</th>
        <th data-options="field:'ordertime',formatter:getTime,width:130,align:'center'">订单时间</th>
        <th data-options="field:'quantity',width:80,align:'center'">商品数量</th>
        <th data-options="field:'totalprice',width:100,align:'center'">总价格</th>
        <th data-options="field:'groupbuystatus',
                          formatter:status,width:80,align:'center',editor:{
                                                                               type:'combobox',
                                                                               options:{
                                                                                 data:[ {'value':'1','text':'已拼单成功'},
                                                                                   {'value':'0','text':'正在拼单中'}
                                                                                    ],
                                                                               valueField: 'value',
                                                                               textField: 'text',
                                                                               editable: false,
                                                                               panelHeight:70,
                                                                               required: true }}">订单状态</th>
    </tr>
    </thead>
</table>

<div id="tb" style="height:auto">
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="removeit()">删除</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="accept()">保存</a>
    &nbsp;&nbsp;
    <span>请输入要查询的订单号:</span>
    <input id="user_name" style="line-height:26px;border:1px solid #ccc">

    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="onSearch()">查询</a>

</div>

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
    function status(value,row,index){
        if (row.groupBuy){
            if(row.groupBuy.groupbuystatus==1){
                return "已拼单成功";

            }else return "正在拼单中";
        }
        else {return value;}
    }
    function getTime(value,row,index) {
     if(row.ordertime){
         var year=row.ordertime.year+1900;
         var month=row.ordertime.month+1;
         var day=row.ordertime.day;
         var hours=row.ordertime.hours-8;
         var minutes=row.ordertime.minutes;
         var seconds=row.ordertime.seconds;

         return year+"-"+month+"-"+day+" "+hours+":"+minutes+":"+seconds;
     }
    }



    var editIndex = undefined;
    function endEditing(){
        if (editIndex == undefined){return true}
        if ($('#table1').datagrid('validateRow', editIndex)){
            $('#table1').datagrid('endEdit', editIndex);
            editIndex = undefined;
            return true;
        } else {
            return false;
        }
    }
    function onClickCell(index, field){
        if (editIndex != index){
            if (endEditing()){
                $('#table1').datagrid('selectRow', index)
                    .datagrid('beginEdit', index);
                var ed = $('#table1').datagrid('getEditor', {index:index,field:field});
                if (ed){
                    ($(ed.target).data('textbox') ? $(ed.target).textbox('textbox') : $(ed.target)).focus();
                }
                editIndex = index;
            } else {
                setTimeout(function(){
                    $('#table1').datagrid('selectRow', editIndex);
                },0);
            }
        }
    }

    function removeit(){
        if (editIndex == undefined){alert("请选择要删除的内容！");}
        var row = $("#table1").datagrid("getSelected");
        $('#table1').datagrid('cancelEdit', editIndex)
            .datagrid('deleteRow', editIndex);

        $.ajax({
            type:"get",
            url:"/delOrderById.action",
            data:{orderid:row.orderid},
            success:function(result){
                alert(result.toString());

            }
        });

        editIndex = undefined;
    }
    function accept(){
        var row = $("#table1").datagrid("getSelected");
        if (endEditing()){
            $('#table1').datagrid('acceptChanges');
            $.ajax({
                type:"get",
                url:"/updateOrder.action",
                data:{orderid:row.orderid,groupbuystatus:row.groupbuystatus},
                success:function(result){
                    alert(result);
                    $('#table1').datagrid('reload');
                    $('#table1').datagrid('selectRow',editIndex);
                }
            });
        }
    }
    function onSearch() {
        $('#table1').datagrid('load', {
            user_name: $('#user_name').val()

        });
    }


</script>
</body>
</html>
