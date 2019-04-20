package com.megain.junhao.dao;

import com.megain.junhao.pojo.Dept;

public interface DeptMapper {
    String selectDeptName(Integer deptId);

    int deleteByPrimaryKey(Integer id);

    int insert(Dept record);

    int insertSelective(Dept record);

    Dept selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Dept record);

    int updateByPrimaryKey(Dept record);
}