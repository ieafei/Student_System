package action;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "UpdateStudent")
public class UpdateStudent extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String sno=request.getParameter("update_sno");
        String name=request.getParameter("update_name");
        String sex=request.getParameter("update_sex");
        String phone=request.getParameter("update_phone");
        String mail=request.getParameter("update_mail");
        String math=request.getParameter("update_math");
        String english=request.getParameter("update_english");
        String javaweb=request.getParameter("update_javaweb");
        String c=request.getParameter("update_c");
        String python=request.getParameter("update_python");
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet rs=null;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/school?serverTimezone=GMT";
            connection = DriverManager.getConnection(url, "root", "991208");
            String sql="Update students set name=?,sex=?,phone=?,mail=?,math=?,english=?,javaweb=?,c=?,python=? where sno=?";
            statement=connection.prepareStatement(sql);
            statement.setString(10,sno);
            statement.setString(1,name);
            statement.setString(2,sex);
            statement.setString(3,phone);
            statement.setString(4,mail);
            statement.setString(5,math);
            statement.setString(6,english);
            statement.setString(7,javaweb);
            statement.setString(8,c);
            statement.setString(9,python);
            statement.executeUpdate();
            request.setAttribute("message2", "更新成功!");
            request.getRequestDispatcher("right.jsp").forward(request, response);
            }catch (Exception e) {
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

