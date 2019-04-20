package com.megain.junhao.controller;

import com.megain.junhao.common.Const;
import com.megain.junhao.common.ResponseCode;
import com.megain.junhao.common.ServerResponse;
import com.megain.junhao.controller.core.SystemLog;
import com.megain.junhao.pojo.Device_warning_config;
import com.megain.junhao.pojo.Device_warning_record_his;
import com.megain.junhao.pojo.User;
import com.megain.junhao.service.IUserService;
import com.megain.junhao.service.WarnService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/warn/")
public class WarnController {
    @Autowired
    private WarnService warnService;
    @Autowired
    private IUserService iUserService;


    @RequestMapping(value = "config.do",method = RequestMethod.POST)
    @ResponseBody
    @SystemLog(module = "越限警报",methods = "越限警报-更新警报设置")
    public void warningConfigSave(Device_warning_config device_warning_config , HttpSession session){
         //device_warning_config.setDevId(Long.parseLong("100000213"));//这一步要改
        device_warning_config.setDevId(Long.parseLong(session.getAttribute("warn_devId").toString()));
         warnService.saveWarn(device_warning_config,session);
    }

    @RequestMapping("test.do")
    @ResponseBody
    public ServerResponse test(HttpSession session){
        User user = (User)session.getAttribute(Const.CURRENT_USER);   // 必须还是那个刚才登录过的浏览器才有session
        if(user == null){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),"用户未登录,请登录管理员");
        }
        if(iUserService.checkAdminRole(user).isSuccess()){
            //填充我们增加产品的业务逻辑
            return ServerResponse.createBySuccessMessage("管理员操作成功");
        }else{
            return ServerResponse.createByErrorMessage("无权限操作");
        }
    }

    //报警配置
    @RequestMapping(value = "list.do",method = RequestMethod.GET)/*,method = RequestMethod.GET*/
    public String configlist(Integer devId,HttpSession session , ModelMap model){/*  ModelMap map*/
        User user = (User)session.getAttribute(Const.CURRENT_USER);   // 必须还是那个刚才登录过的浏览器才有session
        if(user == null){
            //return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),"未登录,需要强制登录status=10");
            return "../index";
        }
        session.setAttribute("warn_devId",devId);
        List<Device_warning_config> warnConfigList = warnService.getConfigInformation(devId,user.getId());//100000213
        model.addAttribute("warnConfigList",warnConfigList);
        return "warning_config";
    }



    //显示报警信息页面
    @RequestMapping(value = "warnlist.do")
   //@ResponseBody
    @SystemLog(module = "越限警报",methods = "越限警报-查看报警列表")
    public String list(HttpSession session , ModelMap model,Device_warning_record_his record_his,
                                                 @RequestParam(value = "pageCode", required = false, defaultValue = "1") int pageCode,
                                                 @RequestParam(value = "pageSize", required = false, defaultValue = "8") int pageSize){

        User user = (User)session.getAttribute(Const.CURRENT_USER);   // 必须还是那个刚才登录过的浏览器才有session
        if(user == null){
            return "../index";
        }
        record_his.setUserid(user.getId());
        if (record_his.getStartTime() != null || record_his.getEndTime() !=null) {
            if (record_his.getStartTime() != null) {
                String StartTime = record_his.getStartTime().replace('T',' ');
                record_his.setStartTime(StartTime);
            }
            if (record_his.getEndTime() != null) {
                String EndTime = record_his.getEndTime().replace('T',' ');
                record_his.setEndTime(EndTime);
            }
        }
        model.addAttribute("page",warnService.findByPage(record_his,pageCode, pageSize));
        return "warning";
    }

   /* ////显示报警信息页面
    @RequestMapping(value = "warnlist.do")*//*,method = RequestMethod.GET*//*
    @ResponseBody
    @SystemLog(module = "越限警报",methods = "越限警报-查看报警列表")
    public List<Device_warning_record_his> list(HttpSession session , ModelMap model
                                                 @RequestParam(value = "pageCode", required = false, defaultValue = "1") int pageCode,
                                                 @RequestParam(value = "pageSize", required = false, defaultValue = "2") int pageSize,){*//*  ModelMap map*//*
        User user = (User)session.getAttribute(Const.CURRENT_USER);   // 必须还是那个刚才登录过的浏览器才有session
        if(user == null){
            //return "index";
        }
        List<Device_warning_record_his> warnList = warnService.getwarnInformation(user.getId());
        model.addAttribute("warnList",warnList);
        return warnList;
        //return "warning";
    }*/


    //删除单条报警记录
    @RequestMapping(value = "delete.do",method = RequestMethod.POST)
    @ResponseBody
    public String delete(@RequestParam Integer id, Model model) {
        try {
            warnService.delete(id);
            model.addAttribute("message", "删除信息成功");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "删除信息成功";
    }



}
