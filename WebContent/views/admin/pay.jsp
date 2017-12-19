<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.xt.java.goods.*" %>
<%@ page import="com.xt.java.user.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String Money = request.getParameter("Money");
	String user_ID = request.getParameter("user_ID");
	if(user_ID == null){
		user_ID = "临时用户";
	}
	
	GoodService gs = new GoodService();
	UserService us = new UserService();
	
	if(gs.payGood(user_ID)){
		
		gs.delUserGoods();
		if(!user_ID.equals("临时用户")){
			us.payMoney(user_ID, Money);
		}
		request.setAttribute("msg1", "购买成功！");
		request.getRequestDispatcher("Cashier.jsp").forward(request, response);
	}else{
		
		request.setAttribute("msg1", "购买失败！");
		request.getRequestDispatcher("Cashier.jsp").forward(request, response);
	}
%>
</body>
</html>