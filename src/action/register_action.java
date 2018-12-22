package action;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;



@WebServlet(name = "register_action")
public class register_action extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String pass_wd1 = request.getParameter("pass_wd1");
        String pass_wd2 = request.getParameter("pass_wd2");
        if(!pass_wd1.equals(pass_wd2)){
            request.setAttribute("message2", "前后密码不一致！");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
        String mail = request.getParameter("mail");
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/school?serverTimezone=GMT";
            connection = DriverManager.getConnection(url, "root", "991208");
            String sql1 = "select * from users where username=?";
            statement = connection.prepareStatement(sql1);
            statement.setString(1,username);
            rs = statement.executeQuery();
            if (rs.next()) {
                request.setAttribute("message", "该用户已存在");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
            else{
                String sql2 = "insert into users (username,password,mail) values(?,?,?)";
                statement = connection.prepareStatement(sql2);
                statement.setString(1, username);
                statement.setString(2, pass_wd1);
                statement.setString(3, mail);
                statement.executeUpdate();
                request.setAttribute("message3","注册成功!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
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
