package com.megain.junhao.dao;

import com.megain.junhao.pojo.user_watch_device;

public interface user_watch_deviceMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(user_watch_device record);

    int insertSelective(user_watch_device record);

    user_watch_device selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(user_watch_device record);

    int updateByPrimaryKey(user_watch_device record);
}