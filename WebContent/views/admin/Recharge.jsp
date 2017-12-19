<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	Object msgo = request.getAttribute("msg");
	String msg = null;
	if(msgo != null){
		msg = msgo + "";
	}

	String user_ID = request.getParameter("user_ID");
%>
	<div class="place">
	    <span>位置：</span>
	    <ul class="placeul">
		    <li><a href="#">信息管理</a></li>
		    <li><a href="#">会员管理</a></li>
		    <li><a href="#">会员充值</a></li>
	    </ul>
    </div>
    
    <div class="formbody">
	    <div class="formtitle"><span>会员充值</span></div>
	    <form action="do_Recharge.jsp" class="forminfo">
	    	<input type="hidden" name="user_ID" value="<%=user_ID %>">
	    	<li><label>充值账户</label><label><%=user_ID %></label></li>
		    <li><label>充值金额</label><input name="Money" type="text" class="dfinput" placeholder="请输入充值金额"/></li>
		    <li><%if(msg != null){ %> <i class="ico-error"></i><span class="errorword"><%=msg %> </span><% } %></li>
		    <li><label>&nbsp;</label><input type="submit" class="btn" value="确认充值"/></li>
	    </form>
    </div>
</body>

</html>