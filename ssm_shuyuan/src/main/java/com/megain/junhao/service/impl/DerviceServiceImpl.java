package com.megain.junhao.service.impl;

import com.megain.junhao.dao.*;
import com.megain.junhao.pojo.Dept;
import com.megain.junhao.pojo.Device_record_his;
import com.megain.junhao.pojo.Device_user;
import com.megain.junhao.service.DerviceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by huangjunhao on 2019/2/15.
 */
@Service
public class DerviceServiceImpl implements DerviceService{

    @Autowired
    private Device_userMapper device_userMapper;

    @Autowired
    private  DeviceMapper deviceMapper;

    @Autowired
    private Device_record_hisMapper device_record_hisMapper;

    @Autowired
    private DeptMapper deptMapper;
    @Autowired
    private Device_warning_configMapper device_warning_configMapper;

    @Override
    public List<Device_user> getDeviceId(Integer id) {

        return device_userMapper.selectDeviceIDByUserId(id);
    }

    //组织名称
    @Override
    public String getDeptName(Integer deptId) {

        return  deptMapper.selectDeptName(deptId);
    }

    //根据设备id获取历史记录
    @Override
    public Device_record_his getListRecord_his(Integer devId) {
        return device_record_hisMapper.selectByDevice(devId);
    }
}
