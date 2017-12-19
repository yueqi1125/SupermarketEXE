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
	<title>欢迎登录超市管理系统</title>
	<link href="<%=ctxPath%>/static/css/style.css" rel="stylesheet" type="text/css" />
	<script language="JavaScript" src="<%=ctxPath%>/static/js/jquery.js"></script>
	<script src="<%=ctxPath%>/static/js/cloud.js" type="text/javascript"></script>

	<script language="javascript">
		$(function(){
		$('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
		$(window).resize(function(){  
		$('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
		})  
		});  
	</script> 
	<script type="text/javascript">
		function checkLogin(){
			var admin_ID = document.getElementsByName("admin_ID")[0].value;
			var admin_PW = document.getElementsByName("admin_PW")[0].value;
			if(admin_ID == ""){
				alert("用户ID不能为空！");
				return false;
			}
			if(admin_PW == ""){
				alert("用户密码不能为空！");
				return false;
			}
			return true;
		}
	</script>

</head>
<body style="background-color:#df7611; background-image:url(images/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">
<%
	Object msgo = request.getAttribute("msg");
	String msg = null;
	if(msgo != null){
		msg = msgo + "";
	}
	
	Cookie[] cookies = request.getCookies();
	String admin_ID = "";
	String admin_PW = "";
   	for(Cookie cookie : cookies){
   		if(cookie.getName().equals("ID")){
   			admin_ID = cookie.getValue();
   		}
   		if(cookie.getName().equals("pwd")){
   			admin_PW = cookie.getValue();
   		}
   	}
   	
   	AdminService as = new AdminService();
   	if(as.checkLogin(admin_ID,admin_PW)){
   		
   		session.setAttribute("USER_LOGIN_INFO", as.getAdminInfo(admin_ID,admin_PW));
	   	response.sendRedirect("../admin/admin_main.jsp");
   	}
%>
    <div id="mainBody">
	    <div id="cloud1" class="cloud"></div>
	    <div id="cloud2" class="cloud"></div>
    </div>  

	<div class="logintop">    
	    <span>欢迎登录超市管理系统</span> 
	    <ul>
		    <li><a href="login.jsp" >用户登录</a></li>
	    </ul>    
    </div>
   
    <div class="loginbody">
		    <span class="systemlogo"></span> 
		    <div class="loginbox loginbox2">
		    	<form action="<%=ctxPath %>/doLogin" onsubmit="return checkLogin()" method="post">
			    <ul>
				    <li><input name="admin_ID" type="text" class="loginpwd" placeholder="请输入您的管理员ID"/></li>
				    <li><input name="admin_PW" type="password" class="loginpwd" placeholder="请输入您的密码"/></li>
				    <li><%if(msg != null){ %> <i class="ico-error"></i><span class="errorword"><%=msg %> </span><% } %></li>
			    	<li>
			    		<input name="" type="submit" class="loginbtn" value="登录"/>
			    	</li>
			    </ul> 
			    <form>
		    </div>
    </div>
</body>

</html>