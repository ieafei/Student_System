<%@ page import="bean.Student" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<style type="text/css">
    table
    {
        border-collapse: collapse;
        margin: 0 auto;
        text-align: center;
    }
    table td, table th
    {
        color: #666;
        height: 30px;
    }
    table thead td, table thead th
    {
        background-color: #CCE8EB;
        width: 100px;
    }
    table tr:nth-child(odd)
    {
        background: #fff;
    }
    table tr:nth-child(even)
    {
        background: #F5FAFA;
    }
    a {font-size:14px}
    a:link {color: #19a8b6; text-decoration:none;}
    a:active {color: red; }
    a:visited {color:purple;text-decoration:none;}
    a:hover {color: red; text-decoration:underline;}
</style>
<body>
<%
    Student student=(Student)request.getAttribute("student");
    String sno = student.getSno();
%>
<table class="LookStudent" border="1" align="center" style="margin-top: 100px">
    <thead>
    <tr bgcolor=yellow>
        <th>学号</th>
        <th>姓名</th>
        <th>性别</th>
        <th>手机号</th>
        <th>邮箱</th>
        <th>Math</th>
        <th>English</th>
        <th>JavaWeb</th>
        <th>C</th>
        <th>Python</th>
        <th>修改</th>
        <th>删除</th>
    <tr>
    </thead>
    <tr>
        <td><%=student.getSno()%></td>
        <td><%=student.getName()%></td>
        <td><%=student.getSex()%></td>
        <td><%=student.getPhone()%></td>
        <td><%=student.getMail()%></td>
        <td><%=student.getMath()%></td>
        <td><%=student.getEnglish()%></td>
        <td><%=student.getJavaweb()%></td>
        <td><%=student.getC()%></td>
        <td><%=student.getPython()%></td>
        <% out.println("<td><a href = 'UpdateStudent.jsp?sno=" + sno + "'>修改</a></td>");
        out.println("<td><a href = 'DeleteStudent?sno=" + sno + "'>删除</a></td>"); %>
    </tr>
</table>
</body>
</html>
