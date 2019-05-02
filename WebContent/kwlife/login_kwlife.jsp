<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>광운대학교</title>
<link rel="stylesheet" type="text/css" href="style.css">
<script type="text/javascript" src="packed.js"></script>
<style>
.text {
	border: 3px solid gray;
	width: 500px;
	border: none;
	margin-right: 40px;
	pedding-right: 50px
}

.log {
	padding-left: 30px;
	padding-top: 25px;
	position: relative;
	top: 0;
	width: 500px;
	height: 500px;
	border: 3px solid lightgray;
	border-top: none;
	border-right: none;
	border-bottom: none;
}

p {
	margin-left: 30px;
	font-size: 50px;
	margin-top: 10px;
}

h3 {
	font-size: 70px;
	font-weight: lighter;
	text-align: right;
	color: #282828;
	margin-top: 0;
}

.grid1 {
	display: grid;
	margin-top: 10px;
	grid-template-columns: auto auto auto;
}
</style>
</head>
<body>
	<form action="../kwlife/authentication.jsp" method="post">
		<div class="grid">
			<a href="../kwmain/kwmain.jsp"><img src="image/mark.jpg"
				width="200"></a>
			<div id="campus" style="margin-left: 600px; margin-top: 20px;">
				<a href="../LogInOut/ucampus_log.jsp"><strong>U-CAMPUS</strong></a>
			</div>
			<div id="life">
				<a href="../kwlife/login_kwlife.jsp" style="color: maroon"><strong>KW-LIFE</strong></a>
			</div>
		</div>
		<hr style="margin-left: 20px; margin-top: 20px">
		<h1
			style="margin-left: 40px; font-weight: lighter; color: #282828; margin-top: 30px; margin-bottom: 30px;">로그인</h1>
		<div class="grid1">
			<div class="text">
				<h2
					style="margin-left: 20px; color: dimgray; margin-top: 30px; text-align: right; margin-bottom: 10px;">통합로그인서비스</h2>
				<h3>
					MEMBERS<br>LOGIN
				</h3>
			</div>
			<div class="log">
				<select name="job"
					style="margin-left: 30px; margin-top: 30px; width: 310px; height: 30px;">
					<option value="">--선택--</option>
					<option value="professor">교수</option>
					<option value="student">학생</option>
				</select>
				<p>
					<input name="id" type="text" size="40"
						style="height: 30px; background-color: whitesmoke;"><br>
					<input name="pw" type="password" size="40"
						style="margin-top: 10px; background-color: whitesmoke; margin-bottom: 10px; height: 30px;"><br>
					<input type="submit" value="login"
						style="border: 1px solid maroon; background-color: maroon; color: white; width: 320px; height: 50px; font-size: 30px;">
				</p>
			</div>
		</div>
	</form>
</body>
</html>