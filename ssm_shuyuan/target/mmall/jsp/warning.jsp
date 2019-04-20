<%--
  Created by IntelliJ IDEA.
  User: huangjunhao
  Date: 2019/4/16
  Time: 10:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>--%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<link href="../css/main.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="../js/bootstrap.min.css"/>
<link rel="stylesheet" href="../js/font-awesome.min.css"/>
<head>
    <title>报警列表页面</title>
</head>
<body onload="getbegtime()">
<!-- 导航栏 -->
<%--<div class="sidebar text-left">
    <nav class="navbar navbar-default" role="navigation">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand">SSM整合</a>
            </div>
            <div>
                <ul class="nav navbar-nav">
                    <li><a href="<%=basePath%>/customer/toSavePage.do"><strong>添加信息功能</strong></a></li>
                    <li><a href="<%=basePath%>/customer/toListPage.do"><strong>分页查询功能</strong></a></li>
                    <li><a>Create by TyCoding</a></li>
                </ul>
            </div>
        </div>
    </nav>
</div>--%>
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
</div></div>
<br/>
<div class="container">
    <h1 class="text-center">越限报警列表信息页面</h1>
    <hr/>
    <br/>
    <!-- 查询 -->
    <form class="form-inline" action="<%=basePath%>/warn/warnlist.do" method="post">
        <div class="form-group">
            <label>管理员：</label>
            <input type="text" class="form-control" name="devId"/>
        </div>
        &nbsp;&nbsp;
        &nbsp;&nbsp;
        <div class="form-group">
            <label>报警类型</label>
            <input type="text" class="form-control" name="warning"/>
        </div>
        &nbsp;&nbsp;
        &nbsp;&nbsp;
        <div class="form-group">
            <label>开始时间  </label>
            <input type="datetime-local" class="form-control" name="startTime" id="begdate"/>
            <label>结束时间  </label>
            <input type="datetime-local" class="form-control" name="endTime" id="enddate"/>

        </div>
        &nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;
        <div class="form-group">
            <input type="submit" value="查询" class="form-control btn btn-info"/>
            &nbsp;&nbsp;
            <input type="reset" value="重置" class="form-control btn btn-danger"/>
        </div>
    </form>
    <br/>
    <hr/>
    <div class="table-responsive">
        <table class="table table-hover table-striped" id="tableda">
            <thead>
            <tr>
                <th style="text-align: center;">编号</th>
                <th style="text-align: center;">管理员姓名</th>
                <th style="text-align: center;">设备编号</th>
                <th style="text-align: center;">报警类型</th>
                <th style="text-align: center;">发生时间</th>
                <th style="text-align: center;">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${requestScope.page.beanList}" var="customer">
                <tr class="text-center">
                    <td>${customer.id}</td>
                    <td>${customer.userid}</td>
                    <td>${customer.devid}</td>
                    <td>${customer.warning}</td>
                    <%--<td>${customer.createTime}</td>--%>
                    <td><fmt:formatDate value="${customer.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    <td>
                        <a href="/warn/list.do?devId=${customer.devid}"  style="text-decoration: none;">
                            <span class="fa fa-edit fa-lg"></span>
                            <%--<span class="fa fa-camera-retro fa-lg"></span>--%>
                        </a>
                        <a href="#" onclick="return trash(${customer.id})" style="text-decoration: none;"
                           data-toggle="modal" data-target="#trashModal">
                            <span class="fa fa-trash-o fa-lg"></span>
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <form class="listForm" method="post" action="<%=basePath%>/warn/warnlist.do">
        <div class="row">
            <div class="form-inline">
                <label style="font-size:14px;margin-top:22px;">
                    <strong>共<b>${requestScope.page.totalCount}</b>条记录，共<b>${requestScope.page.totalPage}</b>页</strong>
                    &nbsp;
                    &nbsp;
                    <strong>每页显示</strong>
                    <input name="pageCode" value="${requestScope.page.pageCode}" hidden="hidden"/>
                    <select class="form-control" name="pageSize">
                        <option value="8"
                                <c:if test="${requestScope.page.pageSize == 8}">selected</c:if> >8
                        </option>
                        <option value="12"
                                <c:if test="${requestScope.page.pageSize == 12}">selected</c:if> >12
                        </option>
                        <option value="15"
                                <c:if test="${requestScope.page.pageSize == 15}">selected</c:if> >15
                        </option>
                        <option value="20"
                                <c:if test="${requestScope.page.pageSize == 20}">selected</c:if> >20
                        </option>
                    </select>
                    <strong>条</strong>
                    &nbsp;
                    &nbsp;
                    <strong>到第</strong>&nbsp;<input type="text" size="3" id="page" name="pageCode"
                                                    class="form-control input-sm"
                                                    style="width:11%"/>&nbsp;<strong>页</strong>
                    &nbsp;
                    <button type="submit" class="btn btn-sm btn-info">GO!</button>
                </label>

                <ul class="pagination" style="float:right;">
                    <li>
                        <a href="<%=basePath%>/warn/warnlist.do?pageCode=1"><strong>首页</strong></a>
                    </li>
                    <li>
                        <c:if test="${requestScope.page.pageCode > 8}">
                            <a href="<%=basePath%>/warn/warnlist.do?pageCode=${requestScope.page.pageCode - 1}">&laquo;</a>
                        </c:if>
                    </li>

                    <!-- 写关于分页页码的逻辑 -->
                    <c:choose>
                        <c:when test="${requestScope.page.totalPage <= 5}">
                            <c:set var="begin" value="1"/>
                            <c:set var="end" value="${requestScope.page.totalPage}"/>
                        </c:when>
                        <c:otherwise>
                            <c:set var="begin" value="${requestScope.page.pageCode - 1}"/>
                            <c:set var="end" value="${requestScope.page.pageCode + 3}"/>

                            <!-- 头溢出 -->
                            <c:if test="${begin < 1}">
                                <c:set var="begin" value="1"/>
                                <c:set var="end" value="5"/>
                            </c:if>

                            <!-- 尾溢出 -->
                            <c:if test="${end > requestScope.page.totalPage}">
                                <c:set var="begin" value="${requestScope.page.totalPage -4}"/>
                                <c:set var="end" value="${requestScope.page.totalPage}"/>
                            </c:if>
                        </c:otherwise>
                    </c:choose>

                    <!-- 显示页码 -->
                    <c:forEach var="i" begin="${begin}" end="${end}">
                        <!-- 判断是否是当前页 -->
                        <c:if test="${i == requestScope.page.pageCode}">
                            <li class="active"><a href="javascript:void(0);">${i}</a></li>
                        </c:if>
                        <c:if test="${i != requestScope.page.pageCode}">
                            <li>
                                <a href="<%=basePath%>/warn/warnlist.do?pageCode=${i}&pageSize=${requestScope.page.pageSize}">${i}</a>
                            </li>
                        </c:if>
                    </c:forEach>

                    <li>
                        <c:if test="${requestScope.page.pageCode < requestScope.page.totalPage}">
                            <a href="<%=basePath%>/warn/warnlist.do?pageCode=${requestScope.page.pageCode + 1}">&raquo;</a>
                        </c:if>
                    </li>
                    <li>
                        <a href="<%=basePath%>/warn/warnlist.do?pageCode=${requestScope.page.totalPage}"><strong>末页</strong></a>
                    </li>
                </ul>
            </div>
        </div>
    </form>




    <!-- 删除的模态框 -->
    <div class="modal fade" id="trashModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- 模糊框头部 -->
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;
                    </button>
                    <h4 class="modal-title">警告！</h4>
                </div>
                <!-- 模糊框主体 -->
                <div class="modal-body">
                    <strong>你确定要删除吗？</strong>
                </div>
                <!-- 模糊框底部 -->
                <div class="modal-footer">
                    <button type="button" class="delSure btn btn-info"  data-dismiss="modal">确定</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>
    <%--
        <!-- 编辑的模态框 -->
        <form class="form-horizontal" role="form" method="post" action="<%=basePath%>/customer/update.do"
              id="form_edit">
            <div class="modal fade" id="editModal" role="dialog" aria-labelledby="myModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title">修改客户信息</h4>
                        </div>
                        <div class="modal-body" style="margin-left: 80px;">
                            <input name="id" id="id" hidden="hidden"/>
                            <div class="form-group form-inline">
                                <label>客户姓名：</label>
                                <input type="text" name="name" class="form-control" id="name"/>
                            </div>
                            <br/>
                            <br/>
                            <div class="form-group form-inline">
                                <label>客户电话：</label>
                                <input type="text" name="telephone" class="form-control" id="telephone"/>
                            </div>
                            <br/>
                            <br/>
                            <div class="form-group form-inline">
                                <label>客户住址：</label>
                                <input type="text" name="address" class="form-control" id="address"/>
                            </div>
                            <br/>
                            <br/>
                            <div class="form-group form-inline">
                                <label>客户备注：</label>
                                <input type="text" name="remark" class="form-control" id="remark"/>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="editSure btn btn-info" data-dismiss="modal">修改</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>--%>
</div>
</body>
<script src="<%=basePath%>/js/jquery-3.3.1.js"></script>
<script src="<%=basePath%>/js/bootstrap.min.js"></script>
<script type="text/javascript">
    // 删除信息的方法
    function trash(id) {
        if (!id) {
            alert("error");
        } else {
            //event.returnValue = confirm("删除是不可恢复的，你确认要删除吗？");
            $(".delSure").click(function () {
                $("#trashModal").modal('show');
                $.ajax({
                    url: '/warn/delete.do?id=' + id,
                    type: 'POST',
                    success: function (data) {
                        //$("#tableda").bootstrapTable('refresh',data);  //没有自动刷新
                        location.reload();
                    }
                });
            });
        }
    }

    //修改报警配置
    function edit(devid){
        $.ajax({
            url: '/warn/list.do?devId=' + devid,
            type: 'GET',
            success: function (data) {
                //console.log("success");
            }

        });
    }
    
    
    function checkdate() {
       var str = document.getElementById("begdate");
       var str1 = document.getElementById("enddate");
       /*str.value = str.value+":00";
       str1.value = str1.value+":00";*/
        alert(str.value.replace('T',' '));
        document.getElementById("begdate").value = str.value.replace('T',' ');
        document.getElementById("enddate").value = str1.value.replace('T',' ');
        /*if (str != null) {
            /!* var timestamp = new Date(str.value).getTime();
             var timestamp1 = new Date(str1.value).getTime();*!/
            document.getElementById("begdate").value = str.value.replace('T',' ');
            //alert(str.value.substring(0,10)+ ' ' + );
            //alert(str.value.replace('T',' '));
            //alert(str.value); //2019-04-18T11:35
            //alert(timestamp); //1555558500000
        }*/
    }

    function x(date) {
        date.substring(0,10);
    }

    /*
    // 编辑信息的方法   onclick="return edit($customer.id
    function edit(id) {
        if (!id) {
            alert("error");
        } else {
            // 先去查询数据
            $.ajax({
                url: 'customer/findById.do',
                type: 'POST',
                dataType: 'json',
                contentType: 'application/json;charset=UTF-8',
                data: JSON.stringify({
                    id: id
                }),
                success: function (data) {
                    $("#id").val(data.id);
                    $("#name").val(data.name);
                    $("#telephone").val(data.telephone);
                    $("#address").val(data.address);
                    $("#remark").val(data.remark);
                    $("#editModal").modal('show');
                },
                error: function () {
                    alert("错误");
                }
            });
        }
    }*/



        function getbegtime() {
            var today = new Date();
            var yyyy = today.getFullYear();
            var MM = today.getMonth() + 1;
            var dd = today.getDate();
            var hh = today.getHours();
            var mm = today.getMinutes();
            MM = checkTime(MM);
            dd = checkTime(dd);
            hh = checkTime(hh);
            mm = checkTime(mm);
            var time = yyyy + "-" + MM + "-" + dd + "T" + hh + ":" + mm;

            var dateControl = document.querySelector("#begdate");
            dateControl.value = time;

            // dateControl = document.querySelector("#enddate");
            // dateControl.value = time;

            function checkTime(i) {
                if (i < 10) {
                    i = "0" + i;
                }
                return i;
            }
        }

    //提交表单的方法
    $(".editSure").click(function () {
        $("#form_edit").submit();
    });

</script>
</html>
