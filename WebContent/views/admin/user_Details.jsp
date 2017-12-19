<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();
%>
<%@ page import="com.xt.java.DBUtil.DBUtil" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="<%=ctxPath%>/static/css/style.css" rel="stylesheet" type="text/css" />

	<script type="text/javascript">
		function checkUpdateuser(){
			var user_Name = document.getElementsByName("user_Name")[0].value;
			if(user_Name == ""){
				alert("会员姓名不能为空！");
				return false;
			}
			return true;
		}
	</script>
</head>

<body>
<%
	String user_ID = request.getParameter("user_ID");
	DBUtil dbu = DBUtil.getDBUInstance();
	Connection conn = null;
	Statement stat = null;
	ResultSet rs = null;
	
	String sql = "select * from user where user_ID = " + user_ID;
	
	try{
		conn = dbu.getDBConn();
		stat = conn.createStatement();
		rs = stat.executeQuery(sql);
		if(rs.next()){
%>
	<div class="place">
	    <span>位置：</span>
	    <ul class="placeul">
		    <li><a href="#">信息管理</a></li>
		    <li><a href="#">会员信息管理</a></li>
		    <li><a href="#">查看会员信息</a></li>
		    <li><a href="#">会员信息</a></li>
	    </ul>
    </div>
    
    <div class="formbody">
	    <div class="formtitle"><span>会员信息</span></div>
	    <form action="user_update.jsp" onsubmit="return checkUpdateuser()" class="forminfo">
	    	<input type="hidden" name="user_ID" value="<%=user_ID %>">
	    	<li><label>会员ID</label><input type="text" class="dfinput" value="<%=user_ID %>" disabled class="form-control"/></li>
		    <li><label>会员姓名</label><input name="user_Name" type="text" class="dfinput" value="<%=rs.getString(2) %>"/></li>
		    <li><label>会员性别</label>
		    	<cite>
		    		<input name="user_Gender" type="radio" value="男" <%="男".equals(rs.getString(3)) ? "checked" : "" %> />男&nbsp;&nbsp;&nbsp;&nbsp;
		    		<input name="user_Gender" type="radio" value="女" <%="女".equals(rs.getString(3)) ? "checked" : "" %> />女
		    	</cite>
		    </li>
		  	<li><label>会员积分</label><input type="text" class="dfinput" value="<%=rs.getInt(6) %>" disabled/></li>
		    <li><label>会员等级</label>
		    	<select name="user_Level" class="dfinput" disabled>
					<option <%="普通".equals(rs.getString(7)) ? "selected" : "" %>>普通</option>
					<option <%="白银".equals(rs.getString(7)) ? "selected" : "" %>>白银</option>
					<option <%="黄金".equals(rs.getString(7)) ? "selected" : "" %>>黄金</option>
					<option <%="钻石".equals(rs.getString(7)) ? "selected" : "" %>>钻石</option>
				</select>
			</li>
		    <li><label>&nbsp;</label><input type="submit" class="btn" value="确认修改"/></li>
	    </form>
		<form action="user_que.jsp" class="forminfo">
			<li><label>&nbsp;</label><input type="submit" class="btn" value="返回"/></li>
		</form>
    </div>
<%
	}
}catch(Exception e){
	e.printStackTrace();
}finally{
	dbu.close(rs);
	dbu.close(stat);
	dbu.close(conn);
}
%>
</body>

</html>