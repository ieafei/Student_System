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
<jsp:useBean id="stu" class="bean.Student" scope="session"></jsp:useBean>
<table class="LookStudent" border="1" align="center" style="margin-top: 40px;">
    <thead>
    <tr bgcolor=yellow>
        <th>Math</th>
        <th>English</th>
        <th>JavaWeb</th>
        <th>C</th>
        <th>Python</th>
    </tr>
    </thead>
    <tr>
        <td><%=stu.getMath()%></td>
        <td><%=stu.getEnglish()%></td>
        <td><%=stu.getJavaweb()%></td>
        <td><%=stu.getC()%></td>
        <td><%=stu.getPython()%></td>
    </tr>
</table>
</div>
</div>
</body>
</html>
