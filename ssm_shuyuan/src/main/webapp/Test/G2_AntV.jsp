<%--
  Created by IntelliJ IDEA.
  User: huangjunhao
  Date: 2019/4/18
  Time: 16:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,height=device-height">
    <title>双折线图</title>
    <style>::-webkit-scrollbar{display:none;}html,body{overflow:hidden;height:100%;margin:0;}</style>
</head>
<body>
<div id="mountNode"></div>
<script>/*Fixing iframe window.innerHeight 0 issue in Safari*/document.body.clientHeight;</script>
<script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
<script src="https://gw.alipayobjects.com/os/antv/pkg/_antv.g2-3.5.1/dist/g2.min.js"></script>
<script src="https://gw.alipayobjects.com/os/antv/pkg/_antv.data-set-0.10.1/dist/data-set.min.js"></script>
<script>

    var devId = 100000213;
    var data = [
        {"create_time":"2017-1","name": "温度","air_humi": 25},
        {"create_time": "2017-2","name": "温度","air_humi": 23},
        {"create_time": "2017-3","name": "温度","air_humi": 30},

        {"create_time":"2017-1","name": "降雨量","air_humi": 10},
        {"create_time": "2017-2","name": "降雨量","air_humi": 3},
        {"create_time": "2017-3","name": "降雨量","air_humi": 0},

        {"create_time":"2017-1","name": "光照强度","light": 10149},
        {"create_time": "2017-2","name": "光照强度","light": 16394},
        {"create_time": "2017-3","name": "光照强度","light": 17446}
    ];


    var chart = new G2.Chart({
        container: 'mountNode',
        forceFit: true,
        height: window.innerHeight
    });
    chart.source(data
    );
    chart.tooltip({
        crosshairs: {
            type: 'line'
        }
    });
    chart.axis('temperature', {
        line: {
            lineWidth: 2, // 设置线的宽度
            stroke: 'red', // 设置线的颜色
            lineDash: [ 3, 3 ] // 设置虚线样式
        },

        label: {
            formatter: function formatter(val) {
                return val + '°C';
            }
        }
    });

    chart.line().position('create_time*light').color('name');
    chart.point().position('create_time*light').color('name').size(4).shape('circle').style({   //将 month 映射到 position 位置图形属性的 x 轴方向；将 temperature 映射到 position 位置图形属性的 y 轴方向；   将 city 映射到 color 颜色图形属性。
        stroke: '#fff',
        lineWidth: 1
    });
    chart.line().position('create_time*air_humi').color('name');  //把点连起来
    chart.point().position('create_time*air_humi').color('name').size(4).shape('circle').style({   //将 month 映射到 position 位置图形属性的 x 轴方向；将 temperature 映射到 position 位置图形属性的 y 轴方向；   将 city 映射到 color 颜色图形属性。
        stroke: '#fff',
        lineWidth: 1
    });
    chart.render();
</script>
</body>
</html>
<%--

function (data) {
        $.ajax({
            type : "GET",
            url : "/echart/G2Week.do?devId="+devId,
            dataType : "json", //返回数据形式为json
            success : function(result) {
               data = result;
            },
            error : function(errorMsg) {
                alert("无设备ID! 请点击设备列表上的ID");
            }
        });
        return data;
    }


{
"month": "Jan",
"city": "Tokyo",
"temperature": 7
}, {
"month": "Jan",
"city": "London",
"temperature": 3.9
}, {
"month": "Feb",
"city": "Tokyo",
"temperature": 6.9
}, {
"month": "Feb",
"city": "London",
"temperature": 4.2
}, {
"month": "Mar",
"city": "Tokyo",
"temperature": 9.5
}, {
"month": "Mar",
"city": "London",
"temperature": 5.7
}, {
"month": "Apr",
"city": "Tokyo",
"temperature": 14.5
}, {
"month": "Apr",
"city": "London",
"temperature": 8.5
}, {
"month": "May",
"city": "Tokyo",
"temperature": 18.4
}, {
"month": "May",
"city": "London",
"temperature": 11.9
}, {
"month": "Jun",
"city": "Tokyo",
"temperature": 21.5
}, {
"month": "Jun",
"city": "London",
"temperature": 15.2
}, {
"month": "Jul",
"city": "Tokyo",
"temperature": 25.2
}, {
"month": "Jul",
"city": "London",
"temperature": 17
}, {
"month": "Aug",
"city": "Tokyo",
"temperature": 26.5
}, {
"month": "Aug",
"city": "London",
"temperature": 16.6
}, {
"month": "Sep",
"city": "Tokyo",
"temperature": 23.3
}, {
"month": "Sep",
"city": "London",
"temperature": 14.2
}, {
"month": "Oct",
"city": "Tokyo",
"temperature": 18.3
}, {
"month": "Oct",
"city": "London",
"temperature": 10.3
}, {
"month": "Nov",
"city": "Tokyo",
"temperature": 13.9
}, {
"month": "Nov",
"city": "London",
"temperature": 6.6
}, {
"month": "Dec",
"city": "Tokyo",
"temperature": 9.6
}, {
"month": "Dec",
"city": "London",
"temperature": 4.8
}--%>
