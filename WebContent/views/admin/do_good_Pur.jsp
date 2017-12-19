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
	String good_Name = request.getParameter("good_Name");
	String good_Kind = request.getParameter("good_Kind");
	String good_Pricein = request.getParameter("good_Pricein");
	String good_No = request.getParameter("good_No");
	
	String info_Kind = "进货";
	String user_ID = "admin";
	String good_Priceout = "0";
	
	GoodService gs = new GoodService(); 
	
	if(gs.goodInfo(good_ID, good_Name, good_Kind, good_Priceout, good_Pricein, good_No, info_Kind, user_ID)){
		
		request.setAttribute("msg", "进货信息添加成功！");
		request.getRequestDispatcher("success.jsp").forward(request, response);
	}else{
		
		request.setAttribute("msg", "进货信息添加失败,请重新输入！");
		request.getRequestDispatcher("fail.jsp").forward(request, response);
	}
%>
</body>
</html>