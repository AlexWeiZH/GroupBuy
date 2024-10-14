<%--
  Created by IntelliJ IDEA.
  User: 99631
  Date: 2019/7/2 0002
  Time: 11:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品信息管理界面</title>
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



<table id="tablegoods" class="easyui-datagrid" style="width:700px;height:auto"
       data-options="
                fit:true,
                fitColumns:true,
				iconCls: 'icon-edit',
				singleSelect: true,
				toolbar: '#goodstb',
				url: '/getGoodsList.action?category=衣服',
				method: 'get',
				onClickCell: onClickCell,
                striped:'true',
                pageNumber:1,
                pageSize:15,
                pageList:[15,20,25,30]
			" pagination="true">
    <thead>
    <tr>

        <th data-options="field:'goodsid',width:100,align:'center',editor:'textbox'">编号</th>
        <th data-options="field:'goodsname',width:100,align:'center',editor:'textbox'">商品名称</th>
        <th data-options="field:'price',width:80,align:'center',editor:'textbox'">商品价格</th>
        <th data-options="field:'goods_gbpeople_number',width:100,align:'center',editor:'textbox'">团购人数</th>
        <th data-options="field:'goods_extra_info',width:80,align:'center',editor:'textbox'">备注信息</th>
        <th data-options="field:'goodsdiscount',width:100,align:'center',editor:'textbox'">团购折扣</th>
        <th data-options="field:'cangroupbuy',formatter:cangroupbuy,width:80,align:'center',editor:{
                                                                               type:'combobox',
                                                                               options:{
                                                                                 data:[ {'value':'1','text':'是'},
                                                                                   {'value':'0','text':'否'}
                                                                                    ],
                                                                               valueField: 'value',
                                                                               textField: 'text',
                                                                               editable: false,
                                                                               panelHeight:70,
                                                                               required: true }}">是否可以团购</th>
    </tr>
    </thead>
</table>

<div id="goodstb" style="height:auto">
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="appendgoods()">添加商品</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="removegoods()">删除</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="acceptgoods()">保存</a>
    &nbsp;&nbsp;
    <span>请输入要查询的商品名:</span>
    <input id="goodsname" style="line-height:26px;border:1px solid #ccc">

    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="onSearchgoods()">查询</a>

</div>

<script type="text/javascript">
    var editIndex = undefined;
    function endEditing(){
        if (editIndex == undefined){return true}
        if ($('#tablegoods').datagrid('validateRow', editIndex)){
            $('#tablegoods').datagrid('endEdit', editIndex);
            editIndex = undefined;
            return true;
        } else {
            return false;
        }
    }
    function onClickCell(index, field){
        if (editIndex != index){
            if (endEditing()){
                $('#tablegoods').datagrid('selectRow', index)
                    .datagrid('beginEdit', index);
                var ed = $('#tablegoods').datagrid('getEditor', {index:index,field:field});
                if (ed){
                    ($(ed.target).data('textbox') ? $(ed.target).textbox('textbox') : $(ed.target)).focus();
                }
                editIndex = index;
            } else {
                setTimeout(function(){
                    $('#tablegoods').datagrid('selectRow', editIndex);
                },0);
            }
        }
    }
    function appendgoods(){
        if (endEditing()){
            $('#tablegoods').datagrid('appendRow',{});
            editIndex = $('#tablegoods').datagrid('getRows').length-1;
            $('#tablegoods').datagrid('selectRow', editIndex)
                .datagrid('beginEdit', editIndex);
        }
    }

    function removegoods(){
        if (editIndex == undefined){alert("请选择要删除的内容！");}
        var row = $("#tablegoods").datagrid("getSelected");
        $('#tablegoods').datagrid('cancelEdit', editIndex)
            .datagrid('deleteRow', editIndex);

        $.ajax({
            type:"get",
            url:"/delGoodsById.action",
            data:{goodsid:row.goodsid},
            success:function(result){
                alert(result.toString());

            }
        });

        editIndex = undefined;
    }
    function acceptgoods(){
        var row = $("#tablegoods").datagrid("getSelected");
        if (endEditing()){
            $('#tablegoods').datagrid('acceptChanges');
            $.ajax({
                type:"get",
                url:"/addOrUpdateGoods.action",
                data:{goodsid:row.goodsid,
                    goodsname:row.goodsname,
                    goodscategory:"衣服",
                    price:row.price,
                    goods_gbpeople_number:row.goods_gbpeople_number,
                    goods_extra_info:row.goods_extra_info,
                    goodsdiscount:row.goodsdiscount,
                    cangroupbuy:row.cangroupbuy},
                success:function(result){
                    alert(result);
                    $('#tablegoods').datagrid('reload');
                    $('#tablegoods').datagrid('selectRow',editIndex);
                }
            });
        }
    }
    function onSearch() {
        $('#table2').datagrid('load', {
            user_name: $('#goodsname').val()

        });
    }
    function cangroupbuy(value,row,index) {
        if(value==1){
            return "是";
        }else {
            return "否";
        }

    }
</script>
</body>
</html>
