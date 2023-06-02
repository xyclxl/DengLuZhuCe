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
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/GoodsQueryById")
public class GoodsQueryByIdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");//解决请求中的中文乱码
        response.setCharacterEncoding("utf-8");//解决响应中文乱码
        response.setContentType("text/html;charset=utf8");//解决响应中文乱码
        int id = Integer.parseInt(request.getParameter("id"));
//        System.out.println(id);
        if(!"0".equals(String.valueOf(id)) && !"null".equals(String.valueOf(id)) ){
            //把用户名、密码、邮箱、手机添加到数据库中
            GoodsInfoService goodsService = new GoodsInfoServiceImpl();
            GoodsInfo goods = new GoodsInfo(id);
            GoodsInfo querygoods = goodsService.queryByid(goods);
            if(querygoods!=null){
                //查询成功
                //把查询成功用户对象保存在session域对象中
                HttpSession session = request.getSession();
                session.setAttribute("querygoods",querygoods);
//                System.out.println(querygoods);
                session.setMaxInactiveInterval(3600*24*7);
                System.out.println("商品查询成功");
               response.sendRedirect("jsp/admin/goodAdmin_home_xiugai.jsp");
            }else{
                //查询失败
                System.out.println("查询失败0");
//                request.getRequestDispatcher("jsp/adminAddError.jsp").forward(request,response);
            }

        }else{
            //查询失败
            System.out.println("查询失败1");
            //request.getRequestDispatcher("jsp/adminAddError.jsp").forward(request,response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
