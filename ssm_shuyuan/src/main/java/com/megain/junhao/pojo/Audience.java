package com.megain.junhao.pojo;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.junit.jupiter.api.Test;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
@Component
@Aspect
public class Audience {

    @Before("execution(* com.megain.junhao.controller.WarnController.test(..))")
    public void before(){
        System.out.println("我是切面");
    }
    
    @Test
    public void test(){
        System.out.println("我是切面");
    }
}