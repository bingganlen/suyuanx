<%--
  Created by IntelliJ IDEA.
  User: huangjunhao
  Date: 2019/2/21
  Time: 8:51
  To change this template use File | Settings | File Templates.
--%>
<%@page pageEncoding="UTF-8" contentType="text/html; utf-8" %>
<head>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="/js/jquery-3.3.1.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="/js/bootstrap.min.js"></script>
</head>
<body>

<form action="/device/saveDevice.do" method="post">

    <div class="form-group">
        <label for="devId" class="col-sm-2 control-label">设备号</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="devId" name="devId"
                   placeholder="设备号" style="width: auto;" >

        </div>
    </div>

    <div class="form-group">
        <label for="light" class="col-sm-2 control-label">光照强度</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="light" name="light"
                   placeholder="" style="width: auto;">
        </div>
    </div>
    <div class="form-group">
        <label for="rain" class="col-sm-2 control-label">降雨量</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="rain" name="rain"
                   placeholder="" style="width: auto;">
        </div>
    </div>
    <div class="form-group">
        <label for="airTemp" class="col-sm-2 control-label">空气温度</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="airTemp" name="airTemp"
                   placeholder="" style="width: auto;">
        </div>
    </div>
    <div class="form-group">
        <label for="airHumi" class="col-sm-2 control-label">空气湿度</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="airHumi" name="airHumi"
                   placeholder="" style="width: auto;">
        </div>
    </div>
    <div class="form-group">
        <label for="soilTemp" class="col-sm-2 control-label">土壤温度</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="soilTemp" name="soilTemp"
                   placeholder="" style="width: auto;">
        </div>
    </div>
    <div class="form-group">
        <label for="soilHumi" class="col-sm-2 control-label">土壤湿度</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="soilHumi" name="soilHumi"
                   placeholder="" style="width: auto;">
        </div>
    </div>
    <div class="form-group">
        <label for="soilElectric" class="col-sm-2 control-label">土壤电导率</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="soilElectric" name="soilElectric"
                   placeholder="" style="width: auto;">
        </div>
    </div>
    <div class="form-group">
        <label for="soilSalt" class="col-sm-2 control-label">土壤盐度</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="soilSalt" name="soilSalt"
                   placeholder="" style="width: auto;">
        </div>
    </div>





    <div class="form-group">
        <div class="col-sm-offset-4 col-sm-10">
            <button type="submit" class="btn btn-default">添加</button>
        </div>
    </div>
</form>
</div>
</div>
</div>
</div>
</form>
</body>
