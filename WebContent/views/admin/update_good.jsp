<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.xt.java.goods.*" %>
<%@ page import="com.xt.java.DBUtil.*" %>
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
	String good_Priceout = request.getParameter("good_Priceout");
	String good_No = request.getParameter("good_No");
	String good_Info = request.getParameter("good_Info");
	
	GoodService gs = new GoodService(); 
	
	if(gs.updateGood(good_ID, good_Name, good_Kind, good_Pricein, good_Priceout, good_No, good_Info)){
		
		request.setAttribute("msg", "信息修改成功！");
		request.getRequestDispatcher("success.jsp").forward(request, response);
	}else{
		
		request.setAttribute("msg", "信息修改失败！");
		request.getRequestDispatcher("fail.jsp").forward(request, response);
	}
%>
</body>
</html>