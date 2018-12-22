package bean;

import javax.servlet.http.HttpSession;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentDao {
    public Connection getConnection(){
        Connection connection =null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/school?serverTimezone=GMT";
            connection = DriverManager.getConnection(url, "root", "991208");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }
    public List<Student> find(int page){
        List<Student> list = new ArrayList<Student>();
        Connection connection = getConnection();
        String sql = "select * from students order by sno limit ?,? ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, (page-1)* Student.PAGE_SIZE);
            ps.setInt(2, Student.PAGE_SIZE);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Student student=new Student();
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
                list.add(student);
            }
            ps.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public int findCount(){
        int count=0;
        Connection connection = getConnection();
        String sql = "select * from students";
        try {
            Statement sta = connection.createStatement();
            ResultSet rs = sta.executeQuery(sql);
            while(rs.next()){
                count++;  //对总记录数赋值
            }
            sta.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;        //返回总记录数
    }
    public ArrayList<Student> find_all() {
        ArrayList<Student> Students=new ArrayList<Student>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/school?serverTimezone=GMT";
            connection = DriverManager.getConnection(url, "root", "991208");
            String sql="select * from students order by sno";
            statement=connection.prepareStatement(sql);
            rs=statement.executeQuery();
            while(rs.next()){
                Student student=new Student();
                student.setSno(rs.getString("sno"));
                student.setName(rs.getString("name"));
                student.setSex(rs.getString("sex"));
                student.setPicname(rs.getString("picname"));
                student.setPhone(rs.getString("phone"));
                student.setMail(rs.getString("mail"));
                student.setMath(rs.getString("math"));
                student.setEnglish(rs.getString("english"));
                student.setJavaweb(rs.getString("javaweb"));
                student.setC(rs.getString("c"));
                student.setPython(rs.getString("python"));
                Students.add(student);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Students;
    }

}
