package action;

import javax.lang.model.element.NestingKind;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "new_password")
public class new_password extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String mail = request.getParameter("mail");
        String username=request.getParameter("username");
        String password = request.getParameter("password");
            Connection connection = null;
            PreparedStatement statement = null;
            ResultSet rs=null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/school?serverTimezone=GMT";
                connection = DriverManager.getConnection(url, "root", "991208");
                String sql1 = "select * from users where mail=? and username=?";
                statement=connection.prepareStatement(sql1);
                statement.setString(1,mail);
                statement.setString(2,username);
                rs=statement.executeQuery();
                if (rs.next())
                {
                    String sql2 = "update users set password=? where mail=? and username=?";
                    statement = connection.prepareStatement(sql2);
                    statement.setString(1,password);
                    statement.setString(2,mail);
                    statement.setString(3,username);
                    statement.executeUpdate();
                    request.setAttribute("message4","密码修改成功!");
                    request.getRequestDispatcher("login.jsp").forward(request,response);
                }
                else
                {
                    String sql3="select * from students where mail=? and sno=?";
                    statement = connection.prepareStatement(sql3);
                    statement.setString(1,mail);
                    statement.setString(2,username);
                    rs=statement.executeQuery();
                    if (rs.next()){
                        String sql2 = "update students set password=? where mail=? and sno=?";
                        statement = connection.prepareStatement(sql2);
                        statement.setString(1,password);
                        statement.setString(2,mail);
                        statement.setString(3,username);
                        statement.executeUpdate();
                        request.setAttribute("message4","密码修改成功!");
                        request.getRequestDispatcher("login.jsp").forward(request,response);
                    }
                    else{
                            request.setAttribute("message", "用户名错误!请重新输入");
                            request.getRequestDispatcher("find_password.jsp").forward(request, response);
                    }
                }
            }catch (Exception e){
                e.printStackTrace();
            }
            try{
                if (statement != null)
                    statement.close();
                if (connection != null)
                connection.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
