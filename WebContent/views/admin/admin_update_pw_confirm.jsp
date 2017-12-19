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
	String admin_PW = request.getParameter("admin_PW");
	
	AdminService as =new AdminService();
	if(as.checkLogin(admin_ID, admin_PW)){
		
		response.sendRedirect("admin_update_pw_2.jsp");
	}else{
		request.setAttribute("msg", "您输入密码错误,请重新输入！");
		request.getRequestDispatcher("admin_update_pw.jsp").forward(request, response);
	}
%>
</body>
</html>