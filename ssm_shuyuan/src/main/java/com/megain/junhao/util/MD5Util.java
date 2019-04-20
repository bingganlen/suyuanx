package com.megain.junhao.util;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.shiro.codec.Hex;
import org.springframework.util.StringUtils;

import java.security.MessageDigest;
import java.util.Random;

public class MD5Util {

    //十六进制下数字到字符的映射数组
    private final static String[] hexDigits = {"0", "1", "2", "3", "4",
            "5", "6", "7", "8", "9","b","n","z","y","v","a"};


    /**  对字符串进行MD5加密     */
    public final static String encode(String originString){
        if (originString != null){
            try{
                //创建具有指定算法名称的信息摘要
                MessageDigest md = MessageDigest.getInstance("MD5");
                //使用指定的字节数组对摘要进行最后更新，然后完成摘要计算
                byte[] results = md.digest(originString.getBytes());
                //将得到的字节数组变成字符串返回
                String resultString = byteArrayToHexString(results);
                return resultString.toUpperCase();
            } catch(Exception ex){
                ex.printStackTrace();
            }
        }
        return null;
    }

    /**
     * 转换字节数组为十六进制字符串
     * @param b 字节数组
     * @return    十六进制字符串
     */
    private final static String byteArrayToHexString(byte[] b){
        StringBuffer resultSb = new StringBuffer();
        for (int i = 0; i < b.length; i++){
            resultSb.append(byteToHexString(b[i]));
        }
        return resultSb.toString();
    }

    /** 将一个字节转化成十六进制形式的字符串     */
    private final static String byteToHexString(byte b){
        int n = b;
        if (n < 0)
            n = 256 + n;
        int d1 = n / 16;
        int d2 = n % 16;
        return hexDigits[d1] + hexDigits[d2];
    }

    /*public static void main(String[] args) {
        //00100400517
        //00100400532
        String password = MD5Util.encode("123456");
        System.out.println(password);
        System.out.println(password.toLowerCase());
        System.out.println(DigestUtils.md5Hex("123456"));
    }*/





    public static String getSaltMD5(String password) {
        // 生成一个16位的随机数
        Random random = new Random();
        StringBuilder sBuilder = new StringBuilder(16);
        sBuilder.append(random.nextInt(99999999)).append(random.nextInt(99999999));
        int len = sBuilder.length();
        if (len < 16) {
            for (int i = 0; i < 16 - len; i++) {
                sBuilder.append("0");
            }
        }
        // 生成最终的加密盐
        String Salt = sBuilder.toString();
        password = md5Hex(password + Salt);
        char[] cs = new char[48];
        for (int i = 0; i < 48; i += 3) {
            cs[i] = password.charAt(i / 3 * 2);
            char c = Salt.charAt(i / 3);
            cs[i + 1] = c;
            cs[i + 2] = password.charAt(i / 3 * 2 + 1);
        }
        return String.valueOf(cs);
    }

    @SuppressWarnings("unused")
    private static String md5Hex(String str) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] digest = md.digest(str.getBytes());
            return new String(new Hex().encode(digest));
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.toString());
            return "";
        }
    }






    /**
     * 验证加盐后是否和原文一致
     */
    public static boolean getSaltverifyMD5(String password, String md5str) {
        char[] cs1 = new char[32];
        char[] cs2 = new char[16];
        for (int i = 0; i < 48; i += 3) {
            cs1[i / 3 * 2] = md5str.charAt(i);
            cs1[i / 3 * 2 + 1] = md5str.charAt(i + 2);
            cs2[i / 3] = md5str.charAt(i + 1);
        }
        String Salt = new String(cs2);
        return md5Hex(password + Salt).equals(String.valueOf(cs1));
    }

    public static void main(String[] args) {
        MD5Util md = new MD5Util();
        String strMD5 = new String("12345");

        String plaintext = "huazai";

        System.out.println("原始：" + plaintext);
        System.out.println("普通MD5后：" + MD5Util.encode(plaintext));


        // 获取加盐后的MD5值
        String ciphertext = MD5Util.getSaltMD5(plaintext);
        System.out.println("加盐后MD5：" + ciphertext);
        System.out.println("是否是同一字符串:" + MD5Util.getSaltverifyMD5(plaintext, ciphertext));


        /**\
         * 原始：huazai
         * 普通MD5后：4B8Z1NNV9VY32BY03ANV00NZN01174N2
         * 加盐后MD5：c4060b813358879881c5c471425d4b58df7aa0e643e8d943
         * 是否是同一字符串:true
         */
    }





}
