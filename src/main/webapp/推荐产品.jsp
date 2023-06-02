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
        th{
            text-align: center;
        }
        td{
            text-align:center;
            line-height: 100px;
        }
        #a tr:hover{
            background:#D4E3E5;
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
            <li><a class="active" href="推荐产品.jsp">推荐产品</a></li>
            <li><a  href="智能硬件.jsp">智能硬件</a></li>
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

<div class="container" >
    <table class="table table-hover table-bordered">

        <caption>更多产品敬请期待...</caption>
        <thead>
        <tr>
            <th>编号</th>
            <th>图片</th>
            <th>商品名</th>
            <th>类型</th>
            <th>产地</th>
            <th>价格</th>
            <th>时间</th>
            <th>描述</th>

        </tr>
        </thead>
        <tbody id="a">
        <c:forEach items="${requestScope.oList}" var="good">
        <tr>
            <td>${good.id}</td>
            <td><img style="width:100px;height: 100px" src="./jsp/static/images/${good.goodurl}" alt=""></td>
            <td>${good.goodname}</td>
            <td>${good.goodtype}</td>
            <td>${good.goodplace}</td>
            <td>${good.goodprice}</td>
            <td>${good.gooddescribe}</td>
            <td>
                <button style="line-height: 100px" type="button" class="btn btn-default btn-xm" data-toggle="modal" data-target="#myModal">
                    <span class="glyphicon glyphicon-pencil">购买</span>
                </button>
            </td>
        </tr>
        <!--购买弹出框-->
        <div id="add">
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                ×
                            </button>
                            <h4 class="modal-title" id="myModalLabel">
                                购买信息
                            </h4>
                        </div>
                        <div class="modal-body">

                            <form class="form-horizontal" action="/DengLuZhuCe/OrderAdd" role="form" method="post">
                                <div class="form-group">
                                    <%--@declare id="firstname"--%><label for="firstname" class="col-sm-2 control-label">用户</label>
                                    <div class="col-sm-9">
                                            <input type="text" class="form-control" name="ordernum" placeholder="请登录后再购买" value="${sessionScope.loginUser.user_name}" readonly>
                                    </div>
                                </div>
<%--                                <div class="form-group">--%>
<%--                                    <label  class="col-sm-2 control-label">品名</label>--%>
<%--                                    <div class="col-sm-9">--%>
<%--                                        <input type="text" class="form-control" name="ordername"--%>
<%--                                               placeholder="请输入商品名">--%>
<%--                                    </div>--%>
<%--                                </div>--%>
                                <div class="form-group">
                                        <%--@declare id="city"--%><label for="city" class="col-sm-2 control-label">类型</label>
                                    <div class="col-sm-9">
                                        <select class="form-control"  name="ordername">
                                            <option selected="selected" value="">请选择商品</option>
                                            <option value="红阳猕猴桃">红阳猕猴桃</option>
                                            <option value="青南瓜">青南瓜</option>
                                            <option value="内蒙古葵花籽">内蒙古葵花籽</option>
                                            <option value="手机血糖仪">手机血糖仪</option>
                                            <option value="血糖尿酸测试仪">血糖尿酸测试仪</option>
                                            <option value="多参数健康监测仪M100">多参数健康监测仪M100</option>
                                            <option value="荷型血糖仪">荷型血糖仪</option>
                                            <option value="云南普洱茶(普洱茶)">云南普洱茶(普洱茶)</option>
                                            <option value="武夷水仙(乌龙茶)">武夷水仙(乌龙茶)</option>
                                            <option value="凤凰单丛(乌龙茶)">凤凰单丛(乌龙茶)</option>
                                            <option value="大益7542(普洱茶)">大益7542(普洱茶)</option>
                                            <option value="湿仓普洱茶">湿仓普洱茶</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="old" class="col-sm-2 control-label">数量</label>
                                    <div class="col-sm-9">
                                        <input type="number" class="form-control" id="old" name="ordernumber"
                                               placeholder="请输入数量">
                                    </div>
                                </div>

                                <div class="form-group">
                                        <%--@declare id="city"--%><label for="city" class="col-sm-2 control-label">类型</label>
                                    <div class="col-sm-9">
                                        <select class="form-control"  name="ordertype">
                                            <option selected="selected" value="">请选择</option>
                                            <option value="水果">水果</option>
                                            <option value="蔬菜">蔬菜</option>
                                            <option value="坚果">坚果</option>
                                            <option value="硬件">硬件</option>
                                            <option value="茶叶">茶叶</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="timer" class="col-sm-2 control-label">时间</label>
                                    <div class="col-sm-9">
                                        <input type="date" class="form-control" id="timer" name="ordertime"
                                               placeholder="请输入时间">
                                    </div>
                                </div>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                                    </button>
                                    <button type="submit" class="btn btn-primary">
                                        确认购买
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </c:forEach>

        </tbody>

    </table>

        <!--图片-->
        <div id="">


            <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h5 class="modal-title" id="myModalLabel2">头像图片</h5>
                        </div>
                        <div class="modal-body"  style="height: 300px;text-align: center;">

                            <img src="images/tou01.jpg" style="height: 250px;" id="touimg"/>


                        </div>
                        <!--<div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-primary">提交更改</button>
                        </div>-->
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
    <script type="text/javascript">
        $("img").click(function(){
            var at=$(this).attr("src")
            $("#touimg").attr("src",at)
        })

    </script>
</body>
</html>
