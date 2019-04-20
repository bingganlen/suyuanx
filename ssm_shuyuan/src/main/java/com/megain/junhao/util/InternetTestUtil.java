package com.megain.junhao.util;

/**
 * Created by huangjunhao on 2019/3/1.
 */


import lombok.extern.slf4j.Slf4j;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

/**\
 * 检查网络
 */
@Slf4j
public class InternetTestUtil {

            public synchronized static String monitoringNet(String ip) {
                Process p = null;
                BufferedReader in = null;
                try {
                    p = Runtime.getRuntime().exec("cmd /c ping -n 1 " + ip); // 此处1变大可以增加精确度，但影响测试速度
                    //缓冲读取
                    in = new BufferedReader(new InputStreamReader(p.getInputStream(), "gbk"));
                    String temp = null;
                    StringBuffer strBuffer = new StringBuffer();
                    while ((temp = ( in .readLine())) != null)
                        strBuffer.append(temp);
                    //             System.out.println(strBuffer.toString().matches(".*\\(\\d?\\d% loss\\).*"));
                    //            System.out.println(strBuffer.toString());
                    if (strBuffer.toString().contains("请求超时")) {
                        log.info(ip + "请求超时");
                        return "-1";

                    } else if (strBuffer.toString().contains("传输失败")) {
                        log.info(ip + "传输失败");
                        return "-1";
                    } else if (strBuffer.toString().contains("请求找不到主机")) {
                        log.info(ip + "请求找不到主机");
                        return "-1";
                    } else if (strBuffer.toString().contains("TTL")) {
                        log.info(ip + "监测网络连接正常");
                        return "0";
                    } else {
                        log.info(ip + "监测网络未知异常");
                        return "-1";
                    }

                } catch (IOException e) {
                    log.info("网络连接出现错误");
                    return "-3";
                } finally {
                    try {
                        in .close();
                    } catch (IOException e) {
                        log.info("IOException关闭文件流");
                    }

                }
            }}