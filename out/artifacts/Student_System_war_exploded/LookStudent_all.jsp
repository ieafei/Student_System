<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="bean.Student" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Insert title here</title>
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
<div>
    <td align="center" colspan="12" >
    <h2 align="center">所有学生信息</h2>
    </td>
    <table align="center" border="1"  class="table">
        <thead>
        <tr align="center" bgcolor="yellow">
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
        </tr>
        </thead>
        <%
            List<Student> list=(List<Student>)request.getAttribute("list");
            for(Student stu:list){
        %>
            <tr bgcolor="#00ffff">
                <td><%=stu.getSno()%></td>
                <td><%=stu.getName()%></td>
                <td><%=stu.getSex()%></td>
                <td><%=stu.getPhone()%></td>
                <td><%=stu.getMail()%></td>
                <td><%=stu.getMath()%></td>
                <td><%=stu.getEnglish()%></td>
                <td><%=stu.getJavaweb()%></td>
                <td><%=stu.getC()%></td>
                <td><%=stu.getPython()%></td>
                <% out.println("<td><a href = 'UpdateStudent.jsp?sno=" + stu.getSno()+ "'>修改</a></td>");
                    out.println("<td><a href = 'DeleteStudent?sno=" + stu.getSno() + "'>删除</a></td>"); %>
            </tr>
            <%
                }
            %>
        <tr>
            <td align="center" colspan="12">
                <%=request.getAttribute("bar") %>
            </td>
        </tr>
    </table><br>
    <a href="pdf_all.jsp" style="margin-left:600px;">生成所有学生PDF文件</a>
</div>
</body>
</html>
