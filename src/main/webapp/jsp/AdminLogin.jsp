<%@ page contentType="text/html;charset=UTF-8" language="java"
         isELIgnored="false" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <meta charset="utf-8"/>
  <title>小糖人糖分摄入管理系统登录</title>
  <meta name="author" content="" />
  <link rel="stylesheet" type="text/css" href="static/css/style.css" />
  <style>
    body{height:100%;background:#16a085;overflow:hidden;}
    canvas{z-index:-1;position:absolute;}
    .black_overlay{  display: none;  position: absolute;  top: 0%;  left: 0%;  width: 100%;  height: 100%;  background-color: black;  z-index:1001;  -moz-opacity: 0.8;  opacity:.80;  filter: alpha(opacity=80);  }
    .white_content {  display: none;  position: absolute;  top: 25%;  left: 35%;  width: 25%;  height: 15%;  padding: 16px;  border: 2px solid black;  background-color: white;  z-index:1002;  overflow: auto;  }
    .myloginul{width:70px;height:42px;border:none;font-size:16px;background:rgb(92,189,170);color:#f8f8f8;}
    .myloginul:hover{background:#0c9076;color:#f4f4f4;}
    select:focus option:checked{
      /* background:#0c9076; */
      background-image:linear-gradient(#0c9076,#fadac0);
      /* color:#f4f4f4; */
    }
    .zhuce{
      position: absolute;
      color: #FFFFFf;
      top: 365px;
      left: 710px;
    }
    .login_txtbx{
      width: 300px;
      height: 42px;
    }
  </style>

  <script src="static/js/jquery.js"></script>
  <script src="static/js/verifyCode.js"></script>
  <script src="static/js/Particleground.js"></script>
  <script>

    $(document).ready(function() {
      //粒子背景特效
      $('body').particleground({
        dotColor: '#5cbdaa',
        lineColor: '#5cbdaa'
      });
    });
  </script>
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

<form action="/DengLuZhuCe/DengLuServlet" method="post">
  <dl class="admin_login">
    <dt>
      <strong>糖护士糖分摄入管理系统</strong>
      <em>Sugar intake management system</em>
    </dt>
    <dd class="user_icon">
      <input style="height:42px ;width:300px" type="text" id="username" placeholder="账号" class="login_txtbx" name="loginname" />
    </dd>
    <dd class="pwd_icon">
      <input style="height:42px ;width:300px" type="password" id="password" placeholder="密码" class="login_txtbx" name="password" />
    </dd>
    <div class="btn-group myloginul">
      <select id="role" class="myloginul" name="role">
        <option selected="selected" value="default" class="op">请选择</option>
        <option value="staff" class="op">用户</option>
        <option value="admin" class="op">管理员</option>
      </select>
    </div>
    <div class="zhuce">还不是糖护士用户？立即去<a href="register.jsp">注册</a></div>
    <dd>
      <input type="submit" id="loginBtn" value="立即登陆" class="submit_btn" onclick="saverole()"/>
    </dd>
    <dd>
      <p>Copyright© 2022 20计科二班  版权所有</p>
      <p><a href="http://www.xyc.edu.cn/" target="_blank">学校官网 </a></p>
    </dd>
  </dl>
</form>
<script>
  function saverole(){
    // var role = document.querySelector("#role").value;
    var role = document.getElementById("role").value;
    if(role == "default"){
      alert("请选择登录角色");
    }

  }
</script>

</body>
</html>
