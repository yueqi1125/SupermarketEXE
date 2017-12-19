<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.xt.java.goods.*" %>
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
	String good_ID = request.getParameter("good_ID");

	GoodService gs = new GoodService(); 
	if(gs.delGood(good_ID)){
		
		request.setAttribute("msg", "商品信息添加成功！");
		request.getRequestDispatcher("success.jsp").forward(request, response);
	}else{
		
		request.setAttribute("msg", "商品库存不为零，删除失败！");
		request.getRequestDispatcher("fail.jsp").forward(request, response);
	}
%>
</body>
</html>