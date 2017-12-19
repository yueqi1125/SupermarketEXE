<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.xt.java.admin.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String admin_ID = request.getParameter("admin_ID");

	AdminService as = new AdminService(); 
	
	if(as.delAdmin(admin_ID)){
		request.getRequestDispatcher("success_admin.jsp").forward(request, response);
	}else{
		request.getRequestDispatcher("fail_admin.jsp").forward(request, response);
	}
%>
</body>
</html>