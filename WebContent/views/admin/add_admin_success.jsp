<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();
%>
<%@ page import="com.xt.java.admin.*" %>
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
	AdminService as = new AdminService();
	String admin_ID = as.getLastID();
	
	String sql = "select * from admin where admin_ID = " + admin_ID;
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
		<li><a href="#">员工管理</a></li>
		<li><a href="#">添加员工信息</a></li>
    </ul>
    </div>
    
    <div class="formtitle"><span>成功添加的员工信息</span></div>
		<table class="tablelist">
		    <thead>
		    	<tr>
			        <th>员工ID<i class="sort"><img src="<%=ctxPath%>/static/images/px.gif" /></i></th>
			        <th>员工姓名</th>
			        <th>员工性别</th>
			        <th>员工年龄</th>
			        <th>员工权限</th>
			        <th>员工密码</th>
			        
			        <th>操作</th>
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
				    <td><%=rs.getInt(4) %></td>
				    <td><%=rs.getString(5) %></td>
				    <td>123456（默认密码）</td>
				    <td><a href="admin_update.jsp?admin_ID=<%=rs.getString(1) %>" class="tablelink">修改</a></td>
			    </tr> 
	        </tbody>
		    <%} %> 
		</table>
    <div>
	    <div class="reindex"><a href="add_admin.jsp" target="rightFrame">返回继续添加</a></div>
	    <div class="reindex"><a href="que_admins.jsp" target="rightFrame">返回查看全部员工信息</a></div>
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