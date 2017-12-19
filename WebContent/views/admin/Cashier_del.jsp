<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.xt.java.goods.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String Pro_batches = request.getParameter("Pro_batches");

	GoodService gs = new GoodService();
	
	gs.delUserGood(Pro_batches);
	
	request.getRequestDispatcher("Cashier.jsp").forward(request, response);
%>
</body>
</html>