package com.megain.junhao.dao;

import com.megain.junhao.pojo.LogEntity;

public interface LogEntityMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(LogEntity record);

    int insertSelective(LogEntity record);

    LogEntity selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(LogEntity record);

    int updateByPrimaryKey(LogEntity record);
}