package com.megain.junhao.pojo;

import java.util.Date;

public class Device_config_his {
    private Integer id;

    private String configIdentifier;

    private Long deviceId;

    private Integer dataUploadInterval;

    private Integer dataSampInterval;

    private Integer isEnableLocate;

    private Date configTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getConfigIdentifier() {
        return configIdentifier;
    }

    public void setConfigIdentifier(String configIdentifier) {
        this.configIdentifier = configIdentifier == null ? null : configIdentifier.trim();
    }

    public Long getDeviceId() {
        return deviceId;
    }

    public void setDeviceId(Long deviceId) {
        this.deviceId = deviceId;
    }

    public Integer getDataUploadInterval() {
        return dataUploadInterval;
    }

    public void setDataUploadInterval(Integer dataUploadInterval) {
        this.dataUploadInterval = dataUploadInterval;
    }

    public Integer getDataSampInterval() {
        return dataSampInterval;
    }

    public void setDataSampInterval(Integer dataSampInterval) {
        this.dataSampInterval = dataSampInterval;
    }

    public Integer getIsEnableLocate() {
        return isEnableLocate;
    }

    public void setIsEnableLocate(Integer isEnableLocate) {
        this.isEnableLocate = isEnableLocate;
    }

    public Date getConfigTime() {
        return configTime;
    }

    public void setConfigTime(Date configTime) {
        this.configTime = configTime;
    }
}