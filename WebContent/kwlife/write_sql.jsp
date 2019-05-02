<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="write.write"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.File"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

<%@ page import="java.sql.*"%>  
<%
request.setCharacterEncoding("utf-8");
String directory = application.getRealPath("/upload/");
String encoding = "utf-8";
String title =request.getParameter("title");
String memo = request.getParameter("memo");
String id = request.getParameter("flag");
new write().upload(title, memo, id);
	
%>
  <script language=javascript	>
   self.window.alert("입력한 글을 저장하였습니다.");
   location.href="../kwlife/table_kwlife.jsp?flag=<%=id%>";

</script>

</body>
</html>