package com.yang.controller;

import com.yang.javabean.AdminInfo;
import com.yang.javabean.UserInfo;
import com.yang.service.AdminInfoService;
import com.yang.service.AdminInfoServiceImpl;
import com.yang.service.UserInfoService;
import com.yang.service.UserInfoServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/DengLuServlet")
public class AdminLoginServlet extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
        request.setCharacterEncoding("utf-8");//解决请求中的中文乱码
        response.setCharacterEncoding("utf-8");//解决响应中文乱码
        response.setContentType("text/html;charset=utf8");//解决响应中文乱码

        String loginname = request.getParameter("loginname");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        System.out.println(role);
        if ("default".equals(role)){
            String msg="请选择登录人物";
            //method 1:JS Script，缺点：无法转发setAttritute方法中的键值对
            System.out.println("role为空");
//method 2:JAVA GUI
//            JOptionPane.showMessageDialog(null,msg);

            response.sendRedirect("jsp/AdminLogin.jsp");//重定向
            //request.getRequestDispatcher("jsp/denglu.jsp").forward(request, response);
        }
//        -------用户-------
        else if(  "staff".equals(role) && role!=null && loginname!=null && !loginname.equals("") && password!=null && !password.equals("")){
            UserInfoService userService = new UserInfoServiceImpl();
            UserInfo user = new UserInfo(loginname,password);
            UserInfo loginUser= userService.login(user);//查询数据库，返回登陆的用户对象
            if(loginUser!=null){
                //把登陆成功用户对象保存在session域对象中
                HttpSession session = request.getSession();
                session.setAttribute("loginUser",loginUser);
                session.setMaxInactiveInterval(3600*24*7);
                System.out.println("用户登陆成功");
                response.sendRedirect("index.jsp");
            }else{
                System.out.println("登陆失败0(用户密码错误)");
//                response.sendRedirect("jsp/fail.jsp");
                /*密码错误*/
                //request携带数据到web资源
                request.setAttribute("errorMessage","账号或密码错误");
                //请求转发
                request.getRequestDispatcher("jsp/AdminLoginError.jsp").forward(request,response);
            }
        }
//        --------管理员-----
        else if(  "admin".equals(role) && role!=null && loginname!=null && !loginname.equals("") && password!=null && !password.equals("")){
            AdminInfoService adminService = new AdminInfoServiceImpl();
            AdminInfo admin = new AdminInfo(loginname,password);
            AdminInfo loginAdmin= adminService.login(admin);//查询数据库，返回登陆的用户对象
            if(loginAdmin!=null){
                //把登陆成功用户对象保存在session域对象中
                HttpSession session = request.getSession();
                session.setAttribute("loginAdmin",loginAdmin);
                session.setMaxInactiveInterval(3600*24*7);
//                System.out.println("管理员登陆成功");
//                response.sendRedirect("jsp/admin_home.jsp");
                //登录成功
                if(loginAdmin.getAdmin_sign().equals("super")){
                    System.out.println("超级管理员登陆成功");
                    response.sendRedirect("jsp/admin/superAdmin_home.jsp");
                }else if(loginAdmin.getAdmin_sign().equals("user")){
                    System.out.println("用户管理员登陆成功");
                    response.sendRedirect("jsp/admin/userAdmin_home.jsp");
                }else if(loginAdmin.getAdmin_sign().equals("good")){
                    System.out.println("商品管理员登陆成功");
                    response.sendRedirect("jsp/admin/goodAdmin_home.jsp");
                }else{
                    System.out.println("订单管理员登陆成功");
                    response.sendRedirect("jsp/admin/orderAdmin_home.jsp");
                }
            }else{
                System.out.println("登陆失败1(管理员密码错误)");
//                response.sendRedirect("jsp/fail.jsp");
                /*密码错误*/
                //request携带数据到web资源
                request.setAttribute("errorMessage","账号或密码错误");
                //请求转发
                request.getRequestDispatcher("jsp/AdminLoginError.jsp").forward(request,response);
            }
        }
        else{
            System.out.println("登陆失败(未输入账号和密码)");
            response.sendRedirect("jsp/AdminLoginError.jsp");
        }
    }
}
