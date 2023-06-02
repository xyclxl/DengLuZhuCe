<%--
  Created by IntelliJ IDEA.
  User: lxl000000000
  Date: 2023/5/30
  Time: 11:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://cdn.bootcdn.net/ajax/libs/axios/1.3.6/axios.js"></script>

    <script>
        // get方式一
        //     axios.get('/DengLuZhuCe/AxiosTestServlet?method=axiosMethod', {
        //         params: {
        //             username: "李四"
        //         }
        //     })
        //         .then(function (response) {
        //             console.log(response);
        //         })
        //         .catch(function (error) {
        //             console.log(error);
        //         })
        //         .then(function () {
        //             // 总是会执行
        //         });

        // get方式二
        // axios({
        //     method:"get",
        //     url:"/DengLuZhuCe/AxiosTestServlet?method=axiosMethod",
        //     params:{
        //         username:"赵六"
        //     }
        // }).then(function (resp) {
        //     console.log(resp)
        //     //执行成功之后的回调
        // }).catch(function (error) {
        //     //执行失败之后的回调
        // })

        //post请求
        axios({
            method: 'post',
            url: '/DengLuZhuCe/AxiosTestServlet?method=axiosMethod',
            data: {
                username: 'NewD'
            }
        }).then(function (response) {
            console.log(response);
        })
            .catch(function (error) {
                console.log(error);
            });


    </script>
</head>
<body>

<h1>axios学习，与项目无关</h1>
</body>
</html>
