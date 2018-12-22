<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8" >
    <%--<meta http-equiv = "refresh" content = "1" />--%>
    <title>选择操作</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <head>
<body>
<style>
    body{
        background: #fff url(image/16.jpg) 100% 0 no-repeat;
    }
</style>
<div class="container">
    <div class="btn-group-vertical">
        <button type="button" class="btn btn-success btn-lg" style="margin-top:20px;" onclick="top.showframe.location.href='Look_info.jsp'">查询个人信息<span class="badge"></span></button>
        <button type="button" class="btn btn-success btn-lg" style="margin-top:20px;" onclick="top.showframe.location.href='Look_score.jsp'">查询个人成绩<span class="badge"></span></button>
        <button type="button" class="btn btn-success btn-lg" style="margin-top:20px;" onclick="top.showframe.location.href='Change_password.jsp'">修改个人密码<span class="badge"></span></button>
    </div>
</div>

</body>
</html>