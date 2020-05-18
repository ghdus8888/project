<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action="test.jsp" method="post">
select <select name="select" >
         <option value="1" selected="selected">1</option>
         <option value="2" >2</option>
         <option value="3">3</option>
         <option value="4">4</option>
         </select>
         <p>
         <hr>
         <p>

         <input type="submit" value="보내기">
</form>
<%
request.setCharacterEncoding("utf-8");

String select1="select1 : "+request.getParameter("select")+"번";
 
out.println(select1+"<p>");

 
%>
</body>
</html>