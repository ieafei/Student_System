<%@ page contentType="application/msexcel;charset=GBK"%>
<%@ page import="bean.Student"%>
<%
    response.setHeader("Content-disposition","attachment; filename=info.xls");
%>
<html>
    <head>
        <title>title</title>
    </head>
    <body>
        <%
            Student stu=(Student)session.getAttribute("stu");
            String sno = stu.getSno();
            String name = stu.getName();
            String sex = stu.getSex();
            String phone = stu.getPhone();
            String mail = stu.getMail();
            String math = stu.getMath();
            String english = stu.getEnglish();
            String javaweb= stu.getJavaweb();
            String c = stu.getC();
            String python = stu.getPython();
        %>
        <table border="1" width="100%">
            <tr>
                <td>学号</td><td>姓名</td><td>性别</td><td>手机号</td><td>Math</td><td>English</td><td>JavaWeb</td><td>C</td><td>Python</td>
            </tr>
            <tr>
                <td><%=sno%></td><td><%=name%></td><td><%=sex%></td><td><%=phone%></td><td><%=mail%></td><td><%=math%></td><td><%=english%>
            </td><td><%=javaweb%></td><td><%=c%></td><td><%=python%></td>
            </tr>
        </table>
    </body>
</html>