<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/1
  Time: 9:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>配送地址</title>
    <script type="text/javascript" src="../js/city.js"></script>
    <script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../css/easyui.css">
    <link rel="stylesheet" type="text/css" href="../css/icon.css">
    <link rel="stylesheet" type="text/css" href="../css/demo.css">
    <script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../js/easyui-lang-zh_CN.js"></script>
</head>
<body style="background-image:url(../css/images/封面以外.jpg);background-position: center;background-repeat: no-repeat;">
<center>
<form id="form" action="refreshinfo.action" method="post">
    <div style="margin:60px 0;"></div>
    <div class="easyui-panel" title="收货信息" style="width:100%;max-width:500px;padding:20px 60px 30px;">
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" id="user_phone" label="手机号码:" value="${person.user_phone}" labelPosition="top" style="width:100%;">
        </div>
        <label class="textbox-label textbox-label-top" style="text-align:left;width:378px;">所在地：</label>
        <div style="margin-bottom:20px;width: 100%">
            <select id="prov" onchange="showCity(this)" style="height: 30px;width: 30%;border: 1px solid #000;border-radius: 5px 5px 5px 5px; " >
                <option>==选择省份==</option>
            </select>
            <select  id="city" onchange="showCountry(this)" style="height: 30px;width: 30%;border: 1px solid #000;border-radius: 5px 5px 5px 5px; ">
                <option>==选择城市==</option>
            </select>
            <select  id="country" onchange="selectCountry(this)" style="height: 30px;width: 30%;border: 1px solid #000;border-radius: 5px 5px 5px 5px; ">
                <option>==选择县区==</option>
            </select>
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" id="intro" label="详细地址:" labelPosition="top" multiline="true" placeholder="输入详细地址.." style="width:100%;height:120px">
        </div>
        <div style="margin:25px 0;"></div>
        <div style="text-align:center">
        <a href="#" class="easyui-linkbutton" onclick="save()" style="width:80px">保存</a>
        <a href="#" class="easyui-linkbutton" onclick="cancel()" style="width:80px">返回</a>
        </div>
    </div>
</form>
</center>
</body>
<script type="text/javascript">
    function e(str) {
        return document.getElementById(str);
    }
    var address="";
    var prov = e('prov');
    var city = e('city');
    var country = e('country');
    var intro="";

    /*用于保存当前所选的省市区*/
    var current = {
        prov: '',
        city: '',
        country: '',
    };

    /*加载省份列表*/
    (function showProv() {
        var len = provice.length;
        for (var i = 0; i < len; i++) {
            var provOpt = document.createElement('option');
            provOpt.innerText = provice[i]['name'];
            provOpt.value = i;
            prov.appendChild(provOpt);
            console.log(provOpt.innerText);
            console.log(provOpt.value);
        }
    })();
    /*根据所选的省份来显示城市列表*/
    function showCity(obj) {
        var val = obj.options[obj.selectedIndex].value;
        if (val != current.prov) {
            current.prov = val;
        }
        if (val != null) {
            city.length = 1;
            var cityLen = provice[val]["city"].length;
            for (var j = 0; j < cityLen; j++) {
                var cityOpt = document.createElement('option');
                cityOpt.innerText = provice[val]["city"][j].name;
                cityOpt.value = j;
                city.appendChild(cityOpt);
            }
        }
    }

    /*根据所选的城市来显示县区列表*/
    function showCountry(obj) {
        var val = obj.options[obj.selectedIndex].value;
        current.city = val;
        if (val != null) {
            country.length = 1; //清空之前的内容只留第一个默认选项
            var countryLen = provice[current.prov]["city"][val].districtAndCounty.length;
            for (var n = 0; n < countryLen; n++) {
                var countryOpt = document.createElement('option');
                countryOpt.innerText = provice[current.prov]["city"][val].districtAndCounty[n];
                countryOpt.value = n;
                country.appendChild(countryOpt);
            }
        }
    }

    /*选择县区之后的处理函数*/
    function selectCountry(obj) {
        current.country = obj.options[obj.selectedIndex].value;
        if ((current.city != null) && (current.country != null)) {
            address= provice[current.prov].name +
                provice[current.prov]["city"][current.city].name +
                provice[current.prov]["city"][current.city].districtAndCounty[current.country];
        }
    }

    function save() {
        intro=$("#intro").val();
        $.ajax({
            type:"post",
            url:"/changeSetting.action",
            data:{"phone":$("#user_phone").val(),"address":address+intro},
            dataType:'json',
            success:function(data) {
                if(data.data==1){
                    alert("信息绑定成功！");
                    window.location.href=("/refreshinfo.action");
                }else{
                    alert("绑定失败，请重试!");
                }
            }
        });
    };

    function cancel() {
        window.location="personinfo.jsp";
    }
</script>
</html>
