package com.yang.javabean;

public class OrderInfo {
    private  int id;
    private String ordernum;
    private String ordername;
    private String ordernumber;
    private String ordertype;
    private String ordertime;

    public OrderInfo() {

    }

    public OrderInfo(int id, String ordernum, String ordername, String ordernumber, String ordertype, String ordertime) {
        this.id = id;
        this.ordernum = ordernum;
        this.ordername = ordername;
        this.ordernumber = ordernumber;
        this.ordertype = ordertype;
        this.ordertime = ordertime;
    }

    public OrderInfo(String ordernum, String ordername, String ordernumber, String ordertype, String ordertime) {
        this.ordernum = ordernum;
        this.ordername = ordername;
        this.ordernumber = ordernumber;
        this.ordertype = ordertype;
        this.ordertime = ordertime;
    }

    public OrderInfo(String ordernum) {
        this.ordernum = ordernum;
    }

    public OrderInfo(int id) {
        this.id = id;
    }

    public OrderInfo(String ordernum, String ordername, String ordernumber, String ordertype, String ordertime, int id) {
        this.ordernum = ordernum;
        this.ordername = ordername;
        this.ordernumber = ordernumber;
        this.ordertype = ordertype;
        this.ordertime = ordertime;
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getOrdernum() {
        return ordernum;
    }

    public void setOrdernum(String ordernum) {
        this.ordernum = ordernum;
    }

    public String getOrdername() {
        return ordername;
    }

    public void setOrdername(String ordername) {
        this.ordername = ordername;
    }

    public String getOrdernumber() {
        return ordernumber;
    }

    public void setOrdernumber(String ordernumber) {
        this.ordernumber = ordernumber;
    }

    public String getOrdertype() {
        return ordertype;
    }

    public void setOrdertype(String ordertype) {
        this.ordertype = ordertype;
    }

    public String getOrdertime() {
        return ordertime;
    }

    public void setOrdertime(String ordertime) {
        this.ordertime = ordertime;
    }
}
