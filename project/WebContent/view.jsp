<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/project?characterEncoding=UTF-8&serverTimezone=UTC";
	String id = "root";
	String pass = "q1w2e3r4A";
	int idx = Integer.parseInt(request.getParameter("idx"));
	try {
		Connection conn = DriverManager.getConnection(url, id, pass);
		Statement stmt = conn.createStatement();
		String sql = "SELECT USERNAME, TITLE, MEMO, TIME, HIT FROM board WHERE NUM=" + idx;
		ResultSet rs = stmt.executeQuery(sql);
		if (rs.next()) {
			String name = rs.getString(1);
			String title = rs.getString(2);
			String memo = rs.getString(3);
			String time = rs.getString(4);
			int hit = rs.getInt(5);
			hit++;
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
					<tr>
						<td>
							<table>
								<tr>
									<td>
										<table width="100%" cellpadding="0" cellspacing="0" border="0">
											<tr
												style="background: url('img/table_mid.gif') repeat-x; text-align: center;">
												<td width="5"><img src="img/table_left.gif" width="5"
													height="30" /></td>
												<td>내 용</td>
												<td width="5"><img src="img/table_right.gif" width="5"
													height="30" /></td>
											</tr>
										</table>
										<table width="413">
											<tr>
												<td width="0">&nbsp;</td>
												<td align="center" width="76">글번호</td>
												<td width="319"><%=idx%></td>
												<td width="0">&nbsp;</td>
											</tr>
											<tr height="1" bgcolor="#dddddd">
												<td colspan="4" width="407"></td>
											</tr>
											<tr>
												<td width="0">&nbsp;</td>
												<td align="center" width="76">조회수</td>
												<td width="319"><%=hit%></td>
												<td width="0">&nbsp;</td>
											</tr>
											<tr height="1" bgcolor="#dddddd">
												<td colspan="4" width="407"></td>
											</tr>
											<tr>
												<td width="0">&nbsp;</td>
												<td align="center" width="76">이름</td>
												<td width="319"><%=name%></td>
												<td width="0">&nbsp;</td>
											</tr>
											<tr height="1" bgcolor="#dddddd">
												<td colspan="4" width="407"></td>
											</tr>
											<tr>
												<td width="0">&nbsp;</td>
												<td align="center" width="76">작성일</td>
												<td width="319"><%=time%></td>
												<td width="0">&nbsp;</td>
											</tr>
											<tr height="1" bgcolor="#dddddd">
												<td colspan="4" width="407"></td>
											</tr>
											<tr>
												<td width="0">&nbsp;</td>
												<td align="center" width="76">제목</td>
												<td width="319"><%=title%></td>
												<td width="0">&nbsp;</td>
											</tr>
											<tr height="1" bgcolor="#dddddd">
												<td colspan="4" width="407"></td>
											</tr>
											<tr>
												<td width="0"></td>
												<td width="399" colspan="2" height="200"><%=memo%>
											</tr>
											<%
												sql = "UPDATE board SET HIT=" + hit + " where NUM=" + idx;
														stmt.executeUpdate(sql);
														rs.close();
														stmt.close();
														conn.close();
													}
												} catch (SQLException e) {
												}
											%>
											<tr height="1" bgcolor="#dddddd">
												<td colspan="4" width="407"></td>
											</tr>
											<tr height="1" bgcolor="#82B5DF">
												<td colspan="4" width="407"></td>
											</tr>
											<tr align="center">
												<td width="0">&nbsp;</td>
												<td colspan="2" width="399"><input type=button
													value="글쓰기" OnClick="window.location='write.jsp'">
													<input type=button value="답글" OnClick="window.location='reply.jsp?idx=<%=idx%>'">

													<input type=button value="목록" OnClick="window.location='menu3.jsp'"> 
												
													<input type=button value="삭제" OnClick="window.location='delete.jsp?idx=<%=idx%>'">
												<td width="0">&nbsp;</td>
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
