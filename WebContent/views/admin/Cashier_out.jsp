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
	GoodService gs = new GoodService();

	gs.delUserGoods();
	
	request.setAttribute("msg", "收银系统退出成功");
	request.getRequestDispatcher("success.jsp").forward(request, response);
%>
</body>
</html>