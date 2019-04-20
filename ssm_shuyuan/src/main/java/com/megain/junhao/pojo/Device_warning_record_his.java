package com.megain.junhao.pojo;

import org.joda.time.DateTime;

import java.util.Date;

public class Device_warning_record_his {
    private Integer id;

    private Integer userid;

    private String devid;

    private String warning;

    private Date createTime;

    /**\
     * 用于查询    Device_warning_record_his record_his = new Device_warning_record_his();  加了后 这条创建对象语句出错  没有参数   弄构造函数后错误消失 public Device_warning_record_his() {}
     *
     */
    private String startTime;
    private String endTime;

    public Device_warning_record_his() {

    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getDevid() {
        return devid;
    }

    public void setDevid(String devid) {
        this.devid = devid == null ? null : devid.trim();
    }

    public String getWarning() {
        return warning;
    }

    public void setWarning(String warning) {
        this.warning = warning == null ? null : warning.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}