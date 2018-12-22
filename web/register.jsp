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
                <div id="switch" class="switch">
                <a id="switch_register" class="switch_btn" href="login.jsp" >登录</a>
                <a id="switch_login" class="switch_btn_focus"  href="register.jsp" >注册</a>
                <div id="switch_bottom" class="switch_bottom" style="position: absolute; width: 50px; right: -10px;"></div>
                </div>
            </div>
            <div id="register" class="register" style="display: block;">
                <div class="web_login">
                     <form id="regUser" name="form2" accept-charset="utf-8" action="register_action" method="post">
                      <ul id="reg-ul" class="reg_form">
                          <br><br>
                     <li>
                        <label class="input-tips2" for="user">用户名:</label>
                             <div class="inputOuter2">
                                 <input id="user" class="input_style2" type="text" required name="username" maxlength="16">
                             </div>
                     </li>
                     <li>
                         <label class="input-tips2" for="pass_wd1">密码:</label>
                            <div class="inputOuter2">
                                 <input id="pass_wd1" class="input_style2" type="password" required name="pass_wd1">
                            </div>
                     </li>
                    <li>
                         <label class="input-tips2" for="pass_wd2">确认密码:</label>
                             <div class="inputOuter2">
                                 <input id="pass_wd2" class="input_style2" type="password" required name="pass_wd2">
                            </div>
                    </li>
                    <li>
                        <label class="input-tips2" for="mail">邮箱:</label>
                            <div class="inputOuter2">
                                <input id="mail" class="input_style2" type="text" required name="mail">
                            </div>
                    </li>
                    <li>
                        <div class="inputArea">
                        <input id="reg" class="button_blue" type="submit" style="margin-top: 10px;margin-left: 85px" value="同意协议并注册">
                        </div>
                     </li>
                    </ul>
                    </form>
                    <%
                        if (request.getAttribute("message") != null) {
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert(\"该用户名已存在! 请重新注册\");");
                            out.println("</script>");
                        }
                        if (request.getAttribute("message2") != null) {
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert(\"前后密码不一致！请重新输入\");");
                            out.println("</script>");
                        }
                    %>
                 </div>
            </div>
        </div>
</body>
</html>
