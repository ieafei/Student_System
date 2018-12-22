package action;

import org.apache.commons.mail.HtmlEmail;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(name = "mail")
public class mail extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String mail = request.getParameter("mail");
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/school?serverTimezone=GMT";
            connection = DriverManager.getConnection(url, "root", "991208");
            String sql1 = "select * from users where mail=?";
            statement = connection.prepareStatement(sql1);
            statement.setString(1, mail);
            rs = statement.executeQuery();
            if (rs.next()) {
                String password = rs.getString("password");
                try {
                    HtmlEmail email = new HtmlEmail();
                    email.setHostName("smtp.126.com");
                    email.setCharset("utf-8");
                    email.addTo(mail);
                    email.setFrom("afeiniubi123@126.com", "ZDB:");
                    email.setAuthentication("afeiniubi123@126.com", "afeiniubi123");
                    email.setSubject("找回密码");
                    email.setMsg("你的密码是:" + password);
                    email.send();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            else{
                String sql2="select * from students where mail=?";
                statement = connection.prepareStatement(sql2);
                statement.setString(1, mail);
                rs = statement.executeQuery();
                if(rs.next()){
                    String password = rs.getString("password");
                    try {
                        HtmlEmail email = new HtmlEmail();
                        email.setHostName("smtp.126.com");
                        email.setCharset("utf-8");
                        email.addTo(mail);
                        email.setFrom("afeiniubi123@126.com", "zhangbo");
                        email.setAuthentication("afeiniubi123@126.com", "afeiniubi123");
                        email.setSubject("找回密码");
                        email.setMsg("你的密码是:" + password);
                        email.send();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                else{
                request.setAttribute("message", "邮箱错误！请重新输入");
                request.getRequestDispatcher("mail_find.jsp").forward(request, response);}
            }
            }catch (Exception e){
            e.printStackTrace();
        }
        request.setAttribute("message5","密码修改成功!");
        request.getRequestDispatcher("login.jsp").forward(request,response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
