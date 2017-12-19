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
		function checkUpdateadmin(){
			var admin_Name = document.getElementsByName("admin_Name")[0].value;
			var admin_Age = document.getElementsByName("admin_Age")[0].value;
			if(admin_Name == ""){
				alert("员工姓名不能为空！");
				return false;
			}
			if(admin_Age == ""){
				alert("员工年龄不能为空！");
				return false;
			}
			return true;
		}
	</script>
</head>

<body>
<%
	String admin_ID = request.getParameter("admin_ID");
	DBUtil dbu = DBUtil.getDBUInstance();
	Connection conn = null;
	Statement stat = null;
	ResultSet rs = null;
	
	String sql = "select * from admin where admin_ID = " + admin_ID;
	
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
		    <li><a href="#">员工信息管理</a></li>
		    <li><a href="#">查看员工信息</a></li>
		    <li><a href="#">员工信息</a></li>
	    </ul>
    </div>
    
    <div class="formbody">
	    <div class="formtitle"><span>员工信息</span></div>
	    <form action="update_admin.jsp" class="forminfo" onsubmit="return checkUpdateadmin()">
	    	<input type="hidden" name="admin_ID" value="<%=admin_ID %>">
	    	<li><label>员工ID</label><input type="text" class="dfinput" value="<%=admin_ID %>" disabled class="form-control"/></li>
		    <li><label>员工姓名</label><input name="admin_Name" type="text" class="dfinput" value="<%=rs.getString(2) %>"/></li>
		    <li><label>员工性别</label>
		    	<cite>
		    		<input name="admin_Gender" type="radio" value="男" <%="男".equals(rs.getString(3)) ? "checked" : "" %> />男&nbsp;&nbsp;&nbsp;&nbsp;
		    		<input name="admin_Gender" type="radio" value="女" <%="女".equals(rs.getString(3)) ? "checked" : "" %> />女
		    	</cite>
		    </li>
		  	<li><label>员工年龄</label><input name="admin_Age" type="text" class="dfinput" value="<%=rs.getInt(4) %>"/></li>
		    <li><label>员工权限</label>
		    	<select name="admin_Level" class="dfinput">
					<option <%="收银员".equals(rs.getString(5)) ? "selected" : "" %>>收银员</option>
					<option <%="管理员".equals(rs.getString(5)) ? "selected" : "" %>>管理员</option>
				</select>
			</li>
		    <li><label>&nbsp;</label><input type="submit" class="btn" value="确认修改"/></li>
	    </form>
		<form action="que_admins.jsp" class="forminfo">
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