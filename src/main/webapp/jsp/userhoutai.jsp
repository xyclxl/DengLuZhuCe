<%--
  Created by IntelliJ IDEA.
  User: lxl000000000
  Date: 2022/7/15
  Time: 14:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>欢迎,${sessionScope.loginUser.user_name}</h2>
<h1><a href="/DengLuZhuCe/UserZhuXiaoServlet">注销</a></h1>
<h1><a href="userLogin.jsp">退出</a></h1>
</body>
</html>
