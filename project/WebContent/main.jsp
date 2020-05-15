<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=utf-8"%>

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
<link rel="stylesheet" type="text/css" href="css/header.css">
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
	System.out.println(checkId + " : 세션아이디 ");
	Enumeration se = session.getAttributeNames();

	while (se.hasMoreElements()) {
		String getse = se.nextElement() + "";
		System.out.println("@@@@@@@ session : " + getse + " : " + session.getAttribute(getse));
	}
%>
</head>

<body>
	<div id="wrap">

		<div class="index">
			<%
				if (checkId == null) {
			%>
			<a href="login2.jsp"><button id="login_check">로그인</button></a>
			<%
				} else {
			%>
			<a href="logout.jsp"><button id="login_check">로그아웃</button></a>
			<%
				}
			%>

			<button>|</button>
			<button id="myBtn">MY PAGE</button>


		</div>
		<header class="header cfixed">
			<h1 class="logo">
				<a href="">풋살장 예약</a>
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
					<br>
					
					<img class="iimg" src="images/ground.png" alt="" width="1300" height="800">
					
		

		<footer class="footer-section">
			<div class="container">
				<ul class="footer-list">
					<li><a href=""> 
					</a></li>
					<li>
						<p class="address">
							<h2>풋살장 예약 시스템에 오신 것을 환영합니다.</h2>
							<p>대표자: 이호연   tel: 01033379606   주소: 전라북도 전주시 덕진구 인후동1가 706-20번지</p>  
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
	<script>
		var slideIndex = 1;
		showSlides(slideIndex);

		function plusSlides(n) {
			showSlides(slideIndex += n);
		}

		function currentSlide(n) {
			showSlides(slideIndex = n);
		}

		function showSlides(n) {
			var i;
			var slides = document.getElementsByClassName("mySlides");
			var dots = document.getElementsByClassName("dot");
			if (n > slides.length) {
				slideIndex = 1
			}
			if (n < 1) {
				slideIndex = slides.length
			}
			for (i = 0; i < slides.length; i++) {
				slides[i].style.display = "none";
			}
			for (i = 0; i < dots.length; i++) {
				dots[i].className = dots[i].className.replace(" active", "");
			}
			slides[slideIndex - 1].style.display = "block";
			dots[slideIndex - 1].className += " active";
		}
	</script>
	<script>
		var modal = document.getElementById('myModal');

		// Get the button that opens the modal
		var btn = document.getElementById("myBtn");

		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("close")[0];

		// When the user clicks the button, open the modal
		btn.onclick = function() {
			modal.style.display = "block";
		}

		// When the user clicks on <span> (x), close the modal
		span.onclick = function() {
			modal.style.display = "none";
		}

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
	</script>
</body>

</html>
