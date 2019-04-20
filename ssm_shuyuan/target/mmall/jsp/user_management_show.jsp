<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--<%    http://java.sun.com/jsp/jstl/fmt
        User user = (User)session.getAttribute("username");
        if(null == user)
        {
            response.sendRedirect("index.jsp");
        }
%>--%>
<!DOCTYPE html>
<html>
    
    <head>
        <meta charset="utf-8">
        <title>
            用户管理-查看
        </title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="format-detection" content="telephone=no">
        <link rel="stylesheet" href="../css/x-admin.css" media="all">
        <link href="../css/main.css" rel="stylesheet" type="text/css" />
    </head>
    
    <body>
      <div id="container">
      <div id="header">
        <img class="logo" src="../images/logo.jpg" width="150" height="50" style="margin-left: -10px;">
        <div class="head"><span class="headtext">智能物联网管理系统</span></div>
        <ul id="headuser">
          <li><img src="../images/0.jpg" width="40" height="40"></li>
            <li class="lix"><a href="/user/logout.do" class="lixa">登出</a></li>
            <li><img src="../images/sort_desc.png"></li>
        </ul>
      </div>
        <div class="x-body">
            <blockquote class="layui-elem-quote">
                <img src="../images/0.jpg" class="layui-circle" style="width:50px;float:left">
                <dl style="margin-left:80px; color:#019688">
                    <c:forEach var="userlist" items="${userList}">
                <dt><span >${userlist.username}</span> <!-- <span >显示内容</span></dt>-->
                <dd style="margin-left:0;visibility:hidden;">显示内容</dd> 
              </dl>
            </blockquote>
            <div class="pd-20">
              <table  class="layui-table" lay-skin="line">
                <tbody>
                  <%--<tr>
                    <th  width="80">性别：</th>
                    <td>男</td>
                  </tr>--%>
                  <tr>
                    <th>手机：</th>
                    <td>${userlist.phone}</td>
                    <td><a href="/jsp/user_management_other.html">修改</a></td>
                  </tr>
                  <tr>
                    <th>邮箱：</th>
                    <td>${userlist.email}</td>
                    <td><a href="/jsp/user_management_other.html">修改</a></td>
                  </tr>
                  <tr>
                    <th>所属组织：</th>
                    <td id="deptName"></td>
                  </tr>
                  <tr>
                    <th>用户类型</th>
                    <td>
                        <c:choose>
                           <c:when test="${userlist.roleId == 1}">超级管理员</c:when>
                           <c:when test="${userlist.roleId == 2}">管理员</c:when>
                            <c:otherwise>普通用户</c:otherwise>
                        </c:choose>
                    </td>
                  </tr>
                  <tr>
                    <th>密码</th>
                    <td>***</td>
                    <td><a href="user_management_password.html">修改</a></td>
                  </tr>
                  <tr>
                    <th>密码提示：</th>
                    <td>${userlist.question}</td>
                    <td><a href="user_management_other.html">修改</a></td>
                  </tr>
                  <!-- <tr>
                    <th>地址：</th>
                    <td>安徽省合肥市</td>
                  </tr> -->
                  <tr>
                    <th>注册时间：</th>
                    <td>
                        <%--<c:out value="${userlist.createTime}"/>--%>
                       <fmt:formatDate value="${userlist.createTime}" type="both" pattern="yyyy-MM-dd HH:mm:ss" />
                    </td>
                  </tr>

                </tbody>
              </table>
            </div>
        </div>

 </div>
      <%@include file="/jsp/include/footer.jsp"%>
    </body>
    <script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            //var deptId = document.getElementById("#deptName");
            var deptId = "${userlist.deptId}";
            $.ajax({
                type: "GET",
                url: "/device/findDeptName.do?devId=" + deptId,

                dataType: "text",
                success: function (data) {
                    $('#deptName').append(data);
                }
            });
        });
//document.getElementById("#deptName").innerHTML = data;    "<td id='deptName'>"+data+"</td>"


    </script>
    </c:forEach>

</html>