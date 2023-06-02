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
<%------搜索框------%>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="form-inline"  >
                <div class="input-group">
                    <div class="form-group">
                        <div class="col-sm-10">
                            <select id="role" class="myloginul"  name="adminsign">
                                <option selected="selected" value="" class="op">请选择</option>
                                <option value="id" class="op">id</option>
                                <option value="姓名" class="op">姓名</option>
                                <option value="权限" class="op">权限</option>
                            </select>
                        </div>
                    </div>
                    <input type="text" style="width: 300px;" class="form-control input-sm" placeholder="" id="searchStr" value="">
                    <button type="button" class="btn btn-success">查询</button>
                </div>
            </div>
            <table class="table" id="grid" data-ajax="true" data-selection="true" data-multi-select="true" data-url="UserSerlvt" data-toggle="bootgrid" class="table table-condensed table-hover table-striped">
                <tr>
                    <th data-column-id="id" data-formatter="id" data-identifier="true"  data-visible="true"  data-width="15px" data-align="left">ID</th>
                    <th>管理员姓名</th>
                    <th>管理员密码</th>
                    <th>管理员邮箱</th>
                    <th>管理员电话</th>
                    <th>注册时间</th>
                    <th>权限</th>
                    <th>删除</th>
                    <th>修改</th>
                </tr>
                <c:forEach items="${requestScope.oList}" var="good">
                    <tr>
                        <td>${good.id}</td>
                        <td>${good.admin_name}</td>
                        <td>${good.admin_password}</td>
                        <td>${good.admin_email}</td>
                        <td>${good.admin_phone}</td>
                        <td>${good.subtime}</td>
                        <td>${good.admin_sign}</td>
                        <td>
                            <a href="/DengLuZhuCe/AdminDeleteByid?id=${good.id}" class="btn btn-danger btn-sm" id="deletebtn" onclick="javascript:return del()">x</a>
                        </td>
                        <td>
                            <a href="/DengLuZhuCe/AdminQueryByid?id=${good.id}" class="btn btn-secondary">修改</a>
                        </td>
                    </tr>
                    <script>
                        function del(){
                            var retVal = confirm("你确定要删除吗");
                            if( retVal == true ) {
                                return true;
                            }
                            else {
                                // window.location.href()
                                return false;
                            }
                        }
                    </script>
                </c:forEach>
            </table>
        </div>
    </div>
</div>
</body>
</html>
