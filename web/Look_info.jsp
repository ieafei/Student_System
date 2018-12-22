<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ page import="bean.Student" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>此学生信息</title>
    <style>
        .resume_con{ width:1000px; margin:0 auto}
        .all_resume{ background:#fff; padding:20px; }
        .all_resume img{ border:1px solid #ccc}
        .all_resume p{ line-height:22px;font-family:Geneva, Arial, Helvetica, sans-serif; font-size:12px; color:#666}
        .resume_left{width:700px;float:left; background:#fff;border-right:1px solid #ccc;}
        .he{ height:8px; overflow:hidden}
        .uploade{background-color: #f8f8f8;
            border: 1px solid #eee;
            border-radius: 8px;
            float: left;
            margin: 50px 50px 50px 50px;
            padding: 50px 50px;}
        .uploade img{}
        .uploade_btn{color:#19a8b6;background:url(image/17.jpg) no-repeat;width:64px; height:27px;display:inline-block; line-height:27px;
            margin-left: 0px;}
        .uploade_btn:hover{color:black;}
        .table_style{float:left;margin-top: 50px;}
        .table_style table tr th{color:#999;}
        .table_style table tr td{padding-left:5px;}
        a {font-size:14px}
        a:link {color: #19a8b6; text-decoration:none;}
        a:active {color: red; }
        a:visited {color:purple;text-decoration:none;}
        a:hover {color: red; text-decoration:underline;}
    </style>
</head>
<body>
<jsp:useBean id="stu" class="bean.Student" scope="session"></jsp:useBean>
<div class="all_resume">
    <div class="rusume_left">
        <div class="table_style">
            <table width="300" border="0" cellpadding="3" cellspacing="1" bgcolor="#EEEEEE">
                <tr>
                    <td width="100" align="right" bgcolor="#F8F8F8" style="color:gray;">学号:</td>
                    <td bgcolor="#F8F8F8">
                        <jsp:getProperty property="sno" name="stu"/></td></tr></table>
            <div class="he"></div>
            <table width="300" border="0" cellpadding="3" cellspacing="1" bgcolor="#EEEEEE">
                <tr>
                    <td width="100" align="right" bgcolor="#F8F8F8" style="color:gray;">姓名:</td>
                    <td bgcolor="#F8F8F8">
                        <jsp:getProperty property="name" name="stu"/></td></tr></table>
            <div class="he"></div>
            <table width="300" border="0" cellpadding="3" cellspacing="1" bgcolor="#EEEEEE">
                <tr>
                    <td width="100" align="right" bgcolor="#F8F8F8" style="color:gray;">性别:</td>
                    <td bgcolor="#F8F8F8">
                        <jsp:getProperty property="sex" name="stu"/></td></tr></table>
            <div class="he"></div>
            <%--<table width="300" border="0" cellpadding="3" cellspacing="1" bgcolor="#EEEEEE">--%>
            <%--<tr>--%>
            <%--<td width="100" align="right" bgcolor="#F8F8F8" style="color:gray;">年龄:</td>--%>
            <%--<td bgcolor="#F8F8F8">--%>
            <%--<jsp:getProperty property="age" name="stu"/></td></tr></table>--%>
            <%--<div class="he"></div>--%>
            <table width="300" border="0" cellpadding="3" cellspacing="1" bgcolor="#EEEEEE">
                <tr>
                    <td width="100" align="right" bgcolor="#F8F8F8" style="color:gray;">手机号:</td>
                    <td bgcolor="#F8F8F8">
                        <jsp:getProperty property="phone" name="stu"/></td></tr></table>
            <div class="he"></div>
            <table width="300" border="0" cellpadding="3" cellspacing="1" bgcolor="#EEEEEE">
                <tr>
                    <td width="100" align="right" bgcolor="#F8F8F8" style="color:gray;">邮箱:</td>
                    <td bgcolor="#F8F8F8">
                        <jsp:getProperty property="mail" name="stu"/></td></tr></table>
            <div class="he"></div>
            <table width="300" border="0" cellpadding="3" cellspacing="1" bgcolor="#EEEEEE">
            <tr>
            <td width="100" align="right" bgcolor="#F8F8F8" style="color:gray;">下载:</td>
            <td bgcolor="#F8F8F8">
                <a href="pdf.jsp">PDF</a>&nbsp<a href="excel.jsp">EXCEL</a></td></tr></table>
            <div class="he"></div>
            <%--<table width="300" border="0" cellpadding="3" cellspacing="1" bgcolor="#EEEEEE">--%>
            <%--<tr>--%>
            <%--<td width="100" align="right" bgcolor="#F8F8F8" style="color:gray;">所在院系:</td>--%>
            <%--<td bgcolor="#F8F8F8">--%>
            <%--<jsp:getProperty property="dep" name="stu"/></td></tr></table>--%>
            <%--<div class="he"></div>--%>
            <%--<table width="300" border="0" cellpadding="3" cellspacing="1" bgcolor="#EEEEEE">--%>
                <%--<tr>--%>
                    <%--<td width="100" align="right" bgcolor="#F8F8F8" style="color:gray;">下载:</td>--%>
                    <%--<td bgcolor="#F8F8F8">--%>
                        <%--<jsp:getProperty property="id" name="stu"/></td></tr></table>--%>
            <%--<div class="he"></div>--%>
        </div>
        <div style="float:right;" class="uploade">
            <% if ("".equals(stu.getPicname()) || null==stu.getPicname()){%>
            <img src="image/1.jpg" style=" width: 150px; height: 150px; margin-left: 50px; margin-right: 50px" >
            <%}else{%>
            <img src="image/<%=stu.getPicname()%>" style="width: 150px; height: 150px;margin-left: 50px; margin-right: 50px">
            <%}%>
            <p>&nbsp;</p>
            <div align="center">
                <a href="head_picture.jsp" class="uploade_btn">更换照片</a>
            </div>
        </div>
    </div>
</div>
<%
    if(request.getAttribute("message")!=null){
        out.println("<script type=\"text/javascript\">");
        out.println("alert(\"头像修改成功!\");");
        out.println("</script>");
    }
%>
</body>
</html>