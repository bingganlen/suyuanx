package com.megain.junhao.dao;

import com.megain.junhao.pojo.Device_record_his_avg;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface Device_record_his_avgMapper {

    //最近一星期的记录
    List<Map<String, Object>> selectByDeviceWeek(@Param("devId") Integer devId);

    //本月
    List<Map<String, Object>> selectByDeviceMonth(@Param("devId") Integer devId);

    //本年的记录   横标签为12个月
    List<Map<String, Object>> selectByDeviceYear(@Param("devId") Integer devId);

    int deleteByPrimaryKey(Integer id);

    int insert(Device_record_his_avg record);

    int insertSelective(Device_record_his_avg record);

    Device_record_his_avg selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Device_record_his_avg record);

    int updateByPrimaryKey(Device_record_his_avg record);
}