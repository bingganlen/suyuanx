<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="../css/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/esl.js"></script>
<link href="https://unpkg.com/video.js/dist/video-js.css" rel="stylesheet">
  <script src="https://unpkg.com/video.js/dist/video.js"></script>
  <script src="https://unpkg.com/videojs-contrib-hls/dist/videojs-contrib-hls.js"></script>
</head>

<body onload="findid()">
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
    <div id="sidebar">
    	<ul class="common">
           <li><a href="#" class="a1 a2">温湿度标签</a></li>
           <li><a href="#" class="a1 a2">溯源系统</a></li>
           <li><a href="#" class="a1 a3">实时温湿度监控</a></li>
    	</ul>
       <div class="list">
          <table border="0px" cellspacing="1px" width="220px"  cellpadding="0px" align="center" bgcolor="black">
		    <caption align="top">在线设备列表</caption>
		       <tr  bgcolor="white">
		        <th class="th1">序号</th>
		        <th class="th2">设备ID</th>
		      </tr>
		      <tr  align="center" bgcolor="white">		       
		        <td class="td"></td>
		        <td class="td"></td>     
		      </tr>
		      <tr  align="center" bgcolor="white">		       
		        <td class="td"></td>
		        <td class="td"></td>     
		      </tr>
		      <tr  align="center" bgcolor="white">		       
		        <td class="td"></td>
		        <td class="td"></td>     
		      </tr>
		      <tr  align="center" bgcolor="white">		       
		        <td class="td"></td>
		        <td class="td"></td>     
		      </tr>
		      <tr  align="center" bgcolor="white">		       
		        <td class="td"></td>
		        <td class="td"></td>     
		      </tr>
		      <tr  align="center" bgcolor="white">		       
		        <td class="td"></td>
		        <td class="td"></td>     
		      </tr>
		      <tr  align="center" bgcolor="white">		       
		        <td class="td"></td>
		        <td class="td"></td>     
		      </tr>
		      <tr  align="center" bgcolor="white">		       
		        <td class="td"></td>
		        <td class="td"></td>     
		      </tr>
		      <tr  align="center" bgcolor="white">		       
		        <td class="td"></td>
		        <td class="td"></td>     
		      </tr>


		    </table>
       </div>
    </div>
    <div id="content">
       <video id="my_video_1" class="video-js vjs-default-skin" controls preload="auto" width="800" height="450" data-setup='{}'>
           <source src="http://d2zihajmogu5jn.cloudfront.net/bipbop-advanced/bipbop_16x9_variant.m3u8" type="application/x-mpegURL"><!-- http://1p5e803947.imwork.net:18634/hls/hls.m3u8 -->
       </video>
       
    </div>


  <div class="main" id="main" style="height: 300px;width: 1200px;">
     
  </div>
  <!-- tubiao chajian  -->
<script type="text/javascript" src="../js/echarts.min.js"></script>
<script type="text/javascript" src="../js/echarts.js"></script>
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
	  <script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
	  <script type="text/javascript">
          function findid() {
              $.ajax({
                  type:"POST",
                  url: "/device/findId.do",
                  dataType: "json",
                  success:function(data){
                      addfindid(data);
                  }

              });

              function addfindid(data) {
                  //var data  = eval( '('+ data + ')' );
                  //alert(data.deviceId);
                  $.each(data,function(index,obj){
                      $("#tablel").append("<tr  align='center' bgcolor='white'>"
                          +"<td class='td'>" + (index + 1) + "</td>"
                          +"<td class='td'>" + obj['deviceId'] + "</td>"
                          +"</tr>");
                  });

              }
          }
	  </script>

  </div></div>
<%@include file="/jsp/include/footer.jsp"%>
</body>

</html>
