<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('로그아웃 되었습니다')");
	script.println("location.href = 'main.jsp'");
	script.println("</script>");

	session.invalidate();
	// response.sendRedirect("main.jsp");
%>


</head>
<body>

</body>
</html>