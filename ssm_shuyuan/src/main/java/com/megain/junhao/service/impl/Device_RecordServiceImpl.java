package com.megain.junhao.service.impl;

import com.megain.junhao.common.ServerResponse;
import com.megain.junhao.dao.Device_record_hisMapper;
import com.megain.junhao.dao.Device_record_his_avgMapper;
import com.megain.junhao.dao.Device_userMapper;
import com.megain.junhao.pojo.Device_record_his;
import com.megain.junhao.service.Device_RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Date;

/**
 * Created by huangjunhao on 2019/2/20.
 */
@Service
public class Device_RecordServiceImpl implements Device_RecordService {

    @Autowired
    private Device_record_hisMapper device_record_hisMapper;
    @Autowired
    private Device_record_his_avgMapper device_record_his_avgMapper;
    @Autowired
    private Device_userMapper deviceUserMapper;

    /**\
     * 更新设备记录
     * 返回的记录数错误  而不是插入一条就返回1
     -2147482646
     * @param device_record_his
     * @return
     */
    @Override
    public ServerResponse<String> saveDevice(Device_record_his device_record_his) {
        if(device_record_his != null)
        {
            if(device_record_his.getId() != null){ // device_record_his.getDevId() != null         ID为空就是新增   因为有多个设备id相同的不同时间段的记录
                int rowCount = device_record_hisMapper.updateByPrimaryKey(device_record_his);//更新整个产品
              /*  if(rowCount > 0){
                    return ServerResponse.createBySuccess("更新设备记录成功");
                }

                return ServerResponse.createBySuccess("更新设备记录失败");*/
                return ServerResponse.createBySuccess("更新设备记录成功");
            }else{
                int rowCount = device_record_hisMapper.insert(device_record_his);
               /* if(rowCount > 0){
                    return ServerResponse.createBySuccess("新增设备记录成功");
                }
                System.out.println(rowCount);
                return ServerResponse.createBySuccess("新增设备记录失败");*/
                return ServerResponse.createBySuccess("新增设备记录成功");
            }
        }
        return ServerResponse.createByErrorMessage("新增或更新设备记录参数不正确");
    }


    //图表的参数   上一个星期
    @Override
    //public Map<Object, Object> echartWeekByRecord_his(Integer devId) {
    public Map<String, Object> echartWeekByRecord_his(Integer devId) {
        List<Map<String, Object>> resultMap  = device_record_hisMapper.selectByDeviceWeek(devId);
        //内存溢出    java.lang.OutOfMemoryError: GC overhead limit exceeded
        int size = resultMap.size();
        List lights= new ArrayList<>();
        List rain = new ArrayList();
        List air_temp = new ArrayList();
        List air_humi = new ArrayList();
        List soil_electric = new ArrayList();
        List soil_temp = new ArrayList();
        List soil_humi = new ArrayList();
        List soil_salt = new ArrayList();
        List create_time = new ArrayList();   //日期转字符串分割  按天进行分组的
        Map<String,Object> mapweek = new HashMap<String,Object>();
        for (int i = 0; i < size; i++) {//7
            Map mapItem = resultMap.get(i);

            if (mapItem != null) {
                lights.add(mapItem.get("light"));
                rain.add(division((Integer) mapItem.get("rain")));
                air_temp.add(division((Integer) mapItem.get("air_temp")));
                air_humi.add(division((Integer) mapItem.get("air_humi")));
                soil_electric.add(mapItem.get("soil_electric"));
                soil_temp.add(division((Integer) mapItem.get("soil_temp")));
                soil_humi.add(division((Integer) mapItem.get("soil_humi")));
                soil_salt.add(mapItem.get("soil_salt"));
                create_time.add( DateTimeToStr((Date) mapItem.get("create_time")));
            }
        }
        mapweek.put("light",lights);
        mapweek.put("rain",rain);
        mapweek.put("air_temp",air_temp);
        mapweek.put("air_humi",air_humi);
        mapweek.put("soil_electric",soil_electric);
        mapweek.put("soil_temp",soil_temp);
        mapweek.put("soil_humi",soil_humi);
        mapweek.put("soil_salt",soil_salt);
        mapweek.put("create_time",create_time);
        return mapweek;
    }

//  [{"air_temp":215,"rain":0,"update_time":1555117261000,"create_time":1555117261000,"light":5021,"soil_electric":58,"air_humi":913,"id":1470,"soil_humi":275,"soil_salt":36,"soil_temp":222,"dev_id":100000213},
//    {"create_time":"2017-1","name": "温度","air_humi": 25},
//    {"create_time":"2017-1","name": "降雨量","air_humi": 10},
//    {"create_time": "2017-3","name": "光照强度","light": 17446}

    // G2 上一个星期
    public List<Map<String, Object>> G2WeekByRecord_his(Integer devId) {
        List<Map<String, Object>> resultMap  = device_record_hisMapper.selectByDeviceWeek(devId);
        int size = resultMap.size();

        //数据库记录一共多少条  *  拆分 8条   其中light
        List list = new ArrayList();

        for (int i = 0; i < size; i++) {
            Map mapItem = resultMap.get(i);
            if (mapItem != null) {
                Map<String, Object> week = new HashMap<String,Object>();
                    week.put("create_time",DatePubToStr((Date) mapItem.get("create_time")));
                    week.put("name","光照强度");
                    week.put("light",mapItem.get("light"));
                    list.add(week);

                    week = new HashMap<String,Object>();
                    week.put("create_time",DatePubToStr((Date) mapItem.get("create_time")));
                    week.put("name","降雨量");
                    week.put("data",mapItem.get("rain"));
                    list.add(week);

                    week = new HashMap<String,Object>();
                    week.put("create_time",DatePubToStr((Date) mapItem.get("create_time")));
                    week.put("name","温度");
                    week.put("data",mapItem.get("air_temp"));
                    list.add(week);

                    week = new HashMap<String,Object>();
                    week.put("create_time",DatePubToStr((Date) mapItem.get("create_time")));
                    week.put("name","湿度");
                    week.put("data",mapItem.get("air_humi"));
                    list.add(week);

                    week = new HashMap<String,Object>();
                    week.put("create_time",DatePubToStr((Date) mapItem.get("create_time")));
                    week.put("name","土壤温度");
                    week.put("data",mapItem.get("soil_temp"));
                    list.add(week);

                    week = new HashMap<String,Object>();
                    week.put("create_time",DatePubToStr((Date) mapItem.get("create_time")));
                    week.put("name","土壤湿度");
                    week.put("data",mapItem.get("soil_humi"));
                    list.add(week);

                    week = new HashMap<String,Object>();
                    week.put("create_time",DatePubToStr((Date) mapItem.get("create_time")));
                    week.put("name","土壤电导率");
                    week.put("data",mapItem.get("soil_electric"));
                    list.add(week);

                    week = new HashMap<String,Object>();
                    week.put("create_time",DatePubToStr((Date) mapItem.get("create_time")));
                    week.put("name","土壤盐度");
                    week.put("data",mapItem.get("soil_salt"));
                    list.add(week);
            }
        }
        return list;
    }


    // 一天
    @Override
    public Map<String, Object> echartDayByRecord_his(Integer devId) {
        List<Map<String, Object>> resultMap  = device_record_hisMapper.selectByDeviceDay(devId);
        Map<String,Object> mapday =  EchartMap(resultMap);
        return mapday;
    }

    //本月
    @Override
    public Map<String, Object> echartMonthByRecord_his(Integer devId) {
        List<Map<String, Object>> resultMap  = device_record_hisMapper.selectByDeviceMonth(devId);
        int size = resultMap.size();
        List lights= new ArrayList<>();
        List rain = new ArrayList();
        List air_temp = new ArrayList();
        List air_humi = new ArrayList();
        List soil_electric = new ArrayList();
        List soil_temp = new ArrayList();
        List soil_humi = new ArrayList();
        List soil_salt = new ArrayList();
        List create_time = new ArrayList();   //日期转字符串分割  按天进行分组的
        Map<String,Object> mapmonth = new HashMap<String,Object>();
        for (int i = 0; i < size; i++) {//7
            Map mapItem = resultMap.get(i);

            if (mapItem != null) {
                lights.add(mapItem.get("light"));
                rain.add(division((Integer) mapItem.get("rain")));
                air_temp.add(division((Integer) mapItem.get("air_temp")));
                air_humi.add(division((Integer) mapItem.get("air_humi")));
                soil_electric.add(mapItem.get("soil_electric"));
                soil_temp.add(division((Integer) mapItem.get("soil_temp")));
                soil_humi.add(division((Integer) mapItem.get("soil_humi")));
                soil_salt.add(mapItem.get("soil_salt"));
                create_time.add( DateTimeToStr((Date) mapItem.get("create_time")));
            }
        }
        mapmonth.put("light",lights);
        mapmonth.put("rain",rain);
        mapmonth.put("air_temp",air_temp);
        mapmonth.put("air_humi",air_humi);
        mapmonth.put("soil_electric",soil_electric);
        mapmonth.put("soil_temp",soil_temp);
        mapmonth.put("soil_humi",soil_humi);
        mapmonth.put("soil_salt",soil_salt);
        mapmonth.put("create_time",create_time);
        return mapmonth;
    }

    //本年
    @Override
    public Map<String, Object> echartYearByRecord_his(Integer devId) {
        List<Map<String, Object>> resultMap  = device_record_hisMapper.selectByDeviceYear(devId);
        int size = resultMap.size();
        List lights= new ArrayList<>();
        List rain = new ArrayList();
        List air_temp = new ArrayList();
        List air_humi = new ArrayList();
        List soil_electric = new ArrayList();
        List soil_temp = new ArrayList();
        List soil_humi = new ArrayList();
        List soil_salt = new ArrayList();
        List create_time = new ArrayList();   //日期转字符串分割  按天进行分组的
        Map<String,Object> mapyear = new HashMap<String,Object>();
        for (int i = 0; i < size; i++) {//7
            Map mapItem = resultMap.get(i);

            if (mapItem != null) {
                lights.add(mapItem.get("light"));
                rain.add(division((Integer) mapItem.get("rain")));
                air_temp.add(division((Integer) mapItem.get("air_temp")));
                air_humi.add(division((Integer) mapItem.get("air_humi")));
                soil_electric.add(mapItem.get("soil_electric"));
                soil_temp.add(division((Integer) mapItem.get("soil_temp")));
                soil_humi.add(division((Integer) mapItem.get("soil_humi")));
                soil_salt.add(mapItem.get("soil_salt"));
                create_time.add(DateTimeToStr((Date) mapItem.get("create_time")));
            }
        }
        mapyear.put("light",lights);
        mapyear.put("rain",rain);
        mapyear.put("air_temp",air_temp);
        mapyear.put("air_humi",air_humi);
        mapyear.put("soil_electric",soil_electric);
        mapyear.put("soil_temp",soil_temp);
        mapyear.put("soil_humi",soil_humi);
        mapyear.put("soil_salt",soil_salt);
        mapyear.put("create_time",create_time);
        return mapyear;
    }

    public Map<String, Object> EchartMap(List<Map<String, Object>> resultMap){
        int size = resultMap.size();
        List lights= new ArrayList<>();
        List rain = new ArrayList();
        List air_temp = new ArrayList();
        List air_humi = new ArrayList();
        List soil_electric = new ArrayList();
        List soil_temp = new ArrayList();
        List soil_humi = new ArrayList();
        List soil_salt = new ArrayList();
        List create_time = new ArrayList();   //日期转字符串分割  按天进行分组的
        Map<String,Object> mapday = new HashMap<String,Object>();
        for (int i = 0; i < size; i++) {//7
            Map mapItem = resultMap.get(i);

            if (mapItem != null) {
                lights.add(mapItem.get("light"));
                rain.add(division((Integer) mapItem.get("rain")));
                air_temp.add(division((Integer) mapItem.get("air_temp")));
                air_humi.add(division((Integer) mapItem.get("air_humi")));
                soil_electric.add(mapItem.get("soil_electric"));
                soil_temp.add(division((Integer) mapItem.get("soil_temp")));
                soil_humi.add(division((Integer) mapItem.get("soil_humi")));
                soil_salt.add(mapItem.get("soil_salt"));
                create_time.add(DateTimeToStr((Date) mapItem.get("create_time")));
            }
        }
        mapday.put("light",lights);
        mapday.put("rain",rain);
        mapday.put("air_temp",air_temp);
        mapday.put("air_humi",air_humi);
        mapday.put("soil_electric",soil_electric);
        mapday.put("soil_temp",soil_temp);
        mapday.put("soil_humi",soil_humi);
        mapday.put("soil_salt",soil_salt);
        mapday.put("create_time",create_time);
        return mapday;
    }

    //整数相除 保留一位小数

    public String division(double a){
        String result = "";
        float num =(float)a/10;

        DecimalFormat df = new DecimalFormat("0.0");

        result = df.format(num);

        return result;

    }

    //日期转字符串
    public static String DateToStr(Date date) {

        SimpleDateFormat format = new SimpleDateFormat("MM月dd号");
        String str = format.format(date);
        return str;
    }
    public static String DateTimeToStr(Date date) {

        SimpleDateFormat format = new SimpleDateFormat("MM月dd号HH:mm");
        String str = format.format(date);
        return str;
    }
    public static String DatePubToStr(Date date) {

        SimpleDateFormat format = new SimpleDateFormat("YY-MM-dd HH:mm");
        String str = format.format(date);
        return str;
    }
    public static String DateMonthToStr(Date date) {

        SimpleDateFormat format = new SimpleDateFormat("dd号");
        String str = format.format(date);
        return str;
    }
    public static String DateYearToStr(Date date) {
        SimpleDateFormat format = new SimpleDateFormat("MM月");
        String str = format.format(date);
        return str;
    }

    //根据value 取key
    public static Object getKey(HashMap <Object, Object> map, String v) {
        Object key = "";
        for (Map.Entry<Object, Object> m: map.entrySet()) {
            if (m.getValue().equals(v)) {
                key = m.getKey();
            }
        }
        return key;
    }
}

       /* Gson gson = new Gson();
        List<Map<String,Object>> newMap=objectMapper.readValue(gson.toJson(listData), List.class);
        System.out.println(newMap);*/