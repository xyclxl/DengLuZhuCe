<%--
  Created by IntelliJ IDEA.
  User: lxl000000000
  Date: 2022/7/6
  Time: 11:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title>宣传主页</title>
    <!-- bootstrap轮播图 -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <!-- vue动画 -->
    <!-- //css引入 -->
    <%--<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">--%>
    <link rel="stylesheet" href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css">
    <script src="./static/js/vue.global.js" type="text/javascript" charset="utf-8"></script>
    <!-- animate动画 -->
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <style>
        /*公共样式*/
        body,p,ul,li,dl,dt,dd,h1,h2,h3,h4,img{
            margin:0;
            padding:0;
            border:0;
        }
        /*汉堡菜单的样式*/
        .menu{
            width: 50px;
            height: 70px;
        }
        .menu img{
            width: 50px;
            height: 70px;
        }
        .header ul li{
            display: inline-block;
        }
        input[type="checkbox"],.menu{
            position: absolute;
            top:3px;
            /* 		bottom: 10px; */
            /* left:0%; */
            display: none;
        }
        /* -------------------媒体查询的样式------------------ */
        /* For mobile phones: */
        [class*="col-"] {
            width: 100%;
        }
        @media only screen and (min-width: 600px) {
            /* For tablets: */
            .col-m-1 {width: 8.33%;}
            .col-m-2 {width: 16.66%;}
            .col-m-3 {width: 25%;}
            .col-m-4 {width: 33.33%;}
            .col-m-5 {width: 41.66%;}
            .col-m-6 {width: 50%;}
            .col-m-7 {width: 58.33%;}
            .col-m-8 {width: 66.66%;}
            .col-m-9 {width: 75%;}
            .col-m-10 {width: 83.33%;}
            .col-m-11 {width: 91.66%;}
            .col-m-12 {width: 100%;}
        }
        @media only screen and (min-width: 768px) {
            /* For desktop: */
            .col-1 {width: 8.33%;}
            .col-2 {width: 16.66%;}
            .col-3 {width: 25%;}
            .col-4 {width: 33.33%;}
            .col-5 {width: 41.66%;}
            .col-6 {width: 50%;}
            .col-7 {width: 58.33%;}
            .col-8 {width: 66.66%;}
            .col-9 {width: 75%;}
            .col-10 {width: 83.33%;}
            .col-11 {width: 91.66%;}
            .col-12 {width: 100%;}
        }
        /* ------------------菜单的媒体查询------------------------- */
        /*小于640px，media媒体查询*/
        @media only screen and (max-width:640px) {
            ul{
                display: none;
            }
            .menu{
                display: block;
            }
            input[type="checkbox"]:checked~ul{
                display:block ;
            }
            .header{
                padding: 30px;
            }
            nav ul li{
                display: block;
                width: 100%;
                text-align: center;
                padding: 7px 0 5px 0;
            }
            nav li a{
                font-size: 1.4rem;
            }
            #menu img{/* //logo图片 */
                position:relative;
                /* 					bottom: 5px; */
            }
        }
        #menu{
            width: 80%;
            list-style-type: none;
            margin: 0;
            padding: 0;
            overflow: hidden;
            background-color: white;
        }
        #menu li{
            float: right;
            padding-top:5px ;
        }
        #menu li a {
            display: block;
            color: #000000;
            text-align: center;
            padding: 20px 25px;
            text-decoration: none;
            /* 	border-radius: 3px; */
            font-size: 16px;
        }
        #menu li a:hover {
            background-color: rgb(71,135,223);
            color: white;
        }
        .active{
            background-color: rgb(71,135,223);
        }
        #menu img{   /* logo图片 */
            height: 70px;
            width: 140px;
        }

        /* ---------登录按钮-------- */
        .logobtn1 {
            position: absolute;
            top: 7px;
            right:350px;
            display: block;
            height: 40px;
            padding:  0em 2em;
            cursor: pointer;
            transition: 800ms ease all;
            outline: none;
            margin: 10px;
        }

        /* ------------------上面logobtn2，下面logobtn2;----------------- */
        .logobtn2 {
            position: absolute;
            top: 7px;
            right:220px;
            display: block;
            height: 40px;
            padding:  0em 2em;
            cursor: pointer;
            transition: 800ms ease all;
            outline: none;
            margin: 10px;
        }
        /* 底部 */
        .web_footer {
            width: 100%;
            height: 240px;
            background-color: #353535;
        }
        .web_footer>.footer_top {
            width: 1000px;
            height: 120px;
            margin: 0 auto;
            display: flex;
        }
        .web_footer>.footer_top>.top_box1 {
            width: 400px;
            height: 100%;
            justify-content: center;
            left: 30px;
            position: relative;
        }

        .web_footer>.footer_top>.top_box1>.box1_1 {
            position: absolute;
            width: 250px;
            height: 100px;
            top: 30%;
        }

        .web_footer>.footer_top>.top_box1>.box1_1>.box1_1_1 {
            width: 50px;
            height: 50px;
            float: left;
        }
        .web_footer>.footer_top>.top_box1>.box1_1>.h {
            overflow: hidden;
            margin-top: 8px;
            width: 2px;
            height: 40px;
            background-color: black;
            float: left;
        }
        .web_footer>.footer_top>.top_box1>.box1_1>.box1_1_3>.h2 {
            width: 176px;
            height: 65px;
            float: left;
            margin-left: 10px;
            color: white;
            font-size: 16px;
        }
        .web_footer>.ht {
            margin: 0 auto;
            width: 100%;
            max-width: 1050px;
        }
        .web_footer>p {
            text-align: center;
            color: #757575;
        }
        .web_copyright {
            height: 160px;
            background-color: #222222;
            color: white;
            text-align: center;
            margin-top: -15px;
        }
        .web_copyright>p {
            padding-top: 50px;
            margin-top: 5px;
            font-weight: lighter;
        }

        .hardware-bg{
            background: url(./jsp/static/images/背景图3.jpg) no-repeat top center;
            width: 100%;
            min-height: 580px;
            position: relative;
        }
        .hardware-bg p {
            text-align: center;
            height: 77px;
            line-height: 77px;
            font-size: 16px;
            color: #999;
        }
        .box1 p,.box2 p,.box3 p,.box4 p{
            font-size: 16px;
            color: #FFFFFf;
            text-align: center;
        }
        .box1 h3,.box2 h3,.box3 h3,.box4 h3{
            font-size: 24px;
            color: #FFFFFf;
            text-align: center;
        }
        .box1{
            background-color: rgb(64,186,222);
            width: 430px;
            height: 400px;
        }
        .box1 img,.box2 img,.box3 img,.box4 img{
            position: relative;
            bottom: 0;
            width: 138px;
            height: 281px;
            margin-left: -69px;
            left: 50%;
        }
        .box2{
            background-color: rgb(242,183,52);
            width: 430px;
            height: 400px;
        }
        .box3{
            background-color: rgb(183,153,241);
            width: 430px;
            height: 400px;
        }
        .box4{
            background-color: rgb(48,196,164);
            width: 430px;
            height: 400px;
        }
        .box-top,.box-bottom{
            align-items: center;
            display: flex;

        }
        .boxs{
            display: flex;
            flex-wrap: wrap;
            /*让弹性盒元素在必要的时候拆行*/
            justify-content: center;
            /*在弹性盒对象的元素中的各项周围留有空白*/
        }
    </style>
</head>
<body>
<!--菜单-->
<header class="header">
    <nav>
        <input type="checkbox" id="togglebox" />
        <ul id="menu">
            <span style="padding-left:255px;"></span>
            <img src="./jsp/static/images/logo.png">
            <!-- 由于向右浮动，导致顺序是反的 -->
            <li><p style="padding-left: 220px;"></p></li>
            <li><a href="#">关于我们</a></li>
            <li><a href="推荐产品.jsp">推荐产品</a></li>
            <li><a class="active" href="#">智能硬件</a></li>
            <li><a  href="index.jsp">首页</a></li>
        </ul>
        <label for="togglebox" class="menu">
            <img src="./jsp/static/images/导航条.png" alt="汉堡图标" >
        </label>
    </nav>
</header>
<%------测试段开始------%>
<c:choose>
    <c:when test="${ not empty sessionScope.loginUser}">
        <div style="position: absolute;top:10px;right: 307px;"><i class="fa fa-user" style="font-size: 30px;line-height: 60px;"></i></div>
        <div class="dropdown" style="position: absolute;top:17px;right: 200px;">

            <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                欢迎,${sessionScope.loginUser.user_name}
            </button>
            <div class="dropdown-menu dropdown-menu-right" data-display="static" aria-labelledby="dropdownMenuButton">
                <a class="dropdown-item" href="jsp/user_home.jsp">个人中心</a>
                <a class="dropdown-item" href="jsp/userLogin.jsp">安全退出</a>
                <a class="dropdown-item" href="/DengLuZhuCe/UserZhuXiaoServlet">注销登录</a>
            </div>
        </div>
    </c:when>
    <c:otherwise>
        <a href="./jsp/userLogin.jsp"><button type="button" class="logobtn1 btn btn-outline-primary">登录</button></a>
        <a href="./jsp/register.jsp"><button type="button" class="logobtn2 btn btn-outline-primary">注册</button></a>
    </c:otherwise>
</c:choose>
<%------测试段结束------%>
<div style="background: url(./jsp/static/images/背景图.png) no-repeat;">
    <p><span style="margin: 80px"></span></p>
    <p style="padding: 10px;"></p>
    <div class="hardware-bg">
        <p>·糖护士智能硬件在京东天猫均有售卖·</p>
        <div class="boxs">
            <div class="box-top">
                <div class="box1">
                    <div align="center"><h3>手机血糖仪</h3></div>
                    <p>注册证号：湘食药监械（准）字2014第2400052号</p>
                    <img src="./jsp/static/images/硬件1.png" alt="">
                </div>
                <div class="box2">
                    <div align="center"><h3 >血糖尿酸测试仪</h3></div>
                    <p>注册证号：湘械注准20202221173</p>
                    <img src="./jsp/static/images/硬件2.png" alt="">
                </div>
            </div>
            <div class="box-bottom">
                <div class="box3">
                    <h3>多参数健康监测仪M100</h3>
                    <p>血糖·血压·心电·血氧 慢病会员管理系统</p>
                    <img src="./jsp/static/images/硬件3.png" alt="">
                </div>
                <div class="box4">
                    <h3>荷型血糖仪</h3>
                    <p>注册证号：湘械注准20162400048</p>
                    <img src="./jsp/static/images/硬件4.png" alt="">
                </div>
            </div>
        </div>
    </div>
    <!--footer-->
    <div class="web_footer">
        <div class="footer_top">
            <!-- 脚部盒子1 -->
            <div class="top_box1">
                <div class="box1_1">
                    <div class="box1_1_1"><img src="image/AD0Iu_ufBxAEGAAg6drLzwUojPKl6gcwMjgy.png" alt=""></div><div class="h"></div>
                    <div class="box1_1_3">
                        <div class="h2">
                            地址<br>
                            新余市渝水区新余学院<br>
                            20计科二班
                        </div>
                    </div>
                </div>
            </div>
            <!-- 脚部盒子2 -->
            <div class="top_box1">
                <div class="box1_1">
                    <div class="box1_1_1"><img src="image/AD0Iu_ufBxAEGAAg7drLzwUotoT08wQwMjgy.png" alt=""></div><div class="h"></div>
                    <div class="box1_1_3">

                        <div class="h2">
                            电话<br>
                            7758-12345678
                        </div>

                    </div>
                </div>
            </div>
            <!-- 脚部盒子2 -->
            <div class="top_box1">
                <div class="box1_1">
                    <div class="box1_1_1"><img src="image/AD0Iu_ufBxAEGAAg8NrLzwUortDrqwUwMjgy.png" alt=""></div>
                    <div class="h"></div>
                    <div class="box1_1_3">

                        <div class="h2">
                            邮箱<br>
                            1976355584@qq.com
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <!-- 横线 -->
        <div class="ht">
		<span>
		</span>
        </div>
        <p>
            首页 &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
            | &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
            关于我们   &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
            | &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
            在线留言    &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
            |&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
            茶品资讯     &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
            |&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
            联系我们
        </p>
    </div>
    <div class="web_copyright">
        <p>©2022 新余市新余学院 版权所有<br>
            电脑版 | 管理登录 | 赣ICP备123456789号</p>
    </div>
</div>
</div>
</body>
</html>
