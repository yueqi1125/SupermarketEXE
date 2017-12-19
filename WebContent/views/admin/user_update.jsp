<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.xt.java.user.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String user_ID = request.getParameter("user_ID");
	
	String user_Name = request.getParameter("user_Name");
	String user_Gender = request.getParameter("user_Gender");
	
	UserService us = new UserService(); 
	
	if(us.A_updateUser(user_ID, user_Name, user_Gender)){
		request.getRequestDispatcher("success_user.jsp").forward(request, response);
	}else{
		request.getRequestDispatcher("fail_user.jsp").forward(request, response);
	}
%>
</body>
</html>