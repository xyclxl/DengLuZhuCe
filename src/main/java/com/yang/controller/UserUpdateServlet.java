package com.yang.controller;

import com.yang.javabean.AdminInfo;
import com.yang.javabean.UserInfo;
import com.yang.service.AdminInfoService;
import com.yang.service.AdminInfoServiceImpl;
import com.yang.service.UserInfoService;
import com.yang.service.UserInfoServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/UserUpdateByid")
public class UserUpdateServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");//解决请求中的中文乱码
        response.setCharacterEncoding("utf-8");//解决响应中文乱码
        response.setContentType("text/html;charset=utf8");//解决响应中文乱码
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println(id);
        if(username!=null && !username.equals("") && password!=null && !password.equals("")
                && email!=null && !email.equals("") &&phone!=null && !phone.equals("")
                && !"0".equals(String.valueOf(id)) && !"null".equals(String.valueOf(id))){
            //把用户名、密码、邮箱、手机添加到数据库中
            UserInfoService userService = new UserInfoServiceImpl();
            UserInfo user = new UserInfo(username,password,email,phone,id);
            int getRow = userService.update(user);
            if(getRow>0){
                //修改成功
                response.sendRedirect("jsp/admin/userAdmin_home.jsp");
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
