<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>광운대학교</title>
<link rel="stylesheet" type="text/css" href="style.css">
<script type="text/javascript" src="write.js"></script>
<style>

#topname a{
	position:relative;
}
a {
   text-decoration: none;
   color: dimgray;
}
.button {
	
	background-color: lightblue;
	border: none;
	border-radius:8px;
	color: dimgray;
	padding: 5px 5px;
	text-align: right;
	text-decoration: none;
	display: inline-block;
	font-size: 20px;
	margin: 4px 2px;
	cursor: pointer;
}

img.text {
width:100%;
height:100%;
border: 2px solid lightgray;
}


</style>
</head>
<body>
	<%
		String flag = request.getParameter("flag");
		System.out.println("write_kwlife page, flage = " + flag);
	%>

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
		style="margin-left: 40px; font-weight: lighter; color: #282828; margin-top: 30px; margin-bottom: 30px;">자유게시판</h1>
		
		<img id="text" src="image/text.JPG" style="width:800px; height:200px; margin-left:270px; border: 2px solid lightgray; margin-bottom:20px;">
		<hr>
		<table style="margin:0 auto; margin-left:300px;">
		<form name=writeform method=post action="../kwlife/write_sql.jsp?flag=<%=flag%>">
			<tr>
				<td>
		<div id="topname" style="margin-bottom:20px;">
						<a >글쓰기</a><br>
					</div>
					<table>
						<tr>
							<td>&nbsp;</td>
							<td align="center" >제목</td>
							<td><input name="title" size="89" maxlength="100"></td>
							<td>&nbsp;</td>
						</tr>
						<tr height="3" bgcolor="lightblue">
							<td colspan="4"></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td align="center">내용</td>
							<td><textarea name="memo" cols="90" rows="15"></textarea></td>
							<td>&nbsp;</td>
						</tr>
						<tr height="3" bgcolor="lightblue">
							<td colspan="4"></td>
						</tr>
						
						<tr height="3" bgcolor="lightblue">
							<td colspan="4"></td>
						</tr>
						<tr align="center">
							<td>&nbsp;</td>
							<td colspan="2"><input type=button
								style="background-color: lightblue; border-radius: 5px;"
								value="등록" OnClick="javascript:writeCheck();"> <input
								type=button value="취소"
								style="background-color: lightblue; border-radius: 5px;"
								OnClick="javascript:history.back(-1)">
							<td>&nbsp;</td>
						</tr>
					</table>
				</td>
</tr></form></table>
</body>
</html>