<%@ page contentType="text/html; charset=utf-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="js/jquery.min.js"></script>
<script src="login.js"></script>
<title>로그인</title>
<style>
#login_box {
	font-family: serif;
	margin: 0 auto;
	width: 100%;
	max-width: 600px;
	height: 800px;
	background-color: white;
	border: none;
	border-radius: 15px;
	text-align: center;
	color: #A566FF;
}


a:link {
	color: black;
	text-decoration: none;
}

#login_button button {
	width: 102%;
	height: 50px;
	border-radius: 10px;
	border: none;
	color: #A566FF;
	font-size: 30px;
	color: #fff;
	cursor: pointer;
}

#login_button button:active {
	transform: translateY(5px)
}

p input {
	width: 100%;
	height: 40px;
	font-size: 23px;
	color: gray;
	padding-left: 10px;
	border-radius: 10px;
	letter-spacing: 2px;
}
a {
   text-decoration:none;
   color:#A566FF;
}
s
</style>

<%
	
%>


</head>

<body>


	<div id="login_box">
		<h2 style="margin-top: 50px;"><a href="http://203.234.62.85:8080/project/main.jsp" >풋살장 예약 시스템</a></h2>
		<form action="userCheck.jsp" method="post">
			<p>
				<!-- value 하드코딩함 -->
				<input type="text" name="id" value="test1" placeholder="아이디">
				<input type="password" name="passwd" value="123" placeholder="비밀번호" style="margin-top: 10px;">
			</p>

			<div id="login_button">
				<button type="submit" style="background: #A566FF;">로그인</button>
			</div>
		</form>
	</div>

	<br>
	<div id="ps_button">
	<a href="join.jsp" target="_blank" style="color: #A566FF; font-size: 20px;"><b>회원가입</b></a><br />
	</div>
	<a href="findid.jsp" target="_blank" style="color: #A566FF; font-size: 20px;"><b>아이디 / 비밀번호 찾기</b></a>
	</div>
</body>
</html>