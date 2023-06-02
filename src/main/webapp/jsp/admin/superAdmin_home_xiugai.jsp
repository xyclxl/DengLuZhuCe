<%@ page import="com.yang.mapper.AdminInfoDaoImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="com.yang.javabean.AdminInfo" %>
<%--
  Created by IntelliJ IDEA.
  User: lxl000000000
  Date: 2022/7/8
  Time: 16:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="./static/js/jquery-3.3.1.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="./static/js/vue.global.js" type="text/javascript" charset="utf-8"></script>
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
    />
    <style>
        .column .text { color: #f00 !important; }
        .cell { font-weight: bold; }

        .pagination {
            float: right;
            /* display: flex; */
            display: inline-block;
            padding-right: 0;
            margin: 0px 0px;
            border-radius: 4px;}
    </style>
</head>
<body>
<%
    AdminInfoDaoImpl adminDao = new AdminInfoDaoImpl();
    List<AdminInfo> supers=adminDao.selectAll();
    System.out.println("oList"+supers);
    request.setAttribute("oList",supers);

%>
<!-- ------------------------------------------------导航栏 ----------------------------->
<nav class="navbar navbar-expand-md bg-dark navbar-dark">
    <a class="navbar-brand" href="#.html">超级管理员</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="superAdmin_personal.jsp">个人信息</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">修改密码</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#.html"></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#.html"></a>
            </li>
        </ul>
        <span style="padding:0 0 0 900px"></span>

        <div class="dropdown">
            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" >
                欢迎，${sessionScope.loginAdmin.admin_name}
                <span class="caret"></span>
            </button>
            <!-- <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1" style="background-color: #CCFFFF; font-size: 20px; font-weight: 600;">
              <li role="presentation"><a role="menuitem" tabindex="-1" href="#">苹果</a></li>
              <li role="presentation"><a role="menuitem" tabindex="-1" href="#">香蕉</a></li>
            </ul> -->
            <div class="dropdown-menu">

                <a class="dropdown-item" href="../AdminLogin.jsp">切换用户</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="../AdminLogin.jsp">退出</a>

            </div>
        </div>
    </div>
</nav>
<%--------修改界面-------%>
<div class="animate__animated animate__bounceInLeft animate__delay-1.5s">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">
                    修改管理员
                </h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="window.location.href='superAdmin_home.jsp'"><span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" action="/DengLuZhuCe/AdminUpdateByid?id=${sessionScope.queryadmin.id}" method="post">
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" value="${sessionScope.queryadmin.admin_name}"
                                   placeholder="请输入管理员姓名" name="adminname">
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" value="${sessionScope.queryadmin.admin_password}"
                                   placeholder="请输入密码" name="adminpassword">
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" value="${sessionScope.queryadmin.admin_email}"
                                   placeholder="请输入邮箱" name="adminemail">
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">Phone</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" value="${sessionScope.queryadmin.admin_phone}"
                                   placeholder="请输入电话" name="adminphone">
                        </div>
                    </div>
<%--                    <div class="form-group">--%>
<%--                        <label  class="col-sm-2 control-label">类型</label>--%>
<%--                        <div class="col-sm-10">--%>
<%--                            <input type="text" class="form-control" value="${sessionScope.queryadmin.admin_sign}"--%>
<%--                                   placeholder="user或good或order" name="adminsign">--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    ---下拉框-----%>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">类型</label>
                        <div class="col-sm-10">
                            <select id="role" class="myloginul"  name="adminsign">
                                <option selected="selected" value="${sessionScope.queryadmin.admin_sign}" class="op">${sessionScope.queryadmin.admin_sign}</option>
                                <option value="user" class="op">user</option>
                                <option value="good" class="op">good</option>
                                <option value="order" class="op">order</option>
                            </select>
                        </div>
                    </div>
 <%--                    ---下拉框结束-----%>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <!-- <div class="checkbox">
                               <label>
                                  <input type="checkbox"> 请记住我
                               </label>
                            </div> -->
                        </div>
                    </div>
                    <div class="form-group">
                        <span style="padding-left: 15px;"></span>
                        <button type="submit" class="btn btn-primary">
                            确认修改
                        </button>
                    </div>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="window.location.href='superAdmin_home.jsp'">返回</button>
            </div>
        </div>
    </div>
</div>
</div>
</body>
</html>
