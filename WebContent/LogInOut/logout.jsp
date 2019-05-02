<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<% 
//인증된 세션이 없는경우, 해당페이지를 볼 수 없게 함.
if (session.getAttribute("signedUser") == null) {
	// 1: 기존의 세션 데이터를 모두 삭제
	session.invalidate();

	// 2: 로그인 페이지로 이동시킴.
	//response.sendRedirect("fail.jsp");
}
%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
alert("학번 또는 비밀번호 오류입니다.");
document.location.href="../LogInOut/ucampus_log.jsp";
</script>
<body>


</body>
</html>