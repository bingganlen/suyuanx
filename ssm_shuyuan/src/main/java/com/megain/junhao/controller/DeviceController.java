package com.megain.junhao.controller;

import com.megain.junhao.common.Const;
import com.megain.junhao.common.ResponseCode;
import com.megain.junhao.common.ServerResponse;
import com.megain.junhao.controller.core.SystemLog;
import com.megain.junhao.pojo.Device_record_his;
import com.megain.junhao.pojo.Device_user;
import com.megain.junhao.pojo.User;
import com.megain.junhao.service.DerviceService;
import com.megain.junhao.service.Device_RecordService;
import com.megain.junhao.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.Servlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by huangjunhao on 2019/2/15.
 */
@Controller
@RequestMapping("/device/")
public class DeviceController {
    @Autowired
    private DerviceService derviceService;
    @Autowired
    private HttpServletRequest request;
    @Autowired
    private IUserService iUserService;
    @Autowired
    private Device_RecordService device_recordService;


    /**\
     * 设备ID
     * @return
     */
    @RequestMapping(value = "findId.do",method = RequestMethod.POST)
    @ResponseBody
    public List<Device_user> findId(){//HttpSession session
        //controller获取userid
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        //System.out.println(username);
        Integer userId = iUserService.selectUserId(username);
        session.setAttribute("userid",userId);
        session.setAttribute("DeviceId", derviceService.getDeviceId(userId));
        return derviceService.getDeviceId(userId);
    }

    /**\
     * 增加设备记录
     * @return
     */
    @RequestMapping(value = "saveDevice.do",method = RequestMethod.POST)
    @ResponseBody
    @SystemLog(module = "设备管理",methods = "增加设备记录")
    public ServerResponse<String> insertDevice(HttpSession session,Device_record_his device_record_his){
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user == null){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),"用户未登录,请登录管理员");
        }
        if(iUserService.checkAdminRole(user).isSuccess()){
            //填充我们增加产品的业务逻辑
            return device_recordService.saveDevice(device_record_his);
        }else{
            //return ServerResponse.createByErrorMessage("无权限操作");
        }
        return device_recordService.saveDevice(device_record_his);
    }


    /**\
     * main  右页面
     * @param devId
     * @return
     */
    @RequestMapping(value = "findListRecord_his.do",method = RequestMethod.GET)
    @ResponseBody
    public Device_record_his findListRecord_his(Integer devId,ModelMap map){//HttpSession session
        Device_record_his device_record_his = derviceService.getListRecord_his(devId);

        map.put("rightrecode",device_record_his);
        return derviceService.getListRecord_his(devId);
    }

    /**\
     * 获取部门名称
     * @param devId
     * @param response
     * @return
     */
    @RequestMapping(value = "findDeptName.do",produces = "text/html;charset=UTF-8",method = RequestMethod.GET)
    @ResponseBody    //要求返回的是信息   如果去掉就返回  jsp/*.jsp页面
    public String getDeptNameByid(Integer devId, HttpServletResponse response){
        response.setCharacterEncoding("UTF-8");
        return derviceService.getDeptName(devId);
    }







}