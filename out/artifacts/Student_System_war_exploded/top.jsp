
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <title>首页</title>
</head>
<body>
<style>
    body{
        background: #fff url(image/13.jpg) 50% 0 no-repeat;
    }
</style>
<h1 style="text-align: center;">学生信息管理系统</h1>
<%
    String username = (String)session.getAttribute("username");
%>
 <p align="right"><%= username%>&nbsp;欢迎您！</p>
&nbsp;<a href="login.jsp" target="_top" style="margin-left: 1450px">退出登录</a>
</body>
</html>