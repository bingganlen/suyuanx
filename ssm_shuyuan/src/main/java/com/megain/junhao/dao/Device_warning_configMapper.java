package com.megain.junhao.dao;

import com.megain.junhao.pojo.Device_warning_config;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface Device_warning_configMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Device_warning_config record);

    int insertSelective(Device_warning_config record);

    List<Device_warning_config> selectByPrimaryKey(@Param("devId") Integer devId,@Param("userId") Integer userId);

    int updateByPrimaryKeySelective(Device_warning_config record);

    int updateByPrimaryKey(Device_warning_config record);
}