<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:: KwangWoon University U-Learning System ::</title>
<script type="text/java" src="write.js"></script>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<style>
</style>
<body>
	<%

		System.out.println("");
		System.out.println("/--email--/");
		System.out.println(session.getAttribute("from"));
		System.out.println(request.getParameter("to"));
		
		session.setAttribute("to", request.getParameter("to"));
		session.setAttribute("from", session.getAttribute("from"));

	%>
	<div id="grid1">
		<a href="../Prof/ucampus_prof.jsp"><img id="2"
			src="image/mark.jpg" width="160" height="50"
			style="margin-left: 30px; margin-top: 5px;"></a>
		<div id="grad1">
			<h1>:: KwangWoon University U-Learning System ::</h1>
		</div>
	</div>
	<div id="grid2">
		<div id="font">
			<div id="info">
				교수(<%=session.getAttribute("prof_id")%>)<br>
				<div id="add">
					<small> <a href="../kwmain/kwmain.jsp">광운대학교</a></small>
				</div>
				<div id="add">
					<small><a href="../LogInOut/ucampus_log.jsp">로그아웃</a></small>
				</div>
			</div>
		</div>
		<img id="1" src="image/subtop.gif" width="790" height="100"
			style="margin-top: 0px; margin-left: 30px;">


	</div>

	<div id="grid3">
		<div id="left">
			<br> <br> <br>
			<p class="one">
				<a href="../Prof/table_prof.jsp">▶ 강의 자료실</a>
			</p>
			<br> <br> <br>
			<p class="one">
				<a href="../Prof/student_info.jsp" style="font-weight: bold">▶
					수강생 조회 </a>
			</p>
		</div>
		<div id="right">
			<table style="margin: 0 auto;">
				<form action="write_sql.jsp" name="writeform" method="post">
					<tr>
						<td>
							<div id="topname">
								<a>이메일 보내기</a>
							</div>
							<div id="emailstu">
								<table>
								</table>
							</div>
							<table>
								<tr height="3" bgcolor="mistyrose">
									<td colspan="4"></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td align="center">제목</td>
									<td><input name="title" size="89" maxlength="100"></td>
									<td>&nbsp;</td>
								</tr>
								<tr height="3" bgcolor="mistyrose">
									<td colspan="4"></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td align="center">내용</td>
									<td><textarea name="memo" cols="90" rows="20"></textarea></td>
									<td>&nbsp;</td>
								</tr>
								<tr height="3" bgcolor="mistyrose">
									<td colspan="4"></td>
								</tr>
								<tr align="center">
									<td>&nbsp;</td>
									<td colspan="2"><input
										style="background-color: mistyrose; border-radius: 5px;"
										type="submit" value="보내기" OnClick="javascript:writeCheck();" /><a
										href="../Prof/student_info.jsp"> <input type=button
											value="취소"
											style="background-color: mistyrose; border-radius: 5px;"></a>
									<td>&nbsp;</td>
								</tr>
							</table>
						</td>
					</tr>
				</form>
			</table>
		</div>
	</div>

	<div id="bottom">
		<div id="grid4">
			<img id="gray" src="image/gray.jpg"
				style="width: 100px; height: 30px; margin-left: 50px; margin-top: 30px;">
			<div id="grid5">
				<h3>
					서울 노원구 광운로 20(월계동 447-1) 광운대학교 TEL. 02-94-5114 / <a
						href="mailto:webadmin@kw.ac.kr">Mail. webadmin@kw.ac.kr</a>
				</h3>
				<h4>COPYRIGHT.(C)2006 KWANGWOON UNIVERSITY. ALL RIGHTS
					RESERVED.</h4>
			</div>
		</div>
	</div>


</body>
</html>