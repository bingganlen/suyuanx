<%--
  Created by IntelliJ IDEA.
  User: huangjunhao
  Date: 2019/3/21
  Time: 11:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style type="text/css">
        #c_chart {
            width: 100%;
            height: 600px;
        }
    </style>
</head>
<body>

<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
<div id="c_chart"></div>
<script type="text/javascript" src="../js/jquery-3.3.1.js"></script>

<%--<script type="text/javascript" src="../js/echarts.min.js"></script>--%>
<%--<script type="text/javascript" src="../js/echarts.js"></script>--%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/4.1.0.rc2/echarts.min.js"></script>
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('c_chart'));
    // 指定图表的配置项和数据
    option = {
        title : {
            text: '带时间轴的折线图',
            subtext: '带时间轴的折线图',
            x: 'center',
            align: 'right'
        },

        toolbox: {
            feature: {
                saveAsImage: {}
            }
        },
        tooltip : {
            trigger: 'axis',

        },
        dataZoom: [
            {
                show: true,
                realtime: true,
                start: 0,
                end: 10
            },
            {
                type: 'inside',
                realtime: true,
                start: 0,
                end: 10
            }
        ],
        //x轴时间轴
        xAxis : [
            {
                type : 'category',
                data : [
                    '2009/6/12 2:00', '2009/6/12 3:00', '2009/6/12 4:00', '2009/6/12 5:00', '2009/6/12 6:00', '2009/6/12 7:00', '2009/6/12 8:00', '2009/6/12 9:00', '2009/6/12 10:00', '2009/6/12 11:00'
                ].map(function (str) {
                    return str.replace(' ', '\n')
                })
            }
        ],
        yAxis: [
            {
                name: '流量(m^3/s)',
                type: 'value'
            }
        ],
        //y轴
        series: [
            {
                name:'流量',
                type:'line',
                animation: false,
                areaStyle: {
                    normal: {}
                },
                lineStyle: {
                    normal: {
                        width: 1
                    }
                },
                data:[
                    100.97,20.96,300.96,40.95,300.95,20.94,50.94,360.94,80.94,100.94
                ]
            }
        ]
    };
    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
    //自适应
    window.onresize = myChart.resize;
</script>


</body>
</html>

