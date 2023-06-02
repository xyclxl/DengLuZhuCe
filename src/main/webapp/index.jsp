<%--
  Created by IntelliJ IDEA.
  User: lxl000000000
  Date: 2022/7/4
  Time: 10:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<meta charset="utf-8">
<title>宣传主页</title>
<!-- bootstrap轮播图 -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- jquery下拉框 -->
<script src="./jsp/static/js/jquery-3.3.1.min.js"></script>
<!-- //css引入 -->
<%--<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">--%>
<link rel="stylesheet" href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css">

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
    /* --------------------------带标题的动画盒子----------------------- */
    .imgboxs1{
        display: flex;
        justify-content: center;
        align-items: center;
        background-color: rgb(71,135,223);
    }
    .container2{
        /* 弹性布局 允许换行 水平居中 */
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
    }
    .card1{
        width: 310px;
        height: 200px;
        overflow: hidden;
        margin: 10px;
        background-color: rgb(53,53,53);
        color: #fff;
        cursor: pointer;
        position: relative;
    }
    .card1 img{
        width: 100%;
        height: 100%;
        /* 设置过渡 */
        transition: 0.35s;
    }
    .card1 .text{
        position: absolute;
        top: 30px;
        left: 30px;
        bottom: 30px;
        right: 30px;
        padding: 0 18px;
    }
    .card1 .text::before{
        content: "";
        position: absolute;
        top: 0;
        bottom: 0;
        right: 0;
        left: 100%;
        border-left: 4px solid rgba(255,255,255,0.8);
        background-color: rgba(255,255,255,0.5);
        opacity: 0;
        bottom: 0;
        left: 100%;
        /* 过渡 */
        transition: 0.5s;
        /* 过渡延迟时间 */
        transition-delay: 0.6s;
    }
    .card1 .text h2,
    .card1 .text p{
        margin-bottom: 6px;
        opacity: 0;
        transition: 0.35s;
    }
    .card1 .text h2{
        font-weight: 300;
        text-transform: uppercase;
        transform: translate(30%,0%);
        transition-delay: 0.3s;
    }
    .card1 .text h2 span{
        font-weight: 800;
    }
    .card1 .text p{
        font-weight: 200;
        transform: translate(0%,30%);
    }
    /* 悬停样式开始 */
    .card1:hover img{
        opacity: 0.3;
    }
    .card1:hover .text h2{
        opacity: 1;
        transform: translate(0%,0%);
        transition-delay: 0.4s;
    }
    .card1:hover .text p{
        opacity: 0.9;
        transform: translate(0%,0%);
        transition-delay: 0.6s;
    }
    .card1:hover .text::before{
        background-color: rgba(255,255,255,0);
        left: 0;
        opacity: 1;
        transition-delay: 0s;
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
            <li><a href="智能硬件.jsp">智能硬件</a></li>
            <li><a class="active" href="#home">首页</a></li>
        </ul>
        <label for="togglebox" class="menu">
            <img src="./jsp/static/images/导航条.png" alt="汉堡图标" >
        </label>
    </nav>
</header>
<%--<a href="./jsp/userLogin.jsp"><button type="button" class="logobtn1 btn btn-outline-primary">登录</button></a>--%>
<%--<a href="./jsp/register.jsp"><button type="button" class="logobtn2 btn btn-outline-primary">注册</button></a>--%>
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
        <a href="./jsp/userRegister.jsp"><button type="button" class="logobtn2 btn btn-outline-primary">注册</button></a>
    </c:otherwise>
</c:choose>
<%------测试段结束------%>
<div style="background: url(./jsp/static/images/背景图.png) no-repeat;">
    <p><span style="margin: 80px"></span></p>
    <div align="center"><img src="./jsp/static/images/文字.png" alt=""></div>
    <p> <span style="padding: 10px;"></span></p>
    <div align="center"><h3 style="color: #4F71A4;">数据、连接、融合，赋能于糖尿病全生态</h3></div>
    <div align="center"><img style="height: 650px;width:80%;" src="./jsp/static/images/小糖人1.png" alt=""></div>
</div>
<div style="background: url(./jsp/static/images/背景图2.png) no-repeat top center ;" >
    <div style="width: 100%;
    min-height: 519px;
    position: relative;
    z-index: 9";>
        <p style="padding-bottom: 180px;"></p>
        <div align="center"> <h2 style="color: #FFFFFF;">糖护士依托“智能医疗设备+APP应用软件+智能管理服务”</h2></div>
        <p style="padding: 20px;"></p>
        <div align="center"><h2 style="color: #FFFFFF;">致力于帮助糖尿病患者提高自我管理能力和依从性、提高血糖达标率</h2></div>
        <p style="padding: 20px;"></p>
        <div align="center"><h2 style="color: #FFFFFF;">提供较低成本、较高效率的解决方案</h2></div>
    </div>
</div>
<!-- ------------------------带标题的动画盒子--------------------- -->
<div style="background-color: rgb(71,135,223);color: wheat;  " >
    <p style="padding: 10px;"> </p>
    <h2 style="align-items: center;text-align: center;">合作企业</h2>
    <p style="padding-bottom: 20px;"></p>
    <div class="imgboxs1">
        <div class="container2">
            <div class="card1">
                <img src="./jsp/static/images/合作机构1.png" alt="">
                <div class="text">
                    <h2>Tsinghua <span>Changgeng</span> hospital</h2>
                    <p>清华长庚医院</p>
                </div>
            </div>
            <div class="card1">
                <img src="./jsp/static/images/合作机构2.png" alt="">
                <div class="text">
                    <h2>Medical</span> Sciences</h2>
                    <p>中国医学科学院阜外医院</p>
                </div>
            </div>
            <div class="card1">
                <img src="./jsp/static/images/合作机构3.png" alt="">
                <div class="text">
                    <h2>华为 <span>创立于</span> 1987年</h2>
                    <p>huawei</p>
                </div>
            </div>
            <div class="card1">
                <img src="./jsp/static/images/合作机构4.png" alt="">
                <div class="text">
                    <h2>Red Cross    <span>Society </span> of China</h2>
                    <p>中国红十字会</p>
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
        产品资讯     &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
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
<!-- ----------------------------------js代码分割线------------------------ -->
<script type="text/javascript">

    // ------------------左右图片js-------------------------
    var boxs = document.querySelector(".boxs");
    //用js检测鼠标滚轮距离顶部位置来给div添加动画
    window.onscroll = function() {
        //检测鼠标滚轮距离顶部位置
        var top = document.documentElement.scrollTop || document.body.scrollTop;
        console.log(top);
        //当页面刚好滑动到div出现时给div添加动画，这个距离是div距离顶部的距离减去div的高度即：box.offsetTop-box.offsetHeight
        if(top > (boxs.offsetTop - boxs.offsetHeight)) {
            boxs.classList.add('animate__animated', 'animate__bounceInRight');　//添加动画　　　　
        }
    }
    //    ------------------------1+4图片js------------------------
    var boxs1 = document.querySelector(".boxs1");
    //用js检测鼠标滚轮距离顶部位置来给div添加动画
    window.onscroll = function() {
        //检测鼠标滚轮距离顶部位置
        var top = document.documentElement.scrollTop || document.body.scrollTop;
        console.log(top);
        //当页面刚好滑动到div出现时给div添加动画，这个距离是div距离顶部的距离减去div的高度即：box.offsetTop-box.offsetHeight
        if(top > (boxs1.offsetTop - boxs1.offsetHeight)) {
            boxs1.classList.add('animate__animated', 'animate__backInLeft');　//添加动画　　　　
        }
    }
</script>
</body>
</html>
