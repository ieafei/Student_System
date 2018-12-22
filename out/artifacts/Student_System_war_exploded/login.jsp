<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
    <title>学生信息管理系统</title>
    <link href="login.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
    request.getSession().invalidate();
%>
<%
    String CookieUsername = "";
    String CookiePassword = "";
    Cookie[] cookies = request.getCookies();
    if(cookies != null){
        for(int i = 0;i < cookies.length; i++){
            String CName = cookies[i].getName();
            if(CName.equals("username")){
                CookieUsername = cookies[i].getValue();
            }
            if(CName.equals("password")){
                CookiePassword = cookies[i].getValue();
            }
        }
    }
%>
    <h1>学生信息管理系统
        <sup>ZDB</sup>
    </h1>
    <div class="login" style="margin-top: 50px;">
        <div class="header">
            <div id="switch" class="switch">
                <a id="switch_register" class="switch_btn_focus" href="login.jsp" >登录</a>
                <a id="switch_login" class="switch_btn"  href="register.jsp" >注册</a>
                <div id="switch_bottom" class="switch_bottom" style="position: absolute; width: 50px; left: -10px;"></div>
            </div>
        </div>
        <div id="web_qr_login" class="web_qr_login" style="display: block; height: 340px">
            <%--登录--%>
            <div id="web_login" class="web_login">
                <div class="login-box">
                    <div class="login_form">
                        <form id="login_form" class="loginForm" name="login_From" action="login_action" accept-charset="utf-8" method="post" onsubmit="check()">
                            <div id="uinArea" class="uinArea">
                                <label class="input-tips" for="u">账号:</label>
                                <div id="uArea" class="inputOuter">
                                    <input id="u" class="input_style" type="text" required name="username" value="<%=CookieUsername%>">
                                </div>
                            </div>
                            <div id="pwdArea" class="pwdArea">
                                <label class="input-tips" for="p">密码:</label>
                                <div id="pArea" class="inputOuter">
                                <input id="p" class="input_style" type="password" required name="password" value="<%=CookiePassword%>">
                                </div>
                            </div>
                            <div>验证码:
                            <input class="code" type="text" required name="code" size="10">
                            <img name="img_Validate" class="code_img" border="0" src="code.jsp"  onclick="this.src='code.jsp?d='+Math.random();"><br>
                            </div>
                            <div class="select_role" style="margin-top: 20px; margin-left: -1px">
                                身份选择：
                            <select name="select_value">
                                <option value="user">管理员</option>
                                <option value="student">学生</option>
                            </select>
                                <span style="margin-left: 48px" >🐀🐂🐅🐇</span>
                            </div>
                            <input id="remember_password" type="checkbox" name="check"/>记住密码
                            <a id="forget_password" href="find_password.jsp">忘记密码</a>
                            <div style="padding-left: 60px; margin-top: 20px;" >
                                <input class="button_blue" type="submit" value="登 录" style="width: 150px;" >
                            </div>
                            <%
                                if (request.getAttribute("message1") != null) {
                                    out.println("<script type=\"text/javascript\">");
                                    out.println("alert(\"验证码错误!\");");
                                    out.println("</script>");
                                }
                                if (request.getAttribute("message2") != null) {
                                    out.println("<script type=\"text/javascript\">");
                                    out.println("alert(\"账号或密码错误!\");");
                                    out.println("</script>");
                                }
                                if (request.getAttribute("message3") != null) {
                                    out.println("<script type=\"text/javascript\">");
                                    out.println("alert(\"注册成功!\");");
                                    out.println("</script>");
                                }
                                if (request.getAttribute("message4") != null) {
                                    out.println("<script type=\"text/javascript\">");
                                    out.println("alert(\"密码修改成功!\");");
                                    out.println("</script>");
                                }
                                if (request.getAttribute("message5") != null) {
                                    out.println("<script type=\"text/javascript\">");
                                    out.println("alert(\"邮件发送成功!\");");
                                    out.println("</script>");
                                }
                            %>
                        </form>
                    </div>
                </div>
            </div>
            <%--登录结束--%>
        </div>
    </div>
</body>
</html>