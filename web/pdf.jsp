<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.lowagie.text.*" %>
<%@ page import="com.lowagie.text.pdf.PdfWriter" %>
<%@ page import="java.io.FileOutputStream" %>
<%@ page import="java.awt.*" %>
<%@ page import="com.lowagie.text.Font" %>
<%@ page import="com.lowagie.text.pdf.BaseFont" %>
<%@ page import="com.lowagie.text.Paragraph" %>
<%@ page import="bean.Student" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        try{
        Document doc=new Document();
        Student stu=(Student)session.getAttribute("stu");
        String sno = stu.getSno();
        String name = stu.getName();
        String sex = stu.getSex();
        String phone = stu.getPhone();
        String mail = stu.getMail();
        String math = stu.getMath();
        String english = stu.getEnglish();
        String javaweb= stu.getJavaweb();
        String c = stu.getC();
        String python = stu.getPython();
        String real_path=application.getRealPath("/");
        PdfWriter.getInstance(doc,new FileOutputStream(real_path + "text.pdf"));
        doc.open();
        BaseFont baseFont = BaseFont.createFont("STSong-Light", "UniGB-UCS2-H", BaseFont.NOT_EMBEDDED);
        Font font = new Font(baseFont, 10, Font.NORMAL, Color.blue);
        Paragraph paragraph = new Paragraph("学生信息表单",font);
        paragraph.setAlignment(Element.ALIGN_CENTER);
        doc.add(paragraph);
        Table table = new Table(10,2);
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
        Cell cell1 = new Cell(new Paragraph(sno,font));
        table.addCell(cell1);
        Cell cell2 = new Cell(new Paragraph(name,font));
        table.addCell(cell2);
        Cell cell3 = new Cell(new Paragraph(sex,font));
        table.addCell(cell3);
        Cell cell4 = new Cell(new Paragraph(phone,font));
        table.addCell(cell4);
        Cell cell5 = new Cell(new Paragraph(mail,font));
        table.addCell(cell5);
        Cell cell6 = new Cell(new Paragraph(math,font));
        table.addCell(cell6);
        Cell cell7 = new Cell(new Paragraph(english,font));
        table.addCell(cell7);
        Cell cell8 = new Cell(new Paragraph(javaweb,font));
        table.addCell(cell8);
        Cell cell9 = new Cell(new Paragraph(c,font));
        table.addCell(cell9);
        Cell cell10 = new Cell(new Paragraph(python,font));
        table.addCell(cell10);
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
