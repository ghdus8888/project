<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="project1.joinService"%>
<%@ page import="java.io.PrintWriter"%>
<%
response.setCharacterEncoding("utf-8");
	request.setCharacterEncoding("utf-8");
	PrintWriter script = response.getWriter();
%>

<jsp:useBean id="member" class="project1.Member">
	<jsp:setProperty name="member" property="*" />
</jsp:useBean>




<%
	System.out.println("joinsuccess 페이지");

	int a = 0;
	joinService join = joinService.getInstance();
	a = join.joinservice(member);
	if (a == 1) {
		script.println("<script>");
		script.println("alert('아이디 중복 확인을 눌러주십시오.')");
		script.println("location.href = 'join.jsp'");
		script.println("</script>");

	} else {
		script.println("<script>");
		script.println("alert('회원가입 되었습니다.')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
	}
%>



<html>
<head>
<title>성공</title>
</head>
<body>
</body>
</html>
