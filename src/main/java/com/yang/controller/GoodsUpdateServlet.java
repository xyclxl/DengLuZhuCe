package com.yang.controller;

import com.yang.javabean.AdminInfo;
import com.yang.javabean.GoodsInfo;
import com.yang.service.AdminInfoService;
import com.yang.service.AdminInfoServiceImpl;
import com.yang.service.GoodsInfoService;
import com.yang.service.GoodsInfoServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/GoodsUpdateByid")
public class GoodsUpdateServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");//解决请求中的中文乱码
        response.setCharacterEncoding("utf-8");//解决响应中文乱码
        response.setContentType("text/html;charset=utf8");//解决响应中文乱码
        String goodnum = request.getParameter("goodnum");
        String goodname = request.getParameter("goodname");
        String goodtype = request.getParameter("goodtype");
        String goodplace = request.getParameter("goodplace");
        Double goodprice = Double.parseDouble(request.getParameter("goodprice"));
        String gooddescribe = request.getParameter("gooddescribe");
        int id = Integer.parseInt(request.getParameter("id"));
        //System.out.println(goodnum+"---"+goodname+"---"+goodtype+"---"+goodplace+"---"+goodprice+"---"+gooddescribe+"---"+id);
        if(goodnum!=null && !goodnum.equals("") && goodname!=null && !goodname.equals("")
                && goodtype!=null && !goodtype.equals("") &&goodplace!=null && !goodplace.equals("")
                && goodprice!=null && !goodprice.equals("") && !"0".equals(String.valueOf(id)) && !"null".equals(String.valueOf(id))){
            //把用户名、密码、邮箱、手机添加到数据库中
            GoodsInfoService goodsService = new GoodsInfoServiceImpl();
            GoodsInfo goods = new GoodsInfo(goodnum,goodname,goodtype,goodplace,goodprice,gooddescribe,id);
            System.out.println("进入修改");
            System.out.println(goodnum+"---"+goodname+"---"+goodtype+"---"+goodplace+"---"+goodprice+"---"+gooddescribe+"---"+id);
            int getRow = goodsService.update(goods);
            if(getRow>0){
                //修改成功
                response.sendRedirect("jsp/admin/goodAdmin_home.jsp");
            }else{
                //修改失败
                System.out.println("修改失败0");
//                request.getRequestDispatcher("jsp/adminAddError.jsp").forward(request,response);
            }

        }else{
            //修改失败
            System.out.println("修改失败1");
            //request.getRequestDispatcher("jsp/adminAddError.jsp").forward(request,response);
        }
    }
}
