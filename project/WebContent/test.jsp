<%@page import="java.sql.*"%> <%-- JDBC API 임포트 작업 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    String driverName="com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/project?serverTimezone=UTC";
    String id = "root";
    String pwd ="q1w2e3r4A";
   Connection conn=null;
    try{
        //[1] JDBC 드라이버 로드
        Class.forName(driverName);     
        conn = DriverManager.getConnection(url,id,pwd);
        out.println("good sucess!!");
        conn.close();
    }catch(ClassNotFoundException e){
        out.println("Where is your mysql jdbc driver?");
        e.printStackTrace();
        return;
    }
    out.println("mysql jdbc Driver registered!!");
   
    //[2]데이타베이스 연결 
    
     
    //[3]데이타베이스 연결 해제
    
%>
</body>
</html>
