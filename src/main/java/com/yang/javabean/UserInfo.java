package com.yang.javabean;

public class UserInfo {

    private int id;
    private String user_name;
    private String user_password;
    private String user_email;
    private String user_phone;

    public UserInfo(int id, String user_name, String user_password, String user_email, String user_phone) {
        this.id = id;
        this.user_name = user_name;
        this.user_password = user_password;
        this.user_email = user_email;
        this.user_phone = user_phone;
    }

    public UserInfo(String loginname, String password) {
        this.user_name = loginname;
        this.user_password = password;
    }

    public UserInfo(String username, String password, String email, String phone) {
        this.user_name = username;
        this.user_password = password;
        this.user_email = email;
        this.user_phone = phone;
    }

    public UserInfo(int id) {
        this.id = id;
    }

    public UserInfo(String username, String password, String email, String phone, int id) {
    this.user_name = username;
    this.user_password = password;
    this.user_email = email;
    this.user_phone = phone;
    this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_password() {
        return user_password;
    }

    public void setUser_password(String user_password) {
        this.user_password = user_password;
    }

    public String getUser_email() {
        return user_email;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }

    public String getUser_phone() {
        return user_phone;
    }

    public void setUser_phone(String user_phone) {
        this.user_phone = user_phone;
    }
}
