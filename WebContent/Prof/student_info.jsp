<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:: KwangWoon University U-Learning System ::</title>

</head>
<style>
a {
	text-decoration: none;
	color: dimgray;
}

p.one {
	width: 110px;
	height: 30px;
	padding: 3px 3px 3px 3px;
	text-align: center;
	font-size: 15px;
	font-weight: normal;
	border-right: 5px solid mistyrose;
	border-bottom: 5px solid mistyrose;
	margin-left: 25px;
}

h1 {
	text-align: center;
	font-size: 20px;
	font-weight: bold;
	color: dimgray;
	font-style: italic;
}

h2 {
	text-align: left;
	font-size: 20px;
	font-weight: normal;
	color: dimgray;
	margin-right: 15px;
}

h3 {
	text-align: right;
	font-size: 12px;
	font-weight: normal;
}

h4 {
	text-align: right;
	font-size: 12px;
	font-weight: bold;
}

#font {
	font-size: 17;
	text-align: center;
	font-weight: bold;
	color: slategray;
}

#left {
	border: 1px solid whitesmoke;
	border-radius: 5px;
	width: 190px;
	height: 340px;
	background-color: whitesmoke;
}

#right {
	border: 1px solid whitesmoke;
	border-radius: 5px;
	width: 790px;
	height: 340px;
	background-color: whitesmoke;
	margin-left: 40px;
}

#bottom {
	border: 1px;
	border-radius: 8px;
	width: 1015px;
	height: 100px;
	background: linear-gradient(mistyrose, white);
	margin-left: 15px;
	margin-top: 20px;
}

#add {
	background-color: whitesmoke;
	color: gray;
	padding: 4px 4px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	border: 1px;
	border-radius: 5px;
	margin-top: 8px;
}

#info {
	background: mistyrose;
	border-radius: 8px;
	border: 1px;
	padding-left: 22px;
	padding-top: 25px;
	padding-right: 22px;
	padding-bottom: 25px;
}

#grid1 {
	display: grid;
	margin-top: 10px;
	grid-template-columns: 210px 800px;
}

#grid2 {
	display: grid;
	grid-template-columns: 190px 800px;
	margin-left: 15px;
	margin-top: 10px;
}

#grid3 {
	display: grid;
	grid-columns-gap: 20px;
	grid-template-columns: 180px 850px;
	margin-left: 15px;
	margin-top: 10px;
}

#grid4 {
	display: grid;
	grid-template-columns: 180px 800px;
}

#grid5 {
	display: grid;
	grid-template-rows: 30px 30px;
	margin-top: 10px;
}

#grad1 {
	width: 800px;
	height: 60px;
	border-radius: 8px;
	border: 2px;
	background: mistyrose;
	margin-right: 320px;
	margin-left: 20px;
	border: 2px;
}

img.2 {
	max-width: 100%;
	max-height: 100%;
	margin-left: 30px;
	margin-right: 10px;
	margin-top: 10px;
}

img.1 {
	width: 100%;
	height: 100%;
	border: 1px;
	border-radius: 8px;
}

img.gray {
	width: 100%;
	height: 100%;
	border: 1px;
	border-radius: 5px;
}

table {
	border-collapse: collapse;
	width: 740px;
	margin-top: 60px;
	margin: auto;
	font-size: 12px;
	font-color: dimgray;
}

th {
	background-color: mistyrose;
	padding: 8px;
	padding-bottom: 8px;
}

td {
	padding: 8px;
	text-align: center;
	border-bottom: 1px solid mistyrose;
}

hr {
	width: 720px;
	padding: 8px;
	text-align: center;
	border-bottom: 4px solid mistyrose;
	border-top: 0;
	border-left: 0;
	border-right: 0;
}
</style>
<body>
	<%
		Connection connection = null;
		Statement statement = null;
		ResultSet queryResult = null;
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
		sql = "SELECT stu_name,stu_id,stu_email FROM db_hw.student WHERE stu_id in (select student_id from db_hw.subject_list where subject_name = 1)";
		queryResult = statement.executeQuery(sql);

		System.out.println("");
		System.out.println("/--student_info--/");

		System.out.println("resetting parameters...");
		//session.setAttribute("to", queryResult.getString(3));

		System.out.println(session.getAttribute("prof_id"));
		System.out.println(session.getAttribute("prof_name"));
		System.out.println(session.getAttribute("job"));
		System.out.println(session.getAttribute("subject_name1"));
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
				<a href="../Prof/table_prof.jsp?flag=1">▶ 강의 자료실</a>
			</p>
			<br> <br> <br>
			<p class="one">
				<a href="../Prof/student_info.jsp" style="font-weight: bold">▶
					수강생 조회 </a>
			</p>
		</div>
		<div id="right">
			<h2 style="margin-left: 20px;">수강생 조회</h2>
			<form name = "form" action="myservlet.do" method="POST"
				style="margin-left: 30px; width: 100px;">
				<select name="subject" id="myselect" onchange="subjectMenu(this.form)">
					<option selected value="subject">--선택--</option>
					<option value="../Prof/table_prof.jsp?flag=1"><%=session.getAttribute("subject_name1")%></option>
				</select>
			</form>
			<table style="margin-top: 10px;">
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>학번</th>
					<th>email</th>
				</tr>
				<%
					int j = 1;
					while (queryResult.next()) {
				%>
				<tr>
					<td><%=j++%></td>
					<td><%=queryResult.getString(1)%></td>
					<td><%=queryResult.getString(2)%></td>
					<td><a href="../email/email.jsp?to=<%=queryResult.getString(3)%>"><%=queryResult.getString(3)%></a></td>
				</tr>
				<%
					}
				%>
			</table>
			<hr>
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