package action;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "DeleteStudent")
public class DeleteStudent extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sno=request.getParameter("sno");
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet rs=null;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/school?serverTimezone=GMT";
            connection = DriverManager.getConnection(url, "root", "991208");
            String sql = "delete from students where sno=?";
            statement=connection.prepareStatement(sql);
            statement.setString(1,sno);
            statement.executeUpdate();
            request.setAttribute("message1", "删除成功");
            request.getRequestDispatcher("right.jsp").forward(request, response);
            }catch (Exception e){
            e.printStackTrace();
        }
    }
}
