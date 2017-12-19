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
	
	Object msgo = request.getAttribute("msg");
	String msg = null;
	if(msgo != null){
		msg = msgo + "";
	}
%>
	<div class="place">
	    <span>位置：</span>
	    <ul class="placeul">
		    <li><a href="#">账户设置</a></li>
		    <li><a href="#">我的账户信息</a></li>
		    <li><a href="#">密码修改</a></li>
	    </ul>
    </div>
    
    <div class="formbody">
	    <div class="formtitle"><span>密码修改</span></div>
	    <form action="admin_update_pw_do.jsp" class="forminfo">
	    	<input type="hidden" name="admin_ID" value="<%=admin_ID %>">
	    	<li><label>我的账户</label><label><%=admin_ID %></label></li>
		    <li><label>新密码</label><input name="admin_PW_1" type="password" class="dfinput" placeholder="请输入您的新密码"/></li>
		    <li><label>密码确认</label><input name="admin_PW_2" type="password" class="dfinput" placeholder="请再次输入您的新密码"/></li>
		    <li><%if(msg != null){ %> <i class="ico-error"></i><span class="errorword"><%=msg %> </span><% } %></li>
		    <li><label>&nbsp;</label><input type="submit" class="btn" value="确认"/></li>
	    </form>
    </div>
</body>
</html>