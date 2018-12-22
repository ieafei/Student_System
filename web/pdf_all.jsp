<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.lowagie.text.*" %>
<%@ page import="com.lowagie.text.pdf.PdfWriter" %>
<%@ page import="java.io.FileOutputStream" %>
<%@ page import="java.awt.*" %>
<%@ page import="com.lowagie.text.Font" %>
<%@ page import="com.lowagie.text.pdf.BaseFont" %>
<%@ page import="com.lowagie.text.Paragraph" %>
<%@ page import="bean.Student" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bean.StudentDao" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    try{
        StudentDao Dao=new StudentDao();
        Document doc=new Document();
        ArrayList<Student> Students=Dao.find_all();
//        Student stu=(Student)session.getAttribute("stu");
//        String sno = stu.getSno();
//        String name = stu.getName();
//        String sex = stu.getSex();
//        String phone = stu.getPhone();
//        String mail = stu.getMail();
//        String math = stu.getMath();
//        String english = stu.getEnglish();
//        String javaweb= stu.getJavaweb();
//        String c = stu.getC();
//        String python = stu.getPython();
        String real_path=application.getRealPath("/");
        PdfWriter.getInstance(doc,new FileOutputStream(real_path + "text.pdf"));
        doc.open();
        BaseFont baseFont = BaseFont.createFont("STSong-Light", "UniGB-UCS2-H", BaseFont.NOT_EMBEDDED);
        Font font = new Font(baseFont, 10, Font.NORMAL, Color.blue);
        Paragraph paragraph = new Paragraph("学生信息表单",font);
        paragraph.setAlignment(Element.ALIGN_CENTER);
        doc.add(paragraph);
        Table table = new Table(10,Students.size());
        table.setDefaultHorizontalAlignment(Element.ALIGN_CENTER);
        table.setPadding(10);
        table.addCell(new Cell(new Paragraph("学号",font)));
        table.addCell(new Cell(new Paragraph("姓名",font)));
        table.addCell(new Cell(new Paragraph("性别",font)));
        table.addCell(new Cell(new Paragraph("手机号",font)));
        table.addCell(new Cell(new Paragraph("邮箱",font)));
        table.addCell(new Cell(new Paragraph("数学",font)));
        table.addCell(new Cell(new Paragraph("英语",font)));
        table.addCell(new Cell(new Paragraph("JavaWeb",font)));
        table.addCell(new Cell(new Paragraph("C",font)));
        table.addCell(new Cell(new Paragraph("Python",font)));
        for(int i=0;i<Students.size();i++){
        Student stu=Students.get(i);
        Cell cell1 = new Cell(new Paragraph(stu.getSno(),font));
        table.addCell(cell1);
        Cell cell2 = new Cell(new Paragraph(stu.getName(),font));
        table.addCell(cell2);
        Cell cell3 = new Cell(new Paragraph(stu.getSex(),font));
        table.addCell(cell3);
        Cell cell4 = new Cell(new Paragraph(stu.getPhone(),font));
        table.addCell(cell4);
        Cell cell5 = new Cell(new Paragraph(stu.getMail(),font));
        table.addCell(cell5);
        Cell cell6 = new Cell(new Paragraph(stu.getMath(),font));
        table.addCell(cell6);
        Cell cell7 = new Cell(new Paragraph(stu.getEnglish(),font));
        table.addCell(cell7);
        Cell cell8 = new Cell(new Paragraph(stu.getJavaweb(),font));
        table.addCell(cell8);
        Cell cell9 = new Cell(new Paragraph(stu.getC(),font));
        table.addCell(cell9);
        Cell cell10 = new Cell(new Paragraph(stu.getPython(),font));
        table.addCell(cell10);
        }
        doc.add(table);
        doc.close();
        response.setHeader("Content - Disposition", "attachment ; filename = text.pdf");
        response.setContentType("application/pdf");}catch (Exception e){
        e.printStackTrace();
    }
%>
<jsp:forward page = "//text.pdf"></jsp:forward>
</body>
</html>
