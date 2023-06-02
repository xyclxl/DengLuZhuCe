
<%--
  Created by IntelliJ IDEA.
  User: lxl000000000
  Date: 2022/7/8
  Time: 16:49
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
    <style>
        .mylabel{
            height: 40px;
            outline-style: none ;
            border: 1px solid #ccc;
            border-radius: 3px;
            padding: 14px 14px;
            width: 620px;
            font-size: 24px;
            font-family: "Microsoft soft";
        }
        *{
            /* 初始化 */
            margin: 0;
            padding: 0;
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
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #222;
            /* font-size: 6vw; */
            font-size: 30px;
            font-weight: bold;
            text-transform: uppercase;
            color: white;
        }
        .products {
            align-items: center;
            display: flex;
            justify-content: center;
            flex-direction: column;
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
    </style>
</head>
<body>
<!-- ------------------------------------------------导航栏 ----------------------------->
<nav class="navbar navbar-expand-md bg-dark navbar-dark">
    <a class="navbar-brand active" href="user_home.jsp">个人信息</a>
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
                <a class="nav-link" href="user_home_order.jsp">我的订单</a>
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
<div class="products">
    <div class="main selected">
        <div class="a">
            <!------------------------------用户信息开始----------------------------->
            <div class="right-style" id="1">
                <h2 style="text-align: center;">用户个人信息</h2>
                <hr style="border: solid 1px #666666">
                <div class="right-info-style">
                                            <span>编号：<input type="text" class="mylabel" id="txtNum" readonly="readonly"
                                                            value="${sessionScope.loginUser.id}"></span>
                </div>
                <div class="right-info-style">
                                            <span>姓名：<input type="text" class="mylabel" id="txtName" readonly="readonly"
                                                            value="${sessionScope.loginUser.user_name}" ></span>
                </div>
                <div class="right-info-style">
                                            <span>密码：<input type="text" class="mylabel" id="txtEmail"
                                                            readonly="readonly" value="${sessionScope.loginUser.user_password}" ></span>
                </div>
                <!-- <div class="right-info-style"><span>联系电话：<input type="text" id="txtTel" readonly="readonly" value="13876543210" style="border:none;"></span></div> -->
                <!-- <div class="right-info-style"><span>常用邮箱：<input type="text" id="txtEmail" readonly="readonly" value="1091313628@qq.com" style="border:none;"></span></div> -->
                <div class="right-info-style">
                                            <span>手机：<input type="text" id="txtPhone" class="mylabel"
                                                            readonly="readonly" value="${sessionScope.loginUser.user_phone}" ></span>
                </div>
                <div class="right-info-style">
                                            <span>邮箱：<input type="text" id="txtSubTime" class="mylabel"
                                                            readonly="readonly" value="${sessionScope.loginUser.user_email}"
                                            ></span>
                </div>
                <div id="div_update" style="text-align: center; margin-top: 3%;">
                    <input  type="button" style="width: 60%;height: 40px;" value="修改"
                            onclick="MsgBox()">
                </div>
                <script language="javascript">
                    function MsgBox() //声明标识符
                    {
                        alert("用户暂不提供修改信息功能，如需修改请联系管理员"); //弹出对话框
                    }
                </script>
                <div id="div_save" style="text-align: center; margin-top: 6%;display:none;">
                    <input  type="button" style="width: 20%;" value="保存"
                            onclick="saveAdmin()"><input id="cancelbtn" type="button"
                                                         style="width: 20%;" value="取消" onclick="updateAdminCancel()()">
                </div>
            </div>
            <!------------------------------管理员信息结束------------------------------>
        </div>
    </div>
</div>
</body>
</html>
