<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="project.loginService"%>
<%@ page import="java.io.PrintWriter"%>

<%
	request.setCharacterEncoding("utf-8");
	PrintWriter script = response.getWriter();
%>


<jsp:useBean id="login" class="project.login">
	<jsp:setProperty name="login" property="*" />
</jsp:useBean>
<jsp:useBean id="sc" class="project.SessionChecker" scope="application" />


<%
	System.out.println(login.getId() + " 출 력");
	System.out.println(login.getPass() + " 출 력");

	int a;
	String checkid = "";

	loginService ls = loginService.getInstance();
	a = ls.check(login);

	if (a == 1) {

		checkid = (String) session.getAttribute("b_id");

		if (checkid == login.getId()) {
			System.out.println(checkid + "  세션 유지중");
		} else {
			String ip = request.getRemoteAddr();
			sc.setSession(session, ip);
			session.setAttribute("b_id", login.getId());
		//	session.setAttribute("name", login.get);
			System.out.println(checkid + "  세션 생성");
		}

		script.println("<script>");
		script.println("alert('로그인되었습니다.')");

		script.println("location.href = 'main.jsp'");
		script.println("</script>");
	} else if (a == -1) {

		script.println("<script>");
		script.println("alert('비밀번호를 다시 확인해주세요.')");
		script.println("history.back()");
		script.println("</script>");

	} else {
		script.println("<script>");
		script.println("alert('아이디를 다시 확인해주세요.')");
		script.println("history.back()");
		script.println("</script>");

	}
%>

<html>
<head>
<title>성공</title>
</head>
<body>





	로그인 되었습니다.
</body>
</html>