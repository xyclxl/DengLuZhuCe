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

<%--------用户管理员添加界面-------%>
<div class="animate__animated animate__bounceInLeft ">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">
                    添加用户
                </h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="window.location.href='userAdmin_home.jsp'"><span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" action="/DengLuZhuCe/UserZhuCeServlet" method="post">
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control"
                                   placeholder="请输入用户姓名" name="username">
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control"
                                   placeholder="请输入密码" name="password">
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control"
                                   placeholder="请输入邮箱" name="email">
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">Phone</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control"
                                   placeholder="请输入电话" name="phone">
                        </div>
                    </div>
                    <div class="form-group">
                        <span style="padding-left: 15px;"></span>
                        <button type="submit" class="btn btn-primary">
                            确认添加
                        </button>
                    </div>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="window.location.href='userAdmin_home.jsp'">返回</button>
            </div>
        </div>
    </div>
</div>
</div>
</body>
</html>
