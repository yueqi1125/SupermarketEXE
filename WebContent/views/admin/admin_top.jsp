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
	<script language="JavaScript" src="<%=ctxPath%>/static/js/jquery.js"></script>
	<script type="text/javascript">
	$(function(){	
		//顶部导航切换
		$(".nav li a").click(function(){
			$(".nav li a.selected").removeClass("selected")
			$(this).addClass("selected");
		})	
	})	
	</script>
</head>

<body style="background:url(<%=ctxPath%>/static/images/topbg.gif) repeat-x;">
<%
	AdminInfo ai = new AdminInfo();
	ai = (AdminInfo)session.getAttribute("USER_LOGIN_INFO");
	String admin_Name = ai.getAdmin_Name();
%>
    <div class="topleft">
    	<a href="main.jsp" target="_parent"><img src="<%=ctxPath%>/static/images/logo.png" title="系统首页" /></a>
    </div>
            
    <div class="topright">    
	    <ul>
			<li><a href="<%=ctxPath %>/doOut" target="_parent">退出</a></li>
	    </ul>  
	    <div class="user">
		    <span><%=admin_Name %>,你好！</span>
	    </div>    
    </div>

</body>
</html>