package action;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

import bean.StudentDao;

@WebServlet(name = "Change_password")
public class Change_password extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        String username=(String)session.getAttribute("username");
        String new_pass=request.getParameter("Change_password");
        StudentDao Dao=new StudentDao();
        Connection connection=Dao.getConnection();
        try{
            String sql="update students set password=? where sno=?";
            PreparedStatement statement=connection.prepareStatement(sql);
            statement.setString(1,new_pass);
            statement.setString(2,username);
            statement.executeUpdate();
            request.setAttribute("message4", "ÃÜÂëÐÞ¸Ä³É¹¦!");
            request.getRequestDispatcher("right.jsp").forward(request, response);
        }catch (Exception e){
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
