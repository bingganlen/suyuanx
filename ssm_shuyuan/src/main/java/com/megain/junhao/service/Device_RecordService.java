package com.megain.junhao.service;

import com.megain.junhao.common.ServerResponse;
import com.megain.junhao.pojo.Device_record_his;

import java.util.List;
import java.util.Map;

/**
 * Created by huangjunhao on 2019/2/20.
 */
public interface Device_RecordService {
    /**\
     *
     * @param device_record_his
     * @return
     */


    ServerResponse<String> saveDevice(Device_record_his device_record_his);

    Map<String, Object> echartWeekByRecord_his(Integer devId);
    //Map<String, Map<String, Object>> echartWeekByRecord_his(Integer devId);
    Map<String,Object> echartDayByRecord_his(Integer devId);
    Map<String,Object> echartMonthByRecord_his(Integer devId);
    Map<String,Object> echartYearByRecord_his(Integer devId);
    List<Map<String, Object>> G2WeekByRecord_his(Integer devId); //List<Map<String, Object>>  Map<String, Object>

    String division(double a);
}
