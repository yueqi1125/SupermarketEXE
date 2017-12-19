<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();
%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>欢迎登录超市购物系统</title>
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
			var user_ID = document.getElementsByName("user_ID")[0].value;
			var user_PW = document.getElementsByName("user_PW")[0].value;
			if(user_ID == ""){
				alert("用户ID不能为空！");
				return false;
			}
			if(user_PW == ""){
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

%>
    <div id="mainBody">
	    <div id="cloud1" class="cloud"></div>
	    <div id="cloud2" class="cloud"></div>
    </div>  

	<div class="logintop">    
	    <span>欢迎登录超市购物系统</span>    
	    <ul>
		    <li><a href="admin_login.jsp" >管理员登录</a></li>
	    </ul>    
    </div>
    
    <div class="loginbody">
    
		    <span class="systemlogo"></span> 
		    <div class="loginbox loginbox2">
		    	<form action="do_login.jsp" onsubmit="return checkLogin()" method="post">
			    <ul>
				    <li><input name="user_ID" type="text" class="loginpwd" placeholder="请输入您的ID"/></li>
				    <li><input name="user_PW"type="password" class="loginpwd" placeholder="请输入您的密码"/></li>
				    <li><%if(msg != null){ %> <i class="ico-error"></i><span class="errorword"><%=msg %> </span><% } %></li>
			    	<li>
			    		<input name="" type="submit" class="loginbtn" value="登录"/>
			    		<label><input name="" type="checkbox" value="" checked="checked" />记住密码</label>
			    	</li>
			    </ul> 
			    <form>
		    </div>
    </div>
</body>

</html>