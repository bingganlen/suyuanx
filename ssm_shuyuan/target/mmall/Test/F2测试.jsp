<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <meta name="chart-name" content="实际收益和预期收益对比">
    <title>F2 图表组件库 - AntV</title>
    <link rel="stylesheet" href="https://gw.alipayobjects.com/os/rmsportal/YmDAMEQVbLJpVbKiRQVX.css" />

</head>
<body>
<script>/*Fixing iframe window.innerHeight 0 issue in Safari*/document.body.clientHeight;</script>

<script src="https://gw.alipayobjects.com/os/antv/assets/f2/3.3.8/f2.min.js"></script>

<script src="https://gw.alipayobjects.com/os/antv/assets/lib/jquery-3.2.1.min.js"></script>
<!-- 在 PC 上模拟 touch 事件 -->
<script src="https://gw.alipayobjects.com/os/rmsportal/NjNldKHIVQRozfbAOJUW.js"></script>

<div class="chart-wrapper">
    <canvas id="mountNode"></canvas>
</div>
<script>
    var data = [{
        time: '2016-08-08 00:00:00',
        value: 10,
        type: '预期收益率'
    }, {
        time: '2016-08-08 00:10:00',
        value: 22,
        type: '预期收益率'
    }, {
        time: '2016-08-08 00:30:00',
        value: 16,
        type: '预期收益率'
    }, {
        time: '2016-08-09 00:35:00',
        value: 26,
        type: '预期收益率'
    }, {
        time: '2016-08-09 01:00:00',
        value: 12,
        type: '预期收益率'
    }, {
        time: '2016-08-09 01:20:00',
        value: 26,
        type: '预期收益率'
    }, {
        time: '2016-08-10 01:40:00',
        value: 18,
        type: '预期收益率'
    }, {
        time: '2016-08-10 02:00:00',
        value: 26,
        type: '预期收益率'
    }, {
        time: '2016-08-10 02:20:00',
        value: 12,
        type: '预期收益率'
    }, {
        time: '2016-08-08 00:00:00',
        value: 4,
        type: '实际收益率'
    }, {
        time: '2016-08-08 00:10:00',
        value: 3,
        type: '实际收益率'
    }, {
        time: '2016-08-08 00:30:00',
        value: 6,
        type: '实际收益率'
    }, {
        time: '2016-08-09 00:35:00',
        value: -12,
        type: '实际收益率'
    }, {
        time: '2016-08-09 01:00:00',
        value: 1,
        type: '实际收益率'
    }, {
        time: '2016-08-09 01:20:00',
        value: 9,
        type: '实际收益率'
    }, {
        time: '2016-08-10 01:40:00',
        value: 13,
        type: '实际收益率'
    }, {
        time: '2016-08-10 02:00:00',
        value: -3,
        type: '实际收益率'
    }, {
        time: '2016-08-10 02:20:00',
        value: 11,
        type: '实际收益率'
    }];
    var chart = new F2.Chart({
        id: 'mountNode',
        pixelRatio: window.devicePixelRatio
    });
    chart.source(data, {
        time: {
            type: 'timeCat',
            tickCount: 3,
            mask: 'hh:mm',
            range: [0, 1]
        },
        value: {
            tickCount: 3,
            formatter: function formatter(ivalue) {
                return ivalue + '%';
            }
        }
    });
    chart.axis('time', {
        line: null,
        label: function label(text, index, total) {
            var textCfg = {};
            if (index === 0) {
                textCfg.textAlign = 'left';
            } else if (index === total - 1) {
                textCfg.textAlign = 'right';
            }
            return textCfg;
        }
    });
    chart.axis('tem', {
        grid: function grid(text) {
            if (text === '0%') {
                return {
                    lineDash: null,
                    lineWidth: 1
                };
            }
        }
    });
    chart.legend({
        position: 'bottom',
        offsetY: -5
    });
    chart.line().position('time*value').color('type').shape('type', function(type) {
        if (type === '预期收益率') {
            return 'line';
        }
        if (type === '实际收益率') {
            return 'dash';
        }
    });

    chart.render();
</script>


</body>
</html>

<%--<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <meta name="chart-name" content="可点击的文本">
    <title>F2 图表组件库 - AntV</title>
    <link rel="stylesheet" href="https://gw.alipayobjects.com/os/rmsportal/YmDAMEQVbLJpVbKiRQVX.css" />

</head>
<body>
<script>/*Fixing iframe window.innerHeight 0 issue in Safari*/document.body.clientHeight;</script>

<script src="https://gw.alipayobjects.com/os/antv/assets/f2/3.3.8/f2-all.min.js"></script>

<script src="https://gw.alipayobjects.com/os/antv/assets/lib/jquery-3.2.1.min.js"></script>
<!-- 在 PC 上模拟 touch 事件 -->
<script src="https://gw.alipayobjects.com/os/rmsportal/NjNldKHIVQRozfbAOJUW.js"></script>

<div class="chart-wrapper">
    <canvas id="mountNode"></canvas>
</div>
<script>
    var data = [{
        const: 'const',
        type: '交通出行',
        money: 51.39
    }, {
        const: 'const',
        type: '饮食',
        money: 356.68
    }, {
        const: 'const',
        type: '生活日用',
        money: 20.00
    }, {
        const: 'const',
        type: '住房缴费',
        money: 116.53
    }];
    var chart = new F2.Chart({
        id: 'mountNode',
        pixelRatio: window.devicePixelRatio
    });
    chart.source(data);
    chart.coord('polar', {
        transposed: true,
        radius: 0.9,
        innerRadius: 0.5
    });
    chart.axis(false);
    chart.legend(false);
    chart.tooltip(false);
    chart.guide().html({
        position: ['50%', '50%'],
        html: '<div style="text-align: center;width:150px;height: 50px;">\n      <p style="font-size: 12px;color: #999;margin: 0" id="title"></p>\n      <p style="font-size: 18px;color: #343434;margin: 0;font-weight: bold;" id="money"></p>\n      </div>'
    });
    chart.interval().position('const*money').adjust('stack').color('type', ['#1890FF', '#13C2C2', '#2FC25B', '#FACC14']);
    chart.pieLabel({
        sidePadding: 30,
        activeShape: true,
        label1: function label1(data) {
            return {
                text: '￥' + data.money,
                fill: '#343434',
                fontWeight: 'bold'
            };
        },
        label2: function label2(data) {
            return {
                text: data.type,
                fill: '#999'
            };
        },
        onClick: function onClick(ev) {
            var data = ev.data;
            if (data) {
                $('#title').text(data.type);
                $('#money').text(data.money);
            }
        }
    });
    chart.render();
</script>


</body>
</html>--%>
