<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p  style="margin-left:500px; font-size: 25px">欢迎使用学生操作系统
                                                                --ZDB</p>
<%
    if (request.getAttribute("message1") != null) {
        out.println("<script type=\"text/javascript\">");
        out.println("alert(\"删除成功!\");");
        out.println("</script>");
    }
    if (request.getAttribute("message2") != null) {
        out.println("<script type=\"text/javascript\">");
        out.println("alert(\"更新成功!\");");
        out.println("</script>");
    }
    if (request.getAttribute("message3") != null) {
        out.println("<script type=\"text/javascript\">");
        out.println("alert(\"添加成功!\");");
        out.println("</script>");
    }
    if (request.getAttribute("message4") != null) {
        out.println("<script type=\"text/javascript\">");
        out.println("alert(\"密码修改成功!\");");
        out.println("</script>");
    }
%>
</body>
</html>
