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
	String admin_Name = request.getParameter("admin_Name");
	String admin_Gender = request.getParameter("admin_Gender");
	String admin_Age = request.getParameter("admin_Age");
	String admin_Level = request.getParameter("admin_Level");
	
	AdminService as = new AdminService();
	
	String admin_ID_0 = "20170902";
	String lastID =  as.getLastID();
	String admin_ID_1 = lastID.substring(8);
	int No = Integer.parseInt(admin_ID_1);
	No++;
	admin_ID_1 = String.format("%02d", No);
	String admin_ID = admin_ID_0 + admin_ID_1; 
	
	String admin_Password = "123456";
	
	if(as.addAdmins(admin_ID, admin_Name, admin_Gender, admin_Age, admin_Level, admin_Password)){
		
		request.getRequestDispatcher("add_admin_success.jsp").forward(request, response);
	}else{
		request.setAttribute("msg", "管理员信息添加失败,请重新输入！");
		request.getRequestDispatcher("add_admin.jsp").forward(request, response);
	}
%>
</body>
</html>