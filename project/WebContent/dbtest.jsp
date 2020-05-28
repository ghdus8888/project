<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    try{
        Class c = Class.forName("com.mysql.jdbc.Driver"); //드라이브 로딩
        if(c!=null){
        out.println("mysql JDBC 드라이브 로딩 완료");
        }
     }catch(ClassNotFoundException e){
           out.println(e);//에러를 웹브라우저에 출력
     }
%>