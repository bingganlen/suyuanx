package com.megain.junhao.util;

import java.text.DecimalFormat;

/**\
 * 查看jvm  堆内存大小
 */
public class JvmDemo {
    public static void main(String[] args) throws InterruptedException {

        byte[] b1 = new byte[1 * 1024 * 1024];

        System.out.println("分配了1m");

        jvmInfo();

        Thread.sleep(3000);

        byte[] b2 = new byte[4 * 1024 * 1024];

        System.out.println("分配了4m");

        Thread.sleep(3000);

        jvmInfo();
    }

    /**
     * 转换为m
     * @param maxMemory
     * @return
     */

    static private String toM(long maxMemory) {

        float num = (float) maxMemory / (1024 * 1024);

        DecimalFormat df = new DecimalFormat("0.00"); // 格式化小数

        String s = df.format(num); // 返回的是String类型

        return s;

    }



    static private void jvmInfo() {

        // 最大内存

        long maxMemory = Runtime.getRuntime().maxMemory();

        System.out.println("最大内存maxMemory:" + maxMemory + ",转换为M:" + toM(maxMemory));

        // 当前空闲内存

        long freeMemory = Runtime.getRuntime().freeMemory();

        System.out.println("空闲内存freeMemory:" + freeMemory + ",转换为M:" + toM(freeMemory));

        // 已经使用内存

        long totalMemory = Runtime.getRuntime().totalMemory();

        System.out.println("已经使用内存totalMemory:" + totalMemory + ",转换为M" + toM(totalMemory));

    }
}
