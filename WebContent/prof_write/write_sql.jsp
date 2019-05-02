<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="file.filedao"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.File"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String flag = request.getParameter("flag");
		String real_flag = (String) session.getAttribute("subject_name" + flag);
		System.out.println("과목번호" + flag);
		System.out.println("real flag" + real_flag);
		String directory = application.getRealPath("/upload/");
		int maxSize = 1024 * 1024 * 100;
		String encoding = "utf-8";
		MultipartRequest multipartRequest = new MultipartRequest(request, directory, maxSize, encoding,
		new DefaultFileRenamePolicy());
		String title = multipartRequest.getParameter("title");
		String memo = multipartRequest.getParameter("memo");
		String file1 = multipartRequest.getFilesystemName("file1");
		String file2 = multipartRequest.getFilesystemName("file2");
		String file3 = multipartRequest.getFilesystemName("file3");
		String file4 = multipartRequest.getFilesystemName("file4");
		String file5 = multipartRequest.getFilesystemName("file5");
		new filedao().upload(title, memo, file1, file2, file3, file4, file5, real_flag);
	%>


	<script language=javascript>
		self.window.alert("입력한 글을 저장하였습니다.");
		location.href = "../Prof/table_prof.jsp?flag=<%=flag%>";
	</script>

</body>
</html>
