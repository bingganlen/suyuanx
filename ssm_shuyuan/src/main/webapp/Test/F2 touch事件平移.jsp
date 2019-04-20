<%--
  Created by IntelliJ IDEA.
  User: huangjunhao
  Date: 2019/4/20
  Time: 11:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <meta name="chart-name" content="折线图平移">
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
    $.getJSON('/assets/data/f2/linear-pan.json', function(data) {
        var chart = new F2.Chart({
            id: 'mountNode',
            pixelRatio: window.devicePixelRatio
        });
        chart.source(data, {
            release: {
                min: 1990,
                max: 2010
            }
        });
        chart.tooltip({
            showCrosshairs: true,
            showItemMarker: false,
            background: {
                radius: 2,
                fill: '#1890FF',
                padding: [3, 5]
            },
            nameStyle: {
                fill: '#fff'
            },
            onShow: function onShow(ev) {
                var items = ev.items;
                items[0].name = items[0].title;
            }
        });
        chart.line().position('release*count');
        chart.point().position('release*count').style({
            lineWidth: 1,
            stroke: '#fff'
        });

        chart.interaction('pan');
        // 定义进度条
        chart.scrollBar({
            mode: 'x',
            xStyle: {
                offsetY: -5
            }
        });

        // 绘制 tag
        chart.guide().tag({
            position: [1969, 1344],
            withPoint: false,
            content: '1,344',
            limitInPlot: true,
            offsetX: 5,
            direct: 'cr'
        });
        chart.render();
    });
</script>


</body>
</html>


<!-- <!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<meta name="chart-name" content="时序折线图过渡动画">
<title>F2 图表组件库 - AntV</title>
<link rel="stylesheet" href="https://gw.alipayobjects.com/os/rmsportal/YmDAMEQVbLJpVbKiRQVX.css" />

</head>
<body>
<script>/*Fixing iframe window.innerHeight 0 issue in Safari*/document.body.clientHeight;</script>

<script src="https://gw.alipayobjects.com/os/antv/assets/f2/3.3.8/f2.min.js"></script>

<script src="https://gw.alipayobjects.com/os/antv/assets/lib/jquery-3.2.1.min.js"></script>
<script src="https://gw.alipayobjects.com/os/rmsportal/NjNldKHIVQRozfbAOJUW.js"></script>

<div class="chart-wrapper">
    <canvas id="mountNode"></canvas>
</div>
<style type="text/css">
    .tab {
        width: 100%;
        height: 40px;
    }
    .btn {
        float: left;
        font-weight: 400;
        text-align: center;
        white-space: nowrap;
        vertical-align: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
        border: none;
        font-size: 13px;
        width: 25%;
        height: 40px;
        line-height: 40px;
        color: #808080;
        background-color: #F2F2F2;
        padding: 0;
        margin: 0;
    }
    .btn.focus, .btn:focus {
        outline: 0;
    }
    .btn:focus, .btn:hover {
        text-decoration: none;
    }
    .btn.active {
        background: #fff;
        color: #2E2E2E;
    }
    canvas {
        display: inherit;
        background: #fff;
        height: 58.67vw;
    }
</style>
<script>
    $('<div class="tab">' + '<button class="btn active" id="one">近 1 月</button>' + '<button class="btn" id="three">近 3 月</button>' + '<button class="btn" id="six">近 6 月</button>' + '<button class="btn" id="oneYear">近 1 年</button>' + '</div>').insertAfter('#mountNode');

    var data;
    var oneMonth;
    var threeMonth;
    var sixMonth;
    var oneYear;
    var chart;

    $('#one').click(function() {
        if ($('#one').hasClass('active')) return;

        $('.btn').removeClass('active');
        $('#one').addClass('active');
        var one = data.slice(oneMonth);
        chart.changeData(one);
    });

    $('#three').click(function() {
        if ($('#three').hasClass('active')) return;

        $('.btn').removeClass('active');
        $('#three').addClass('active');
        var three = data.slice(threeMonth);
        chart.changeData(three);
    });

    $('#six').click(function() {
        if ($('#six').hasClass('active')) return;

        $('.btn').removeClass('active');
        $('#six').addClass('active');
        var six = data.slice(sixMonth);
        chart.changeData(six);
    });

    $('#oneYear').click(function() {
        if ($('#oneYear').hasClass('active')) return;

        $('.btn').removeClass('active');
        $('#oneYear').addClass('active');
        var six = data.slice(oneYear);
        chart.changeData(six);
    });

    // 自定义线图变更动画
    F2.Animate.registerAnimation('lineUpdate', function(updateShape, animateCfg) {
        var cacheShape = updateShape.get('cacheShape'); // 该动画 shape 的前一个状态
        var cacheAttrs = cacheShape.attrs; // 上一个 shape 属性
        var geomType = cacheShape.geomType; // 图形类型

        var oldPoints = cacheAttrs.points; // 上一个状态的关键点
        var newPoints = updateShape.attr('points'); // 当前 shape 的关键点

        var oldLength = oldPoints.length;
        var newLength = newPoints.length;
        var deltaLength = geomType === 'area' ? (oldLength - newLength) / 2 : oldLength - newLength;

        if (deltaLength > 0) {
            var firstPoint = newPoints[0];
            var lastPoint = newPoints[newPoints.length - 1];

            for (var i = 0; i < deltaLength; i++) {
                newPoints.splice(0, 0, firstPoint);
            }

            if (geomType === 'area') {
                for (var j = 0; j < deltaLength; j++) {
                    newPoints.push(lastPoint);
                }
            }
        } else {
            deltaLength = Math.abs(deltaLength);
            var firstPoint1 = oldPoints[0];
            var lastPoint1 = oldPoints[oldPoints.length - 1];

            for (var k = 0; k < deltaLength; k++) {
                oldPoints.splice(0, 0, firstPoint1);
            }

            if (geomType === 'area') {
                for (var p = 0; p < deltaLength; p++) {
                    oldPoints.push(lastPoint1);
                }
            }

            cacheAttrs.points = oldPoints;
        }
        updateShape.attr(cacheAttrs);
        updateShape.animate().to({
            attrs: {
                points: newPoints
            },
            duration: 800,
            easing: animateCfg.easing
        });
    });

    $.getJSON('/assets/data/f2/animted-line.json', function(json) {
        var source = [];
        var i = 0;
        json.map(function(obj) {
            i++;
            if (obj.reportDate === "2018-01-02") {
                oneMonth = i;
            } else if (obj.reportDate === "2017-11-01") {
                threeMonth = i;
            } else if (obj.reportDate === "2017-08-01") {
                sixMonth = i;
            } else if (obj.reportDate === "2017-01-03") {
                oneYear = i;
            }
            obj.value = obj.value * 1;
            source.push(obj);
        });
        data = source;
        chart = new F2.Chart({
            id: 'mountNode',
            pixelRatio: window.devicePixelRatio
        });

        chart.source(data.slice(oneMonth), {
            reportDateTimestamp: {
                type: 'timeCat',
                tickCount: 3,
                range: [0, 1]
            },
            value: {
                alias: '涨幅',
                tickCount: 5,
                formatter: function formatter(val) {
                    return val.toFixed(2) + '%';
                }
            }
        });
        chart.tooltip({
            showCrosshairs: true
        });
        chart.axis('reportDateTimestamp', {
            label: function label(text, index, total) {
                var cfg = {
                    textAlign: 'center'
                };
                // 第一个点左对齐，最后一个点右对齐，其余居中，只有一个点时左对齐
                if (index === 0) {
                    cfg.textAlign = 'start';
                }
                if (index > 0 && index === total - 1) {
                    cfg.textAlign = 'end';
                }
                return cfg;
            }
        });

        chart.line({
            sortable: false
        }).position('reportDateTimestamp*value').shape('smooth').animate({
            update: {
                animation: 'lineUpdate'
            }
        });
        chart.area({
            sortable: false
        }).position('reportDateTimestamp*value').shape('smooth').animate({
            update: {
                animation: 'lineUpdate'
            }
        });
        chart.render();
    });
</script>


</body>
</html>
-->

