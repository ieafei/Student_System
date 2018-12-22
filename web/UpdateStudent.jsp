<%@ page import="bean.StudentDao" %>
<%@ page import="java.net.ConnectException" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="bean.Student" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="welcome.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
    String sno = request.getParameter("sno");
    StudentDao Dao =new StudentDao();

    try {
        Connection connection = Dao.getConnection();
        String sql = "select * from students where sno=?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, sno);
        ResultSet rs = statement.executeQuery();
        if (rs.next()) {
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
            session.setAttribute("Stu",student);
        }
    }catch (Exception e){
        e.printStackTrace();
    }
%>
<jsp:useBean id="Stu" class="bean.Student" scope="session"></jsp:useBean>
    <form class="Update_Student" action="UpdateStudent" method="post" accept-charset="utf-8">
        <label for="sno">学号:</label>
        <input type="text" id="sno" required name="update_sno" value="<%=sno%>"><br><br>
        <label for="name">姓名:</label>
        <input type="text" id="name" required name="update_name" value=<jsp:getProperty property="name" name="Stu"/>><br><br>
        <label for="phone">手机号:</label>
        <input type="text" id="phone" required name="update_phone" value=<jsp:getProperty property="phone" name="Stu"/>><br><br>
        <label for="mail">邮箱:</label>
        <input type="text" id="mail" required name="update_mail" value=<jsp:getProperty property="mail" name="Stu"/>><br><br>
        <label for="math">数学:</label>
        <input type="text" id="math" required name="update_math" value=<jsp:getProperty property="math" name="Stu"/>><br><br>
        <label for="english">英语:</label>
        <input type="text" id="english" required name="update_english" value=<jsp:getProperty property="english" name="Stu"/>><br><br>
        <label for="javaweb">JavaWeb:</label>
        <input type="text" id="javaweb" required name="update_javaweb" value=<jsp:getProperty property="javaweb" name="Stu"/>><br><br>
        <label for="c">C:</label>
        <input type="text" id="c" required name="update_c" value=<jsp:getProperty property="c" name="Stu"/>><br><br>
        <label for="python">Python:</label>
        <input type="text" id="python" required name="update_python" value=<jsp:getProperty property="python" name="Stu"/>><br>
        <input class="sex_boy" type="radio" required name="update_sex" value="男" <%if("男".equals(Stu.getSex())){%> checked<%}%>>男
        <input class="sex_girl" type="radio" required name="update_sex" value="女" <%if("女".equals(Stu.getSex())){%> checked<%}%>>女<br>
        <button type="submit" class="btn">确定修改</button>
    </form>
</body>
</html>
