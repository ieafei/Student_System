<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生信息管理系统</title>
    <link href="login.css" rel="stylesheet" type="text/css">
</head>
<body>
<h1>学生信息管理系统
    <sup>ZDB</sup>
</h1>
<div class="login" style="margin-top: 50px;">
    <div class="header">
        <p class="find_text" >邮箱找回</p>
    </div>
    <div id="register" class="register" style="display: block;">
        <div class="web_login">
            <form id="regUser" name="form2" accept-charset="utf-8" action="mail" method="post">
                <ul id="reg-ul" class="reg_form">
                    <br><br>
                    <li>
                        <label class="input-tips2" for="mail">邮箱:</label>
                        <div class="inputOuter2">
                            <input id="mail" class="input_style2" type="text" required name="mail">
                        </div>
                    </li>
                    <a id="return_login" href="login.jsp" style="margin-top: 20px; margin-left: 30px">返回登录</a>
                    <li>
                        <div class="inputArea">
                            <input id="reg" class="button_blue" type="submit" style="margin-top: 10px;margin-left: 90px; width: 140px" value="找回旧密码">
                        </div>
                    </li>
                </ul>
                <%
                    if (request.getAttribute("message") != null) {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert(\"邮箱不存在!请重新输入\");");
                        out.println("</script>");
                    }
                %>
            </form>
        </div>
    </div>
</div>
</body>
</html>