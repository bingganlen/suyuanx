<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="../css/main.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="../css/foot.css">
<link rel="stylesheet" type="text/css" href="../css/config.css">
</head>

<body>
	<div id="container">
	<!-- This is the Header -->
        <div id="header">
            <img class="logo" src="../images/logo.jpg" width="150" height="50">
            <div class="head"><span class="headtext">智能物联网管理系统</span></div>
            <ul id="headuser">
                <li><img src="../images/0.jpg" width="40" height="40"></li>
                <li class="lix"><a href="/user/get_information.do" class="lixa">用户信息</a></li>
                <li><img src="../images/sort_desc.png"></li>
            </ul>
        </div>
		<span id="atext"><a href="#">实时温湿度监控</a> >  终端配置</span>
        <div class="content">
            <form action="#" method="post" id="formconfig">

               <div class="formla">终端编号：   <input type="text" class="inputsize" name="id" value="" placeholder="0065876"></div>
               <div class="formla">备注名称：   <input type="text" class="inputsize" name="name" ></div>
               <div class="formla">数据上传时间：<input type="number" class="inputsize1" name="data_upload"><select class="bool"><option value="1">秒</option><option value="0">分</option></select></div>
               <div class="formla">数据采集间隔：<input type="number" class="inputsize1" name="data_samp"><select class="bool"><option value="1">秒</option><option value="0">分</option></select></div>
               <div class="formla">定位功能：    <select name="locate" class="locate"><option value="1">是</option><option value="0">否</option></select></div>
               <input type="submit" name="" value="配 置" class="btn btnsubmit">
               <input type="button" name="" value="取 消" class="btn btnquite">
            </form>
        </div>
		

    </div>
    <%@include file="/jsp/include/footer.jsp"%>

</body>

</html>
