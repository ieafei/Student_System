package bean;

public class Student {
    public static final int PAGE_SIZE=5;
    private String sno;
    private String name;
    private String sex;
    private String picname;
    private String phone;
    private String math;
    private String english;
    private String javaweb;
    private String c;
    private String python;
    private String mail;
    public void setSno(String sno){
        this.sno=sno;
    }
    public void setName(String name){
        this.name=name;
    }
    public void setSex(String sex){
        this.sex=sex;
    }
    public void setPicname(String picname){
        this.picname=picname;
    }
    public void setPhone(String phone){this.phone=phone;}
    public void setMail(String mail){this.mail=mail;}
    public void setMath(String math){this.math=math;}
    public void setEnglish(String english){this.english=english;}
    public void setJavaweb(String java){this.javaweb=java;}
    public void setC(String c){this.c=c;}
    public void setPython(String python){this.python=python;}
    public String getSno(){
        return sno;
    }
    public String getName(){
        return name;
    }
    public String getSex(){
        return sex;
    }
    public String getPicname(){
        return picname;
    }
    public String getPhone(){return phone;}
    public String getMail(){return  mail;}
    public String getMath(){return math;}
    public String getEnglish(){return english;}
    public String getJavaweb(){return javaweb;}
    public String getC(){return c;}
    public String getPython(){return python;}
    }

