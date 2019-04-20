package com.megain.junhao.dao;

import com.megain.junhao.pojo.Device_user;

import java.util.List;

public interface Device_userMapper {
    int insert(Device_user record);

    int insertSelective(Device_user record);

    List<Device_user> selectDeviceIDByUserId(int id);
    List<Device_user> selectUserIdByDeviceID(int deviceId);

}