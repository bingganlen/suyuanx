package com.megain.junhao.dao;

import com.github.pagehelper.Page;
import com.megain.junhao.pojo.Device_warning_record_his;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface Device_warning_record_hisMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Device_warning_record_his record);

    int insertSelective(Device_warning_record_his record);

    List<Device_warning_record_his> selectByPrimaryKey(Integer id);

    List<Device_warning_record_his> selectByUserId(Integer id);
    List<Device_warning_record_his> selectByDevId(Integer devId);

    //List<Device_warning_record_his> findByPage(Integer devId,String warning);
    Page<Device_warning_record_his> findByPage(Device_warning_record_his record);
    //List<Device_warning_record_his> findByPage(Device_warning_record_his record);
    //List<Device_warning_record_his> findByPage(@Param("userid") Integer userid);



    int updateByPrimaryKeySelective(Device_warning_record_his record);

    int updateByPrimaryKey(Device_warning_record_his record);
}