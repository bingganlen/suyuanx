package com.megain.junhao.service.impl;

import com.megain.junhao.common.ServerResponse;
import com.megain.junhao.dao.LogEntityMapper;
import com.megain.junhao.pojo.LogEntity;
import com.megain.junhao.service.LogService;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Aspect
@Transactional
public class LogServiceImpl implements LogService {

    @Autowired
    private LogEntityMapper logEntityMapper;

    public final Logger logger = LoggerFactory.getLogger(LogServiceImpl.class);

    @Override
    public ServerResponse<String> insertlog(LogEntity log) {
        int resultCount = logEntityMapper.insert(log); //insertSelective
        if(resultCount == 0){
            return ServerResponse.createByErrorMessage("日志记录失败");
        }
        return ServerResponse.createBySuccessMessage("成功记录日志");
    }

   /* public static void main(String[] args){
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        //String name = (String) request.getSession().getAttribute("USER_ID");
        User currentUser = (User)request.getSession().getAttribute(Const.CURRENT_USER);    //通过sessionID得到自己的session，将参数存储在session中，即使重定向客户端也没事，这个值可以在多个页面上使用。
        System.out.println("1 测试session   "+currentUser.getId());

        User re = (User) request.getAttribute(Const.CURRENT_USER);  //只能在一个request内有效，如果重定向客户端，将取不到值。
        System.out.println("2 测试session   "+re.getId());
    }*/



/*   public void update(){
       System.out.println("愿天下无BUG!!");
   }
    public static void main(String[] args){
       LogServiceImpl lo = new LogServiceImpl();
       lo.update();
    }*/
}
