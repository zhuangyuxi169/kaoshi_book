<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/5/24
  Time: 10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
</head>
<h2>登录</h2>

    用户名：<input type="text" name="username">
    <br>
    密  码：<input type="password" name="password">
    <input type="button" onclick="jump()" value="登录" id="sub1">

</body>
<script>
     // $("#sub1").on("click",function(){
     //     alert("登录成功");
     //     window.location.href = "/goods/list";
     //
     // });
    function jump() {
        alert("登录成功");
        window.open("/goods/list")
    }
</script>
</html>
