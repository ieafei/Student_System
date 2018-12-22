package action;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Date;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.util.Random;

import bean.Student;
import bean.StudentDao;
import com.jspsmart.upload.File;
import com.jspsmart.upload.Request;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;


@WebServlet(name = "change_head")
@MultipartConfig
public class change_head extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SmartUpload smartUpload = new SmartUpload();
        ServletConfig config = this.getServletConfig();
        smartUpload.initialize(config,request,response);
        try {
            HttpSession session=request.getSession();
            Student stu=(Student)session.getAttribute("stu");
            smartUpload.upload();
            File smartFile = smartUpload.getFiles().getFile(0);
            String name = smartFile.getFileName();
            String filepath= stu.getSno() + ".jpg";
            smartFile.saveAs("E:/" +  filepath, smartUpload.SAVE_PHYSICAL);
            StudentDao Dao = new StudentDao();
            Connection connection = Dao.getConnection();
            String sql = "update students set picname=? where sno=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1,name);
            statement.setString(2,stu.getSno());
            statement.executeUpdate();
            stu.setPicname(name);
            session.setAttribute("stu",stu);
            request.setAttribute("message","头像修改成功");
            request.getRequestDispatcher("Look_info.jsp").forward(request,response);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
