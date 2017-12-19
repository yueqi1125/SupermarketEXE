<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.xt.java.user.*" %>
<%@ page import="com.xt.java.DBUtil.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.math.BigDecimal" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String user_Name = request.getParameter("user_Name");
	String user_Gender = request.getParameter("user_Gender");
	String user_Level0 = request.getParameter("user_Level");
	BigDecimal user_Money = new BigDecimal("0.0");
	BigDecimal Money1 = new BigDecimal("200.0");
	BigDecimal Money2 = new BigDecimal("1000.0");
	BigDecimal Money3 = new BigDecimal("5000.0");
	int user_Integral = 0;
	
	UserService us = new UserService();
	
	String user_Level = user_Level0.substring(0, 2);
	
	String user_ID_0 = "20170902";
	String lastID =  us.getLastID();
	String user_ID_1 = lastID.substring(8);
	int No = Integer.parseInt(user_ID_1);
	No++;
	user_ID_1 = String.format("%04d", No);
	String user_ID = user_ID_0 + user_ID_1; 
	
	String user_Password = "123456";
	
	if("白银".equals(user_Level)){
		user_Money = user_Money.add(Money1);
		user_Integral = 200;
	}else if("黄金".equals(user_Level)){
		user_Money = user_Money.add(Money2);
		user_Integral = 1000;
	}else if("钻石".equals(user_Level)){
		user_Money = user_Money.add(Money3);
		user_Integral = 5000;
	}
	
	if(us.addUser(user_ID, user_Name, user_Gender, user_Password, user_Money, user_Integral, user_Level)){
		
		request.getRequestDispatcher("user_add_success.jsp").forward(request, response);
	}else{
		request.setAttribute("msg", "会员信息注册失败,请重新输入！");
		request.getRequestDispatcher("user_add.jsp").forward(request, response);
	}
%>
</body>
</html>