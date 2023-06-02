<%--
  Created by IntelliJ IDEA.
  User: lxl000000000
  Date: 2022/7/4
  Time: 10:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>蓝色透明登录界面模板</title>

    <link rel="stylesheet" href="static/css/font-awesome.min.css">
    <link rel="stylesheet" href="static/css/loginMy.css"/>


    <style>
        html,body{width:100%;}
        .loginbtn{
            color: rgb(165,164,165);
            border: none;
            width: 53.2%;
            height: 3em;
            font-size: 1em;
            background-color: rgb(2,134,160);
            font-weight: bolder;
            font-family: "微软雅黑";
            opacity: 1;
            margin-left: 22.9%;
            position: relative;
            top: 30px;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
            cursor:pointer;
            /* left: 125px; */
        }
        .loginbtn:hover{
            background-color: rgba(2,134,160,0.5);
        }
        .zhuce{
            position: absolute;
            color: rgb(204,200,196);
            top: 410px;
            left: 710px;
        }
        a{
            color: rgb(0,128,152);
        }
    </style>

</head>

<body>

<div class="main">

    <div class="center">
        <form action="/DengLuZhuCe/UserZhuCeServlet" id="formOne" method="post" onsubmit="return submitB()" >
            <i class="fa fa-user Cone">  | </i>
            <input  type="text" name="username" id="user" placeholder="用户名"onblur="checkUser()"/>
            <span id="user_pass"></span>
            <br/>
            <i class="fa fa-key Cone">  | </i>
            <input type="password" name="password" id="pwd" placeholder="密码"onblur="checkUser1()"/>
            <span id="pwd_pass"></span>
            <br/>
            <i class="fa fa-folder-open Cone">  | </i>
            <input type="text" name="email"  placeholder="邮箱"/>
            <span id="surePwd_pass1" ></span><br/>
            <i class="fa fa-folder-open Cone">  | </i>
            <input type="text" name="phone"  placeholder="电话"/>
            <span id="surePwd_pass2" ></span><br/>
            <button class="loginbtn" type="submit">注册</button>
            <!-- <input type="submit" value="登录" id="submit" name="submit"> -->
            <br/>
        </form>
    </div>

</div>


<script type="text/javascript" src="static/js/loginMy.js"></script>
<div style="text-align:center;">
</div>
</body>
</html>
