<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String redirectUrl = "";
String id = request.getParameter("id");
String pw = request.getParameter("pw");
String job = request.getParameter("job");
String subject_name;
String professor_id;

Connection connection = null;
Statement statement = null;
ResultSet queryResult = null;
ResultSet qr2 = null;
String sql = "";
boolean errFlag = false;

try {
	System.out.println("/--authentication--/");

	String driverName = "com.mysql.jdbc.Driver";
	Class.forName(driverName); // driver load

	String dbURL = "jdbc:mysql://192.168.43.18:3306/";
	String dbName = "db_hw";
	String userName = "kw";
	String password = "vkdvkd2";

	connection = DriverManager.getConnection(dbURL + dbName, userName, password); // connect

	statement = connection.createStatement();

	// check student
	if(job.equals("student")) {
		//check valid value in database using query
		System.out.println("check student");
		sql = "SELECT stu_id,stu_name FROM db_hw.student WHERE ((student.stu_id=" + id + ") AND (student.stu_password='" + pw + "'))";
		queryResult = statement.executeQuery(sql);
		System.out.println("query ok");

		// query ok
		if(queryResult.next()) { 
			int i = 1;
			session.setAttribute("id", id);
			System.out.println(queryResult.getString(1));
			session.setAttribute("pw", pw);
			System.out.println(queryResult.getString(2));
			session.setAttribute("job", job);
			
			sql = "SELECT * FROM subject WHERE subject_name IN (SELECT subject_name FROM subject_list WHERE subject_list.student_id = " + id + ")";
			queryResult = statement.executeQuery(sql);	
			redirectUrl = "../stu/ucampus_stu.jsp";
			
			while(queryResult.next()){
				System.out.println("cj");
				subject_name = queryResult.getString(1);
				professor_id = queryResult.getString(2);
	//			sql="select prof_name FROM professor WHERE prof_id=" + professor_id;
	//			qr2 = statement.executeQuery(sql);
	//			qr2.next();					
				System.out.println(subject_name);
				System.out.println(professor_id);
				session.setAttribute("subject_name" + i, subject_name);
				session.setAttribute("professor_name" + i, professor_id);
				
				i++;
			}
			
		}else {
			redirectUrl = "../LogInOut/logout.jsp";
		}

		System.out.println("id : " + session.getAttribute("id"));
		System.out.println("pw : " + session.getAttribute("pw"));
		System.out.println("job : " + session.getAttribute("job"));
		System.out.println("subject_name1 : " + session.getAttribute("subject_name1"));
		System.out.println("professor_name1 : " + session.getAttribute("professor_name1"));
		System.out.println("subject_name2 : " + session.getAttribute("subject_name2"));
		System.out.println("professor_name2 : " + session.getAttribute("professor_name2"));
	
	}
	// check prof 
	else if(job.equals("professor")) {
		//check valid value in database using query
		System.out.println("check prof");
		sql = "SELECT prof_id,prof_name,prof_email FROM db_hw.professor WHERE ((professor.prof_id=" + id + ") AND (professor.prof_password ='" + pw + "'))";
		queryResult = statement.executeQuery(sql);
		System.out.println("query ok");
		
		// query ok
		if(queryResult.next()) { 
			session.setAttribute("prof_id", queryResult.getString(1));
			session.setAttribute("prof_name", queryResult.getString(2));
			session.setAttribute("from", queryResult.getString(3));
			System.out.println("[query] prof_id\t" + queryResult.getString(1));
			System.out.println("[query] prof_name\t" + queryResult.getString(2));
			System.out.println("[query] prof_email\t" + queryResult.getString(3));
			session.setAttribute("job", job);
			
			sql = "SELECT * FROM subject WHERE instructor_id = " + queryResult.getString(1);
			queryResult = statement.executeQuery(sql);	
			redirectUrl = "../Prof/ucampus_prof.jsp";

			while(queryResult.next()){
				subject_name = queryResult.getString(1);
				System.out.println("[query] subject_name\t" + subject_name);
				session.setAttribute("subject_name1", subject_name);
			}
		}
		else {
			redirectUrl = "../LogInOut/logout.jsp";
		}
		
		System.out.println("[set attri] prof_id\t" + session.getAttribute("prof_id"));
		System.out.println("[set attri] prof_name\t" + session.getAttribute("prof_name"));
		System.out.println("[set attri] prof_email\t" + session.getAttribute("prof_email"));
		System.out.println("[set attri] job\t" + session.getAttribute("job"));
		System.out.println("[set attri] subject_name1\t" + session.getAttribute("subject_name1"));
	}
	
	response.sendRedirect(redirectUrl);
	
	queryResult.close();
	statement.close();
	connection.close();
	
} catch (Exception e) {
	errFlag = true;
	e.printStackTrace();
	// error handling
}
%>