package com.megain.junhao.controller.Manager;


import com.megain.junhao.common.Const;
import com.megain.junhao.common.ServerResponse;
import com.megain.junhao.pojo.User;
import com.megain.junhao.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * 管理员登录
 */

@Controller
@RequestMapping("/manage/user")
public class UserManageController {

    @Autowired
    private IUserService iUserService;

    @RequestMapping(value="login.do",method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse<User> login(String username, String password, HttpSession session){
        ServerResponse<User> response = iUserService.login(username,password);//UserServiceImpl调用
        if(response.isSuccess()){ //请求为成功时
            User user = response.getData();
            if(user.getRoleId() == Const.Role.ROLE_ADMIN){
                //说明登录的是管理员 1  ，普通用户的role是3
                session.setAttribute(Const.CURRENT_USER,user);  //放到session里
                return response;
            }else{
                return ServerResponse.createByErrorMessage("不是管理员,无法登录");
            }
        }
        return response;
    }

}
