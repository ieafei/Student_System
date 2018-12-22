<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="welcome.css" rel="stylesheet" type="text/css">
</head>
<body>
<form  class="Add_Student" action="AddStudent" method="post" accept-charset="utf-8">
    <label for="sno">学号:</label>
        <input type="text" id="sno" required name="add_sno"><br><br>
    <label for="name">姓名:</label>
        <input type="text" id="name" required name="add_name"><br><br>
    <label for="phone">手机号:</label>
    <input type="text" id="phone" required name="add_phone" ><br><br>
    <label for="mail">邮箱:</label>
    <input type="text" id="mail" required name="add_mail"><br><br>
    <label for="math">数学:</label>
    <input type="text" id="math" required name="add_math"><br><br>
    <label for="english">英语:</label>
    <input type="text" id="english" required name="add_english"><br><br>
    <label for="javaweb">JavaWeb:</label>
    <input type="text" id="javaweb" required name="add_javaweb"><br><br>
    <label for="c">C:</label>
    <input type="text" id="c" required name="add_c"><br><br>
    <label for="python">Python:</label>
    <input type="text" id="python" required name="add_python"><br>
    <input class="sex_boy" type="radio" required name="add_sex" value="男">男
    <input class="sex_girl" type="radio" required name="add_sex" value="女">女<br>
    <button type="submit" class="btn">提交信息</button>
    <%
        if (request.getAttribute("message1") != null) {
        out.println("<script type=\"text/javascript\">");
        out.println("alert(\"信息格式错误！请重新输入\");");
        out.println("</script>");
        }
        if (request.getAttribute("message2") != null) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert(\"学号已存在!请重新输入\");");
            out.println("</script>");
        }
        if (request.getAttribute("message3") != null) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert(\"添加成功！\");");
            out.println("</script>");
        }
    %>
</form>
</body>
</html>
