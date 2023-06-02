package com.yang.controller;

import com.yang.javabean.UserInfo;
import com.yang.service.UserInfoService;
import com.yang.service.UserInfoServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/UserZhuCeServlet")
public class UserZhuCeServlet extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");//解决请求中的中文乱码
        response.setCharacterEncoding("utf-8");//解决响应中文乱码
        response.setContentType("text/html;charset=utf8");//解决响应中文乱码
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        System.out.println(username+"---------"+password+"---------"+email+"---------"+phone);
        if(username!=null && !username.equals("") && password!=null && !password.equals("")
                && email!=null && !email.equals("") &&phone!=null && !phone.equals("")){
            //把用户名、密码、邮箱、手机添加到数据库中
            UserInfoService userService = new UserInfoServiceImpl();
            UserInfo user = new UserInfo(username,password,email,phone);
            int getRow = userService.add(user);
            if(getRow>0){
                //注册成功
                response.sendRedirect("jsp/loading.jsp");
            }else{
                //注册失败(数据库错误)
//                response.sendRedirect("jsp/register.jsp");
                request.getRequestDispatcher("jsp/userRegisterError.jsp").forward(request,response);
            }

        }else{
            //注册失败(未输入完整信息)
//            response.sendRedirect("jsp/register.jsp");
            request.getRequestDispatcher("jsp/userRegisterError.jsp").forward(request,response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
