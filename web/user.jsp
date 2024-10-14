<%--
  Created by IntelliJ IDEA.
  User: 99631
  Date: 2019/6/27 0027
  Time: 14:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户信息管理界面</title>
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



<table id="table1" class="easyui-datagrid" title="用户信息管理" style="width:700px;height:auto"
       data-options="
                fit:true,
                fitColumns:true,
				iconCls: 'icon-edit',
				singleSelect: true,
				toolbar: '#tb',
				url: '/getUserList.action',
				method: 'get',
				onClickCell: onClickCell,
                striped:'true',
                pageNumber:1,
                pageSize:15,
                pageList:[15,20,25,30]
			"  pagination="true">
    <thead>
    <tr>

        <th data-options="field:'user_id',width:100,align:'center',editor:'textbox'">编号</th>
        <th data-options="field:'user_name',width:100,align:'center',editor:'textbox'">用户名</th>
        <th data-options="field:'user_password',width:80,align:'center',editor:'textbox'">用户密码</th>
        <th data-options="field:'user_phone',width:80,align:'center',editor:'textbox'">手机号码</th>
        <th data-options="field:'user_address',width:250,align:'center',editor:'textbox'">配送地址</th>
    </tr>
    </thead>
</table>

<div id="tb" style="height:auto">
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="append()">添加用户</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="removeit()">删除</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="accept()">保存</a>
      &nbsp;&nbsp;
    <span>请输入要查询的用户名:</span>
    <input id="user_name" style="line-height:26px;border:1px solid #ccc">

    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="onSearch()">查询</a>

</div>

<script type="text/javascript">
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
    function append(){
        if (endEditing()){
            $('#table1').datagrid('appendRow',{});
            editIndex = $('#table1').datagrid('getRows').length-1;
            $('#table1').datagrid('selectRow', editIndex)
                .datagrid('beginEdit', editIndex);
        }
    }

    function removeit(){
        if (editIndex == undefined){alert("请选择要删除的内容！");}
        var row = $("#table1").datagrid("getSelected");
        $('#table1').datagrid('cancelEdit', editIndex)
            .datagrid('deleteRow', editIndex);

            $.ajax({
                type:"get",
                url:"/delUserById.action",
                data:{user_id:row.user_id},
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
                url:"/addOrUpdateUser.action",
                data:{user_id:row.user_id,user_name:row.user_name,user_password:row.user_password,
                      user_address:row.user_address,user_phone:row.user_phone},
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
