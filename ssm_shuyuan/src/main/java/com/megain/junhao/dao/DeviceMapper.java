package com.megain.junhao.dao;

import com.megain.junhao.pojo.Device;

public interface DeviceMapper {
    //String selectDeviceIDByUsername(String username);

    int deleteByPrimaryKey(Integer id);

    int insert(Device record);

    int insertSelective(Device record);

    Device selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Device record);

    int updateByPrimaryKeyWithBLOBs(Device record);

    int updateByPrimaryKey(Device record);
}