<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
        <p class="find_text">找回密码</p>
    </div>
    <div id="web_qr_login" class="web_qr_login" style="display: block; height: 290px">
        <%--找回密码--%>
        <div id="web_login" class="web_login">
            <div class="login-box">
                <div class="login_form">
                    <form id="login_form" class="loginForm" action="new_password" accept-charset="utf-8" method="post">
                        <div id="uinArea" class="uinArea">
                            <label class="input-tips" for="u">账号:</label>
                            <div id="uArea" class="inputOuter">
                                <input id="u" class="input_style" type="text" required name="username">
                            </div>
                            <label class="input-tips" for="mail">邮箱:</label>
                            <div  class="inputOuter">
                                <input id="mail" class="input_style" type="text" required name="mail">
                            </div>
                            <label class="input-tips" for="password" style="width:60px;margin-left:-10px;">新密码:</label>
                            <div class="inputOuter">
                                <input id="password" class="input_style" type="password" required name="password">
                            </div>
                        </div>
                        <a id="return_login" href="login.jsp">返回登录</a>
                        <a id="mail_find" href="mail_find.jsp">找回旧密码</a>
                        <div style="padding-left: 50px; margin-top: 130px">
                            <input class="button_blue" type="submit" value="重设密码" style="width: 150px;margin-left: 15px;" >
                        </div>
                        <%
                            if (request.getAttribute("message") != null) {
                                out.println("<script type=\"text/javascript\">");
                                out.println("alert(\"用户名不存在!请重新输入\");");
                                out.println("</script>");
                            }
                        %>
                    </form>
                </div>
            </div>
        </div>
        <%--找回密码结束--%>
    </div>
</div>
</body>
</html>