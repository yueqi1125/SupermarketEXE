<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.xt.java.user.*" %>
<%@ page import="com.xt.java.DBUtil.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String user_ID = request.getParameter("user_ID");
	String user_PW = request.getParameter("user_PW");
	
	UserService us = new UserService();
	if(us.checkLogin(user_ID, user_PW)){
		
		session.setAttribute(Constance.USER_LOGIN_INFO, us.getUserInfo(user_ID,user_PW));	
		response.sendRedirect("../user/user_main.jsp");
	}else{
		request.setAttribute("msg", "用户名或者密码错误,请重新输入！");
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}
%>
</body>
</html>