
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
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
        <button type="button" class="btn btn-success btn-lg" style="margin-top:20px;" onclick="top.showframe.location.href='AddStudent.jsp'">增加学生信息<span class="badge"></span></button>
        <div class="btn-group">
            <button type="button" class="btn btn-primary dropdown-toggle btn-lg" data-toggle="dropdown" style="margin-top:20px;">
                查找学生信息
            </button>
            <ul class="dropdown-menu" role="menu">
                <li><a href="page_select" target="showframe">查询全部学生</a></li>
                <li><a href="LookStudent_sno.jsp" target="showframe">根据学号查找</a></li>
                <li><a href="LookStudent_name.jsp" target="showframe">根据姓名查找</a></li>
            </ul>
        </div>
        <button type="button" class="btn btn-success btn-lg" style="margin-top:20px;" onclick="top.showframe.location.href='Change_password_user.jsp'">修改个人密码<span class="badge"></span></button>
    </div>
</div>
</body>
</html>