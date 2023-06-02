<%--
  Created by IntelliJ IDEA.
  User: lxl000000000
  Date: 2022/7/19
  Time: 10:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8"/>
    <title>后台管理系统</title>
    <meta name="author" content="DeathGhost" />
    <link rel="stylesheet" type="text/css" href="../static/css/style.css" />
    <!--[if lt IE 9]>
    <script src="js/html5.js"></script>
    <![endif]-->
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
<!--header-->
<header>
    <h1><img style="position: absolute;left: 0;width: 210px;height: 54px;" src="../static/images/logo.png"/></h1>
    <ul class="rt_nav">
        <li><a href="http://h2design.taobao.com/" target="_blank" class="website_icon">站点首页</a></li>
        <li><a href="#" class="admin_icon">欢迎,${sessionScope.loginAdmin.admin_name}</a></li>
        <li><a href="#" class="set_icon">账号设置</a></li>
        <li><a href="login.php" class="quit_icon">安全退出</a></li>
    </ul>
</header>

<aside class="lt_aside_nav content" style="overflow: scroll">
    <h2><a href="../static/images/logo.png">登录页</a></h2>
    <ul>
        <li>
            <dl>
                <dt>商品信息</dt>
                <!--当前链接则添加class:active-->
                <dd><a href="goodAdmin_home.jsp">商品列表</a></dd>
                <dd><a href="goodAdmin_home_tianjia.jsp">商品添加</a></dd>
                <dd><a href="goodAdmin_home_xiugai.jsp" class="active">商品修改</a></dd>
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

<section class="rt_wrap content" style="overflow: scroll">
    <div class="rt_content">

        <section>
            <form action="/DengLuZhuCe/GoodsUpdateByid?id=${sessionScope.querygoods.id}" method="post" >
                <h2><strong style="color:grey;">商品修改</strong></h2>
                <ul class="ulColumn2">
                    <li>
                        <span class="item_name" style="width:120px;">商品编号：</span>
                        <input type="text" class="textbox textbox_295" placeholder="编号请按顺序" value="${sessionScope.querygoods.goodnum}" name="goodnum"/>
                        <span class="errorTips">*请按类型填写编号前缀</span>
                    </li>
                    <li>
                        <span class="item_name" style="width:120px;">商品名称：</span>
                        <input type="text" class="textbox textbox_295" placeholder="名称请写全" value="${sessionScope.querygoods.goodname}" name="goodname"/>
                        <span class="errorTips">*必填项</span>
                    </li>
                    <li>
                        <span class="item_name" style="width:120px;">类型：</span>
                        <select class="select"  name="goodtype">
                            <option selected="selected" value="${sessionScope.querygoods.goodtype}">${sessionScope.querygoods.goodtype}</option>
                            <option value="水果">水果</option>
                            <option value="蔬菜">蔬菜</option>
                            <option value="坚果">坚果</option>
                            <option value="硬件">硬件</option>
                            <option value="茶叶">茶叶</option>
                        </select>
                        <span class="errorTips">*必填项</span>
                    </li>
                    <li>
                        <span class="item_name" style="width:120px;">商品产地：</span>
                        <input type="text" class="textbox textbox_295" placeholder="产地注明" value="${sessionScope.querygoods.goodplace}" name="goodplace"/>
                        <span class="errorTips">*必填项</span>
                    </li>
                    <li>
                        <span class="item_name" style="width:120px;">价格：</span>
                        <input type="text" class="textbox textbox_295" placeholder="价格注明" value="${sessionScope.querygoods.goodprice}" name="goodprice"/>
                        <span class="errorTips">*必填项</span>
                    </li>
                    <li>
                        <span class="item_name" style="width:120px;">摘要：</span>
                        <textarea placeholder="摘要信息" class="textarea" style="width:500px;height:100px;"  name="gooddescribe">${sessionScope.querygoods.gooddescribe}</textarea>
                    </li>
                    <li>
                        <span class="item_name" style="width:120px;"></span>
                        <input type="submit" class="link_btn"/>
                    </li>
                </ul>
            </form>
        </section>
        <!--tabStyle-->
        <script>
            $(document).ready(function(){
                //tab
                $(".admin_tab li a").click(function(){
                    var liindex = $(".admin_tab li a").index(this);
                    $(this).addClass("active").parent().siblings().find("a").removeClass("active");
                    $(".admin_tab_cont").eq(liindex).fadeIn(150).siblings(".admin_tab_cont").hide();
                });
            });
        </script>

    </div>
</section>
</body>
</html>
