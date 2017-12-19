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
	String Money = request.getParameter("Money");
	
	UserService us = new UserService(); 
	
	if(us.Recharge(user_ID, Money)){
		
		request.setAttribute("msg", "充值成功！");
		request.getRequestDispatcher("user_Recharge.jsp").forward(request, response);
	}else{
		
		request.setAttribute("msg", "充值成功,请重新操作！");
		request.getRequestDispatcher("user_Recharge.jsp").forward(request, response);
	}
%>
</body>
</html>