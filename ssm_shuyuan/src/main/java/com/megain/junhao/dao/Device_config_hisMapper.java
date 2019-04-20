package com.megain.junhao.dao;

import com.megain.junhao.pojo.Device_config_his;

public interface Device_config_hisMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Device_config_his record);

    int insertSelective(Device_config_his record);

    Device_config_his selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Device_config_his record);

    int updateByPrimaryKey(Device_config_his record);
}