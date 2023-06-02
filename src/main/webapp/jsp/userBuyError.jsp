<%--
  Created by IntelliJ IDEA.
  User: lxl000000000
  Date: 2022/7/20
  Time: 16:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<meta http-equiv="refresh" content="0;url=/DengLuZhuCe/推荐产品.jsp">
<script>
    var flag = 0;
    if(flag==0){
        alert("请输入完整的购买信息!");
        flag ==1;
        if(flag==1){
            response.sendRedirect("/DengLuZhuCe/推荐产品.jsp");//重定向
        }
    }
</script>
</body>
</html>
