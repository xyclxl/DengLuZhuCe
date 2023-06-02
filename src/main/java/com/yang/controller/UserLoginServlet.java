package com.yang.controller;

import com.yang.javabean.UserInfo;
import com.yang.service.UserInfoService;
import com.yang.service.UserInfoServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/UserLoginServlet")
public class UserLoginServlet extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");//解决请求中的中文乱码
        response.setCharacterEncoding("utf-8");//解决响应中文乱码
        response.setContentType("text/html;charset=utf8");//解决响应中文乱码

        String loginname = request.getParameter("loginname");
        String password = request.getParameter("password");
        String notLogin = request.getParameter("notLogin");

        if(loginname!=null && !loginname.equals("") && password!=null && !password.equals("")){
            UserInfoService userService = new UserInfoServiceImpl();
            UserInfo user = new UserInfo(loginname,password);
            UserInfo loginUser= userService.login(user);//查询数据库，返回登陆的用户对象
            if(loginUser!=null){
                //把登陆成功用户对象保存在session域对象中
                HttpSession session = request.getSession();
                session.setAttribute("loginUser",loginUser);
                session.setMaxInactiveInterval(3600*24*7);
                System.out.println(loginUser.getUser_name());
                if(notLogin != null){//勾选了
                    Cookie cookie = new Cookie("JSESSIONID",request.getSession().getId());
                    cookie.setMaxAge(3600*24*7);
                    response.addCookie(cookie);

                    Cookie cookie1 = new Cookie("isNotLogin","yes");
                    cookie1.setMaxAge(3600*24*7);
                    response.addCookie(cookie1);

                }else{//未勾选
                    Cookie cookie = new Cookie("JSESSIONID",request.getSession().getId());
                    response.addCookie(cookie);

                    Cookie cookie1 = new Cookie("isNotLogin","no");
                    cookie1.setMaxAge(3600*24*7);
                    response.addCookie(cookie1);
                }

                System.out.println("登陆成功");
                response.sendRedirect("index.jsp");

            }else{
                System.out.println("登陆失败0(密码错误)");
                /*密码错误*/
                //request携带数据到web资源
                request.setAttribute("errorMessage","账号或密码错误");
                //请求转发
                request.getRequestDispatcher("jsp/userLoginError.jsp").forward(request,response);
//                response.sendRedirect("jsp/userLogin.jsp");
            }
        }else{
            System.out.println("登陆失败1");
            response.sendRedirect("jsp/userLogin.jsp");
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
