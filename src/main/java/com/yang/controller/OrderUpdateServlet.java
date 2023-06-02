package com.yang.controller;

import com.yang.javabean.AdminInfo;
import com.yang.javabean.GoodsInfo;
import com.yang.javabean.OrderInfo;
import com.yang.service.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/OrderUpdateByid")
public class OrderUpdateServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");//解决请求中的中文乱码
        response.setCharacterEncoding("utf-8");//解决响应中文乱码
        response.setContentType("text/html;charset=utf8");//解决响应中文乱码
        String ordernum = request.getParameter("ordernum");
        String ordername = request.getParameter("ordername");
        String ordernumber = request.getParameter("ordernumber");
        String ordertype = request.getParameter("ordertype");
        String ordertime =  request.getParameter("ordertime");
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println(ordernum+"---"+ordername+"---"+ordernumber+"---"+ordertype+"---"+ordertime+"----"+id);
        if(ordernum!=null && !ordernum.equals("") && ordername!=null && !ordername.equals("")
                && ordernumber!=null && !ordernumber.equals("") &&ordertype!=null && !ordertype.equals("")
                && ordertime!=null && !ordertime.equals("") && !"0".equals(String.valueOf(id)) && !"null".equals(String.valueOf(id))){
            //把用户名、密码、邮箱、手机添加到数据库中
            OrderInfoService orderService = new OrderInfoServiceImpl();
            OrderInfo order = new OrderInfo(ordernum,ordername,ordernumber,ordertype,ordertime,id);
            System.out.println("进入修改");
            System.out.println(ordernum+"---"+ordername+"---"+ordernumber+"---"+ordertype+"---"+ordertime+"---"+id);
            int getRow = orderService.update(order);
            if(getRow>0){
                //修改成功
                response.sendRedirect("jsp/admin/orderAdmin_home.jsp");
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
