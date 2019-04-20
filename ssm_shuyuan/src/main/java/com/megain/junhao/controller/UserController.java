package com.megain.junhao.controller;

import com.google.common.annotations.VisibleForTesting;
import com.megain.junhao.common.Const;
import com.megain.junhao.common.ResponseCode;
import com.megain.junhao.common.ServerResponse;
import com.megain.junhao.controller.core.SystemLog;
import com.megain.junhao.pojo.User;
import com.megain.junhao.service.DerviceService;
import com.megain.junhao.service.IUserService;
import com.mysql.jdbc.log.Log;
import org.apache.commons.lang3.builder.ToStringExclude;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


@Controller
@RequestMapping("/user/")
public class UserController {
    @Autowired
    private IUserService iUserService;
    @Autowired
    private DerviceService derviceService;

    /**
     * 用户登录   用户相关的提交都是POST
     * @param username
     * @param password
     * @param session
     * @return
     */
    @RequestMapping(value = "login.do",method = RequestMethod.POST)
    @ResponseBody   /*  使返回值序列化为json   https://www.cnblogs.com/qiankun-site/p/5774325.html    */
    @SystemLog(module = "用户管理",methods = "用户登录")
    public ServerResponse<User> login(String username, String password, HttpSession session){
        session.setAttribute("username",username);
        session.setAttribute("password",password);
        ServerResponse<User> response = iUserService.login(username,password);
        if(response.isSuccess()){// 0   ResponseCode中0代表返回成功
            session.setAttribute(Const.CURRENT_USER,response.getData());
        }
        return response;
    }

    @RequestMapping(value = "logout.do")
    @ResponseBody
    @SystemLog(module = "用户管理",methods = "退出登录")
    public ServerResponse<String> logout(HttpSession session){ //退出登录
        session.removeAttribute(Const.CURRENT_USER);
        return ServerResponse.createBySuccess();
    }

    @RequestMapping(value = "register.do",method = RequestMethod.POST)
    @ResponseBody
    @SystemLog(module = "用户管理",methods = "用户注册")
    public ServerResponse<String> register(User user){
        return iUserService.register(user);
    }

    //校验  type要么用户名验证要么邮箱验证
    @RequestMapping(value = "check_valid.do",method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse<String> checkValid(String str,String type){
        return iUserService.checkValid(str,type);
    }

    // 获取用户登录信息
    @RequestMapping(value = "get_user_info.do",method = RequestMethod.POST)
    @ResponseBody
    @SystemLog(module = "用户管理",methods = "获取用户登录信息")
    public ServerResponse<User> getUserInfo(HttpSession session){
        User user = (User) session.getAttribute(Const.CURRENT_USER);
        if(user != null){
            return ServerResponse.createBySuccess(user);
        }
        return ServerResponse.createByErrorMessage("用户未登录,无法获取当前用户的信息");
    }

    //密码提示的获取
    @RequestMapping(value = "forget_get_question.do",method = RequestMethod.POST)
    @ResponseBody
    @SystemLog(module = "用户管理",methods = "密码提示的获取")
    public ServerResponse<String> forgetGetQuestion(String username){
        return iUserService.selectQuestion(username);
    }

    ////使用本地缓存检查问题答案
    @RequestMapping(value = "forget_check_answer.do",method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse<String> forgetCheckAnswer(String username,String question,String answer){
        return iUserService.checkAnswer(username,question,answer);
    }

    //忘记密码中的重置密码
    @RequestMapping(value = "forget_reset_password.do",method = RequestMethod.POST)
    @ResponseBody
    @SystemLog(module = "用户管理",methods = "忘记密码--重置密码")
    public ServerResponse<String> forgetRestPassword(String username,String passwordNew,String forgetToken){
        return iUserService.forgetResetPassword(username,passwordNew,forgetToken);
    }


    // 登录状态的重置密码
    @RequestMapping(value = "reset_password.do",method = RequestMethod.POST)
    @ResponseBody
    @SystemLog(module = "用户管理",methods = "重置密码")
    public ServerResponse<String> resetPassword(HttpSession session,String passwordOld,String passwordNew){
        User user = (User)session.getAttribute(Const.CURRENT_USER); //HttpSession判断登录状态需要session
        if(user == null){
            return ServerResponse.createByErrorMessage("用户未登录");
        }
        return iUserService.resetPassword(passwordOld,passwordNew,user);
    }

    //更新个人用户信息
    @RequestMapping(value = "update_information.do",method = RequestMethod.POST)
    @ResponseBody
    @SystemLog(module = "用户管理",methods = "更新个人用户信息")
    public ServerResponse<User> update_information(HttpSession session,User user){
        User currentUser = (User)session.getAttribute(Const.CURRENT_USER);  //用户登录状态才能更改用户信息
        if(currentUser == null){
            return ServerResponse.createByErrorMessage("用户未登录");
        }
        user.setId(currentUser.getId());  // userId 变为当前用户的userID   防止ID被变化
        user.setUsername(currentUser.getUsername());
        ServerResponse<User> response = iUserService.updateInformation(user);
        if(response.isSuccess()){
            response.getData().setUsername(currentUser.getUsername());//
            session.setAttribute(Const.CURRENT_USER,response.getData());//如果成功，更新session  值为response.getData()
        }
        return response;
    }
    //获取个人详细信息
    @RequestMapping(value = "get_information.do",method = RequestMethod.GET)
    //@ResponseBody  //有这个注解的时候返回结果直接写入HTTP response body中，不会被解析为跳转路径。比如异步请求，希望响应的结果是json数据，那么加上@responsebody后，就会直接返回json数据。
    @SystemLog(module = "用户管理",methods = "查看用户详细信息")
    public String get_information(HttpSession session, ModelMap map){
        String currentUser = (String) session.getAttribute("username");
        if(currentUser == null){
            //return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),"未登录,需要强制登录status=10");
            return "index";
        }
        List<User> userList = iUserService.selectUser(currentUser);
        /*SimpleDateFormat sdf  =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date d = sdf.parse(userList.get(8));*/
        map.put("userList",userList);
        return "user_management_show";
    }



    //查找userid
    @RequestMapping(value = "findUserId.do",method = RequestMethod.POST)
    @ResponseBody
    public int findUserId(String username){

        return iUserService.selectUserId(username);
    }


/*
    *//*安全框架shiro测试*//*
    @RequestMapping(value = "/subLogin",method = RequestMethod.POST)
    @ResponseBody
    public String login(User user) {
        Subject subject = SecurityUtils.getSubject();  //import org.apache.shiro.subject.Subject;
        UsernamePasswordToken token = new UsernamePasswordToken(user.getUsername(), user.getPassword());
        try {
            subject.login(token);
        } catch (AuthenticationException e) {
            return e.getMessage();
        }

        if (subject.hasRole("1")){//boolean型    //subject.hasAllRoles（List<String> list）返回一个boolean型，判断用户是否拥有所有角色
            return "有超级管理员权限";
        }

        return "登录成功";
    }*/
}
