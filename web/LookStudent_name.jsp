<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="welcome.css" rel="stylesheet" type="text/css">
</head>
<body>
<form class="LookStudent_name" action="LookStudent_name" method="post" accept-charset="utf-8">
    <label for="name">姓名:</label>
    <input type="text" id="name" required name="LookStudent_name"><br>
    <button type="submit" class="btn" >查找信息</button>
    <%
        if (request.getAttribute("message") != null) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert(\"姓名不存在!请重新输入\");");
            out.println("</script>");
        }
    %>
</form>
</body>
</html>
