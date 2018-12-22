package action;

import bean.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;


@WebServlet(name = "LookStudent_sno")
public class LookStudent_sno extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sno=request.getParameter("LookStudent_sno");
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet rs=null;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/school?serverTimezone=GMT";
            connection = DriverManager.getConnection(url, "root", "991208");
            String sql="select * from students where sno=?";
            statement=connection.prepareStatement(sql);
            statement.setString(1,sno);
            rs=statement.executeQuery();
            if(!rs.next()){
                request.setAttribute("message", "学号不存在！请重新输入");
                request.getRequestDispatcher("LookStudent_sno.jsp").forward(request, response);
            }
            else{
                Student student = new Student();
                student.setSno(rs.getString("sno"));
                student.setName(rs.getString("name"));
                student.setSex(rs.getString("sex"));
                student.setPhone(rs.getString("phone"));
                student.setMail(rs.getString("mail"));
                student.setMath(rs.getString("math"));
                student.setEnglish(rs.getString("english"));
                student.setJavaweb(rs.getString("javaweb"));
                student.setC(rs.getString("c"));
                student.setPython(rs.getString("python"));
                request.setAttribute("student", student);
                request.getRequestDispatcher("LookStudent.jsp").forward(request, response);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
