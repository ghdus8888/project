<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>


<!DOCTYPE HTML>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<title>풋살장 예약 시스템</title>
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/default.css">
<link rel="stylesheet" type="text/css" href="css/index.css">
<link rel="apple-touch-icon-precomposed"
	href="images/favicon/indigo-touch-icon.png">
<script src="js/jquery.min.js"></script>
<script src="js/foot.min.js"></script>
<script src="js/profile.js"></script>


<style>
</style>
<%
	String checkId = "";
	checkId = (String) session.getAttribute("b_id");
	Enumeration se = session.getAttributeNames();

	while (se.hasMoreElements()) {
		String getse = se.nextElement() + "";
	}
%>
</head>

<body>
	<div id="wrap">

		<div class="index">
			<%
				if (checkId == null) {
			%>
			<a href="login.jsp"><button id="login_check">로그인</button></a>
			<%
				} else {
			%>
			<a href="logout.jsp"><button id="login_check">로그아웃</button></a>
			<%
				}
			%>

			<button>|</button>
			<button id="myBtn">내 정보</button>


		</div>
		<header class="header cfixed">
			<h1 class="logo">
				<a href="main.jsp">풋살장 예약 시스템</a>
			</h1>
			<nav>
				<ul class="gnb">
					<li><a href="menu1.jsp">예약하기</a></li>
					<li><a href="menu2.jsp">반납하기</a></li>
					<li><a href="menu3.jsp">상대방 찾기</a></li>
					<li><a href="">이용안내</a></li>

				</ul>
			</nav>
			
		</header>
		<bodyer class="bodyer-section">
			<div class="container">
					<h1>게시판</h1>
					<div class="container">
					 <%
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/project?characterEncoding=UTF-8&serverTimezone=UTC";
	String id = "root";
	String pass = "q1w2e3r4A";
	int total = 0;
	
	try {
		Connection conn = DriverManager.getConnection(url,id,pass);
		Statement stmt = conn.createStatement();

		String sqlCount = "SELECT COUNT(*) FROM board";
		ResultSet rs = stmt.executeQuery(sqlCount);
		
		if(rs.next()){
			total = rs.getInt(1);
		}
		rs.close();
		out.print("총 게시물 : " + total + "개");
		
		String sqlList = "SELECT NUM, USERNAME, TITLE, TIME, HIT, INDENT from board order by REF DESC, STEP ASC";
		rs = stmt.executeQuery(sqlList);
		
%>
<table width="100%" height="100%" cellpadding="0" cellspacing="0" border="0">
  <tr height="5"><td width="5"></td></tr>
 <tr style="background:url('img/table_mid.gif') repeat-x; text-align:center;">
   <td width="5"><img src="img/table_left.gif" width="5" height="30" /></td>
   <td width="73">번호</td>
   <td width="379">제목</td>
   <td width="73">작성자</td>
   <td width="164">작성일</td>
   <td width="58">조회수</td>
   <td width="7"><img src="img/table_right.gif" width="5" height="30" /></td>
  </tr>
<%
	if(total==0) {
%>
	 		<tr align="center" bgcolor="#FFFFFF" height="30">
	 	   <td colspan="6">등록된 글이 없습니다.</td>
	 	  </tr>
<%
	 	} else {
	 		
		while(rs.next()) {
			int idx = rs.getInt(1);
			String name = rs.getString(2);
			String title = rs.getString(3);
			String time = rs.getString(4);
			int hit = rs.getInt(5);
		
%>
<tr height="25" align="center">
	<td>&nbsp;</td>
	<td><%=idx %></td>
	<td align="left"><a href="view.jsp?idx=<%=idx%>"><%=title %></td>
	<td align="center"><%=name %></td>
	<td align="center"><%=time %></td>
	<td align="center"><%=hit %></td>
	<td>&nbsp;</td>
</tr>
  <tr height="1" bgcolor="#D2D2D2"><td colspan="6"></td></tr>
<% 
		}
	} 
	rs.close();
	stmt.close();
	conn.close();
} catch(SQLException e) {
	out.println( e.toString() );
}
%>
 <tr height="1" bgcolor="#82B5DF"><td colspan="6" width="752"></td></tr>
 </table>
 
<table width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr><td colspan="4" height="5"></td></tr>
  <tr align="center">
   <td><input type=button value="글쓰기" OnClick="window.location='write.jsp'"></td>

  </tr>
</table>

					</div>
					</bodyer>
					


		<footer class="footer-section">
			<div class="container">
				<ul class="footer-list">
					<li><a href=""> 
					</a></li>
					<li>
						<p class="address">
							<h2>풋살장 예약 시스템에 오신 것을 환영합니다.</h2>
							<p>연락자: 이호연  <br/> tel: 010-3337-9606 <br/>주소: 전라북도 전주시 덕진구 인후동1가 706-20번지</p>  
						</p>
					</li>
					<li>
						<div></div>
			</div>
			</li>
			</ul>
	</div>
		</footer>
	</section>
	</div>
	
</body>

</html>
