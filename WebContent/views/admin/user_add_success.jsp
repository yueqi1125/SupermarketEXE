<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();
%>
<%@ page import="com.xt.java.user.*" %>
<%@ page import="com.xt.java.DBUtil.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="<%=ctxPath%>/static/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>

<script language="javascript">
	$(function(){
    $('.error').css({'position':'absolute','left':($(window).width()-490)/2});
	$(window).resize(function(){  
    $('.error').css({'position':'absolute','left':($(window).width()-490)/2});
    })  
});  
</script> 
</head>
<%
	request.setCharacterEncoding("UTF-8");
	UserService us = new UserService();
	String user_ID = us.getLastID();
	
	String sql = "select * from user where user_ID = " + user_ID;
	DBUtil dbu = DBUtil.getDBUInstance();
	Connection conn = null;
	Statement stat = null;
	ResultSet rs = null;

	try{
		conn = dbu.getDBConn();
		stat = conn.createStatement();
		rs = stat.executeQuery(sql);
%>

<body style="background:#FFF8ED;">

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    	<li><a href="#">信息管理</a></li>
		<li><a href="#">会员管理</a></li>
		<li><a href="#">会员信息注册</a></li>
    </ul>
    </div>
    
    <div class="formtitle"><span>成功注册的会员信息</span></div>
		<table class="tablelist">
		    <thead>
		    	<tr>
			        <th>会员ID<i class="sort"><img src="<%=ctxPath%>/static/images/px.gif" /></i></th>
			        <th>会员姓名</th>
			        <th>会员性别</th>
			        <th>会员密码</th>
			        <th>账户余额</th>
			        <th>账户积分</th>
			        <th>会员等级</th>
		        </tr>
	        </thead>
	        <%
		    while(rs.next()){
	        %>
		    <tbody>
			    <tr>
				    <td><%=rs.getString(1) %></td>
				    <td><%=rs.getString(2) %></td>
				    <td><%=rs.getString(3) %></td>
				    <td>123456（默认密码）</td>
				    <td><%=rs.getBigDecimal(5) %></td>
				    <td><%=rs.getInt(6) %></td>
				    <td><%=rs.getString(7) %></td>
			    </tr> 
	        </tbody>
		    <%} %> 
		</table>
    <div>
	    <div class="reindex"><a href="user_add.jsp" target="rightFrame">继续注册</a></div>
	    <div class="reindex"><a href="user_que.jsp" target="rightFrame">查看会员信息</a></div>
    </div>


</body>
<%

}catch(Exception e){
	e.printStackTrace();
}finally{
	dbu.close(rs);
	dbu.close(stat);
	dbu.close(conn);
}
%>
</html>