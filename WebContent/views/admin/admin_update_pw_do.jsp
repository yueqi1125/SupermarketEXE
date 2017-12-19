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
	String admin_PW = request.getParameter("admin_PW_1");
	String admin_PW_0 = request.getParameter("admin_PW_2");
	
	AdminService as =new AdminService();
	if(admin_PW.equals(admin_PW_0)){
		
		if(as.updatePW(admin_ID, admin_PW)){
			
			response.sendRedirect("success_admin.jsp");
		}else{
			request.setAttribute("msg", "密码修改失败！");
			request.getRequestDispatcher("admin_update_pw_2.jsp").forward(request, response);
		}
	}else{
		request.setAttribute("msg", "两次输入的密码不相同，请重新输入！");
		request.getRequestDispatcher("admin_update_pw_2.jsp").forward(request, response);
	}
%>
</body>
</html>