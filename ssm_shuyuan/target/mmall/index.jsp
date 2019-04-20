<%--
  Created by IntelliJ IDEA.
  User: huangjunhao
  Date: 2019/1/30
  Time: 14:46
  To change this template use File | Settings | File Templates.
  1
--%>
<%@page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

    <title>登录</title>
    <link rel="stylesheet" href="<%=basePath%>/lib/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="<%=basePath%>/css/login.css" />
    <link rel="stylesheet" href="<%=basePath%>/css/drag.css">

</head>

<body class="beg-login-bg" background="<%=basePath%>/images/bg.jpg">
<div class="beg-login-box">

    <header>
        <h1>欢迎登录</h1>
    </header>
    <div class="beg-login-main">
        <form class="layui-form" id="formlogin">
            <div class="layui-form-item">
                <label class="beg-login-icon">
                    <i class="layui-icon">&#xe612;</i>
                </label>
            </div>

            <div class="layui-form-item">
                <label class="beg-login-icon">
                    <i class="layui-icon">&#xe612;</i>
                </label>
                <input type="text" name="username" id="username" lay-verify="userName" autocomplete="off" placeholder="请输入登录名" class="layui-input" onBlur="checkUserName()" oninput="checkUserName()">
                <div class="err"><span class="default" id="nameErr"></span></div>
            </div>
            <div class="layui-form-item">
                <label class="beg-login-icon">
                    <i class="layui-icon">&#xe642;</i>
                </label>
                <input type="password" name="password" id="password" lay-verify="password" autocomplete="off" placeholder="请输入密码" class="layui-input" onBlur="checkPassword()" oninput="checkPassword()">
                <div class="err"><span class="default" id="passwordErr"></span></div>
            </div>

            <div id="drag" class="huadong"></div>
            <!-- <div class="huadong"></div> -->
            <div class="message" >
                <span class="messageleft">
                    <a href="#">忘记密码？</a>
                </span>

                <span class="messageright">
							<a href="jsp/register.html">注册新用户</a>
                </span>
            </div>

            <div class="login"><!-- login -->
                <input type="button" name="" class="btn" value="登 录" lay-submit lay-filter="login" id="submit" onclick="login()">
            </div>
        </form>
    </div>

</div>
<script type="text/javascript"  src="<%=basePath%>/lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=basePath%>/js/jquery.min.js" ></script>
<script src="<%=basePath%>/js/jquery-1.7.2.min.js" type="text/javascript"></script>
<script src="<%=basePath%>/js/drag.js" type="text/javascript" charset="utf-8"></script>
<script>
    $(document).ready(function(e) {
        $('#drag').drag();

    });

</script>

<script type="text/javascript">
    function login(){

        if (checkUserName()==true && checkPassword()== true && checkyan()==true) {
            $.ajax({
                url: "/user/login.do",
                type: "post",
//                dataType: "jsonp",
//                crossDomain: true,
                data: $('#formlogin').serialize(),
                success: function (data) {
                    if (data.status == 0) {
                        //这一步时将后台获取的data存储到obj中
                        sessionStorage.obj = JSON.stringify(data);
                        //登陆成功后跳转到首页
                        window.location.href = "<%=basePath%>/jsp/main.jsp";
                    } else if (data.status == 1) {
                        alert("账号或密码错误");
                    }
                }
            });
            //return true;
        }
        return false;
    }

    function checkyan(){
        var a = document.getElementById("haha").innerHTML;
        if (a=="拖动滑块验证") {
            alert("请滑动验证码");
            return false;
        }else{
            return true;
        }

    }


    function checkUserName(){
        var name = document.getElementById("username");
        var errname = document.getElementById("nameErr");
        if (name.value.length == 0) {
            errname.innerHTML = "账号不为空"
            errname.className = "error";
            return false;
        }else{
            errname.innerHtml = ""
            errname.className = "default";
            return true;
        }
    }
    function checkPassword(){
        var pass = document.getElementById("password");
        var errPasswd = document.getElementById("passwordErr");
        var pattern = /^\w{6,12}$/; //密码要在6-8位
        if(!pattern.test(pass.value)){
            errPasswd.innerHTML="密码的范围应在6-12位"
            errPasswd.className="error"
            return false;
        }
        else{
            errPasswd.innerHTML=""
            errPasswd.className="default";
            return true;
        }
    }
</script>
</body>

</html>