<%@ page contentType="charset=UTF-8" language="java"
    import="java.awt.*" import="java.awt.image.BufferedImage" import="java.util.*" import="javax.imageio.ImageIO"  %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        response.setHeader("Cache-Control", "no-cache");
        int width=60, height=20;
        BufferedImage image=new BufferedImage(width, height, BufferedImage.TYPE_INT_BGR);
        Graphics g=image.getGraphics();
        g.setColor(new Color(200, 200, 200));
        g.fillRect(0,0,width,height);
        Random rnd=new Random();
        int rndNum=rnd.nextInt(8999)+1000;
        String randStr=String.valueOf(rndNum);
        session.setAttribute("randStr", randStr);
        g.setColor(Color.BLACK);
        g.setFont(new Font("", Font.PLAIN, 20));
        g.drawString(randStr, 10, 17);
        for (int i=0; i<100; i++){
            int x=rnd.nextInt(width);
            int y=rnd.nextInt(height);
            g.drawOval(x,y,1,1);
        }
        ImageIO.write(image,"JPEG",response.getOutputStream());
        out.clear();
        out=pageContext.pushBody();
    %>
</body>
</html>
