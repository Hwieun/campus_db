<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


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
		Connection connection = null;
		Statement statement = null;
		ResultSet queryResult = null;
		ResultSet fileResult = null;
		String sql = "";
		boolean errFlag = false;

		String driverName = "com.mysql.jdbc.Driver";
		Class.forName(driverName); // driver load

		String dbURL = "jdbc:mysql://192.168.43.18:3306/";
		String dbName = "db_hw";
		String userName = "kw";
		String password = "vkdvkd2";
		connection = DriverManager.getConnection(dbURL + dbName, userName, password); // connect

		statement = connection.createStatement();
		String flag = request.getParameter("flag");
		String title = request.getParameter("title");
		String num = request.getParameter("num");

		sql = "SELECT course_name,time,view_count,memo,file1,file2,file3,file4,file5 FROM `db_hw`.`course material` WHERE course_name = '"
				+ title + "'";

		System.out.println(sql);
		System.out.println(flag);

		queryResult = statement.executeQuery(sql);
		queryResult.next();
	%>
	<div id="grid1">
		<a href="../Prof/ucampus_prof.jsp"><img id="2" src="image/mark.jpg"
			width="160" height="50" style="margin-left: 30px; margin-top: 5px;"></a>
		<div id="grad1">
			<h1>:: KwangWoon University U-Learning System ::</h1>
		</div>
	</div>
	<div id="grid2">
		<div id="font">
			<div id="info">
				교수(<%=session.getAttribute("prof_id")%>)<br>
				<div id="add">
					<small> <a href="../kwmail/kwmain.jsp">광운대학교</a></small>
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
				<a href="../Prof/table_prof.jsp?flag=1">▶ 강의 자료실</a>
			</p>
			<br> <br> <br>
			<p class="one">
				<a href="../Prof/student_info.jsp?flag=<%=flag%>" style="font-weight: bold">▶
					수강생 조회 </a>
			</p>
		</div>
		<div id="right">
			<div id="inright">
				<div id="topname" style="text-align: left">
					<a>강의자료</a>
				</div>
				<div id="resourcetitle"
				style="text-align: center; font-weight: bold;"><%=queryResult.getString(1)%></div></div>
				<div id="resourceetc"style="margin: 20px;">
					<div></div>
					<div>글번호:</div>
					<div><%=num%></div>
					<div>등록 날짜:</div>
					<div><%=queryResult.getString(2)%></div>
					<div>조회수:</div>
					<div><%=queryResult.getString(3)%></div>
				</div>
				<div id="content"style="margin: 20px; margin-bottom:5px;"><%=queryResult.getString(4)%></div>
				<div id="rightfile"style="margin: 20px; margin-top:5px;">
					<table>
						<tr>
							<td>&nbsp;</td>
							<td rowspan="5" align="center">첨부파일</td>
							<td><div class="file_input">
							<%
							int count = queryResult.getInt(3) + 1;
										sql = "UPDATE `db_hw`.`course material` SET view_count = '" + count + "' WHERE subject_name = '"
												+ session.getAttribute("subject_name" + flag) + "' and course_name = '" + title + "'";
										System.out.println(sql);
										statement.executeUpdate(sql);

										String directory = application.getRealPath("/upload/");
										String files[] = new File(directory).list();
										sql = "SELECT file1,file2,file3,file4,file5 FROM `db_hw`.`course material` WHERE course_name = '"
												+ title + "'";
										System.out.println(sql);
										fileResult = statement.executeQuery(sql);
										fileResult.next();
										for (int i = 1; i <= 5; i++) {
											String file = fileResult.getString(i);
											if (file != null) {
												System.out.println(file);
												out.write("<a href=\"" + request.getContextPath() + "/downloadAction?file="
														+ java.net.URLEncoder.encode(file, "utf-8") + "\">" + file + "</a><br>");
											}
										}
									%>
								</div></td>
							<td>&nbsp;</td>
						</tr>
						
					</table>

				</div>
				<div style="text-align: right; margin: 20px;">
					<a href="../Prof/table_prof.jsp?flag=<%=flag%>"><input type=button value="목록"
						style="background-color: mistyrose; border-radius: 5px;"
						></a>
				</div>
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