package action;

import bean.Student;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "login_action")
public class login_action extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("select_value");
        String code = request.getParameter("code");
        HttpSession session = request.getSession();
        session.setAttribute("username", username);
        String randStr = (String)session.getAttribute("randStr");
        if (!code.equals(randStr)){
            request.setAttribute("message1","验证码错误!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/school?serverTimezone=GMT";
            connection = DriverManager.getConnection(url, "root", "991208");
            if ("user".equals(role)){
            String sql1 = "select * from users where username=? and password=?";
            statement = connection.prepareStatement(sql1);
            statement.setString(1, username);
            statement.setString(2, password);
            rs =statement.executeQuery();
            Cookie cookies1 = new Cookie("username",username);
            Cookie cookies2 = new Cookie("password",password);
            if(rs.next()){
                if(request.getParameter("check") != null){
                    cookies1.setMaxAge(600);
                    cookies2.setMaxAge(600);
                    response.addCookie(cookies1);
                    response.addCookie(cookies2);
                }
                response.sendRedirect("welcome_user.html");
                return;
            }
            else{
                request.setAttribute("message2","账号或密码错误");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        }
        else if ("student".equals(role)){
                String sql2 = "select * from students where sno=? and password=?";
                statement = connection.prepareStatement(sql2);
                statement.setString(1, username);
                statement.setString(2, password);
                rs =statement.executeQuery();
                Cookie cookies1 = new Cookie("username",username);
                Cookie cookies2 = new Cookie("password",password);
                if(rs.next()){
                    Student student=new Student();
                    student.setSno(rs.getString("sno"));
                    student.setName(rs.getString("name"));
                    student.setSex(rs.getString("sex"));
                    student.setPicname(rs.getString("picname"));
                    student.setPhone(rs.getString("phone"));
                    student.setMail(rs.getString("mail"));
                    student.setMath(rs.getString("math"));
                    student.setEnglish(rs.getString("english"));
                    student.setJavaweb(rs.getString(  "javaweb"));
                    student.setC(rs.getString("c"));
                    student.setPython(rs.getString("python"));
                    session.setAttribute("stu",student);
                    if(request.getParameter("check") != null){
                        cookies1.setMaxAge(600);
                        cookies2.setMaxAge(600);
                        response.addCookie(cookies1);
                        response.addCookie(cookies2);
                    }
                    response.sendRedirect("welcome_student.html");
                    return;
                }
                else{
                    request.setAttribute("message2","账号或密码错误");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        finally {
            try{
                if (rs != null)
                    rs.close();
                if (statement != null)
                    statement.close();
                if (connection != null)
                    connection.close();
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        }
    }