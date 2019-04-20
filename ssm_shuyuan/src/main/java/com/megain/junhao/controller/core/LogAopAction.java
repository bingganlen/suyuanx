package com.megain.junhao.controller.core;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import com.megain.junhao.common.Const;
import com.megain.junhao.common.ServerResponse;
import com.megain.junhao.pojo.User;
import com.megain.junhao.service.impl.LogServiceImpl;
import com.megain.junhao.util.IPLocal;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.*;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;


import com.megain.junhao.service.LogService;
import com.megain.junhao.pojo.LogEntity;   //  log 实体类

/**\
 * AOP  日志记录逻辑
 */


@Component
@Aspect
@ComponentScan("com.megain.junhao.controller.*")
public class LogAopAction {
    //注入service,用来将日志信息保存在数据库
    @Resource
    private LogService logservice;


    //配置接入点,如果不知道怎么配置,可以百度一下规则
    @Pointcut("execution(* com.megain.junhao.controller..*.*(..))")
    private void controllerAspect(){ }//定义一个切入点

   /* @Around("controllerAspect()")
    public Object around(ProceedingJoinPoint pjp) throws Throwable {

        //常见日志实体对象
        LogEntity log = new LogEntity();
        //获取登录用户账户
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        //String name = (String) request.getSession().getAttribute("USER_ID");
        User currentUser = (User)request.getSession().getAttribute(Const.CURRENT_USER);  //用户登录状态才能更改用户信息...  但没登录呢？
        if (currentUser != null){
            log.setUserid(currentUser.getdId());
            log.setUsername(currentUser.getUsername());
        }


        //获取系统时间
        //String time = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss").format(new Date());  数据库是datetime   不是varchar
        log.setCreateTime(new Date());

        //获取系统ip,这里用的是我自己的工具类,可自行网上查询获取ip方法
        String ip = IPLocal.getLocalIP();
        log.setIp(ip);

        //方法通知前获取时间,为什么要记录这个时间呢？当然是用来计算模块执行时间的
        long start = System.currentTimeMillis();
        // 拦截的实体类，就是当前正在执行的controller
        Object target = pjp.getTarget();
        // 拦截的方法名称。当前正在执行的方法
        String methodName = pjp.getSignature().getName();
        // 拦截的方法参数
        Object[] args = pjp.getArgs();
        // 拦截的放参数类型
        Signature sig = pjp.getSignature();
        MethodSignature msig = null;
        if (!(sig instanceof MethodSignature)) {
            throw new IllegalArgumentException("该注解只能用于方法");
        }
        msig = (MethodSignature) sig;
        Class[] parameterTypes = msig.getMethod().getParameterTypes();

        Object object = null;
        // 获得被拦截的方法
        Method method = null;
        try {
            method = target.getClass().getMethod(methodName, parameterTypes);
        } catch (NoSuchMethodException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        } catch (SecurityException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }
        if (null != method) {
            // 判断是否包含自定义的注解，说明一下这里的SystemLog就是我自己自定义的注解
            if (method.isAnnotationPresent(SystemLog.class)) {
                SystemLog systemlog = method.getAnnotation(SystemLog.class);
                log.setModule(systemlog.module());
                log.setMethod(systemlog.methods());
                try {
                    object = pjp.proceed();
                    long end = System.currentTimeMillis();
                    //将计算好的时间保存在实体中
                    log.setRsponseData(""+(end-start));
                    log.setCommite("执行成功！");
                    //保存进数据库
                    logservice.insertlog(log);
                    return object;
                } catch (Throwable e) {
                    // TODO Auto-generated catch block
                    long end = System.currentTimeMillis();
                    log.setRsponseData(""+(end-start));
                    log.setCommite("执行失败");
                    logservice.insertlog(log);
                }
            } else {//没有包含注解
                object = pjp.proceed();
            }
        } else { //不需要拦截直接执行
            object = pjp.proceed();
        }
        return object;
    }
*/

    @After("controllerAspect()")
    public void after(JoinPoint pjp) throws Throwable {

        //常见日志实体对象
        LogEntity log = new LogEntity();
        //获取登录用户账户
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        User currentUser = (User)request.getSession().getAttribute(Const.CURRENT_USER);  //用户登录状态才能更改用户信息...  但没登录呢？
        if (currentUser != null){
            log.setUserid(currentUser.getId());
            log.setUsername(currentUser.getUsername());
        }

        log.setCreateTime(new Date());

        //获取系统ip,这里用的是我自己的工具类,可自行网上查询获取ip方法
        String ip = IPLocal.getLocalIP();
        log.setIp(ip);

        //方法通知前获取时间,为什么要记录这个时间呢？当然是用来计算模块执行时间的
        long start = System.currentTimeMillis();
        // 拦截的实体类，就是当前正在执行的controller
        Object target = pjp.getTarget();
        // 拦截的方法名称。当前正在执行的方法
        String methodName = pjp.getSignature().getName();//login
        // 拦截的方法参数
        Object[] args = pjp.getArgs();
        // 拦截的放参数类型
        Signature sig = pjp.getSignature();
        MethodSignature msig = null;
        if (!(sig instanceof MethodSignature)) {
            throw new IllegalArgumentException("该注解只能用于方法");
        }
        msig = (MethodSignature) sig;
        Class[] parameterTypes = msig.getMethod().getParameterTypes();

        Object object = null;
        // 获得被拦截的方法
        Method method = null;
        method = target.getClass().getMethod(methodName, parameterTypes);

        if (null != method) {
            // 判断是否包含自定义的注解，说明一下这里的SystemLog就是我自己自定义的注解
            if (method.isAnnotationPresent(SystemLog.class)) {
                SystemLog systemlog = method.getAnnotation(SystemLog.class);
                log.setModule(systemlog.module());
                log.setMethod(systemlog.methods());
                try {
                    long end = System.currentTimeMillis();
                    //将计算好的时间保存在实体中
                    log.setRsponseData(""+(end-start));
                    log.setCommite("执行成功！");
                    //保存进数据库
                    logservice.insertlog(log);
                    //return;
                } catch (Throwable e) {
                    // TODO Auto-generated catch block
                    long end = System.currentTimeMillis();
                    log.setRsponseData(""+(end-start));
                    log.setCommite("执行失败");
                    logservice.insertlog(log);
                    //return;
                }
            }
        }
    }
}