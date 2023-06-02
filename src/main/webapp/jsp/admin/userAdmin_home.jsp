<%@ page import="com.yang.mapper.UserInfoDaoImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="com.yang.javabean.UserInfo" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/7/7
  Time: 23:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">

    <script src="../static/js/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="../static/css/fonts/font.css">
    <title>用户管理员后台</title>
    <!-- 引入字体图标 -->
    <style>
        .mylabel{
            height: 40px;
            outline-style: none ;
            border: 1px solid #ccc;
            border-radius: 3px;
            padding: 14px 14px;
            width: 620px;
            font-family: "Microsoft soft";
        }
        *{
            /* 初始化 */
            margin: 0;
            padding: 0;
        }
        body{
            /* 100%窗口宽度和高度 */
            width: 100vw;
            height: 100vh;
            /* 溢出隐藏 */
            overflow: hidden;
            /* 设置背景 */
            background: url("../static/images/clock.gif") no-repeat;
            background-size: cover;
        }
        .container{
            width: 100%;
            height: 100%;
            /* 弹性布局 水平排列 */
            display: flex;
        }
        /* 字体图标 */
        .icon{
            color: #fff;
            font-size: 24px;
        }
        /* 左侧导航栏 */
        .left-box{
            width: 250px;
            height: 100%;
            /* 半透明背景 */
            background-color: rgba(0,0,0,0.65);
            /* 背景模糊（毛玻璃） */
            backdrop-filter: blur(30px);
            /* 相对定位 */
            position: relative;
            color: #fff;
            font-size: 14px;
            /* 弹性布局 垂直排列 */
            display: flex;
            flex-direction: column;
            /* 设置过渡 */
            transition: 0.5s ease;
            /* 不让文字换行 */
            white-space: nowrap;
        }
        .left-box ul{
            list-style: none;
            width: 90%;
            margin: 25px auto;
            /* 高度铺满 */
            flex: 1;
        }
        .left-box li{
            height: 46px;
            /* 弹性布局 垂直居中 */
            display: flex;
            align-items: center;
            padding-left: 12px;
            border-radius: 10px;
            cursor: pointer;
            /* 过渡 */
            transition: 0.3s;
        }
        /* 选中态样式 */
        .left-box li.active,
        .left-box li.active:hover{
            background-color: rgba(255,255,255,0.2);
        }
        .left-box li:hover{
            background-color: rgba(255,255,255,0.1);
        }
        .left-box hr{
            width: 90%;
            margin: 18px auto;
            border: none;
            border-top: 1px solid rgba(255,255,255,0.2);
        }
        .left-box .icon{
            margin-right: 16px;
        }
        /* 用户信息区域 */
        .user-info{
            border-top: 1px solid rgba(255,255,255,0.2);
            display: flex;
            align-items: center;
            padding: 24px;
        }
        .user-info img{
            width: 32px;
            height: 32px;
            border-radius: 50%;
            object-fit: cover;
            margin-right: 14px;
        }
        .user-info span{
            flex: 1;
        }
        .user-info .icon{
            font-size: 20px;
            margin-right: 0;
        }
        /* 右侧区域 */
        .right-box{
            background-color: #0f0f11;
            flex: 1;
            position: relative;
            display: flex;
            flex-direction: column;
        }
        .right-box .top{
            margin: 25px 35px;
            display: flex;
            align-items: center;
            height: 46px;
        }
        .right-box .top .current-tag{
            flex: 1;
            color: #fff;
            font-weight: 600;
        }
        .right-box .top .btn{
            width: 32px;
            height: 32px;
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 50%;
        }
        .right-box .top .btn:last-child{
            background-color: #446dff;
            margin-left: 20px;
        }
        .right-box .products{
            flex: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #222;
            /* font-size: 6vw; */
            font-weight: bold;
            text-transform: uppercase;
            color: white;
        }
        .products {
            width: 100%;
            /* border: 1px solid #ddd;   边框待注释 */
            height: 300px;
        }
        .products .main {
            float: left;
            display: none;
        }
        .products .main.selected {
            display: block;
        }
        /* 展开收起开关 */
        .right-box .handler{
            width: 10px;
            height: 50px;
            /* 绝对定位 垂直居中 */
            position: absolute;
            left: 10px;
            top: 50%;
            transform: translateY(-50%);
            z-index: 1;
            /* 光标变小手 */
            cursor: pointer;
            /* 默认不透明度为0 */
            opacity: 0;
            /* 过渡 */
            transition: opacity 0.3s;
        }
        .right-box .handler::before,
        .right-box .handler::after{
            content: "";
            background-color: rgba(255,255,255,0.2);
            position: absolute;
            left: 0;
            width: 100%;
            height: 50%;
            border-radius: 10px 10px 0 0;
            /* 过渡 */
            transition: 0.2s;
        }
        .right-box .handler::after{
            bottom: 0;
            border-radius: 0 0 10px 10px;
        }
        .right-box:hover .handler{
            opacity: 1;
        }
        .right-box .handler:hover::before{
            transform: skewX(-15deg);
        }
        .right-box .handler:hover::after{
            transform: skewX(15deg);
        }
        .right-box .handler.close:hover::before{
            transform: skewX(15deg);
        }
        .right-box .handler.close:hover::after{
            transform: skewX(-15deg);
        }
        .button {
            background-color: #4CAF50; /* Green */
            border: none;
            color: white;
            padding: 16px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin-right: 4px;
            margin: 4px 0;
            transition-duration: 0.4s;
            cursor: pointer;
        }

        .button1 {
            background-color: white;
            color: black;
            border: 2px solid #4CAF50;
        }

        .button1:hover {
            background-color: #4CAF50;
            color: white;
        }

        .button2 {
            background-color: white;
            color: black;
            border: 2px solid #008CBA;
        }

        .button2:hover {
            background-color: #008CBA;
            color: white;
        }
        .delectbtn{
            text-decoration : none;
            padding : 3px 3px;
            background : red;
            color:#fff;
        }
        .modifybtn{
            text-decoration : none;
            padding : 3px 3px;
            background : rgb(0,123,255);
            color:#fff;
        }

        td:hover{
            color: #0c9076;
        }
        a{
            text-decoration: none;
            color: white;
        }
    </style>
</head>
<body>
<%
    UserInfoDaoImpl userDao = new UserInfoDaoImpl();
    List<UserInfo> user=userDao.selectAll();
    System.out.println("oList"+user);
    request.setAttribute("oList",user);

%>
<div class="container">
    <div class="left-box">
        <ul>
            <li class="item active">
                <i class="icon icon-like"></i>
                用户信息管理
            </li>
            <li class="item">
                <i class="icon icon-file"></i>
                基本信息
            </li>
            <li class="item">
                <i class="icon icon-album"></i>
                修改密码
            </li>
            <li class="item">
                <i class="icon icon-vault"></i>
                用户打卡管理
            </li>
            <li class="item">
                <i class="icon icon-favorite"></i>
                高糖食品管理
            </li>
            <li class="item">
                <i class="icon icon-trash"></i>
                回收站
            </li>
            <hr><a href="../AdminLogin.jsp">
            <li class="item">
                <i class="icon icon-transfer"></i>
                重新登录
            </li></a>
        </ul>
        <div class="user-info">
            <img src="../static/images/clock.gif" alt="">
            <span><p>欢迎,${sessionScope.loginAdmin.admin_name}</p></span>
            <i class="icon icon-gear"></i>
        </div>
    </div>
    <div class="right-box">
        <div class="top">
            <span class="current-tag">基本信息</span>
            <div class="btn">
                <i class="icon icon-search"></i>
            </div>
            <div class="btn">
                <i class="icon icon-add"></i>
            </div>
        </div>
        <div class="products">
            <div class="main selected">
        <span class="a"><%--            第一个分页签内容--%>
            <!-- -------------管理界面--------- -->
                <section class="rt_wrap content mCustomScrollbar">
        <div class="rt_content">
            <!-- ----------------------------- -->
            <br><br><br><br><br><br><br><br><br>

<%--            <h2><strong style="color:grey;">页面标题及表格/分页（根据具体情况列入重点，切勿放置可扩展内容不定的数据）</strong></h2>--%>
            <div class="page_title">
<%--                <h2 class="fl">例如产品详情标题</h2>--%>
                <button style="width: 145px" class="button button1" onclick="window.location.href='userAdmin_home_tianjia.jsp'">添加</button>
                <button style="width: 145px" class="button button2">查询</button>
            </div>
            <div style="height: 500px;overflow-y: scroll">
            <table class="table" rules=rows cellspacing=0 align=right style=" height: 500px;overflow: scroll;">
                <tr style="background: white;overflow-y: scroll;
font-family: fantasy;
font-size: 24px;
font-style: italic;
font-weight: bold;
color: #000000;
line-height: 60px;
text-align: center;
  justify-content: center;
text-decoration: underline;">
                    <!-- <th>项目1</th> -->
                    <th style="width: 150px">用户id</th>
                    <th style="width: 150px">用户名</th>
                    <th style="width: 150px">用户密码</th>
                    <th style="width: 150px">用户邮箱</th>
                    <th style="width: 150px">用户电话</th>
                    <th style="width: 150px">操作</th>
                </tr>
                <c:forEach items="${requestScope.oList}" var="user">
                <tbody style="overflow: scroll;scrollbar-face-color: #889B9F;">
                <tr style="background: white;">
                    <!-- <td style="width:265px;"><div class="cut_title ellipsis">265px宽·长标题字符串截取，仅适合单行截取，多行截取程序定义一下。</div></td> -->
                    <td align="center" height="30px">${user.id}</td>
                    <td align="center">${user.user_name}</td>
                    <td align="center">${user.user_password}</td>
                    <td align="center">${user.user_email}</td>
                    <td align="center">${user.user_phone}</td>
                    <td align="center">
                        <a href="/DengLuZhuCe/UserDeleteByid?id=${user.id}" class="delectbtn" id="deletebtn" onclick="javascript:return del()">删除</a>
                        <a href="/DengLuZhuCe/UserQueryByid?id=${user.id}" class="modifybtn">修改</a>
                    </td>
                </tr>
            </tbody>
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
</section>
<%--    -----用户信息管理到此结束------%>
        </span>
            </div>
            <div class="main">
        <span class="a">
                                                   <!------------------------------管理员信息开始----------------------------->
                                       <div class="right-style" id="1"><br><br><br><br><br><br><br><br><br><br>
                                        <h2 style="text-align: center;">用户管理员信息</h2>
                                        <hr style="border: solid 1px #666666">
                                        <div class="right-info-style">
                                            <span>编号：<input type="text" class="mylabel" id="txtNum" readonly="readonly"
                                                            value="${sessionScope.loginAdmin.id}"></span>
                                        </div>
                                        <div class="right-info-style">
                                            <span>姓名：<input type="text" class="mylabel" id="txtName" readonly="readonly"
                                                            value="${sessionScope.loginAdmin.admin_name}" ></span>
                                        </div>
                                        <div class="right-info-style">
                                            <span>邮箱：<input type="text" class="mylabel" id="txtEmail"
                                                            readonly="readonly" value="${sessionScope.loginAdmin.admin_email}" ></span>
                                        </div>
                                           <!-- <div class="right-info-style"><span>联系电话：<input type="text" id="txtTel" readonly="readonly" value="13876543210" style="border:none;"></span></div> -->
                                           <!-- <div class="right-info-style"><span>常用邮箱：<input type="text" id="txtEmail" readonly="readonly" value="1091313628@qq.com" style="border:none;"></span></div> -->
                                        <div class="right-info-style">
                                            <span>电话：<input type="text" id="txtPhone" class="mylabel"
                                                            readonly="readonly" value="${sessionScope.loginAdmin.admin_phone}" ></span>
                                        </div>
                                        <div class="right-info-style">
                                            <span>注册：<input type="text" id="txtSubTime" class="mylabel"
                                                            readonly="readonly" value="${sessionScope.loginAdmin.subtime}"
                                            ></span>
                                        </div>
                                        <div id="div_update" style="text-align: center; margin-top: 3%;">
                                            <input  type="button" style="width: 60%;height: 40px;" value="修改"
                                                    onclick="updateAdmin()">
                                        </div>
                                        <div id="div_save" style="text-align: center; margin-top: 6%;display:none;">
                                            <input  type="button" style="width: 20%;" value="保存"
                                                    onclick="saveAdmin()"><input id="cancelbtn" type="button"
                                                                                 style="width: 20%;" value="取消" onclick="updateAdminCancel()()">
                                        </div>
                                    </div>
            <!------------------------------管理员信息结束------------------------------>
        </span>
            </div>
<%--            ---修改密码开始-----%>
            <div class="main">
        <span class="a">
            <p>用户管理员暂不提供修改密码服务，如需修改密码请联系超级管理员</p>
        </span>
            </div>
<%--            ---修改密码到此结束-----%>
<%--            ---用户打卡管理开始-----%>
            <div class="main">
        <span class="a">
            <p>用户打卡管理开发中</p>
        </span>
            </div>
<%--            ---用户打卡管理到此结束-----%>
<%--            ---高糖食品管理开始-----%>
            <div class="main">
        <span class="a">
            <p>高糖食品管理开发中</p>
        </span>
            </div>
 <%--            ---高糖食品管理到此结束-----%>
<%--            ---回收站-----%>
            <div class="main">
        <span class="a">
            <p>回收站开发中</p>
        </span>
            </div>
<%--            ---回收站到此结束-----%>
        </div>
        <!-- ----------------- -->
        <div class="handler"></div>
    </div>
</div>
<script>
    // 获取要操作的元素
    let items=document.querySelectorAll('.item');
    let current_tag=document.querySelector('.current-tag');
    let handler=document.querySelector('.handler');
    let left_box=document.querySelector('.left-box');

    // 设置选中项的样式
    function setActive(){
        items.forEach((item)=>{
            item.classList.remove('active');
        })
        this.classList.add('active');
        current_tag.innerText=this.innerText;
    }
    // 为每一个li设置点击事件
    items.forEach((item)=>{
        item.addEventListener('click',setActive);
    })

    handler.addEventListener('click',function(){
        if(!this.classList.contains('close')){
            left_box.style.width=0;
            this.classList.add('close');
        }else{
            left_box.style.width=250+'px';
            this.classList.remove('close');
        }
    })
    $(function () {
        $(".container .item").click(function () {
            $(this).addClass("active").siblings().removeClass("active");
            $(".products .main").eq($(this).index()).show().siblings().hide();
        })
    })
</script>
</body>
</html>
