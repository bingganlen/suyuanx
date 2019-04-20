<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>报警信息页面</title>
<link href="../css/main.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="../css/foot.css">

	<link href="${APP_PATH}/css/bootstrap.min.css" rel="stylesheet">
	<script src="${APP_PATH}/js/bootstrap.min.js"></script>
	<%--&lt;%&ndash;// 引入展示分页的方法&ndash;%&gt;
	<script type="text/javascript" src="..js/include/paging.js"></script>
	&lt;%&ndash;//引入校验表单数据的方法&ndash;%&gt;
    <script type="text/javascript" src="..js/include/validate_form.js"></script>--%>
</head>

<body>
<div id="container">
	<!-- This is the Header -->
  <div id="header">
    <!-- <div class="logo"> --><img class="logo" src="../images/logo.jpg" width="150" height="50">
    <div class="head"><span class="headtext">智能物联网管理系统</span></div>
    <ul id="headuser">
    	<li><img src="../images/0.jpg" width="40" height="40"></li>
        <li class="lix"><a href="/user/get_information.do" class="lixa">用户信息</a></li>
        <li><img src="../images/sort_desc.png"></li>
    </ul>
  </div>
  <div id="mainContent">
    	<span id="atext"><a href="#">设备报警信息</a></span>

	  <%--显示表格数据--%>
	  <div class="row">
		  <div class="col-md-12">
			  <table class="table table-hover" id="emps_table">
				  <thead>
				  <tr>
					  <th>
						  <input type="checkbox" id="check_all"/>
					  </th>
					  <th>ID</th>
					  <th>姓名</th>
					  <th>性别</th>
					  <th>邮箱</th>
					  <th>部门</th>
					  <th>操作</th>
				  </tr>
				  </thead>
				  <tbody></tbody>
			  </table>
		  </div>
		  <div class="row">
			  <%--分页文字信息--%>
			  <div class="col-md-6" id="page_info_area"></div>
			  <%--分页条信息--%>
			  <div class="col-md-6" id="page_nav_area"></div>
		  </div>
	  </div>



   
  <div class="THlist">
          <table border="0" cellspacing="1px" width="1440px"  cellpadding="0px" align="center" bgcolor="white" id="tablelist">
		    
		       <tr  bgcolor="white">
		        <th class="l l1">编号</th>
		        <th class="l l2">标签ID</th>
		        <th class="l l3">标签类型</th>
                <th class="l l5">数据最新上传日期</th>
                <th class="l l7">标签固件版本</th>
                <th class="l l8">操作</th>
		      </tr>
		      <tr  align="center">		       
		        <td class="tdl"></td>
		        <td class="tdl"></td>   
		        <td class="tdl"></td>
		        <td class="tdl"></td>
		        <td class="tdl"></td>
		        <td class="tdl"><a href="/warn/list.do">配置</a></td>
		      </tr>
		      <tr  align="center">		       
		        <td class="tdl"></td>
		        <td class="tdl"></td>   
		        <td class="tdl"></td>
		        <td class="tdl"></td>
		        <td class="tdl"></td>
		        <td class="tdl"><a href="#">配置</a></td>    
		      </tr>
		      <tr  align="center">		       
		        <td class="tdl"></td>
		        <td class="tdl"></td>   
		        <td class="tdl"></td>
		        <td class="tdl"></td>
		        <td class="tdl"></td>
		        <td class="tdl"><a href="#">配置</a></td>    
		      </tr>
		      <tr  align="center">		       
		        <td class="tdl"></td>
		        <td class="tdl"></td>   
		        <td class="tdl"></td>
		        <td class="tdl"></td>
		        <td class="tdl"></td>
		        <td class="tdl"><a href="#">配置</a></td>    
		      </tr>
		      <tr  align="center">		       
		        <td class="tdl"></td>
		        <td class="tdl"></td>   
		        <td class="tdl"></td>
		        <td class="tdl"></td>
		        <td class="tdl"></td>
		        <td class="tdl"><a href="#">配置</a></td>    
		      </tr>
		      <tr  align="center">		       
		        <td class="tdl"></td>
		        <td class="tdl"></td>   
		        <td class="tdl"></td>
		        <td class="tdl"></td>
		        <td class="tdl"></td>
		        <td class="tdl"><a href="#">配置</a></td>    
		      </tr>
		    </table>
       </div>

<div class="main" id="main" style="height: 300px;width: 1200px;">
     
  </div>
  <!-- tubiao chajian  -->
<script type="text/javascript" src="../js/echarts.min.js"></script>
<script type="text/javascript" src="../js/echarts.js"></script>
<%--
<script type="text/javascript">
    require.config({
            paths: {
                echarts: '../js'
            }
        });
        require(
            [
                'echarts',
                'echarts/chart/line',   // 按需加载所需图表，如需动态类型切换功能，别忘了同时加载相应图表
                'echarts/chart/bar'
            ],
            function (ec) {
                var myChart = ec.init(document.getElementById('main'));
                var option = {
			         tooltip : {
			         trigger: 'axis'
			       },
                title:{
                	text:'\n设备数据曲线',
                	x:'center',
                	y:'top'
                },

			    toolbox: {
			        show : true,
			        feature : {
			            mark : {show: true},
			            dataView : {show: true, readOnly: false},
			            magicType: {show: true, type: ['line', 'bar']},
			            restore : {show: true},
			            saveAsImage : {show: true}
			        }
			    },
			    calculable : true,
			    legend: {
			        data:['蒸发量','降水量','平均温度']
			    },
			    xAxis : [
			        {
			            type : 'category',
			            data : ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']
			        }
			    ],
			    yAxis : [
			        {
			            type : 'value',
			            name : '水量',
			            axisLabel : {
			                formatter: '{value} ml'
			            }
			        },
			        {
			            type : 'value',
			            name : '温度',
			            axisLabel : {
			                formatter: '{value} °C'
			            }
			        }
			    ],
			    series : [

			        {
			            name:'蒸发量',
			            type:'bar',
			            data:[2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3]
			        },
			        {
			            name:'降水量',
			            type:'bar',
			            data:[2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3]
			        },
			        {
			            name:'平均温度',
			            type:'line',
			            yAxisIndex: 1,
			            data:[2.0, 2.2, 3.3, 4.5, 6.3, 10.2, 20.3, 23.4, 23.0, 16.5, 12.0, 6.2]
			        }

			    ]
                }
                myChart.setOption(option);
            }
        );
</script>
--%>
<script type="text/javascript" src="../js/jquery.js"></script>


<script type="text/javascript">
       $("#tablelist tr:odd").css("background-color","#ececec");
	   window.onscroll=function(){
		   var scrollTop = document.documentElement.scrollTop||document.body.scrollTop;
		   if(scrollTop>=document.body.offsetHeight-document.documentElement.clientHeight)
		   {
			   document.getElementById("look").style.display="none";
		   }
		   if(scrollTop<=document.body.offsetHeight-document.documentElement.clientHeight){
			   document.getElementById("look").style.display="block";
		   }
	   }

</script>

<style type="text/css">
#atext{
	font-family: 华文中宋;
	font-size: 18px;
   position: absolute;
   top: 20px;
   left: 30px;
}
</style>
</div>

	<%@include file="/jsp/include/footer.jsp"%>
</body>
</html>
