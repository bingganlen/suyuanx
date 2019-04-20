package com.megain.junhao.controller;

import com.megain.junhao.controller.core.SystemLog;
import com.megain.junhao.pojo.Device_record_his;
import com.megain.junhao.service.DerviceService;
import com.megain.junhao.service.Device_RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by huangjunhao on 2019/2/21.
 */
@Controller
@RequestMapping("/echart/")
public class Device_record_hisController {

    @Autowired
    private Device_RecordService recordService;
    @Autowired
    private DerviceService derviceService;

    //echart 图表 main.jsp  一星期
    @RequestMapping(value = "echartWeek.do", method = RequestMethod.GET)
    @ResponseBody
    @SystemLog(module = "展示模块",methods = "图表 一星期")
    public Map<String, Object> echartsweek(Integer devId) {// List<Map<String, Object>>      List<Integer> 返回lights    Map<String,Map<String,Object>>  Map<String, Object>
        return recordService.echartWeekByRecord_his(devId);
    }

    //G2Week 图表 main.jsp  一星期
    @RequestMapping(value = "G2Week.do", method = RequestMethod.GET)
    @ResponseBody
    @SystemLog(module = "展示模块",methods = "图表 一星期")
    public  List<Map<String, Object>> G2week(Integer devId) {// List<Map<String, Object>>      List<Integer> 返回lights    Map<String,Map<String,Object>>  Map<String, Object>
        return recordService.G2WeekByRecord_his(devId);
    }


    //echart 图表 main.jsp  一天
    @RequestMapping(value = "echartDay.do", method = RequestMethod.GET)
    @ResponseBody
    @SystemLog(module = "展示模块",methods = "图表 一天")
    public Map<String, Object> echartsday(Integer devId) {
        return recordService.echartDayByRecord_his(devId);
    }

    //echart 图表 main.jsp  //本月
    @RequestMapping(value = "echartMonth.do", method = RequestMethod.GET)
    @ResponseBody
    @SystemLog(module = "展示模块",methods = "图表 30天")
    public Map<String, Object> echartsMonth(Integer devId) {
        return recordService.echartMonthByRecord_his(devId);
    }

    //echart 图表 main.jsp  本年
    @RequestMapping(value = "echartYear.do", method = RequestMethod.GET)
    @ResponseBody
    @SystemLog(module = "展示模块",methods = "图表 年")
    public Map<String, Object> echartsYear(Integer devId) {
        return recordService.echartYearByRecord_his(devId);
    }



}
