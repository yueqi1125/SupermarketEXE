<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.xt.java.goods.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String good_ID = request.getParameter("good_ID");
	String good_No = request.getParameter("good_No");
	String good_No_ = request.getParameter("good_No_");
	
	if(Integer.parseInt(good_No) > Integer.parseInt(good_No_)){
		
		request.setAttribute("msg", "商品库存不足！");
		request.getRequestDispatcher("Cashier.jsp").forward(request, response);
	}else{
	
		GoodService gs = new GoodService(); 
		
		if(gs.addUserGood(good_ID, good_No)){
			
			request.setAttribute("msg", "商品信息添加成功！");
			request.getRequestDispatcher("Cashier.jsp").forward(request, response);
		}else{
			
			request.setAttribute("msg", "商品信息添加失败！");
			request.getRequestDispatcher("Cashier.jsp").forward(request, response);
		}
	}
%>
</body>
</html>