package com.megain.junhao.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.megain.junhao.common.Const;
import com.megain.junhao.common.ResponseCode;
import com.megain.junhao.common.ServerResponse;
import com.megain.junhao.dao.Device_warning_configMapper;
import com.megain.junhao.dao.Device_warning_record_hisMapper;
import com.megain.junhao.pojo.Device_warning_config;
import com.megain.junhao.pojo.Device_warning_record_his;
import com.megain.junhao.pojo.PageBean;
import com.megain.junhao.pojo.User;
import com.megain.junhao.service.IUserService;
import com.megain.junhao.service.WarnService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service
@Slf4j
public class WarnServiceImpl implements WarnService {

    @Autowired
    private Device_warning_configMapper device_warning_configMapper;
    @Autowired
    private IUserService iUserService;
    @Autowired
    private Device_warning_record_hisMapper device_warning_record_hisMapper;
    /**\
     * 更新报警配置
     * @param device_warning_config
     * @return
     */
    @Override
    public ServerResponse<String> saveWarn(Device_warning_config device_warning_config, HttpSession session) {

        if(device_warning_config != null)
        {
            User user = (User)session.getAttribute(Const.CURRENT_USER);

            if(user == null){ //
                return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),"用户未登录,请登录管理员");
            }

            if(iUserService.checkAdminRole(user).isSuccess()){  //用户是否是管理员
                //填充我们增加产品的业务逻辑
                device_warning_config.setUserId(user.getId());
                if (device_warning_config.getCheckLight() == null){device_warning_config.setCheckLight("0");}
                if (device_warning_config.getCheckAirTemp() == null){device_warning_config.setCheckAirTemp("0");}
                if (device_warning_config.getCheckAirHumi() == null){device_warning_config.setCheckAirHumi("0");}
                if (device_warning_config.getCheckRainWarning() == null){device_warning_config.setCheckRainWarning("0");}
                if (device_warning_config.getCheckSoilTemp() == null){device_warning_config.setCheckSoilTemp("0");}
                if (device_warning_config.getCheckSoilHumi() == null){device_warning_config.setCheckSoilHumi("0");}
                if (device_warning_config.getCheckSoilElectric() == null){device_warning_config.setCheckSoilElectric("0");}
                if (device_warning_config.getCheckSoilSalt() == null){device_warning_config.setCheckSoilSalt("0");}
                device_warning_configMapper.updateByPrimaryKey(device_warning_config);//更新整个产品 updateByPrimaryKeySelective
            }else{
                return ServerResponse.createByErrorMessage("无权限操作");
            }
                return ServerResponse.createBySuccess("更新配置成功");
        }
        return ServerResponse.createByErrorMessage("更新报警参数不正确");
    }

    //  warning_config
    @Override
    public List<Device_warning_config> getConfigInformation(Integer userId,Integer devId) {

        return device_warning_configMapper.selectByPrimaryKey(userId,devId);
    }

    //用于Java定时器检查报警   warning_record
    @Override
    public List<Device_warning_record_his> getwarnInformation(Integer devId) {
        return device_warning_record_hisMapper.selectByDevId(devId);
    }

    @Override
    public void delete(Integer id) {
        device_warning_record_hisMapper.deleteByPrimaryKey(id);
    }

    //用于Java定时器插入报警表
    @Override
    public List<Device_warning_record_his> checkwarn(Integer userId) {
        return null;
    }

    //用于Java定时器插入表
    @Override
    public int insert(Device_warning_record_his record) {
        return device_warning_record_hisMapper.insert(record);
    }
/*
    第一种方法   前端页面配置麻烦
    @Override
    public PageInfo<Device_warning_record_his> findByPage(Integer userid ,Integer pageNum) {
        //设置分页
        PageHelper.startPage(pageNum, 10);
        List<Device_warning_record_his> emps = device_warning_record_hisMapper.findByPage(userid);
        return new PageInfo<Device_warning_record_his>(emps,5);
    }
*/


    /**\
     * 分页
     * @param record_his
     * @param pageCode   当前页
     * @param pageSize   每页 的记录数
     * @return
     */
    @Override
    public PageBean findByPage(Device_warning_record_his record_his, int pageCode, int pageSize) {
        PageHelper.startPage(pageCode,pageSize);//使用Mybatis分页插件
        Page<Device_warning_record_his> page = device_warning_record_hisMapper.findByPage(record_his);

        //计算总页数：总页数 = 总记录数 / 每页显示的记录条数。这里用到的ceil()方法：返回大于或登录参数的最小double值，并等于数学整数。如double a = 5;double b = 3;ceil(a/b) = 2.0。最后用Double类的intValue()方法返回此Double值作为int类型的值。
        return new PageBean(pageCode, (int)Math.ceil((double) (page.getTotal() / (double)pageSize)), (int)page.getTotal(),  pageSize , page.getResult());
    }




}
