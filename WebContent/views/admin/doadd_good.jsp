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
	String good_Name = request.getParameter("good_Name");
	String good_Kind = request.getParameter("good_Kind");
	String good_Pricein = request.getParameter("good_Pricein");
	String good_Priceout = request.getParameter("good_Priceout");
	String good_No = request.getParameter("good_No");
	String good_Info = request.getParameter("good_Info");
	
	GoodService gs = new GoodService();
	
	String user_ID = "admin";
	
	String good_ID_0 = "201701";
	String lastID =  gs.getLastID();
	String good_ID_1 = lastID.substring(6);
	int No = Integer.parseInt(good_ID_1);
	No++;
	good_ID_1 = String.format("%04d", No);
	String good_ID = good_ID_0 + good_ID_1;
	
	if(gs.addGood(good_ID, good_Name, good_Kind, good_Pricein, good_Priceout, good_No, good_Info, user_ID)){
		
		request.setAttribute("msg", "商品入库成功,请继续添加或选择其他操作！");
		request.getRequestDispatcher("add_good.jsp").forward(request, response);
	}else{
		request.setAttribute("msg", "商品信息添加失败,请重新输入！");
		request.getRequestDispatcher("add_good.jsp").forward(request, response);
	}
%>
</body>
</html>