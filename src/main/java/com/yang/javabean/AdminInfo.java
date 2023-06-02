package com.yang.javabean;


import java.sql.Timestamp;
import java.util.Date;

public class AdminInfo {


    public AdminInfo(int id) {
        this.id = id;
    }

    public AdminInfo(String admin_name, String admin_password, String admin_email, String admin_phone, Timestamp subtime, String admin_sign) {
        this.admin_name = admin_name;
        this.admin_password = admin_password;
        this.admin_email = admin_email;
        this.admin_phone = admin_phone;
        this.subtime = subtime;//注册时间
        this.admin_sign = admin_sign;//管理员标志
    }

    public AdminInfo(int id, String admin_name, String admin_password, String admin_email, String admin_phone, String admin_sign) {
        this.id = id;
        this.admin_name = admin_name;
        this.admin_password = admin_password;
        this.admin_email = admin_email;
        this.admin_phone = admin_phone;
        this.admin_sign = admin_sign;//管理员标志
    }

    public AdminInfo(String admin_name, String admin_password, String admin_email, String admin_phone, String admin_sign, int id) {
        this.admin_name = admin_name;
        this.admin_password = admin_password;
        this.admin_email = admin_email;
        this.admin_phone = admin_phone;
        this.admin_sign = admin_sign;//管理员标志
        this.id = id;
    }

    public Timestamp getSubtime() {
        return subtime;
    }

    public void setSubtime(Timestamp subtime) {
        this.subtime = subtime;
    }
    private int id;
    private String admin_name;
    private String admin_password;
    private String admin_email;
    private String admin_phone;
    private Timestamp subtime;
    private  String admin_sign;

    public AdminInfo(String admin_name, String admin_password, String admin_email, String admin_phone, String admin_sign) {
        this.admin_name = admin_name;
        this.admin_password = admin_password;
        this.admin_email = admin_email;
        this.admin_phone = admin_phone;
        this.admin_sign = admin_sign;//管理员标志
    }

    public AdminInfo(String admin_name, String admin_password, String admin_email, String admin_phone, String admin_sign, Timestamp subtime) {
        this.admin_name = admin_name;
        this.admin_password = admin_password;
        this.admin_email = admin_email;
        this.admin_phone = admin_phone;
        this.subtime = subtime;//注册时间
        this.admin_sign = admin_sign;//管理员标志
    }


    public String getAdmin_sign() {
        return admin_sign;
    }

    public void setAdmin_sign(String admin_sign) {
        this.admin_sign = admin_sign;
    }




    public AdminInfo(int id, String admin_name, String admin_password, String admin_email, String admin_phone, Timestamp subtime,String admin_sign) {
    this.id = id;
    this.admin_name = admin_name;
    this.admin_password = admin_password;
    this.admin_email = admin_email;
    this.admin_phone = admin_phone;
    this.subtime = subtime;//注册时间
    this.admin_sign = admin_sign;//管理员标志
    }

    @Override
    public String toString() {
        return "AdminInfo{" +
                "id=" + id +
                ", admin_name='" + admin_name + '\'' +
                ", admin_password='" + admin_password + '\'' +
                ", admin_email='" + admin_email + '\'' +
                ", admin_phone='" + admin_phone + '\'' +
                ", subtime='" + subtime + '\'' +
                '}';
    }

    public String getAdmin_email() {
        return admin_email;
    }

    public void setAdmin_email(String admin_email) {
        this.admin_email = admin_email;
    }

    public String getAdmin_phone() {
        return admin_phone;
    }

    public void setAdmin_phone(String admin_phone) {
        this.admin_phone = admin_phone;
    }

    public AdminInfo(){}
    public AdminInfo(int id, String admin_name, String admin_password) {
        this.id = id;
        this.admin_name = admin_name;
        this.admin_password = admin_password;
    }
    public AdminInfo(String admin_name, String admin_password) {
        this.admin_name = admin_name;
        this.admin_password = admin_password;
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAdmin_name() {
        return admin_name;
    }

    public void setAdmin_name(String admin_name) {
        this.admin_name = admin_name;
    }

    public String getAdmin_password() {
        return admin_password;
    }

    public void setAdmin_password(String admin_password) {
        this.admin_password = admin_password;
    }
}
