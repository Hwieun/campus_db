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
String professor_name;

Connection connection = null;
Statement statement = null;
ResultSet queryResult = null;
String sql = "";
boolean errFlag = false;

try {
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
		
		// query ok
		if(queryResult.next()) { 
			int i = 1;
			session.setAttribute("id", id);
			session.setAttribute("pw", pw);
			session.setAttribute("job", job);
			
			System.out.println("query ok");
			System.out.println(queryResult.getString(1));
			System.out.println(queryResult.getString(2));
			sql = "SELECT * FROM subject WHERE subject_name IN (SELECT subject_name FROM subject_list WHERE subject_list.student_id = " + id + ")";
			queryResult = statement.executeQuery(sql);	
			redirectUrl = "../kwlife/table_kwlife.jsp?flag=" + id;

			while(queryResult.next()){
				subject_name = queryResult.getString(1);
				professor_name = queryResult.getString(2);
				System.out.print(subject_name);
				System.out.println(professor_name);
				session.setAttribute("subject_name" + i, subject_name);
				session.setAttribute("professor_name" + i, professor_name);
				i++;
			}
		}else {
			redirectUrl = "../kwlife/logfail_kwlife.jsp";
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
		sql = "SELECT prof_id ,prof_name FROM db_hw.professor WHERE ((professor.prof_id=" + id + ") AND (professor.prof_password ='" + pw + "'))";
		queryResult = statement.executeQuery(sql);
		
		// query ok
		if(queryResult.next()) { 
			int i = 1;
			session.setAttribute("id", id);
			session.setAttribute("pw", pw);
			session.setAttribute("job", job);
			
			System.out.println("query ok");
			System.out.println(queryResult.getString(1));
			System.out.println(queryResult.getString(2));
			sql = "SELECT * FROM subject WHERE instructor_id = " + id;
			queryResult = statement.executeQuery(sql);	
			redirectUrl = "../kwlife/table_kwlife.jsp?flag=" + id;

			while(queryResult.next()){
				subject_name = queryResult.getString(1);
				professor_name = queryResult.getString(2);
				System.out.print(subject_name);
				System.out.println(professor_name);
				session.setAttribute("subject_name" + i, subject_name);
				session.setAttribute("professor_name" + i, professor_name);
				i++;
			}
		}
		else {
			redirectUrl = "../kwlife/logfail_kwlife.jsp";
		}
		
		System.out.println("id : " + session.getAttribute("id"));
		System.out.println("pw : " + session.getAttribute("pw"));
		System.out.println("job : " + session.getAttribute("job"));
		System.out.println("subject_name1 : " + session.getAttribute("subject_name1"));
		System.out.println("professor_name1 : " + session.getAttribute("professor_name1"));
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