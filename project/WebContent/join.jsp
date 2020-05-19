<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>


<style>
form {
	width: 100%;
	border: solid auto;
	color: #A566FF;
}

@media all and (min-width:320px) {
	h1 {
		font-size: 60px;
		margin-top: -5px;
	}
	.aid2, .aid3, .pw2, .pw_2, .nm2, .hn2, .bt_1, .pn2 {
		line-height: 30px;
		border: solid auto;
		width: 50%;
		margin: 0 auto;
	}
	.aid, .pw, .pw_1, .nm, .hn, .pn {
		line-height: 40px;
		border: solid auto;
		width: 50%;
		margin: 0 auto;
		text-align: left;
	}

	.clear {
		clear: left;
	}
	div input {
		border: solid 1.7px;
		width: 90%;
		height: 35px;
		color: gray;
		padding-left: 10px;
		border-radius: 10px;
		letter-spacing: 1px;
	}
	select {
		-webkit-appearance: none; /* 화살표 없애기 for chrome*/
		-moz-appearance: none; /* 화살표 없애기 for firefox*/
		appearance: none;
		width: 24%;
		height: 35px;
		border-radius: 7px;
		border: solid 2px;
	}
}

@media all and (min-width:768px) {
	h1 {
		font-size: 70px;
		margin-top: -10px;
	}
	.aid2, .aid3, .pw2, .pw_2, .nm2, .hn2, .bt_1, .pn2 {
		line-height: 40px;
		border: solid auto;
		width: 40%;
		margin: 0 auto;
	}
	.aid, .pw, .pw_1, .nm, .hn, .pn {
		line-height: 40px;
		border: solid auto;
		width: 40%;
		margin: 0 auto;
		text-align: left;
	}

	.clear {
		clear: left;
	}
	div input {
		width: 90%;
		height: 35px;
		color: gray;
		padding-left: 10px;
		border-radius: 10px;
		letter-spacing: 1px;
	}
	select {
		-webkit-appearance: none; /* 화살표 없애기 for chrome*/
		-moz-appearance: none; /* 화살표 없애기 for firefox*/
		appearance: none;
		width: 25%;
		height: 33px;
		border-radius: 5px;
	}
}

@media all and (min-width:1024px) {
	h1 {
		font-size: 80px;
		margin-top: 0px;
	}
	.aid2, .aid3, .pw2, .pw_2, .nm2, .bt_1, .pn2 {
		line-height: 40px;
		border: solid auto;
		width: 34%;
		margin: 0 auto;
	}
	.aid, .pw, .pw_1, .nm, .pn {
		line-height: 40px;
		border: solid auto;
		width: 34%;
		margin: 0 auto;
		text-align: left;
	}

	div input {
		width: 90%;
		height: 35px;
		color: gray;
		padding-left: 10px;
		border-radius: 10px;
		letter-spacing: 1px;
	}
	select {
		-webkit-appearance: none; /* 화살표 없애기 for chrome*/
		-moz-appearance: none; /* 화살표 없애기 for firefox*/
		appearance: none;
		width: 28%;
		height: 33px;
		border-radius: 5px;
	}
}

body {
	font-family: 'Lato', sans-serif;
	color: black;
	margin: 0 auto;
	text-align: center;
}

h2 {
	margin-top: -40px;
	font-size: 30px;
}

.btn1 {
	width: 90px;
	height: 41px;
	border-radius: 10px;
	background: #A566FF;
	color: #fff;
	cursor: pointer;
	border: none;
	position: absolute;
	margin-left: 12.15%;
	margin-top: -41px;
}

.bt_2 {
	width: 90%;
	height: 50px;
	border-radius: 10px;
	background: #A566FF;
	color: #fff;
	cursor: pointer;
	font-size: 25px;
	border: none;
	margin-top: 30px;
}

button:active {
	transform: translateY(5px)
}
</style>
<script type="text/javascript">
	window.onload = function() {
		// document.getElementById("btnSend").onclick = ?;
		document.getElementById('mumu').onsubmit = function() {
			// alert('비밀번호가 서로 다르게 입력되었습니다');
			var pass = document.getElementById('ch1').value;
			var passCheck = document.getElementById('ch2').value;
			var id = document.getElementById('aaa').value;
			var name = document.getElementById('name').value;
			var ph1 = document.getElementById('ph1').value;


			if (id != "") {

			} else {
				alert('아이디를 입력하여 주십시오');
				return false;
			}

			if (pass != "") {

			} else {
				alert('비밀번호를 입력하여 주십시오');
				return false;
			}
			if (name != "") {

			} else {
				alert('이름을 입력하여 주십시오');
				return false;
			}
			if (ph1 != "") {

			} else {
				alert('핸드폰번호를 입력하여 주십시오');
				return false;
			}
			if (ph2 != "") {

			} else {
				alert('핸드폰번호를 입력하여 주십시오');
				return false;
			}
			if (pass == passCheck) {

			} else {
				alert('비밀번호가 서로 다르게 입력되었습니다');
				return false;
			}

		}
	}
	function test() {

		var a = document.getElementById("aaa").value;
		window.location.href = "check.jsp?idd=" + a;

	}
	function joinCheck() {

		alert("비밀번호를 입력해주세요.");
		if (!mumu.password.value == "" || mumu.password.trim().length == 0) {

			alert("비밀번호를 입력해주세요.");
			mumu.password.value = "";
			mumu.password.focus();
			return false;

		}

		else
			true;
	}
</script>


</head>

<body>

	<br>
	</br>
	<form id="mumu" name="mumu" action="joinsuccess.jsp" method="post"">
		<div id="box">
>
			<h2>풋살장 예약 시스템</h2>



			<div class="aid">아이디</div>
			<div class="aid2">
				<input type="text" id="aaa" name="id">
			</div>
			<div class="aid3" style="width: 80px">
				<button type="button" class="btn1" onclick="test()">중복확인</button>
			</div>
			<div class="pw">비밀번호</div>
			<div class="pw2">
				<input type="password" id='ch1' name="password" size="22" />
			</div>
			<div class="pw_1">비밀번호 확인</div>
			<div class="pw_2">
				<input type="password" id='ch2' name="PWC" size="22" />
			</div>
			<div class="nm">이름</div>
			<div class="nm2">
				<input type="text" id='name' name="name" size="22" />
			</div>
			<div class="pn">연락처</div>
			<div class="pn2">
				<input type="text" id='ph2' name="phone" size="22" />
			</div>

			<div class="bt_1">
				<button type="submit" id="btnsend" class="bt_2">회원가입</button>
				<!--    <input type="submit" class="bt_2">회원가입/> -->
			</div>
	</form>

</body>

</html>