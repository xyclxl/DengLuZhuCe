<%@ page import="com.yang.mapper.GoodsInfoDaoImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="com.yang.javabean.GoodsInfo" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/6/30
  Time: 23:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8"/>
    <title>商品管理员后台</title>
    <meta name="author" content="" />
    <link rel="stylesheet" type="text/css" href="../static/css/style.css" />
    <script src="../static/js/jquery.js"></script>
    <script src="../static/js/jquery.mCustomScrollbar.concat.min.js"></script>
    <script>
        (function($){
            $(window).load(function(){
                $("a[rel='load-content']").click(function(e){
                    e.preventDefault();
                    var url=$(this).attr("href");
                    $.get(url,function(data){
                        $(".content .mCSB_container").append(data); //load new content inside .mCSB_container
                        //scroll-to appended content
                        $(".content").mCustomScrollbar("scrollTo","h2:last");
                    });
                });

                $(".content").delegate("a[href='top']","click",function(e){
                    e.preventDefault();
                    $(".content").mCustomScrollbar("scrollTo",$(this).attr("href"));
                });
            });
        })(jQuery);
    </script>
    <style>
        .table td .inner_btn{background:#F9F;color:white;padding:5px 8px;border-radius:2px;}
        .table td .inner_btn:hover{background:#ffa4ff;color:#f8f8f8;}
        .table td .inner2_btn{background:rgb(23,162,184);color:white;padding:5px 8px;border-radius:2px;}
        .table td .inner2_btn:hover{background:rgba(23,162,184,0.8);color:#f8f8f8;}
        td
        {
            text-align:center;
        }
    </style>
</head>
<body>
<%
    GoodsInfoDaoImpl goodsDao = new GoodsInfoDaoImpl();
    List<GoodsInfo> oList=goodsDao.selectGoodsByName();
    System.out.println("oList"+oList);
    request.setAttribute("oList",oList);

%>
<!--header-->
<header>
    <h1><img style="position: absolute;left: 0;width: 210px;height: 54px;" src="../static/images/logo.png"/></h1>
    <ul class="rt_nav">
        <li><a href="/DengLuZhuCe/index.jsp" target="_blank" class="website_icon">站点首页</a></li>
        <li><a href="#" class="admin_icon">欢迎,${sessionScope.loginAdmin.admin_name}</a></li>
        <li><a href="#" class="set_icon">账号设置</a></li>
        <li><a href="/DengLuZhuCe/jsp/AdminLogin.jsp" class="quit_icon">安全退出</a></li>
    </ul>
</header>

<!--aside nav-->
<aside class="lt_aside_nav content " style="overflow: scroll">
    <h2><a href="../AdminLogin.jsp">登录页</a></h2>
    <ul>
        <li>
            <dl>
                <dt>商品信息</dt>
                <!--当前链接则添加class:active-->
                <dd><a href="goodAdmin_home.jsp" class="active">商品列表</a></dd>
                <dd><a href="goodAdmin_home_tianjia.jsp">商品添加</a></dd>
                <dd><a href="#">商品修改</a></dd>
                <dd><a href="#">商品查询</a></dd>
            </dl>
        </li>
        <li>
            <dl>
                <dt>订单信息</dt>
                <dd><a href="#">订单列表</a></dd>
                <dd><a href="#">添加订单</a></dd>
                <dd><a href="#">缺货登记</a></dd>
            </dl>
        </li>
        <li>
            <dl>
                <dt>会员管理</dt>
                <dd><a href="#">会员列表</a></dd>
                <dd><a href="#">添加会员</a></dd>
                <dd><a href="#">会员等级</a></dd>
                <dd><a href="#">资金管理</a></dd>
            </dl>
        </li>
    </ul>
</aside>
<section class="rt_wrap content " style="overflow: scroll">
    <div class="rt_content">
        <!-- ----------------------------- -->
        <h2><strong style="color:grey;"></strong></h2>
        <div class="page_title">
            <h2 class="fl">所有产品详情</h2>
            <a class="fr top_rt_btn">查询</a>
            <a class="fr top_rt_btn" href="goodAdmin_home_tianjia.jsp">添加</a>
        </div>
        <table class="table">
            <tr>
                <th>编号</th>
                <th>图片</th>
                <th>商品名</th>
                <th>商品类型</th>
                <th>产地</th>
                <th>销售价格</th>
                <th>描述</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${requestScope.oList}" var="good">
            <tr>
                <td>${good.id}</td>
                <td><img style="width:100px;height: 100px" src="../static/images/${good.goodurl}" alt=""></td>
                <td>${good.goodname}</td>
                <td>${good.goodtype}</td>
                <td>${good.goodplace}</td>
                <td>${good.goodprice}</td>
                <td>${good.gooddescribe}</td>
                <td>
                    <a href="/DengLuZhuCe/GoodsDeleteByid?id=${good.id}" class="inner_btn" id="deletebtn" onclick="javascript:return del()">删除</a>
                    <a href="/DengLuZhuCe/GoodsQueryById?id=${good.id}" class="inner2_btn">修改</a>
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
<%--            -----循环到此-----%>
        </table>
    </div>
</section>

</body>
</html>
