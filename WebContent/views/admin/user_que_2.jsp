<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.xt.java.user.*" %>
<%@ page import="java.math.BigDecimal" %>
<%
	String ctxPath = request.getContextPath();
%>
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
	BigDecimal user_Money = new BigDecimal(Money);	
%>
	<input type="hidden" name="Maney" value="<%=Money %>"/>
	<input type="hidden" name="user_ID" value="<%=user_ID %>">
<%
	UserService us = new UserService();

	if(us.queUser(user_ID)){
		
		if(user_Money.compareTo(us.queMoney(user_ID)) == -1){
			
			
			request.getRequestDispatcher("pay.jsp").forward(request, response);
		}else{
			
			request.setAttribute("msg2", "会员卡余额不足！");
			request.getRequestDispatcher("Cashier.jsp").forward(request, response);
		}
	}else{
		
		request.setAttribute("msg2", "会员ID错误或ID不存在,请重新输入！");
		request.getRequestDispatcher("Cashier.jsp").forward(request, response);
	}
%>
</body>
</html>