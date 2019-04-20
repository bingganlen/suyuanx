<%--
  Created by IntelliJ IDEA.
  User: huangjunhao
  Date: 2019/4/19
  Time: 11:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,height=device-height">
    <title></title>
    <style>::-webkit-scrollbar{display:none;}html,body{overflow:hidden;height:100%;margin:0;}</style>
</head>
<body>
<div id="mountNode"></div>
<div id="slider"></div>

<script>/*Fixing iframe window.innerHeight 0 issue in Safari*/document.body.clientHeight;</script>
<script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
<script src="https://gw.alipayobjects.com/os/antv/pkg/_antv.g2-3.5.1/dist/g2.min.js"></script>
<script src="https://gw.alipayobjects.com/os/antv/pkg/_antv.data-set-0.10.1/dist/data-set.min.js"></script>
<script src="https://gw.alipayobjects.com/os/antv/assets/lib/jquery-3.2.1.min.js"></script>
<script src="https://gw.alipayobjects.com/os/antv/pkg/_antv.data-set-0.9.6/dist/data-set.min.js"></script>
<!-- 引入 slider 组件脚本 -->
<%--<script src="https://a.alipayobjects.com/g/datavis/g2-plugin-slider/1.2.1/slider.js"></script>--%>
<%--<script src="https://gw.alipayobjects.com/os/antv/pkg/_antv.g2-plugin-slider-2.0.4/dist/g2-plugin-slider.min.js"></script>--%>
<script src="../js/g2-plugin-slider.js"></script>
<script>



    var devId = 100000213;
    //var data = [];
   $(function () {
       $.ajax({
           type : "GET",
           url : "/echart/G2Week.do?devId="+devId,
           dataType : "json", //返回数据形式为json
           success : function(data) {

               const ds = new DataSet({
                   state: {
                       start: '2004-01-01',
                       end: '2007-09-24'
                   }
               });
               var chart = new G2.Chart({
                   container: 'mountNode',
                   forceFit: true,
                   width:1000,
                   height: 600
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
               chart.line().position('create_time*data').color('name');  //把点连起来
               chart.point().position('create_time*data').color('name').size(4).shape('circle').style({   //将 month 映射到 position 位置图形属性的 x 轴方向；将 temperature 映射到 position 位置图形属性的 y 轴方向；   将 city 映射到 color 颜色图形属性。
                   stroke: '#fff',
                   lineWidth: 1
               });
               chart.render();

               // var slider = new Slider({
               //     domId: 'slider',
               //     height: 30,
               //     charts: [chart],
               //     xDim: 'create_time',
               //     yDim: 'data',
               //     data:
               //
               //     // start : 0,
               //     // end: 10
               // });

               // 创建 Slider
               const slider = new Slider({
                   container: 'slider', // dom 容器 id 或者 dom 容器对象
                   width: 1000, // slider 的宽度，默认为 'auto'，即自适应宽度
                   height: 26, // slider 的高度，默认为 '26px'
                   padding: [ 20, 120, 100 ], // slider 所在画布 canvas 的内边距，用于对齐图表，默认与图表默认的 padding 相同
                   start: '19-04-17 11:00', // 和状态量对应，滑块的起始点数值，如果是时间类型，建议将其转换为时间戳，方便数据过滤
                   end: '19-04-19 11:00', // 和状态量对应，滑块的结束点数值，如果是时间类型，建议将其转换为时间戳，方便数据过滤
                   // minSpan: 30 * 24 * 60 * 60 * 1000, // 可选，用于设置滑块的最小范围，时间类型的数值必须使用时间戳，这里设置最小范围为 30 天
                   // maxSpan: 120 * 24 * 60 * 60 * 1000, // 可选，用于设置滑块的最大范围，时间类型的数值必须使用时间戳，这里设置最大范围为 120 天
                   data: data,//[data], // slider 的数据源
                   xAxis: 'create_time', // 背景图的横轴对应字段，同时为数据筛选的字段
                   yAxis: 'data', // 背景图的纵轴对应字段
                   // onChange: ({ startValue, endValue }) => {
                   // ds.setState('start', startValue);
                   // ds.setState('end', endValue);
                   // } // 更新数据状态量的回调函数
                   fillerStyle: {
                       fill: '#5AA8D8',
                       fillOpacity: 0.1
                   },
                   backgroundStyle: {
                       stroke: '#dddddd',  //border
                       fill: '#000000',   //背景色
                       fillOpacity: 0.005,
                       lineWidth: 0
                   },
                   backgroundChart : {
                       type: [ 'interval' ], // 图表的类型，可以是字符串也可是是数组  line  area
                       color: '#825738',
                   },
                   textStyle: {
                       fill: '#ff0000'  //333333
                   },
                   onChange: function (obj) {
                       var temp = obj.startText + obj.endText;
                       console.log(temp);
                   }
               });
               slider.render(); // 渲染


           },
           error : function(errorMsg) {
               alert("无设备ID! 请点击设备列表上的ID");
           }
       });
   })





</script>
</body>
</html>