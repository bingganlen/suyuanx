package com.megain.junhao.service;

import com.github.pagehelper.PageInfo;
import com.megain.junhao.common.ServerResponse;
import com.megain.junhao.pojo.Device_warning_config;
import com.megain.junhao.pojo.Device_warning_record_his;
import com.megain.junhao.pojo.PageBean;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface WarnService {
    // 保存设备报警信息   我想知道设置哪个设备的，这需要前台保存session
    ServerResponse<String> saveWarn(Device_warning_config record, HttpSession session);

    List<Device_warning_config> getConfigInformation(Integer devId,Integer userId);
    List<Device_warning_record_his> getwarnInformation(Integer devId);
    public void delete(Integer id);
    List<Device_warning_record_his> checkwarn(Integer userId);

    int insert(Device_warning_record_his record);

    //分页查询
    public PageBean findByPage(Device_warning_record_his record_his, int pageCode, int pageSize);
     //PageInfo<Device_warning_record_his> findByPage(Integer userid ,Integer pageNum);   能查询出来  前端分页太复杂
}
