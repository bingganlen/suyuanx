package com.megain.junhao.pojo;

public class Dept {
    private Integer id;

    private Integer deptId;

    private String deptName;

    private String company;

    private Integer numEmpCount;

    private Integer adminUserId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName == null ? null : deptName.trim();
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company == null ? null : company.trim();
    }

    public Integer getNumEmpCount() {
        return numEmpCount;
    }

    public void setNumEmpCount(Integer numEmpCount) {
        this.numEmpCount = numEmpCount;
    }

    public Integer getAdminUserId() {
        return adminUserId;
    }

    public void setAdminUserId(Integer adminUserId) {
        this.adminUserId = adminUserId;
    }
}