<%--
  Created by IntelliJ IDEA.
  User: lxl000000000
  Date: 2022/7/6
  Time: 8:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<meta http-equiv="refresh" content="0;url=jsp/userRegister.jsp">
<%--网页打开后达到相应时间即转网页：--%>
<%--content=1 是时间控制,表示1秒后自动跳转到要跳转的页面.--%>
<%--content=0表示打开该页后立即跳转到你要跳转的页面.--%>
<%--url=login.jsp 是要跳转的页面--%>
<script>
    var flag = 0;
    if(flag==0){
        alert("请输入完整的注册信息！");
        flag ==1;
        if(flag==1){
            response.sendRedirect("jsp/userRegister.jsp");//重定向
        }
    }
</script>
</body>
</html>
