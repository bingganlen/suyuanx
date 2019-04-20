package com.megain.junhao.pojo;

import java.util.Date;

public class Device {
    private Integer id;

    private Long devId;

    private Integer video;

    private String dImage;

    private String dIp;

    private String deviceIp;

    private Integer dStatus;

    private String nickname;

    private String devType;

    private Integer csq;

    private Date createTime;

    private Date updateTime;

    private String dDetail;

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

    public Integer getVideo() {
        return video;
    }

    public void setVideo(Integer video) {
        this.video = video;
    }

    public String getdImage() {
        return dImage;
    }

    public void setdImage(String dImage) {
        this.dImage = dImage == null ? null : dImage.trim();
    }

    public String getdIp() {
        return dIp;
    }

    public void setdIp(String dIp) {
        this.dIp = dIp == null ? null : dIp.trim();
    }

    public String getDeviceIp() {
        return deviceIp;
    }

    public void setDeviceIp(String deviceIp) {
        this.deviceIp = deviceIp == null ? null : deviceIp.trim();
    }

    public Integer getdStatus() {
        return dStatus;
    }

    public void setdStatus(Integer dStatus) {
        this.dStatus = dStatus;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname == null ? null : nickname.trim();
    }

    public String getDevType() {
        return devType;
    }

    public void setDevType(String devType) {
        this.devType = devType == null ? null : devType.trim();
    }

    public Integer getCsq() {
        return csq;
    }

    public void setCsq(Integer csq) {
        this.csq = csq;
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

    public String getdDetail() {
        return dDetail;
    }

    public void setdDetail(String dDetail) {
        this.dDetail = dDetail == null ? null : dDetail.trim();
    }
}