<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:: KwangWoon University U-Learning System ::</title>
<script type="text/javascript" src="write.js"></script>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<style>
</style>
<body>
	<%
		String flag = request.getParameter("flag");
		System.out.println("write_main page, flage = " + flag);
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
				<%=session.getAttribute("prof_name")%>(<%=session.getAttribute("id")%>)<br>
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
				<a href="../Prof/student_info.jsp" style="font-weight: bold">▶ 수강생 조회 </a>
			</p>
		</div>
		<div id="right">
			<table style="margin: 0 auto;">
				<form name=writeform method=post action="write_sql.jsp?flag=<%=flag%>" enctype="multipart/form-data">
					<tr>
						<td>
							<div id="topname">
								<a>글쓰기</a>
							</div>
							<table>
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
									<td><textarea name="memo" cols="90" rows="15"></textarea></td>
									<td>&nbsp;</td>
								</tr>
								<tr height="3" bgcolor="mistyrose">
									<td colspan="4"></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td rowspan="5" align="center">첨부파일</td>
									<td><div class="file_input">
											<input type="file" name="file1">
										</div></td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td><div class="file_input">
											<input type="file" name="file2">
										</div></td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td><div class="file_input">
											<input type="file" name="file3">
										</div></td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td><div class="file_input">
											<input type="file" name="file4">
										</div></td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>
										<div class="file_input">
											<input type="file" name="file5">
										</div>
									</td>
									<td>&nbsp;</td>
								</tr>
								<tr height="3" bgcolor="mistyrose">
									<td colspan="4"></td>
								</tr>
								<tr align="center">
									<td>&nbsp;</td>
									<td colspan="2"><input type=button
										style="background-color: mistyrose; border-radius: 5px;"
										value="등록" OnClick="javascript:writeCheck();"> <input
										type=button value="취소"
										style="background-color: mistyrose; border-radius: 5px;"
										OnClick="javascript:history.back(-1)">
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