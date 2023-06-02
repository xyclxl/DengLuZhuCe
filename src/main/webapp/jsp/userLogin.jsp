<%--
  Created by IntelliJ IDEA.
  User: lxl000000000
  Date: 2022/7/13
  Time: 16:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         isELIgnored="false" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>用户登录</title>

    <link rel="stylesheet" href="static/css/font-awesome.min.css"/>
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
            top: 407px;
            left: 710px;
        }
        a{
            color: rgb(0,128,152);
        }
    </style>

</head>
<body>
<%
    Cookie[] cookies= request.getCookies();
    if(cookies!=null){
        for (Cookie coo: cookies) {
            if(coo.getName().equals("isNotLogin") && coo.getValue().equals("yes")){
                pageContext.setAttribute("isNotLogin",true);
                break;
            }
        }
    }
%>
<div class="main">

    <div class="center">
        <form action="/DengLuZhuCe/UserLoginServlet" id="formOne" method="post"onsubmit="return submitB()" >
            <c:choose>
                <c:when test="${pageScope.isNotLogin && not empty sessionScope.loginUser}">

                    <i class="fa fa-user Cone">  | </i>
                    <input  type="text" name="loginname" id="user" placeholder="用户名" value="${sessionScope.loginUser.user_name}" onblur="checkUser()"/>
                    <span id="user_pass"></span>
                    <br/>
                    <i class="fa fa-key Cone">  | </i>
                    <input type="password" name="password" id="pwd" placeholder="密码" value="${sessionScope.loginUser.user_password}" onblur="checkUser1()"/>
                    <span id="pwd_pass"></span>
                    <br/><br/>
                    <div style="font-size: 15px;">
                        <input  type="checkbox" style="width: 20px;height:20px;vertical-align:bottom; " name="notLogin"  value="true"  placeholder="7天免登录" checked/>记住我
                    </div>
                    <div class="zhuce">还不是糖护士用户？立即去<a href="register.jsp">注册</a></div>
                    <button class="loginbtn" type="submit">登录</button>
                    <!-- <input type="submit" value="登录" id="submit" name="submit"> -->
                    <br/>
                </c:when>
                <c:otherwise>
                    <i class="fa fa-user Cone">  | </i>
                    <input  type="text" name="loginname" id="user" placeholder="用户名"onblur="checkUser()"/>
                    <span id="user_pass"></span>
                    <br/>
                    <i class="fa fa-key Cone">  | </i>
                    <input type="password" name="password" id="pwd" placeholder="密码"onblur="checkUser1()"/>
                    <span id="pwd_pass"></span>
                    <br/><br/>
                    <div style="font-size: 15px;">
                        <input  type="checkbox" style="width: 20px;height:20px;vertical-align:bottom; " name="notLogin"  value="true" placeholder="7天免登录"/>记住我
                    </div>
                    <div class="zhuce">还不是糖护士用户？立即去<a href="userRegister.jsp">注册</a></div>
                    <button class="loginbtn" type="submit">登录</button>
                    <br/>
                </c:otherwise>
            </c:choose>
        </form>
    </div>

</div>


<script type="text/javascript" src="static/js/loginMy.js"></script>
<div style="text-align:center;">
</div>
</body>
</html>
