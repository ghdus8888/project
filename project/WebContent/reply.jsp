<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<script language="javascript">
	function replyCheck() { 
		var form = document.replyform; 
		if( !form.name.value ) { 
			alert( "이름을 적어주세요" ); 
			form.name.focus(); 
			return; 
			} 
		if( !form.password.value ) { 
			alert( "비밀번호를 적어주세요" ); 
			form.password.focus(); 
			return; 
			} 
		if( !form.title.value ) {
			alert( "제목을 적어주세요" ); 
			form.title.focus(); 
			return; 
			} 
		if( !form.memo.value ) {
			alert( "내용을 적어주세요" ); 
			form.memo.focus(); 
			return; 
			} 
		form.submit(); 
		}
	
</script>
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/project?characterEncoding=UTF-8&serverTimezone=UTC";
	String id = "root";
	String pass = "q1w2e3r4A";
	String title = "";
	try {
		Connection conn = DriverManager.getConnection(url, id, pass);
		Statement stmt = conn.createStatement();
		String sql = "SELECT TITLE FROM board WHERE NUM=" + idx;
		ResultSet rs = stmt.executeQuery(sql);
		if (rs.next()) {
			title = rs.getString(1);
		}
		rs.close();
		stmt.close();
		conn.close();
	} catch (SQLException e) {
	}
%>



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
				<table>
					<form name=replyform method=post action="reply_ok.jsp?idx=<%=idx%>">
						<tr>
							<td>
								<table width="100%" cellpadding="0" cellspacing="0" border="0">
									<tr
										style="background: url('img/table_mid.gif') repeat-x; text-align: center;">
										<td width="5"><img src="img/table_left.gif" width="5"
											height="30" /></td>
										<td>답글</td>
										<td width="5"><img src="img/table_right.gif" width="5"
											height="30" /></td>
									</tr>
								</table>
								<table>
									<tr>
										<td>&nbsp;</td>
										<td align="center">제목</td>
										<td><input name="title" size="50" maxlength="100"
											value="<%=title%>"></td>
										<td>&nbsp;</td>
									</tr>
									<tr height="1" bgcolor="#dddddd">
										<td colspan="4"></td>
									</tr>
									<tr>
										<td>&nbsp;</td>
										<td align="center">이름</td>
										<td><input name="name" size="50" maxlength="50"></td>
										<td>&nbsp;</td>
									</tr>
									<tr height="1" bgcolor="#dddddd">
										<td colspan="4"></td>
									</tr>
									<tr>
										<td>&nbsp;</td>
										<td align="center">비밀번호</td>
										<td><input name="password" size="50" maxlength="50"></td>
										<td>&nbsp;</td>
									</tr>
									<tr height="1" bgcolor="#dddddd">
										<td colspan="4"></td>
									</tr>
									<tr>
										<td>&nbsp;</td>
										<td align="center">내용</td>
										<td><textarea name="memo" cols="50" rows="13"></textarea></td>
										<td>&nbsp;</td>
									</tr>
									<tr height="1" bgcolor="#dddddd">
										<td colspan="4"></td>
									</tr>
									<tr height="1" bgcolor="#82B5DF">
										<td colspan="4"></td>
									</tr>
									<tr align="center">
										<td>&nbsp;</td>
										<td colspan="2"><input type=button value="등록"
											OnClick="javascript:replyCheck();"> <input
											type=button value="취소" OnClick="javascript:history.back(-1)">
										<td>&nbsp;</td>
									</tr>
								</table>
							</td>
						</tr>
				</table>

			</div>
		</bodyer>



		<footer class="footer-section">
			<div class="container">
				<ul class="footer-list">
					<li><a href=""> </a></li>
					<li>
						<p class="address">
						<h2>풋살장 예약 시스템에 오신 것을 환영합니다.</h2>
						<p>
							연락자: 이호연 <br /> tel: 010-3337-9606 <br />주소: 전라북도 전주시 덕진구 인후동1가
							706-20번지
						</p>
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
