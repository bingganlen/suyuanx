package com.megain.junhao.pojo;

import java.util.Date;

public class Device_record_his_avg {
    private Integer id;

    private Long devId;

    private String video;

    private Double light;

    private Double rain;

    private Double airTemp;

    private Double airHumi;

    private Double soilTemp;

    private Double soilHumi;

    private Double soilElectric;

    private Double soilSalt;

    private Double airPressure;

    private Double windSpeed;

    private String wind;

    private Date createTime;

    private Date updateTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Long getDevId() {
        return devId;
    }

    public void setDevId(Long devId) {
        this.devId = devId;
    }

    public String getVideo() {
        return video;
    }

    public void setVideo(String video) {
        this.video = video == null ? null : video.trim();
    }

    public Double getLight() {
        return light;
    }

    public void setLight(Double light) {
        this.light = light;
    }

    public Double getRain() {
        return rain;
    }

    public void setRain(Double rain) {
        this.rain = rain;
    }

    public Double getAirTemp() {
        return airTemp;
    }

    public void setAirTemp(Double airTemp) {
        this.airTemp = airTemp;
    }

    public Double getAirHumi() {
        return airHumi;
    }

    public void setAirHumi(Double airHumi) {
        this.airHumi = airHumi;
    }

    public Double getSoilTemp() {
        return soilTemp;
    }

    public void setSoilTemp(Double soilTemp) {
        this.soilTemp = soilTemp;
    }

    public Double getSoilHumi() {
        return soilHumi;
    }

    public void setSoilHumi(Double soilHumi) {
        this.soilHumi = soilHumi;
    }

    public Double getSoilElectric() {
        return soilElectric;
    }

    public void setSoilElectric(Double soilElectric) {
        this.soilElectric = soilElectric;
    }

    public Double getSoilSalt() {
        return soilSalt;
    }

    public void setSoilSalt(Double soilSalt) {
        this.soilSalt = soilSalt;
    }

    public Double getAirPressure() {
        return airPressure;
    }

    public void setAirPressure(Double airPressure) {
        this.airPressure = airPressure;
    }

    public Double getWindSpeed() {
        return windSpeed;
    }

    public void setWindSpeed(Double windSpeed) {
        this.windSpeed = windSpeed;
    }

    public String getWind() {
        return wind;
    }

    public void setWind(String wind) {
        this.wind = wind == null ? null : wind.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}