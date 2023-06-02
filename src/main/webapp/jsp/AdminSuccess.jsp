<%--
  Created by IntelliJ IDEA.
  User: lxl000000000
  Date: 2022/7/11
  Time: 9:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<meta http-equiv="refresh" content="0;url=admin/superAdmin_home.jsp">
<script>
    var flag = 0;
    if(flag==0){
        alert("添加管理员成功");
        flag ==1;
        if(flag==1){
            response.sendRedirect("admin/superAdmin_home.jsp");//重定向
        }
    }
</script>
</body>
</html>
