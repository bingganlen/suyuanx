package com.megain.junhao.dao;

import com.megain.junhao.pojo.Dervice_status_his;

public interface Dervice_status_hisMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Dervice_status_his record);

    int insertSelective(Dervice_status_his record);

    Dervice_status_his selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Dervice_status_his record);

    int updateByPrimaryKey(Dervice_status_his record);
}