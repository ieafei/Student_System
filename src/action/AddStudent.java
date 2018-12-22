package action;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "AddStudent")
public class AddStudent extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String sno=request.getParameter("add_sno");
        String name=request.getParameter("add_name");
        String sex=request.getParameter("add_sex");
        String phone=request.getParameter("add_phone");
        String mail=request.getParameter("add_mail");
        String math=request.getParameter("add_math");
        String english=request.getParameter("add_english");
        String javaweb=request.getParameter("add_javaweb");
        String c=request.getParameter("add_c");
        String python=request.getParameter("add_python");
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet rs=null;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/school?serverTimezone=GMT";
            connection = DriverManager.getConnection(url, "root", "991208");
            String sql1="select * from students where sno=?";
            statement=connection.prepareStatement(sql1);
            statement.setString(1,sno);
            rs=statement.executeQuery();
            if (rs.next()){ request.setAttribute("message2", "学号已存在！请重新输入");
                request.getRequestDispatcher("AddStudent.jsp").forward(request, response);
            }
            else{
                String sql2 = "insert into students(sno,name,sex,phone,mail,math,english,javaweb,c,python) values(?,?,?,?,?,?,?,?,?,?)";
                statement=connection.prepareStatement(sql2);
                statement.setString(1,sno);
                statement.setString(2,name);
                statement.setString(3,sex);
                statement.setString(4,phone);
                statement.setString(5,mail);
                statement.setString(6,math);
                statement.setString(7,english);
                statement.setString(8,javaweb);
                statement.setString(9,c);
                statement.setString(10,python);
                statement.executeUpdate();
                request.setAttribute("message3", "添加成功");
                request.getRequestDispatcher("right.jsp").forward(request, response);
            }
        }catch(Exception e){
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
