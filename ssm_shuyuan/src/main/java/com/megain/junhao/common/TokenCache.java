package com.megain.junhao.common;

import com.google.common.cache.CacheBuilder;
import com.google.common.cache.CacheLoader;
import com.google.common.cache.LoadingCache;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.concurrent.TimeUnit;

/**
 *在客户端用户登录时忘记密码，需要找回密码，通过正确输入找回密码答案来访问服务端的修改密码接口。为了防止恶意用户来直接访问修改密码接口，在调用验证答案接口后采用token机制来验证身份，并用Guava Cache做一个定时的token来保证安全性。
 */
public class TokenCache {

    private static Logger logger = LoggerFactory.getLogger(TokenCache.class);

    public static final String TOKEN_PREFIX = "token_";

    //LRU算法  本地缓存如果超过10000 LRU算法进行清除

    //CacheBuilder.newBuilder()构建本地cache
    //initialCapacity(1000) 初始化缓存的容量
    //LRU算法  maximumSize(10000)最大值设成10000     expireAfterAccess有效期12个小时  当超过了最大容量，guava将使用LRU算法（最少使用算法），来移除缓存项
    private static LoadingCache<String,String> localCache = CacheBuilder.newBuilder().initialCapacity(1000).maximumSize(10000).expireAfterAccess(12, TimeUnit.HOURS)
            .build(new CacheLoader<String, String>() {
                //默认的数据加载实现,当调用get取值的时候,如果key没有对应的值,就调用这个方法进行加载.
                @Override
                public String load(String s) throws Exception {
                    return "null";   //为什么要把return的null值写成字符串，因为到时候用null去.equal的时候，会报空指针异常
                }
            });


    public static void setKey(String key,String value){//外部调用该方法  添加本地缓存
        localCache.put(key,value);
    }

    public static String getKey(String key){  //得到本地缓存
        String value = null;
        try {
            value = localCache.get(key);
            if("null".equals(value)){//若key没有对应值，则返回空
                return null;
            }
            return value;
        }catch (Exception e){
            logger.error("localCache get error",e);
        }
        return null;
    }
}
