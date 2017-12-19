<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.xt.java.admin.*" %>
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
	String admin_ID = request.getParameter("admin_ID");
	String admin_Name = request.getParameter("admin_Name");
	String admin_Gender = request.getParameter("admin_Gender");
	String admin_Age = request.getParameter("admin_Age");
	String admin_Level = request.getParameter("admin_Level");
	
	AdminService as = new AdminService(); 
	
	if(as.updateAdmin(admin_ID, admin_Name, admin_Gender, admin_Age, admin_Level)){
		request.getRequestDispatcher("success_admin.jsp").forward(request, response);
	}else{
		request.getRequestDispatcher("fail_admin.jsp").forward(request, response);
	}
%>
</body>
</html>