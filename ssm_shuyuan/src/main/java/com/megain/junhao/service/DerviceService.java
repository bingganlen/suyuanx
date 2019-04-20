package com.megain.junhao.service;

//import com.megain.junhao.common.ServerResponse;
import com.megain.junhao.pojo.Dept;
import com.megain.junhao.pojo.Device_record_his;
import com.megain.junhao.pojo.Device_user;

import java.util.List;

/**
 * Created by huangjunhao on 2019/2/15.
 */
public interface DerviceService {
    List<Device_user> getDeviceId(Integer id);
    String getDeptName(Integer deptId);

    Device_record_his getListRecord_his(Integer devId);


    //Device selectByPrimaryKey(Integer id);

}
