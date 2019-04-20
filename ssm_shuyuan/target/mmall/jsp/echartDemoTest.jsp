<%--
  Created by IntelliJ IDEA.
  User: huangjunhao
  Date: 2019/3/22
  Time: 9:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>更新Echarts版本出现的问题</title>
    <script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
</head>
<body>
<div id="main" style="width: 1200px;height:500px;"></div>
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/4.1.0.rc2/echarts.min.js"></script>--%>
<script type="text/javascript" src="../js/echarts.min.js"></script>
<script type="text/javascript" src="../js/echarts.js"></script>
<script type="text/javascript">

    var echartUrl = "/echart/echartMonth.do";
    var myColumns = [];
    var num = 0;
    var chart = 1799;//Day
    var myChart = echarts.init(document.getElementById("main"));
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
            myChart = ec.init(document.getElementById('main'));
            $.ajax({
                type: "GET",
                /*async : false, //同步执行*/
                url: echartUrl + "?devId=" + 100000213,
                dataType: "json", //返回数据形式为json
                success: function (result) {
                    if (result) {
                        drawEchart(result);
                    }
                },
                error: function (errorMsg) {
                    alert("无设备ID! 请点击设备列表上的ID");
                }
            });
        });

    function drawEchart(result) {
        myChart.setOption({
            tooltip : {
                trigger: 'axis'
            },
            title:{
                text:'\n环境监测历史记录',
                x:'center',
                y:'top'
            },
            grid: {
                bottom: 80
            },
            toolbox: {
                show : true,
                feature : {
                    mark : {show: true},
                    dataView : {show: true, readOnly: true},
                    magicType: {show: true, type: ['line', 'bar']},
                    restore : {show: true},
                    saveAsImage : {show: true}
                }
            },
            calculable : true,
            legend: {
                data:['光照强度','降水量','温度','湿度','土壤温度','土壤湿度','土壤电导率','土壤盐分']
            },

            dataZoom: {
                    show: true,
                    realtime: true,
                    start: 65,
                    end: 85
            },
            /*dataZoom: [
                {
                    show: true,
                    realtime: true,
                    start: 65,
                    end: 85
                },
                {
                    type: 'inside',
                    realtime: true,
                    start: 65,
                    end: 85
                }
            ],*/
            /* dataZoom:
                 {
                     show: true,
                     realtime: true,
                     backgroundColor:"rgba(47,69,84,0)",
                 /!*yAxisIndex: 0,//控制x轴*!/
                     start: 0,
                     end: 10
                 },*/

            /*{
                show: true,
                start:90
                //shart:0,end:10
            },*/
            xAxis : [
                {

                    type : 'category',/*category*/
                    data : result.create_time.map(function (str) {
                        return str.replace(' ', '\n')
                    }),/*result.create_time*/

                    axisLabel:{
                        //rotate:10, //刻度旋转45度角
                        //interval:chart,//横坐标隐藏个数

                        textStyle:{
                            color:"#24C5DB",
                            fontSize:12
                        }
                    }
                }
            ],
            yAxis : [
                {
                    type : 'value',
                    name : '水量',
                    axisLabel : {
                        formatter: '{value} mm'
                    }
                },
                {
                    type : 'value',
                    name : '温度',
                    axisLabel : {
                        formatter: '{value}'+' °C',
                        min:-10,
                        max:10
                    }
                }
            ],
            series: [/*{
                 // 根据名字对应到相应的系列
                 name: '销量',
                 data: nums
                 }*/
                {
                    name:'光照强度',
                    type:'bar',
                    connectNulls: true,
                    data :result.light//[2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3]

                },
                {
                    name:'降水量',
                    type:'bar',
                    connectNulls: true,
                    data: result.rain//[2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3]
                },
                {
                    name:'温度',
                    type:'line',
                    yAxisIndex: 1,
                    connectNulls: true,
                    data:result.air_temp
                },
                {
                    name:'湿度',
                    type:'line',
                    yAxisIndex: 1,
                    connectNulls: true,
                    data:result.air_humi
                },
                {
                    name:'土壤温度',
                    type:'line',
                    yAxisIndex: 1,
                    connectNulls: true,
                    data:result.soil_temp
                },
                {
                    name:'土壤湿度',
                    type:'line',
                    yAxisIndex: 1,
                    connectNulls: true,
                    data:result.soil_humi
                },
                {
                    name:'土壤电导率',
                    type:'line',
                    yAxisIndex: 1,
                    connectNulls: true,
                    data:result.soil_electric
                },
                {
                    name:'土壤盐分',
                    type:'line',
                    yAxisIndex: 1,
                    connectNulls: true,
                    data:result.soil_salt
                }
            ]
        },true)
        //自适应
        window.onresize = myChart.resize;
    }


</script>
</body>
</html>
