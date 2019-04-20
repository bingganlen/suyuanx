<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" isELIgnored="false" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<%--<link href="../css/main.css" rel="stylesheet" type="text/css" />--%>
<link rel="stylesheet" type="text/css" href="../css/foot.css">
<link rel="stylesheet" type="text/css" href="../css/config.css">
<link rel="stylesheet" type="text/css" href="../css/warning_config_list.css">
	<%--<link href="../lib/bootstrap/css/bootstrap.css" rel="stylesheet">--%>

</head>

<body>
	<div id="container">
	<!-- This is the Header -->
	  <div id="header">
	    <img class="logo" src="../images/logo.jpg" width="150" height="50">
	    <div class="head"><span class="headtext">智能物联网管理系统</span></div>

	  </div>
		<span id="atext"><a href="#" onclick="javascript:history.back(-1);">实时温湿度监控</a> >  报警设置</span>

        <form id="formconfig" action="/warn/config.do" method="post">
                <div class="THlist">
		          <table border="0" cellspacing="1px" width="80%"  cellpadding="0px" align="center" bgcolor="white" id="tablelist">
				    
				       <tr  bgcolor="white">
				        <th class="l l1">类型</th>
				        <th class="l l3">是否开启警告</th>
		                <th class="l l5">警告上限</th>
		                <th class="l l6">警告下限</th>
				      </tr>

                      <c:forEach var="item" items="${warnConfigList}">
				      <tr  align="center">		       
				        <td class="tdl">光照强度</td>

				        <td class="tdl">
							<input type="checkbox" name="checkLight" value="${item.checkLight}" onclick="this.value=(this.value==0)?1:0" <c:if test="${item.checkLight==1}"> checked</c:if> />  <%--  value="0"  onclick="this.value=(this.value==0)?1:0"  --%>
						    <%--<input type="text" id="vv"/>--%>
                        </td>
				        <td class="tdl">
	   						<input type="text" class="box" name="lightMaxWarning"  value="${item.lightMaxWarning}" />
				        </td>
				        <td class="tdl">
							<input type="text" class="box" name="lightMinWarning" value="${item.lightMinWarning}"/>
				        </td>
					  </tr>
				        <tr  align="center">		       
				        <td class="tdl">降雨量</td>
                            <td class="tdl">
                                <input type="checkbox" name="checkRainWarning" value="${item.checkRainWarning}" onclick="this.value=(this.value==0)?1:0" <c:if test="${item.checkRainWarning==1}"> checked</c:if> />
                            </td>
                            <td class="tdl">
                                <input type="text" class="box" name="rainMaxWarning" value="${item.rainMaxWarning}" />
                            </td>
                            <td class="tdl">
                                <input type="text" class="box" name="rainMinWarning" value="${item.rainMinWarning}"/>
                            </td>
						</tr>
				      <tr  align="center">
                          <td class="tdl">温度</td>
                          <td class="tdl">
                              <input type="checkbox" name="checkAirTemp" value="${item.checkAirTemp}" onclick="this.value=(this.value==0)?1:0" <c:if test="${item.checkAirTemp==1}"> checked</c:if> />
                          </td>
                          <td class="tdl">
                              <input type="text" class="box" name="airTempMaxWarning" value="${item.airTempMaxWarning}" />
                          </td>
                          <td class="tdl">
                              <input type="text" class="box" name="airTempMinWarning" value="${item.airTempMinWarning}"/>
                          </td>
					  </tr>
				        <tr  align="center">		       
				        <td class="tdl">湿度</td>
                            <td class="tdl">
                                <input type="checkbox" name="checkAirHumi" value="${item.checkAirHumi}" onclick="this.value=(this.value==0)?1:0" <c:if test="${item.checkAirHumi==1}"> checked</c:if> />
                            </td>
                            <td class="tdl">
                                <input type="text" class="box" name="airHumiMaxWarning" value="${item.airHumiMaxWarning}" />
                            </td>
                            <td class="tdl">
                                <input type="text" class="box" name="airHumiMinWarning" value="${item.airHumiMinWarning}"/>
                            </td>
						</tr>
				      <tr  align="center">		       
				        <td class="tdl">土壤温度</td>
                          <td class="tdl">
                              <input type="checkbox" name="checkSoilTemp" value="${item.checkSoilTemp}" onclick="this.value=(this.value==0)?1:0" <c:if test="${item.checkSoilTemp==1}"> checked</c:if> />
                          </td>
                          <td class="tdl">
                              <input type="text" class="box" name="soilTempMaxWarning" value="${item.soilTempMaxWarning}" />
                          </td>
                          <td class="tdl">
                              <input type="text" class="box" name="soilTempMinWarning" value="${item.soilTempMinWarning}"/>
                          </td>
					  </tr>
				        <tr  align="center">		       
				        <td class="tdl">土壤湿度</td>
                            <td class="tdl">
                                <input type="checkbox" name="checkSoilHumi" value="${item.checkSoilHumi}" onclick="this.value=(this.value==0)?1:0" <c:if test="${item.checkSoilHumi==1}"> checked</c:if> />
                            </td>
                            <td class="tdl">
                                <input type="text" class="box" name="soilHumiMaxWarning" value="${item.soilHumiMaxWarning}" />
                            </td>
                            <td class="tdl">
                                <input type="text" class="box" name="soilHumiMinWarning" value="${item.soilHumiMinWarning}"/>
                            </td>
						</tr>
				      <tr  align="center">		       
				        <td class="tdl">土壤盐分</td>
                          <td class="tdl">
                              <input type="checkbox" name="checkSoilSalt" value="${item.checkSoilSalt}" onclick="this.value=(this.value==0)?1:0" <c:if test="${item.checkSoilSalt==1}"> checked</c:if> />
                          </td>
                          <td class="tdl">
                              <input type="text" class="box" name="soilSaltMaxWarning" value="${item.soilSaltMaxWarning}" />
                          </td>
                          <td class="tdl">
                              <input type="text" class="box" name="soilSaltMinWarning" value="${item.soilSaltMinWarning}"/>
                          </td>
					  </tr>
				        <tr  align="center">		       
				        <td class="tdl">土壤电导率</td>
                            <td class="tdl">
                                <input type="checkbox" name="checkSoilElectric" value="${item.checkSoilElectric}" onclick="this.value=(this.value==0)?1:0" <c:if test="${item.checkSoilElectric==1}"> checked</c:if> />
                            </td>
                            <td class="tdl">
                                <input type="text" class="box" name="soilElectricMaxWarning" value="${item.soilElectricMaxWarning}" />
                            </td>
                            <td class="tdl">
                                <input type="text" class="box" name="soilElectricMinWarning" value="${item.soilElectricMinWarning}"/>
                            </td>
						</tr>
				    </table>
		       </div>
               <input type="submit" class="btn" value="提交"/>
            </form>
        </c:forEach>
       
    </div>

    <script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
         //document.getElementById("vv").value = document.getElementsByName("checkLight").value;
        //alert(document.getElementsByName("checkLight").value);



       /* $.ajax({
            type:"POST",
            url: "/warn/list.do",
            dataType: "json",
            success:function(data){
            }
        });*/
    })

 /* function onSave(){
      $.ajax({
          type:"POST",
          url: "/warn/config.do",
          dataType: "json",
          success:function(data){
              location.reload();
              alert("更新成功");
          }
      });
  }*/
</script>
    <%--<%@include file="/jsp/include/footer.jsp"%>--%>
</body>

</html>
