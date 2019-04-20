package com.megain.junhao.dao;

import com.megain.junhao.pojo.Mounting;

public interface MountingMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Mounting record);

    int insertSelective(Mounting record);

    Mounting selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Mounting record);

    int updateByPrimaryKey(Mounting record);
}