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

@WebServlet("/AdminUpdateByid")
public class AdminUpdateServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");//解决请求中的中文乱码
        response.setCharacterEncoding("utf-8");//解决响应中文乱码
        response.setContentType("text/html;charset=utf8");//解决响应中文乱码
        String admin_name = request.getParameter("adminname");
        String admin_password = request.getParameter("adminpassword");
        String admin_email = request.getParameter("adminemail");
        String admin_phone = request.getParameter("adminphone");
        String admin_sign = request.getParameter("adminsign");
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println(admin_name+"----"+admin_password+"----"+admin_email+"----"+admin_phone+"----"+admin_sign+"----");
        if(admin_name!=null && !admin_name.equals("") && admin_password!=null && !admin_password.equals("")
                && admin_email!=null && !admin_email.equals("") &&admin_phone!=null && !admin_phone.equals("")
                && admin_sign!=null && !admin_sign.equals("") && !"0".equals(String.valueOf(id)) && !"null".equals(String.valueOf(id))){
            //把用户名、密码、邮箱、手机添加到数据库中
            AdminInfoService adminService = new AdminInfoServiceImpl();
            AdminInfo admin = new AdminInfo(admin_name,admin_password,admin_email,admin_phone,admin_sign,id);
            int getRow = adminService.update(admin);
            if(getRow>0){
                //修改成功
                response.sendRedirect("jsp/admin/superAdmin_home.jsp");
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
