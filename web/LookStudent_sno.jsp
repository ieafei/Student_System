<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="welcome.css" rel="stylesheet" type="text/css">
</head>
<body>
<form class="LookStudent_sno" action="LookStudent_sno" method="post" accept-charset="utf-8">
    <label for="name">学号:</label>
    <input type="text" id="name" required name="LookStudent_sno"><br>
    <button type="submit" class="btn" >查找信息</button>
    <%
        if (request.getAttribute("message") != null) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert(\"学号不存在!请重新输入\");");
            out.println("</script>");
        }
    %>
</form>
</body>
</html>
