<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>


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
					
					<div class="container">
					<h1>예약하기</h1>
<div align="center"></div>
<table border="1" width=auto height=auto>
<tr height="10%">
<th width="20%" style="font-size: 30px">풋살장</th>
<th width="40%" style="font-size: 30px">예약시간</th>
<th width="20%" style="font-size: 30px">예약가능여부</th>
</tr>
<%
      // 1. JDBC 드라이버 로딩
      Class.forName("com.mysql.jdbc.Driver");
  
      Connection conn = null; // DBMS와 Java연결객체
      Statement stmt = null; // SQL구문을 실행
      ResultSet rs = null; // SQL구문의 실행결과를 저장
  
      try
      {
            String jdbcDriver = "jdbc:mysql://localhost:3306/project?characterEncoding=UTF-8&serverTimezone=UTC";
            String dbUser = "root";
            String dbPass = "q1w2e3r4A";
   
            String query = "select * from ground_1";
   
            // 2. 데이터베이스 커넥션 생성
            conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
   
            // 3. Statement 생성
            stmt = conn.createStatement();
   
            // 4. 쿼리 실행
            rs = stmt.executeQuery(query);
   
            // 5. 쿼리 실행 결과 출력
            while(rs.next())
            {
%>

      <tr>
            <td><center><button type="button">풋살장 1</button></center></td>
            <td><center><button type="button"><%= rs.getString("time") %></button></center></td>
            <td><%= rs.getString("yn") %></td>
      </tr>
<%
            }
      }catch(SQLException ex){
            out.println(ex.getMessage());
            ex.printStackTrace();
      }finally{
            // 6. 사용한 Statement 종료
            if(rs != null) try { rs.close(); } catch(SQLException ex) {}
            if(stmt != null) try { stmt.close(); } catch(SQLException ex) {}
   
            // 7. 커넥션 종료
            if(conn != null) try { conn.close(); } catch(SQLException ex) {}
      }
%>

</table>
</div>
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
