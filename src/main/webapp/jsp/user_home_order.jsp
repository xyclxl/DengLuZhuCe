<%@ page import="com.yang.mapper.OrderInfoDaoImpl" %>
<%@ page import="com.yang.javabean.OrderInfo" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: lxl000000000
  Date: 2022/7/6
  Time: 19:51
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
</head>
<body>

<c:set var="cI" value="${sessionScope.loginUser.user_name}" scope="request"></c:set>
<%
    String ordernum=(String) request.getAttribute("cI");
    OrderInfoDaoImpl orderDao = new OrderInfoDaoImpl();
    List<OrderInfo> oList=orderDao.userselectorderByName(ordernum);
    System.out.println("oList"+oList);
    request.setAttribute("oList",oList);
%>
<nav class="navbar navbar-expand-md bg-dark navbar-dark">
    <a class="navbar-brand " href="user_home.jsp">个人信息</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="#">修改密码</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">自律打卡</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">今日糖分摄入</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="user_home_good.jsp">本期主推产品</a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="user_home_order.jsp">我的订单</a>
            </li>
        </ul>
        <span style="padding:0 0 0 500px"></span>

        <div class="dropdown">

            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" >
                欢迎，${sessionScope.loginUser.user_name}
                <span class="caret"></span>
            </button>
            <!-- <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1" style="background-color: #CCFFFF; font-size: 20px; font-weight: 600;">
              <li role="presentation"><a role="menuitem" tabindex="-1" href="#">苹果</a></li>
              <li role="presentation"><a role="menuitem" tabindex="-1" href="#">香蕉</a></li>
            </ul> -->
            <div class="dropdown-menu">

                <a class="dropdown-item" href="userLogin.jsp">切换用户</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="userLogin.jsp">退出</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="/DengLuZhuCe/index.jsp">返回主页</a>
            </div>
        </div>

    </div>
</nav>
<p style="padding: 30px"></p>

<!-- -------------管理界面--------- -->
<div class="container-fluid">
    <div class="row">

        <div class="col-md-12">
            <h2>用户订单</h2>
            <%--------表单---------%>
            <table class="table" id="grid" data-ajax="true" data-selection="true" data-multi-select="true" data-url="UserSerlvt" data-toggle="bootgrid" class="table table-condensed table-hover table-striped">
                <tr>
                    <!-- <th>项目1</th> -->
                    <th data-column-id="id" data-formatter="id" data-identifier="true"  data-visible="true"  data-width="15px" data-align="left">订单id</th>
                    <th>订单顾客</th>
                    <th>订单商品</th>
                    <th>商品数量</th>
                    <th>商品类型</th>
                    <th>购买日期</th>
                    <th>删除</th>
                </tr>
                <c:forEach items="${requestScope.oList}" var="good">
                    <tr>
                        <!-- <td style="width:265px;"><div class="cut_title ellipsis">265px宽·长标题字符串截取，仅适合单行截取，多行截取程序定义一下。</div></td> -->
                        <td>${good.id}</td>
                        <td>${good.ordernum}</td>
                        <td>${good.ordername}</td>
                        <td>${good.ordernumber}</td>
                        <td>${good.ordertype}</td>
                        <td>${good.ordertime}</td>
                        <td>
                                <%--                            <a href="#">表内链接</a>--%>
                            <a href="/DengLuZhuCe/OrderDeleteByid?id=${good.id}" class="btn btn-danger btn-sm" id="deletebtn" onclick="javascript:return del()">x</a>
                        </td>
                    </tr>
                    <script>
                        function del(){
                            var retVal = confirm("你确定要删除吗");
                            if( retVal == true ) {
                                <%--window.location.href("/DengLuZhuCe/AdminDeleteByid?id=${good.id}")--%>
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
