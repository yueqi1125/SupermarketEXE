<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.xt.java.admin.*" %>
<%
	String ctxPath = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="<%=ctxPath%>/static/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>

</head>


<body>
<%
	AdminInfo ai = new AdminInfo();
	Object o = session.getAttribute("USER_LOGIN_INFO");
	if(o != null){
		
		ai = (AdminInfo)session.getAttribute("USER_LOGIN_INFO");
	}else{
		
		response.sendRedirect("../login/sessionExpired.jsp");
	}
	
	String admin_ID = ai.getAdmin_ID();
	String admin_Name = ai.getAdmin_Name();
%>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    </ul>
    </div>
    
    <div class="mainindex">
    
    
    <div class="welinfo">
	    <span><img src="<%=ctxPath%>/static/images/sun.png" alt="天气" /></span>
	    <b><%=admin_Name %>您好，欢迎使用超市管理系统</b>(<%=admin_ID %>)
    </div>
    
    <div class="xline"></div>
    <div class="xline"></div>
    <div class="box"></div>
    
    <div class="welinfo">
    <span><img src="<%=ctxPath%>/static/images/dp.png" alt="提醒" /></span>
    <b>超市管理系统使用指南</b>
    </div>
    
    <ul class="infolist">
    <li><span>您可以对商品信息进行管理</span></li>
    <li><span>您可以对员工信息进行管理</span></li>
    <li><span>您可以对会员信息进行管理</span></li>
    <li><span>您可以使用本系统进行收银操作</span></li>
    <li><span>您可以查看进出货、利润统计的详情</span></li>
    <li><span>您可以进行账户信息修改等操作</span></li>
    </ul>
    
    <div class="xline"></div>

</body>

</html>
