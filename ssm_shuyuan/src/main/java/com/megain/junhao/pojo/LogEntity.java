package com.megain.junhao.pojo;

import java.util.Date;

public class LogEntity {
    private Integer id;

    private Integer userid;

    private String username;

    private String module;

    private String method;

    private String rsponseData;

    private String ip;

    private Date createTime;

    private String commite;

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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getModule() {
        return module;
    }

    public void setModule(String module) {
        this.module = module == null ? null : module.trim();
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method == null ? null : method.trim();
    }

    public String getRsponseData() {
        return rsponseData;
    }

    public void setRsponseData(String rsponseData) {
        this.rsponseData = rsponseData == null ? null : rsponseData.trim();
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip == null ? null : ip.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public Date setCreateTime(Date createTime) {
       return this.createTime = createTime;
    }

    public String getCommite() {
        return commite;
    }

    public void setCommite(String commite) {
        this.commite = commite == null ? null : commite.trim();
    }
}