<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<%
	session.invalidate();
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>광운대학교 종합정보 서비스</title>
<style>
div.bottom {
	margin-top: 40px;
	margin-left: 250px;
	width: 860px;
	height: 100px;
	border: 1px;
	border-radius: 10px;
	background: linear-gradient(lightgray, white);
}

img.gray {
	width: 100%;
	height: 100%;
	border: 1px;
	border-radius: 5px;
}

img {
	float: left;
	border: 1px;
	border-radius: 5px;
}

div.relative {
	background-color: white;
	padding-left: 10px;
	padding-top: 20px;
	padding-bottom: 90px;
	position: relative;
	width: 530px;
	height: 380px;
	border: 5px solid lightgray;
	border-radius: 10px;
	margin-top: 1%;
	margin-left: 560px;
}

div.absolute {
	padding-left: 10px;
	padding-top: 25px;
	background-color: whitesmoke;
	position: relative;
	top: 0;
	left: 1%;
	width: 500px;
	height: 200px;
	border: 1px solid lightgray;
	border-radius: 10px;
	margin-top: 30px;
}

h1 {
	color: #464646;
	padding-top: 0px;
	padding-left: 20px;
	font-style: italic;
	font-weight: bold;
	font-family: serif;
	margin-top: 60px;
	margin-bottom: 0px;
}

body {
	background-image: url(image/background.JPG);
	background-repeat: no-repeat;
}
</style>
</head>
<body>

	<form action="../LogInOut/authentication.jsp" method="post">
		<p>
			<img src="image/loginleft.PNG"
				style="width: 300px; height: 500px; margin-left: 250px;">
		</p>
		<div class="relative">
			<h1>LOGIN</h1>
			<div class="absolute">
				<select name="job"
					style="width: 245px; height: 30px; margin-left: 30px;">
					<option value="">--선택--</option>
					<option value="professor">교수</option>
					<option value="student">학생</option>
				</select><br>
				<p>
					<label>ID : </label> <input name="id" type="text" size="30"
						style="height: 20px; background-color: white; margin-bottom: 10px;"><br>
					<label>PW: </label> <input name="pw" type="password" size="30"
						style="height: 20px; background-color: white; margin-bottom: 10px;">
					<input type="submit" value="로그인"
						style="border: 1px solid darkgray; background-color: darkgray; color: white; width: 245px; height: 30px; margin-left: 30px;">
					<br> <br> <br>
				</p>
				<img src="image/luxheader.png"
					style="width: 300px; height: 100px; margin-left: 200px; margin-top: 10px;"><br>
			</div>
		</div>

		<div class="bottom">
			<img class="gray" src="image/gray.jpg"
				style="width: 100px; height: 30px; margin-left: 100px; margin-top: 40px;">
		</div>

	</form>

</body>
</html>