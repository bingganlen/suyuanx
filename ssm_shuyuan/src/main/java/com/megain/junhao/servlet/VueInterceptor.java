package com.megain.junhao.servlet;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.List;

public class VueInterceptor implements HandlerInterceptor {
    private List<String> allowedUrls;

    public List<String> getAllowedUrls() {
        return allowedUrls;
    }

    public void setAllowedUrls(List<String> allowedUrls) {
        this.allowedUrls = allowedUrls;
    }

    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse response, Object o) throws Exception {
        String ip = "";
        Enumeration<String> requestHeaderNames = httpServletRequest.getHeaderNames();
        List<String> origins = Arrays.asList(new String[]{"origin", "Origin", "ORIGIN"});
        while(requestHeaderNames.hasMoreElements()) {
            String header = requestHeaderNames.nextElement();
            if(origins.contains(header)) {
                ip = httpServletRequest.getHeader(header);
                System.out.println(header);
                break;
            }
        }
        response.setHeader("Access-Control-Allow-Origin", ip);
        response.setHeader("Access-Control-Allow-Methods", "*");
        response.setHeader("Access-Control-Max-Age", "3600");
        response.setHeader("Access-Control-Allow-Headers",
                "Origin, X-Requested-With, Content-Type, Accept");
        return true;
    }
}