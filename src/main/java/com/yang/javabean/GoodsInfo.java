package com.yang.javabean;

public class GoodsInfo {
    private int id;
    private  String goodurl;//商品图片
    private String goodnum;//商品编号
    private String goodname;//商品名字
    private String goodtype;//商品类型
    private String goodplace;//商品产地
    private double goodprice;//商品价格

    public GoodsInfo(String goodnum, String goodname, String goodtype, String goodplace, String gooddescribe, String fname) {
        this.goodnum = goodnum;
        this.goodname = goodname;
        this.goodtype = goodtype;
        this.goodplace = goodplace;
        this.gooddescribe = gooddescribe;
        this.goodurl = fname;
    }

    public GoodsInfo(int id, String goodurl, String goodnum, String goodname, String goodtype, String goodplace, double goodprice, String gooddescribe) {
        this.id = id;
        this.goodurl = goodurl;
        this.goodnum = goodnum;
        this.goodname = goodname;
        this.goodtype = goodtype;
        this.goodplace = goodplace;
        this.goodprice = goodprice;
        this.gooddescribe = gooddescribe;
    }

    public GoodsInfo(int goodId, String goodnum, String goodname, String goodtype, String goodplace, double goodprice, String goodurl, String gooddescribe) {
        this.id = goodId;
        this.goodnum = goodnum;
        this.goodname = goodname;
        this.goodtype = goodtype;
        this.goodplace = goodplace;
        this.goodprice = goodprice;
        this.goodurl =goodurl;
        this.gooddescribe = gooddescribe;
    }

    public GoodsInfo(String goodnum, String goodname, String goodtype, String goodplace, Double goodprice, String gooddescribe, String fname) {
        this.goodnum = goodnum;
        this.goodname = goodname;
        this.goodtype = goodtype;
        this.goodplace = goodplace;
        this.goodprice =goodprice;
        this.gooddescribe = gooddescribe;
        this.goodurl = fname;
    }

    public GoodsInfo(String goodnum, String goodname, String goodtype, String goodplace, double goodprice, String gooddescribe) {
        this.goodnum = goodnum;
        this.goodname = goodname;
        this.goodtype = goodtype;
        this.goodplace = goodplace;
        this.goodprice =goodprice;
        this.gooddescribe = gooddescribe;
    }



    public GoodsInfo(String goodnum, String goodname, String goodtype, String goodplace, Double goodprice, String gooddescribe, int id) {
        this.goodnum = goodnum;
        this.goodname = goodname;
        this.goodtype = goodtype;
        this.goodplace = goodplace;
        this.goodprice = goodprice;
        this.gooddescribe = gooddescribe;
        this.id = id;
    }


    public String getGooddescribe() {
        return gooddescribe;
    }

    public void setGooddescribe(String gooddescribe) {
        this.gooddescribe = gooddescribe;
    }

    private String gooddescribe;//商品描述



    public GoodsInfo(int id, String goodname, double goodprice) {
        this.id = id;
        this.goodname = goodname;
        this.goodprice = goodprice;
    }
    public String getGoodurl() {
        return goodurl;
    }

    public void setGoodurl(String goodurl) {
        this.goodurl = goodurl;
    }
    public GoodsInfo(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getGoodnum() {
        return goodnum;
    }

    public void setGoodnum(String goodnum) {
        this.goodnum = goodnum;
    }

    public String getGoodname() {
        return goodname;
    }

    public void setGoodname(String goodname) {
        this.goodname = goodname;
    }

    public String getGoodtype() {
        return goodtype;
    }

    public void setGoodtype(String goodtype) {
        this.goodtype = goodtype;
    }

    public String getGoodplace() {
        return goodplace;
    }

    public void setGoodplace(String goodplace) {
        this.goodplace = goodplace;
    }

    @Override
    public String toString() {
        return "Goodsinfo{" +
                "id=" + id +
                ", goodnum='" + goodnum + '\'' +
                ", goodname='" + goodname + '\'' +
                ", goodtype='" + goodtype + '\'' +
                ", goodplace='" + goodplace + '\'' +
                ", goodprice=" + goodprice +
                '}';
    }

    public double getGoodprice() {
        return goodprice;
    }

    public void setGoodprice(double goodprice) {
        this.goodprice = goodprice;
    }
}
