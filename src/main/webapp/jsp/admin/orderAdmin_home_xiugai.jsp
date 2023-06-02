<%@ page import="com.yang.mapper.AdminInfoDaoImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="com.yang.javabean.AdminInfo" %>
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
    .column .text { color: #f00 !important; }
    .cell { font-weight: bold; }

    .pagination {
      float: right;
      /* display: flex; */
      display: inline-block;
      padding-right: 0;
      margin: 0px 0px;
      border-radius: 4px;}
    :root {
      --animate-delay: 0.5s;
    }
  </style>
</head>
<body>

<%--------订单管理员修改界面-------%>
<div class="animate__animated animate__bounceInLeft  animate__delay-0.5s">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel">
          修改订单信息
        </h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="window.location.href='orderAdmin_home.jsp'"><span aria-hidden="true">&times;</span></button>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" role="form" action="/DengLuZhuCe/OrderUpdateByid?id=${sessionScope.queryorder.id}" method="post">
          <div class="form-group">
            <label  class="col-sm-2 control-label">顾客</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" value="${sessionScope.queryorder.ordernum}"
                     placeholder="请输入用户顾客姓名" name="ordernum">
            </div>
          </div>
          <div class="form-group">
            <label  class="col-sm-2 control-label">品名</label>
            <div class="col-sm-10">
              <select class="form-control"  name="ordername">
                <option selected="selected" value="${sessionScope.queryorder.ordername}">${sessionScope.queryorder.ordername}</option>
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
            <label  class="col-sm-2 control-label">数量</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" value="${sessionScope.queryorder.ordernumber}"
                     placeholder="请输入数量" name="ordernumber">
            </div>
          </div>
          <div class="form-group">
            <label  class="col-sm-2 control-label">类型</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" value="${sessionScope.queryorder.ordertype}"
                     placeholder="请输入商品类型" name="ordertype">
            </div>
          </div>
          <div class="form-group">
            <label  class="col-sm-2 control-label">下单时间</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" name="ordertime" placeholder="请输入下单时间" value="${sessionScope.queryorder.ordertime}" readonly>
            </div>
          </div>
          <div class="form-group">
            <span style="padding-left: 15px;"></span>
            <button type="submit" class="btn btn-primary">
              确认修改
            </button>
          </div>
        </form>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="window.location.href='orderAdmin_home.jsp'">返回</button>
      </div>
    </div>
  </div>
</div>
</div>
</body>
</html>
