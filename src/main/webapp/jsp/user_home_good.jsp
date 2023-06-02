<%--
  Created by IntelliJ IDEA.
  User: lxl000000000
  Date: 2022/7/6
  Time: 19:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="utf-8" %>
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
        /* 图片自适应的样式 */
        .img-object{
            object-fit: cover;
            object-position: 50% 20%;
        }
        #app {
            text-align: center;
            margin: 60px;
            margin: 0 auto;
            display: table;
        }
        .wulongbtn {
            font-family: "Bitter";
            background: #c62735;
            color: white;
            border: 0;
            padding: 5px 15px;
            margin: 0 10px;
            border-radius: 4px;
            outline: 0;
            cursor: pointer;
        }
        .img-contain {
            width: 450px;
            height: 360px;
            overflow: hidden;
            transform-origin: 50% 50%;
        }
        .mainimg {
            display: inline-block;
            height: 350px;
            width: 100%;
            transform-origin: 50% 50%;
            cursor: pointer;
            transform: scaleY(1) translateZ(0);
            margin: 5px;
        }
        main {
            display: flex;
            flex-wrap: wrap;
            /*让弹性盒元素在必要的时候拆行*/
            justify-content: center;

            /*在弹性盒对象的元素中的各项周围留有空白*/
        }
        .img-contain:hover .overlay {
            opacity: 1;
            background: hsla(50, 0%, 0%, 0.6);
            transition: 0.3s all ease-out;
        }
        .img-contain .overlay {
            position: absolute;
            z-index: 1000;
            display: block;
            width: 445px;
            height: 355px;
            margin: 5px;
            opacity: 0;
            overflow: hidden;
            transition: 0.3s all ease-in;
        }
        .overlay-text {
            margin-top: 40px;
        }
        .flip-enter-active {
            transition: all 0.2s cubic-bezier(0.55, 0.085, 0.68, 0.53); /*ease-in-quad*/
            transform-origin: 50% 50%;
        }
        .flip-leave-active {
            transform-origin: 50% 50%;
            transition: all 0.25s cubic-bezier(0.25, 0.46, 0.45, 0.94); /*ease-out-quad*/
        }
        .flip-enter-from,
        .flip-leave-to {
            transform-origin: 50% 50%;
            transform: scaleY(0) translateZ(0);
            opacity: 0;
        }
        /* -----------------------购物车--------------------- */
        * {
            margin: 0;
            padding: 0;
            font-family: "微软雅黑";
            list-style: none;
            color: #666;
            text-decoration: none;
            font-size: 14px;
        }
        .con1{
            background: #f5f5f5;
            height: 100%;
        }
        .link {
            padding: 0 5px;
            color: #757575;
            text-decoration: none;
        }
        .hid {
            overflow: hidden;
        }
        .left {
            float: left;
        }
        .box_head{
            position: relative;
            margin: 0;
            height: 50px;
            font-size: 30px;
            font-weight: 400;
            color: #757575;
            border-top: 1px solid #e0e0e0;
        }
        .box_head span{
            position: absolute;
            top: -20px;
            left: 372px;
            height: 40px;
            width: 482px;
            line-height: 40px;
            text-align: center;
            display: block;
            background-color: #f5f5f5;
            font-size: 30px;
        }
        #box {
            width:1240px;
            margin: 20px auto;
        }
        #box ul {
            margin-right: -14px;
            overflow: hidden;
        }
        #box li {
            width: 234px;
            float: left;
            margin-right: 14px;
            padding: 24px 0 20px;
            background: #FFF;
            text-align: center;
            position: relative;
            cursor: pointer;
            margin-bottom:14px;
        }
        .pro_img {
            width: 150px;
            height: 150px;
            margin: 0 auto 18px;
        }
        .pro_name {
            display: block;
            text-overflow: ellipsis;
            white-space: nowrap;
            overflow: hidden;
            font-weight: 400;
        }
        .pro_name a {
            color: #333;
        }
        .pro_price {
            color: #ff6700;
            margin: 10px;
        }
        .pro_rank {
            color: #757575;
            margin: 10px;
        }
        #box li:hover .add_btn {
            display: block;
        }
        #box li:hover .pro_rank {
            opacity: 0;
        }
        #box li .add_btn:hover {
            background-color: #f60;
            color: white;
        }



        .add_btn {
            height: 22px;
            position: absolute;
            width: 122px;
            bottom: 28px;
            left: 50%;
            margin-left: -61px;
            line-height: 22px;
            display: none;
            color: #F60;
            font-size: 12px;
            border: 1px solid  #f60;
        }
        .car {
            width: 1240px;
            margin: 20px auto;
            background: #FFF;
        }
        .car .check{
            width: 50px;

        }
        .car .check i{
            color: #fff;
            display: inline-block;

            width: 18px;
            height: 18px;
            line-height: 18px;
            border: 1px solid #e0e0e0;
            margin-left: 24px;
            background-color: #fff;
            font-size: 16px;
            text-align: center;
            vertical-align: middle;
            position: relative;
            top: -1px;
            cursor: pointer;
            font-family: "iconfont";
        }
        .i_acity {

            border-color: #ff6700 !important;
            background-color: #ff6700 !important;
        }
        .car .img {
            width: 190px;
        }
        .car .img img {
            display: block;
            width: 80px;
            height: 80px;
            margin: 3px auto;
        }
        .car .name {
            width: 300px;
        }
        .car .name span {
            line-height: 1;
            margin-top: 8px;
            margin-bottom: 8px;
            font-size: 18px;
            font-weight: normal;
            text-overflow: ellipsis;
            white-space: nowrap;
            overflow: hidden;
        }
        .car .price {
            width: 144px;
            text-align: right;
            padding-right: 84px;
        }
        .car .price span {
            color: #ff6700;
            font-size: 16px;
        }
        .car .number{
            width: 150px;
        }
        .car .subtotal{
            width: 130px;

        }
        .car .ctrl {
            width: 105px;
            padding-right:25px;
            text-align: center;
        }
        .car .ctrl a {
            font-size: 20px;
            cursor: pointer;
            display: block;
            width: 26px;
            height: 26px;
            margin: 30px auto;
            line-height: 26px;
        }
        .car .ctrl a:hover {
            color: #FFF;
            background: #ff6700;
            border-radius: 50%;
        }
        .head_row {
            height: 70px;
            line-height: 70px;
        }
        .head_row, .row {
            border-bottom: solid 1px #e0e0e0;
        }
        .row {
            height: 86px;
            line-height:86px;
            padding: 15px 0;
            margin: 0px;
        }
        #sum_area{
            width:1240px;
            height: 60px;
            background: white;
            margin: 20px auto;
        }
        #sum_area #pay{
            width:250px;
            height:60px;
            text-align: center;
            float: right;
            line-height: 60px;
            font-size: 19px;
            background: #FF4B00;
            color: white;
        }
        #sum_area #pay_amout{
            width:250px;
            height:60px;
            text-align: center;
            float: right;
            line-height: 60px;
            font-size: 16px;
            color:#FF4B00 ;
        }
        #sum_area #pay_amout #price_num{
            width:100px;
            height: 60px;
            font-size: 25px;
            color:#FF4B00 ;
            /*	float: left;*/
        }

        .item_count_i{
            height: 85px;
            width:10%;
            /*border: 1px solid black;*/
            float: left;
            margin-right: 25px;
        }
        .num_count{
            width:150px;
            height:40px;
            border: 1.2px solid #E0E0E0;
            float:right;
            margin-top: 21px;

        }
        .count_i{
            width:30%;
            height:40px;
            line-height: 40px;
            float: left;
            text-align: center;
            font-size:21px;
            color: #747474;
        }
        .count_i:hover{
            width:30%;
            height:40px;
            line-height: 40px;
            float: left;
            text-align: center;
            font-size:21px;
            color: #747474;
            background: #E0E0E0;
            cursor: pointer;
        }
        .c_num{
            width:40%;
            height:40px;
            line-height: 40px;
            float: left;
            text-align: center;
            font-size:16px;
            color: #747474;
        }
        .count_d{
            width:30%;
            height:40px;
            line-height: 40px;
            float: left;
            text-align: center;
            font-size:25px;
            color: #747474;
        }
        .count_d:hover{
            width:30%;
            height:40px;
            line-height: 40px;
            float: left;
            text-align: center;
            font-size:25px;
            color: #747474;
            background: #E0E0E0;
            cursor: pointer;
        }
        .i_acity2 {
            border-color: #ff6700 !important;
            background-color: #ff6700 !important;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-md bg-dark navbar-dark">
    <a class="navbar-brand " href="user_home.jsp">个人信息</a>
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
                <a class="nav-link active" href="user_home_good.jsp">本期主推产品</a>
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
<!-- -----------------------vue盒子----------------------- -->
<div id="app" class="animate__animated animate__bounceInRight animate__delay-.5s">
    <p style="padding-top: 10px;"></p>
    <h1 style="background: #EEE url(data:image/gif;base64,iVBORw0KGgoAAAANSUhEUgAAAAQAAAAECAIAAAAmkwkpAAAAHklEQVQImWNkYGBgYGD4//8/A5wF5SBYyAr+//8PAPOCFO0Q2zq7AAAAAElFTkSuQmCC) repeat;
	  text-shadow: 5px -5px black, 4px -4px white;
	  font-weight: bold;
	  -webkit-text-fill-color: transparent;
	  -webkit-background-clip: text ">精品茶叶</h1>
    <main>
        <app-child>
            <img style="width:560px;height: 560px;overflow:hidden;" src="./static/images/乌龙茶7.png" alt="">
        </app-child>
        <app-child>
            <img style="width:560px;height: 560px;overflow:hidden;" class="img-object" src="./static/images/乌龙茶1.png" alt="">
        </app-child>
        <app-child>
            <img style="width:560px;height: 560px;overflow:hidden;" class="img-object" src="./static/images/乌龙茶9.png" alt="">
        </app-child>
        <!-- <br> -->
    </main>
    <p style="padding-top: 10px;"></p>
    <h1 style="background: #EEE url(data:image/gif;base64,iVBORw0KGgoAAAANSUhEUgAAAAQAAAAECAIAAAAmkwkpAAAAHklEQVQImWNkYGBgYGD4//8/A5wF5SBYyAr+//8PAPOCFO0Q2zq7AAAAAElFTkSuQmCC) repeat;
		text-shadow: 5px -5px black, 4px -4px white;
		font-weight: bold;
		-webkit-text-fill-color: transparent;
		-webkit-background-clip: text ">精品坚果</h1>
    <main>
        <app-child>
            <img style="width:560px;height: 560px;overflow:hidden;" src="./static/images/葵花籽.jpg" alt="">
        </app-child>
        <app-child>
            <img style="width:560px;height: 560px;overflow:hidden;" src="./static/images/鹰嘴豆.jpg" alt="">
        </app-child>
        <app-child>
            <img style="width:560px;height: 560px;overflow:hidden;" src="./static/images/松子.webp" alt="">
        </app-child>
    </main>

</div>
<!-- ---------------------------------购物车---------------------------- -->
<!-- <img src="./img/背景图9.jpg" alt="" width="100%"> -->
<div id="gwc">
    <div class="con1">

        <div id="car" class="car">
            <div class="head_row hid">
                <div class="check left"> <i onclick="checkAll()">√</i></div>
                <div class="img left">  全选</div>
                <div class="name left">商品名称</div>
                <div class="price left">单价</div>
                <div class="number left">数量</div>
                <div class="subtotal left">小计</div>
                <div class="ctrl left">操作</div>
            </div>

        </div>
        <div id="sum_area">
            <div id="pay">去结算</div>
            <div id="pay_amout">合计：<span id="price_num">0</span>元</div>
            <p><span style="padding: 10px;"></span></p>
        </div>
        <p><span style="padding: 50px;"></span></p>
        <div id="box">
            <h2 id="h5" class="box_head"><span>健康植物性饮食降低糖尿病风险产品</span></h2>
            <ul1>

            </ul1>
            <!-- 与导航栏的ul冲突 -->
        </div>
    </div>
</div>
<div class="card-footer" style="position: relative; bottom: -300px;">
    <div class="row clearfix ">
        <center style="position: absolute;right: 6px; width: 100%;">
            新余学院--数学与计算机学院理科楼实验室
        </center>
    </div>
</div>
<!-- -----------------------------------vue盒子js代码---------------------->
<script>
    const app = Vue.createApp({});
    // ------------------------------最后三个是app-child-----------------------------------------
    app.component("app-child", {
        template: ` <div class="img-contain">
		                      <div class="overlay">
		                        <p class="overlay-text"></p>
								<p style="margin: 270px;"></p>
		                        <button v-on:click="toggleShow" class="wulongbtn">切换</button>
		                      </div>
		                      <transition name="flip" mode="out-in">
		                        <div v-if="!isShowing">
		                          <slot></slot>
		                        </div>
		                        <img v-else src='./static/images/猕猴桃.jpg' class="mainimg" alt=''>
		                      </transition>
		                    </div>`,
        data() {
            return {
                isShowing: false
            }
        },
        methods: {
            toggleShow() {
                this.isShowing = !this.isShowing;
            }
        }
    });
    app.mount("#app");
    //   -----------------------------------购物车js代码-------------------------
    window.onload = function() {
        var aData = [{
            "imgUrl": "./static/images/猕猴桃.jpg",
            "proName": "红阳猕猴桃",
            "proPrice": "29",
            "proComm": "1"
        },
            {
                "imgUrl": "./static/images/南瓜.jpg",
                "proName": "青南瓜",
                "proPrice": "39",
                "proComm": "9.7"
            },
            {
                "imgUrl": "./static/images/葵花籽.jpg",
                "proName": " 内蒙古葵花籽 ",
                "proPrice": "35",
                "proComm": "1.3"
            },
            {
                "imgUrl": "./static/images/黑咖啡.jpg",
                "proName": " 黑咖啡 ",
                "proPrice": "149",
                "proComm": "1.1"
            },
            {
                "imgUrl": "./static/images/鹰嘴豆.jpg",
                "proName": "鹰嘴豆",
                "proPrice": "50",
                "proComm": "0.3"
            },

        ];
        var oBox = document.getElementById("box");
        var oCar = document.getElementById("car");
        var oUl = document.getElementsByTagName("ul1")[0];
        for (var i = 0; i < aData.length; i++) {
            var oLi = document.createElement("li");
            var data = aData[i];
            oLi.innerHTML += '<div class="pro_img"><img src="' + data["imgUrl"] + '" width="150" height="150"></div>';
            oLi.innerHTML += '<h3 id="h3" class="pro_name"><a rel="nofollow" href="#">' + data["proName"] + '</a></h3>';
            oLi.innerHTML += '<p class="pro_price">' + data["proPrice"] + '元</p>';
            oLi.innerHTML += '<p class="pro_rank">' + data["proComm"] + '万人好评</p>';
            oLi.innerHTML += '<div class="add_btn">加入购物车</div>';
            oUl.appendChild(oLi);
        }
        var aBtn = getClass(oBox, "add_btn");//获取box下的所有添加购物车按钮
        var number = 0;//初始化商品数量
        for (var i = 0; i < aBtn.length; i++) {
            number++;
            aBtn[i].index = i;
            aBtn[i].onclick = function() {
                var oDiv = document.createElement("div");
                var data = aData[this.index];
                oDiv.className = "row hid";
                oDiv.innerHTML += '<div class="check left"> <i class="i_check" id="i_check" onclick="i_check()" >√</i></div>';
                oDiv.innerHTML += '<div class="img left"><img src="' + data["imgUrl"] + '" width="80" height="80"></div>';
                oDiv.innerHTML += '<div class="name left"><span>' + data["proName"] + '</span></div>';
                oDiv.innerHTML += '<div class="price left"><span>' + data["proPrice"] + '元</span></div>';
                oDiv.innerHTML +=' <div class="item_count_i"><div class="num_count"><div class="count_d">-</div><div class="c_num">1</div><div class="count_i">+</div></div> </div>'
                oDiv.innerHTML += '<div class="subtotal left"><span>' + data["proPrice"] + '元</span></div>'
                oDiv.innerHTML += '<div class="ctrl left"><a rel="nofollow" href="javascript:;">×</a></div>';
                oCar.appendChild(oDiv);
                var flag = true;
                var check = oDiv.firstChild.getElementsByTagName("i")[0];
                check.onclick = function() {
                    // console.log(check.className);
                    if (check.className == "i_check i_acity") {
                        check.classList.remove("i_acity");

                    } else {
                        check.classList.add("i_acity");
                    }
                    getAmount();
                }
                var delBtn = oDiv.lastChild.getElementsByTagName("a")[0];
                delBtn.onclick = function() {
                    var result = confirm("确定删除吗?");
                    if (result) {
                        oCar.removeChild(oDiv);
                        number--;
                        getAmount();
                    }
                }
                var i_btn = document.getElementsByClassName("count_i");
                for (var k = 0; k < i_btn.length; k++) {
                    i_btn[k].onclick = function() {
                        bt = this;
                        //获取小计节点
                        at = this.parentElement.parentElement.nextElementSibling;
                        //获取单价节点
                        pt = this.parentElement.parentElement.previousElementSibling;
                        //获取数量值
                        node = bt.parentNode.childNodes[1];
                        console.log(node);
                        num = node.innerText;
                        num = parseInt(num);
                        num++;
                        node.innerText = num;
                        //获取单价
                        price = pt.innerText;
                        price = price.substring(0, price.length - 1);
                        //计算小计值
                        at.innerText = price * num + "元";
                        //计算总计值
                        getAmount();
                    }
                }
                //获取所有的数量减号按钮
                var d_btn = document.getElementsByClassName("count_d");
                for (k = 0; k < i_btn.length; k++) {
                    d_btn[k].onclick = function() {
                        bt = this;
                        //获取小计节点
                        at = this.parentElement.parentElement.nextElementSibling;
                        //获取单价节点
                        pt = this.parentElement.parentElement.previousElementSibling;
                        //获取c_num节点
                        node = bt.parentNode.childNodes[1];
                        num = node.innerText;
                        num = parseInt(num);
                        if (num > 1) {
                            num--;
                        }
                        node.innerText = num;
                        //获取单价
                        price = pt.innerText;
                        price = price.substring(0, price.length - 1);
                        //计算小计值
                        at.innerText = price * num + "元";
                        //计算总计值
                        getAmount();
                    }
                }
                delBtn.onclick = function() {
                    var result = confirm("确定删除吗?");
                    if (result) {
                        oCar.removeChild(oDiv);
                        number--;
                        getAmount();
                    }
                }
            }
        }
    }
    function getClass(oBox, tagname) {
        var aTag = oBox.getElementsByTagName("*");
        var aBox = [];
        for (var i = 0; i < aTag.length; i++) {
            if (aTag[i].className == tagname) {
                aBox.push(aTag[i]);
            }
        }
        return aBox;
    }
    var index = false;
    function checkAll() {
        var choose = document.getElementById("car").getElementsByTagName("i");
        // console.log(choose);
        if (choose.length != 1) {
            for (i = 1; i < choose.length; i++) {
                if (!index) {
                    choose[0].classList.add("i_acity2")
                    choose[i].classList.add("i_acity");
                } else {
                    choose[i].classList.remove("i_acity");
                    choose[0].classList.remove("i_acity2")
                }
            }
            index = !index;
        }
        getAmount();
    }
    //进行价格合计
    function getAmount() {
        // console.log(ys);
        ns = document.getElementsByClassName("i_acity");
        console.log(ns);
        sum = 0;
        //选中框
        document.getElementById("price_num").innerText = sum;
        for (y = 0; y < ns.length; y++) {
            //小计
            amount_info = ns[y].parentElement.parentElement.lastElementChild.previousElementSibling;
            num = parseInt(amount_info.innerText);
            sum += num;
            document.getElementById("price_num").innerText = sum;
        }
    }
</script>
</body>
</html>
