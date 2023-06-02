package com.yang.controller;

import com.yang.javabean.AdminInfo;
import com.yang.service.AdminInfoService;
import com.yang.service.AdminInfoServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/AdminDeleteByid")
public class AdminDeleteServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");//解决请求中的中文乱码
        response.setCharacterEncoding("utf-8");//解决响应中文乱码
        response.setContentType("text/html;charset=utf8");//解决响应中文乱码
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println(id);
        if(!"0".equals(String.valueOf(id)) && !"null".equals(String.valueOf(id)) ){
            //把用户名、密码、邮箱、手机添加到数据库中
            AdminInfoService adminService = new AdminInfoServiceImpl();
            AdminInfo admin = new AdminInfo(id);
            int getRow = adminService.delete(admin);
            if(getRow>0){
                //删除成功
                response.sendRedirect("jsp/admin/superAdmin_home.jsp");
            }else{
                //删除失败
                System.out.println("删除失败0");
//                request.getRequestDispatcher("jsp/adminAddError.jsp").forward(request,response);
            }

        }else{
            //删除失败
            System.out.println("删除失败1");
            //request.getRequestDispatcher("jsp/adminAddError.jsp").forward(request,response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
