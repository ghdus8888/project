<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="project1.joinService"%>
<%@ page import="java.io.PrintWriter"%>

<%
request.setCharacterEncoding("utf-8");
PrintWriter script = response.getWriter();
%>






<%
System.out.println("check 페이지");
	int a=0;
	String idd = request.getParameter("idd");
	joinService join = joinService.getInstance();

	if(idd.equals("")){
		
		 script.println("<script>");
        script.println("alert('아이디를 입력해주십시오')");
    //    script.println("history.back()"); 
           script.println("location.href = 'join.jsp'");
        script.println("</script>");
	}
	
	
	a = join.joincheck(idd);
	
	
	
	
	 if (a == 1){



		 script.println("<script>");
      script.println("alert('중복체크완료 되었습니다.')");
      script.println("history.back()"); 
      script.println("</script>");
     //  response.sendRedirect("main.jsp");
	}
	else{
		
		 script.println("<script>");
      script.println("alert('아이디가 중복되었습니다.')");
      script.println("history.back()"); 
      script.println("</script>");
	}


%>



<html>
<head>
<title>체크</title>
</head>
<body>중복체크 되었습니다.
</body>
</html>
