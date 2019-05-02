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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>광운대학교</title>
<link rel="stylesheet" type="text/css" href="style.css">
<script type="text/javascript" src="packed.js"></script>
<style>
.button {
	background-color: lightblue;
	border: none;
	border-radius: 8px;
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
	width: 100%;
	height: 100%;
	border: 2px solid lightgray;
}

table {
	border-collapse: collapse;
	border-radius: 10px;
	width: 1000px;
	margin-top: 60px;
	margin: auto;
	font-size: 18px;
	color: dimgray;
}

th {
	background-color: lightblue;
	padding: 8px;
	padding-bottom: 8px;
	font-color: dimgray;
}

td {
	padding: 8px;
	text-align: center;
	border-bottom: 1px solid lightblue;
}

#middle {
	display: grid;
	grid-template-columns: 150px 150px 150px;
	margin-left: 5px;
}
</style>
</head>
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
		sql = "SELECT * FROM db_hw.`free_board` where name ='"+flag + "'";

		System.out.println(sql);
		queryResult = statement.executeQuery(sql);
		queryResult.next();
		String test_page = "../kwlife/showresource.jsp";
		//<a href="../prof_write/writemain.jsp?flag="+flag class="button"
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

	<img id="text" src="image/text.JPG"
		style="width: 800px; height: 200px; margin-left: 270px; border: 2px solid lightgray; margin-bottom: 20px;">
	<hr>
	<div style="width: 1000px; margin-left: 150px;">
		<div
			style="background: lightblue; border-radius: 5px; border: 8px solid lightblue;">
			제목:
			<%=queryResult.getString(1)%></div>
		<div id="middle">
			<div id="kkk">
				작성자:
				<%=queryResult.getString(2)%></div>
			<div id="ddd">
				작성일:
				<%=queryResult.getString(3)%></div>
			<div id="aaa">
				조회수:
				<%=queryResult.getString(4)%></div>
		</div>
	</div>
	<hr
		style="width: 1000px; margin-left: 150px; border: 3px solid lightblue; margin-top: 5px;">
	<div style="width: 1000px; margin-left: 155px; height: 350px;"><%=queryResult.getString(5)%></div>
	<hr
		style="width: 1000px; margin-left: 150px; border: 3px solid lightblue; margin-top: 20px;">
	<a href="table_kwlife.jsp" class="button"
		style="margin-top: 15px; margin-left: 1000px;">목록</a>
	<%
		int count = queryResult.getInt(4) + 1;
		sql = "UPDATE `db_hw`.`free_board` SET view_count = '" + count + "' WHERE name = '"
				+ queryResult.getString(1) + "' and write_name = '" + queryResult.getString(2) + "'";
		System.out.println(sql);
		statement.executeUpdate(sql);
	%>
</body>
</html>