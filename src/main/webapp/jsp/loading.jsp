<%--
  Created by IntelliJ IDEA.
  User: lxl000000000
  Date: 2022/7/6
  Time: 10:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <meta http-equiv="refresh" content="5;url= ./userLogin.jsp "> <!-- 十秒跳转 -->
    <!-- ----------------------------导入小图标-------------------- -->
    <link href="https://cdn.bootcdn.net/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <title>loading加载动画</title>
    <style>
        *{
            /* 初始化 */
            margin: 0;
            padding: 0;
        }
        .jiazai{
            /* 100%窗口高度 */
            height: 100vh;
            /* 渐变背景 */
            background: linear-gradient(to top,#70b9f1,#1e3c55);
            /* 溢出隐藏 */
            overflow: hidden;
        }
        .container{
            width: 100%;
            height: 100%;
            /* 弹性布局 水平+垂直居中 */
            display: flex;
            justify-content: center;
            align-items: center;
        }
        /* 钢铁侠 */
        .iron-man{
            /* 相对定位 */
            position: relative;
            /* 执行飞行抖动动画：动画名 时长 线性的 无限次播放 */
            animation: flight 0.5s linear infinite;
        }
        .iron-man img{
            width: 250px;
            position: relative;
            z-index: 1;
        }
        /* 脚下喷射线 */
        .iron-man span{
            width: 30px;
            height: 1px;
            background-color: #fff;
            /* 绝对定位 */
            position: absolute;
            top: 12px;
            z-index: 0;
            /* 执行喷射动画 */
            animation: spray 0.3s linear infinite;
        }
        /* 为每条喷射线设置top、动画延迟时间 */
        .iron-man span:nth-child(2){
            top: 13px;
            animation-delay: -1s;
        }
        .iron-man span:nth-child(3){
            top: 14px;
            animation-delay: -2s;
        }
        .iron-man span:nth-child(4){
            top: 15px;
            animation-delay: -1.5s;
        }
        /* 背景线区域 */
        .lines{
            width: 100%;
            height: 100%;
            position: absolute;
            left: 0;
            top: 0;
        }
        /* 背景线 */
        .lines span{
            position: absolute;
            width: 20%;
            height: 2px;
            background-color: #fff;
            /* 执行线移动的动画 */
            animation: linemove linear infinite;
        }
        /* 为每条线设置top、动画时长、动画延迟时间 */
        .lines span:nth-child(1){
            top: 20%;
            animation-duration: 0.6s;
            animation-delay: -5s;
        }
        .lines span:nth-child(2){
            top: 40%;
            animation-duration: 0.8s;
            animation-delay: -1s;
        }
        .lines span:nth-child(3){
            top: 60%;
            animation-duration: 0.6s;
            animation-delay: 0s;
        }
        .lines span:nth-child(4){
            top: 80%;
            animation-duration: 0.5s;
            animation-delay: -3s;
        }
        .loading-text{
            /* 绝对定位 水平居中 垂直偏下 */
            position: absolute;
            left: 50%;
            transform: translateX(-50%);
            top: 58%;
            color: #fff;
            font-size: 14px;
            letter-spacing: 3px;
            white-space: nowrap;
            /* 执行文字移动的动画：动画名 时长 贝塞尔曲线 无限次播放 */
            animation: textmove 3s cubic-bezier(0.075, 0.82, 0.165, 1) infinite;
        }

        /* 定义动画 */
        /* 飞行动画（抖动） */
        @keyframes flight {
            0%{
                transform: translate(2px,1px) rotate(0deg);
            }
            10%{
                transform: translate(-1px,-3px) rotate(-1deg);
            }
            20%{
                transform: translate(-2px,0px) rotate(1deg);
            }
            30%{
                transform: translate(1px,2px) rotate(0deg);
            }
            40%{
                transform: translate(1px,-1px) rotate(1deg);
            }
            50%{
                transform: translate(-1px,3px) rotate(-1deg);
            }
            60%{
                transform: translate(-1px,1px) rotate(0deg);
            }
            70%{
                transform: translate(3px,1px) rotate(-1deg);
            }
            80%{
                transform: translate(-2px,-1px) rotate(1deg);
            }
            90%{
                transform: translate(2px,1px) rotate(0deg);
            }
            100%{
                transform: translate(1px,-2px) rotate(-1deg);
            }
        }
        /* 脚下喷射 */
        @keyframes spray {
            0%{
                left: 0;
                opacity: 1;
            }
            100%{
                left: -80px;
                opacity: 0;
            }
        }
        /* 线移动（速度的感觉） */
        @keyframes linemove {
            0%{
                left: 200%;
                opacity: 1;
            }
            100%{
                left: -200%;
                opacity: 0;
            }
        }
        /* 加载文字移动 */
        @keyframes textmove {
            0%{
                margin-left: 500px;
                opacity: 0;
            }
            30%,70%{
                margin-left: 0;
                opacity: 1;
            }
            100%{
                margin-left: -500px;
                opacity: 0;
            }
        }
        .red{
            color: red;
            font-size: 30px;
            align-items: center;
        }
        a{
            text-decoration: none;
            color: black;
        }
        input{
            background-color: rgb(39,74,103);
            border: none;
            width: 30px;
            height: 30px;
            text-align: center;
        }
        /* ---------------------加载动画--------------- */
        .container{
            /* 相对定位 */
            position: relative;
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .container1 .circle{
            position: relative;
            width: 150px;
            height: 150px;
            border-radius: 50%;
            border: 5px solid transparent;
            margin: -30px;
            /* 通过var函数调用自定义属性--c（颜色） */
            border-top: 5px solid var(--c);
            /* 通过var函数调用自定义属性--a（动画名称） */
            /* 执行动画：动画名 时长 线性的 无限次播放 */
            animation: var(--a) 3s linear infinite;
        }
        /* 发光头 */
        .container1 .circle::before{
            content: "";
            position: absolute;
            top: 12px;
            right: 12px;
            width: 15px;
            height: 15px;
            /* 通过var函数调用自定义属性--c（颜色） */
            background-color: var(--c);
            border-radius: 50%;
            /* 阴影（发光效果） */
            box-shadow:
                    0 0 5px var(--c),
                    0 0 10px var(--c),
                    0 0 20px var(--c),
                    0 0 40px var(--c),
                    0 0 80px var(--c);
        }
        /* 第三个圆 */
        .container1 .circle:nth-child(3){
            position: absolute;
            top: -66.66px;
            /* 设置自定义属性--c（颜色） */
            --c: lightgreen;
            /* 设置自定义属性--a（动画） */
            --a: animate2;
            /* 调整边框 */
            border-top: 5px solid transparent;
            border-left: 5px solid var(--c);
            /* 调整动画延迟时间 */
            animation-delay: -2s;
        }
        /* 第二个圆 */
        .container1 .circle:nth-child(2){
            /* 设置自定义属性--c（颜色） */
            --c: lightsalmon;
            /* 设置自定义属性--a（动画） */
            --a: animate2;
            /* 调整边框 */
            border-top: 5px solid transparent;
            border-left: 5px solid var(--c);
            /* 调整动画延迟时间 */
            animation-delay: -0.5s;
        }
        /* 第一个圆 */
        .container1 .circle:nth-child(1){
            /* 设置自定义属性--c（颜色） */
            --c: lightskyblue;
            /* 设置自定义属性--a（动画） */
            --a: animate1;
        }
        .container1 .circle:nth-child(3):before,
        .container1 .circle:nth-child(2):before{
            /* initial关键字用于设置CSS属性为它的默认值 */
            top: initial;
            left: 12px;
            bottom: 12px;
        }

        /* 定义动画 */
        @keyframes animate1 {
            0%{
                transform: rotate(0deg);
            }
            100%{
                transform: rotate(360deg);
            }
        }
        @keyframes animate2 {
            0%{
                transform: rotate(360deg);
            }
            100%{
                transform: rotate(0deg);
            }
        }
        /* ------------------飞机样式------------- */
        #plane{
            color: #fff;
            font-size: 70px;
            /* 绝对定位 */
            position: absolute;
            /* 弹性布局 水平+垂直居中 */
            display: flex;
            justify-content: center;
            align-items: center;
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
    </style>
</head>
<body onload="djs()">
<div class="jiazai">
    <h2>注册成功</h2>
    <p><input type="text" name="" id="js" value=""  class="red"/><a href="./userLogin.jsp">秒系统自动跳转，也可单击此页跳转
        <script type="text/javascript">

            var input = document.querySelector('input');
            var btn = document.querySelector('button');
            var times=6;
            var djs= function(){

                times = times-1;
                input.value=parseInt(times);
            }
            setInterval(djs,1000);
        </script>
        <div class="container">
        <div class="iron-man">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <div class="container1">
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
                <!-- <img src="./img/iron_man.png" alt="" style="right: 80px;"> -->
            </div>
        </div>
        <div class="lines">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
        </div>
        <div class="loading-text">正在拼命加载</div>
    </div>
</div>
</a></p>
<!-- ---------------------------飞机鼠标-------------------- -->
<div id="plane">
    <i class="fa fa-paper-plane" aria-hidden="true"></i>
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
    <p>©2021 新余市新余学院 版权所有<br>
        电脑版 | 管理登录 | 赣ICP备123456789号</p>
</div>
</div>
</div>
<!-- ---------------------------飞机鼠标js------------------ -->
<script>
    let plane=document.getElementById('plane');
    let deg=0,ex=0,ey=0,vx=0,vy=0,count=0;
    window.addEventListener('mousemove',(e)=>{
        ex=e.x-plane.offsetLeft-plane.clientWidth/2;
        ey=e.y-plane.offsetTop-plane.clientHeight/2;
        deg=360*Math.atan(ey/ex)/(2*Math.PI)+45;
        if(ex<0){
            deg+=180;
        }
        count=0;
    })
    function draw(){
        plane.style.transform='rotate('+deg+'deg)';
        if(count<100){
            vx+=ex/100;
            vy+=ey/100;
        }
        plane.style.left=vx+'px';
        plane.style.top=vy+'px';
        count++;
    }
    setInterval(draw, 1);
</script>
</body>
</html>
