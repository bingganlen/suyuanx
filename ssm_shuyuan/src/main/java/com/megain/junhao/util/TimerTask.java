package com.megain.junhao.util;

/**
 * Created by huangjunhao on 2019/2/28.
 */
import com.google.gson.JsonIOException;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.megain.junhao.common.Const;
import com.megain.junhao.dao.Device_record_hisMapper;
import com.megain.junhao.dao.Device_record_his_avgMapper;
import com.megain.junhao.pojo.*;
import com.megain.junhao.service.WarnService;
import com.megain.junhao.service.impl.WarnServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.*;

import static com.megain.junhao.util.InternetTestUtil.monitoringNet;
import static jdk.nashorn.internal.runtime.regexp.joni.Config.log;

/**
 *
 * 类名称：TimerTask
 * 类描述：定时器任务
 * @version  V1.0
 *
 */
/*@Scheduled(cron = "0 07 16 ? * *")//每天16点07启动任务
    @Scheduled(cron = "0/5 * * * * ?")//每隔5秒隔行一次*/
@Slf4j
@Component
public class TimerTask{

    @Autowired
    Device_record_hisMapper device_record_hisMapper;
    @Autowired
    Device_record_his_avgMapper avg;
    @Autowired
    WarnService warnService;
    /*@Autowired
    private HttpSession session;*/

    @Autowired
    private HttpServletRequest request;

    /*SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");*/
    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式


    String url = "http://1p5e803947.imwork.net:18634/sensor/sensor.php";
    JsonParser parser = new JsonParser(); //创建json解析器

    @Scheduled(cron = "0 0/1 * * * ? ")
    public void getDateToSQL()
    {
        log.info("------------   每分钟服务启动    ------------");
        try{
            //解析 保存
            device_record_hisMapper.insert(jsonRead());

        }catch (Exception e){
            e.printStackTrace();
            log.info("插入数据库出错");
        }

    }

/*public static void main(String[] args){
    WarnService warnService = new WarnServiceImpl(); //静态方法无法直接访问非静态方法  要new 对象
    List<Device_warning_config> warnConfigList = warnService.getConfigInformation(1001);
    //遍历
    int size= warnConfigList.size();
    for(int i=0;i<size;i++){
        System.out.println(warnConfigList.get(i));
    }
}
        "userid": 1001,
        "devid": "100000213",
        "warning": "温度",
        "createTime": 1553498324000

*/
/*

Device_warning_record_his record_his = new Device_warning_record_his();
                    if (null != userid){
                        record_his.setUserid(userid);
                    }
                    record_his.setCreateTime(date);
                    record_his.setDevid(DevId);
    public Device_warning_record_his add(){
        Device_warning_record_his record_his = new Device_warning_record_his();
        //User user = (User) request.getSession().getAttribute(Const.CURRENT_USER);
        List<Device_warning_config> warnConfigList = warnService.getConfigInformation(100000213,1001);  //查询条件应该具有设备ID与用户名   这里因为session问题只设置设备id
        int size= warnConfigList.size();
        String DevId = String.valueOf(warnConfigList.get(0).getDevId());
        Date date = new Date();
        Integer userid = warnConfigList.get(0).getUserId();
        if (null != userid){
            record_his.setUserid(userid);
        }

        record_his.setCreateTime(date);
        record_his.setDevid(DevId);
        //record_his.setUserid(userid);
        return record_his;
    }
*/


    //解析成Device_record_his
    public Device_record_his jsonRead(){
        monitoringNet(url);//检查网络
        Device_record_his d  = new Device_record_his();
        String strJson = getURLContent(url);//获取Json
        if (strJson == null | strJson.isEmpty()) {
            System.out.println("++++++++   json字符串为空   +++++++"+TimeUtils.getCurrentDatetime());
            log.info("++++++++   json字符串为空   +++++++");
        }
        try{
            JsonObject json = (JsonObject) parser.parse(strJson);
            int light = json.get("illumination").getAsInt();//将json数据转为为int型的数据              //getAsString());     //将json数据转为为String型的数据
            int rain = json.get("rainfall").getAsInt();
            int air_temp = json.get("air_temp").getAsInt();
            int air_humi = json.get("air_hum").getAsInt();
            int soil_temp = json.get("soil_temp").getAsInt();
            int soil_humi = json.get("soil_hum").getAsInt();
            int soil_electric = json.get("soil_conductivity").getAsInt();
            int soil_salinity = json.get("soil_salinity").getAsInt();



            //获取报警配置
            //session 报错   无登录状态无法获取用户名
            //User user = (User) request.getSession().getAttribute(Const.CURRENT_USER);
            //List<Device_warning_config> warnConfigList = warnService.getConfigInformation(user.getId());
            List<Device_warning_config> warnConfigList = warnService.getConfigInformation(100000213,1001);////先用这个设备占用
            String DevId = String.valueOf(warnConfigList.get(0).getDevId());
            Date date = new Date();
            Integer userid = warnConfigList.get(0).getUserId();

            if (Integer.parseInt(warnConfigList.get(0).getCheckLight()) ==1){
                //检查值是否越过报警  越过就插入数据表Device_warning_record_his
                //todo

                if ( light > warnConfigList.get(0).getLightMaxWarning() || light < warnConfigList.get(0).getLightMinWarning()) {
                    Device_warning_record_his record_his = new Device_warning_record_his();
                    if ( light > warnConfigList.get(0).getLightMaxWarning()) {
                        record_his.setWarning("光照强度  max ");
                    }
                    if ( light < warnConfigList.get(0).getLightMinWarning()){
                        record_his.setWarning("光照强度  min ");
                    }
                    if (null != userid) {
                        record_his.setUserid(userid);
                    }
                    record_his.setCreateTime(date);
                    record_his.setDevid(DevId);
                    warnService.insert(record_his);

                }
            }
            if (Integer.parseInt(warnConfigList.get(0).getCheckRainWarning()) ==1){
                if ( rain > warnConfigList.get(0).getRainMaxWarning() || rain < warnConfigList.get(0).getRainMinWarning()){
                    Device_warning_record_his record_his = new Device_warning_record_his();
                    if( rain > warnConfigList.get(0).getRainMaxWarning()){
                        record_his.setWarning("降雨量  max");
                    }
                    if( rain < warnConfigList.get(0).getRainMinWarning()){
                        record_his.setWarning("降雨量  min");
                    }
                    if (null != userid){
                        record_his.setUserid(userid);
                    }
                    record_his.setCreateTime(date);
                    record_his.setDevid(DevId);
                    warnService.insert(record_his);
                }
            }
            if (Integer.parseInt(warnConfigList.get(0).getCheckAirTemp()) ==1){
                if ( air_temp > warnConfigList.get(0).getAirTempMaxWarning() || air_temp < warnConfigList.get(0).getAirTempMinWarning()){
                    Device_warning_record_his record_his = new Device_warning_record_his();
                    if (air_temp > warnConfigList.get(0).getAirTempMaxWarning()){
                        record_his.setWarning("温度  max");
                    }
                    if (air_temp < warnConfigList.get(0).getAirTempMinWarning()){
                        record_his.setWarning("温度  min");
                    }
                    if (null != userid){
                        record_his.setUserid(userid);
                    }
                    record_his.setCreateTime(date);
                    record_his.setDevid(DevId);
                    warnService.insert(record_his);
                }
            }
            if (Integer.parseInt(warnConfigList.get(0).getCheckAirHumi()) ==1){
                if ( air_humi > warnConfigList.get(0).getAirHumiMaxWarning() || air_humi < warnConfigList.get(0).getAirHumiMinWarning()){

                    Device_warning_record_his record_his = new Device_warning_record_his();
                    if (air_humi > warnConfigList.get(0).getAirHumiMaxWarning()){
                        record_his.setWarning("湿度  max");
                    }
                    if (air_humi < warnConfigList.get(0).getAirHumiMinWarning()){
                        record_his.setWarning("湿度  min");
                    }
                    if (null != userid){
                        record_his.setUserid(userid);
                    }
                    record_his.setCreateTime(date);
                    record_his.setDevid(DevId);
                    warnService.insert(record_his);
                }
            }
            if (Integer.parseInt(warnConfigList.get(0).getCheckSoilTemp()) ==1){
                if ( soil_humi > warnConfigList.get(0).getSoilTempMaxWarning() || soil_humi < warnConfigList.get(0).getSoilTempMinWarning()){
                    Device_warning_record_his record_his = new Device_warning_record_his();
                    if (soil_humi > warnConfigList.get(0).getSoilTempMaxWarning()){
                        record_his.setWarning("土壤温度  max");
                    }
                    if (soil_humi < warnConfigList.get(0).getSoilTempMinWarning()){
                        record_his.setWarning("土壤温度  min");
                    }
                    if (null != userid){
                        record_his.setUserid(userid);
                    }
                    record_his.setCreateTime(date);
                    record_his.setDevid(DevId);
                    warnService.insert(record_his);
                }
            }
            if (Integer.parseInt(warnConfigList.get(0).getCheckSoilHumi()) ==1){
                if ( air_humi > warnConfigList.get(0).getSoilHumiMaxWarning() || air_humi < warnConfigList.get(0).getSoilHumiMinWarning()){
                    Device_warning_record_his record_his = new Device_warning_record_his();
                    if(air_humi > warnConfigList.get(0).getSoilHumiMaxWarning()){
                        record_his.setWarning("土壤湿度  max");
                    }
                    if(air_humi < warnConfigList.get(0).getSoilHumiMinWarning()){
                        record_his.setWarning("土壤湿度  min");
                    }
                    if (null != userid){
                        record_his.setUserid(userid);
                    }
                    record_his.setCreateTime(date);
                    record_his.setDevid(DevId);
                    warnService.insert(record_his);
                }
            }
            if (Integer.parseInt(warnConfigList.get(0).getCheckSoilElectric()) ==1){
                if ( soil_electric > warnConfigList.get(0).getSoilElectricMaxWarning() || soil_electric < warnConfigList.get(0).getSoilElectricMinWarning()){
                    Device_warning_record_his record_his = new Device_warning_record_his();
                    if (soil_electric > warnConfigList.get(0).getSoilElectricMaxWarning()){
                        record_his.setWarning("土壤电导率  max");
                    }
                    if (soil_electric < warnConfigList.get(0).getSoilElectricMinWarning()){
                        record_his.setWarning("土壤电导率  min");
                    }
                    if (null != userid){
                        record_his.setUserid(userid);
                    }
                    record_his.setCreateTime(date);
                    record_his.setDevid(DevId);
                    warnService.insert(record_his);
                }
            }
            if (Integer.parseInt(warnConfigList.get(0).getCheckSoilSalt()) ==1){
                if ( soil_salinity > warnConfigList.get(0).getSoilSaltMaxWarning() || soil_salinity < warnConfigList.get(0).getSoilSaltMinWarning()){
                    Device_warning_record_his record_his = new Device_warning_record_his();
                    if(soil_salinity > warnConfigList.get(0).getSoilSaltMaxWarning()){
                        record_his.setWarning("土壤盐度  max");
                    }else {
                        record_his.setWarning("土壤盐度  min");
                    }

                    if (null != userid){
                        record_his.setUserid(userid);
                    }
                    record_his.setCreateTime(date);
                    record_his.setDevid(DevId);
                    warnService.insert(record_his);
                }
            }



            //System.out.println("-------------------------------------------     " + light);
            d.setLight(light);
            d.setRain(rain);
            d.setAirTemp(air_temp);
            d.setAirHumi(air_humi);
            d.setSoilElectric(soil_electric);
            d.setSoilHumi(soil_humi);
            d.setSoilTemp(soil_temp);
            d.setSoilSalt(soil_salinity);

            //因为只有一个设备  先设定为100000213
            d.setDevId((long) 100000213);
        }catch (JsonIOException e){
            e.printStackTrace();
            log.info("JSON 解析出错");
        }
        return d;
    }


    /*@Scheduled(cron = "0 0 0/1 * * *")//每60分钟即每小时执行一次  0 0 0/1 * * *
    public void getDateToSQL()
    {
        log.info("------------   每小时服务启动    ------------");
        try{
            //解析 保存
            device_record_hisMapper.insert(jsonRead());
        }catch (Exception e){
            e.printStackTrace();
            log.info("插入数据库出错");
        }

    }*/

    /**\
     *  保存当天数据的平均值
     *  每天23点59分自启动
     *
     */
    /*@Scheduled(cron = "0 59 23 * * ?")
    public void AvgDataToSQL()
    {
        log.info("------------   每天23点59分自启动服务    ------------");
        try{
            //解析 保存
            List<Map<String, Object>> resultMap  =  device_record_hisMapper.selectByDeviceDay(100000213);
            int size = resultMap.size();

            double lights = 0,rain = 0,air_temp = 0,air_humi = 0,soil_temp = 0,soil_humi = 0,soil_electric = 0,soil_salt = 0;

            for (int i = 0; i < size; i++) {//7
                Map mapItem = resultMap.get(i);

                if (mapItem != null) {
                    lights += (Double) mapItem.get("light");
                    rain += (Double)mapItem.get("rain");
                    air_temp += (Double)mapItem.get("air_temp");
                    air_humi += (Double)mapItem.get("air_humi");
                    soil_temp += (Double)mapItem.get("soil_temp");
                    soil_humi += (Double)mapItem.get("soil_humi");
                    soil_electric += (Double)mapItem.get("soil_electric");
                    soil_salt += (Double)mapItem.get("soil_salt");
                }
            }
            Device_record_his_avg device_record_his_avg = new Device_record_his_avg();
            device_record_his_avg.setDevId((long)100000213);
            device_record_his_avg.setCreateTime(df.parse(df.format(new Date())));
            device_record_his_avg.setLight(lights/size);
            device_record_his_avg.setRain(rain);// 降雨量没有平均值
            device_record_his_avg.setAirTemp(air_temp/size);
            device_record_his_avg.setAirHumi(air_humi/size);
            device_record_his_avg.setSoilTemp(soil_temp/size);
            device_record_his_avg.setSoilHumi(soil_humi/size);
            device_record_his_avg.setSoilElectric(soil_electric/size);
            device_record_his_avg.setSoilSalt(soil_salt/size);


            avg.insert(device_record_his_avg);
        }catch (Exception e){
            e.printStackTrace();
            log.info("AvgDataToSQL  插入数据库出错");
        }

    }*/



    /**\
     * 前台定时弄数据比较好
     * @return
     */
    /*@Scheduled(cron = "0 0/1 * * * ?")//每隔一分钟0 0/1 * * * ?
    public List<Device_record_his> getDatefromRight()
    {
        log.info("------------   每分钟服务启动    ------------");
        //Device_record_his device_record_his = jsonRead();
        List<Device_record_his> map = new ArrayList<>();
        map.add(jsonRead());
        return map;
    }*/




    //parm：请求的url链接  返回的是json字符串
    public static String getURLContent(String urlStr) {

        //请求的url
        URL url = null;

        //建立的http链接
        HttpURLConnection httpConn = null;

        //请求的输入流
        BufferedReader in = null;

        //输入流的缓冲
        StringBuffer sb = new StringBuffer();

        try{
            url = new URL(urlStr);

            in = new BufferedReader(new InputStreamReader(url.openStream(),"UTF-8") );

            String str = null;

            //一行一行进行读入
            while((str = in.readLine()) != null) {
                sb.append( str );
            }
        } catch (Exception ex) {

        } finally{
            try{
                if(in!=null) {
                    in.close(); //关闭流
                }
            }catch(IOException ex) {

            }
        }
        String result =sb.toString();
        return result;
    }




}
