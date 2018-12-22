<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script>
    function setImagePreview() {
        var docObj=document.getElementById("doc");
        var imgObjPreview=document.getElementById("preview");
        if(docObj.files && docObj.files[0]){
            imgObjPreview.style.display = 'block';
            imgObjPreview.style.width = '150px';
            imgObjPreview.style.height = '150px';
            imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
        }
        return true;
    }
</script>
<body>
<jsp:useBean id="stu" class="bean.Student" scope="session"></jsp:useBean>
<form action="change_head" method="post" enctype="multipart/form-data">
    <div id="localImag" align="center" style="margin-top: 50px">
        <%--<img id="preview" width=-1 height=-1 style="diplay:none" />--%>
        <% if ("".equals(stu.getPicname()) || null==stu.getPicname()){%>
        <img id="preview" src="image/1.jpg" style=" width: 150px; height: 150px; margin-left: 50px; margin-right: 50px" >
        <%}else{%>
        <img id="preview" src="image/<%=stu.getPicname()%>" style="width: 150px; height: 150px;margin-left: 50px; margin-right: 50px">
        <%}%>
    </div>
    <div align="center" style="margin-top: 20px;">
    <input type="file" name="upload" class="input-text lh30" size="10"  id="doc" onchange="javascript:setImagePreview();">
    <%--<input type=file name="photo">--%>
    <input type="submit" value="上传">
    </div>
</form>
</body>
</html>
