package com.yang.controller;

import com.yang.javabean.AdminInfo;
import com.yang.javabean.GoodsInfo;
import com.yang.javabean.OrderInfo;
import com.yang.service.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

@WebServlet("/OrderAdd")
@MultipartConfig
public class OrderAddServlet extends HttpServlet {

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
        String ordertime = request.getParameter("ordertime");

//        String subtime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(time);
        System.out.println(ordernum + "---------" + ordername + "---------" + ordernumber + "---------" + ordertype + "---------" + ordertime);
        if (ordernum != null && !ordernum.equals("") && ordername != null && !ordername.equals("")
                && ordernumber != null && !ordernumber.equals("") && ordertype != null && !ordertype.equals("")
                && ordertime != null && !ordertime.equals("")
        ){
            //把用户名、密码、邮箱、手机添加到数据库中
            OrderInfoService orderService = new OrderInfoServiceImpl();
            OrderInfo order = new OrderInfo(ordernum, ordername, ordernumber, ordertype, ordertime);
            int getRow = orderService.add(order);
            if (getRow > 0) {
                //添加成功
                response.sendRedirect("jsp/user_home_order.jsp");
            } else {
                //添加失败
                System.out.println("0");
                response.sendRedirect("jsp/userBuyError.jsp");
            }

        } else {
            //添加失败
            System.out.println("1");
            response.sendRedirect("jsp/userBuyError.jsp");
        }
    }

}

