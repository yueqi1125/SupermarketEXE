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
</head>

<body>
<%
	String good_ID = request.getParameter("good_ID");
	DBUtil dbu = DBUtil.getDBUInstance();
	Connection conn = null;
	Statement stat = null;
	ResultSet rs = null;
	
	String sql = "select * from goods where good_ID = " + good_ID;
	
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
		    <li><a href="#">商品管理</a></li>
		    <li><a href="#">查看商品信息</a></li>
		    <li><a href="#">商品详情</a></li>
	    </ul>
    </div>
    
    <div class="formbody">
	    <div class="formtitle"><span>商品详情</span></div>
	    <form action="do_good_Pur.jsp" class="forminfo">
	    	<input type="hidden" name="good_ID" value="<%=good_ID %>">
	    	<input type="hidden" name="good_Name" value="<%=rs.getString(2) %>">
	    	<input type="hidden" name="good_Kind" value="<%=rs.getString(3) %>">
	    	<li><label>商品编号</label><input type="text" class="dfinput" value="<%=good_ID %>" disabled class="form-control"/></li>
		    <li><label>商品名称</label><input type="text" class="dfinput" value="<%=rs.getString(2) %>"  disabled/></li>
		    <li><label>商品种类</label>
		    	<select class="dfinput" disabled>
					<option <%="电器".equals(rs.getString(3)) ? "selected" : "" %>>电器</option>
					<option <%="生活用品".equals(rs.getString(3)) ? "selected" : "" %>>生活用品</option>
					<option <%="工具".equals(rs.getString(3)) ? "selected" : "" %>>工具</option>
					<option <%="食品".equals(rs.getString(3)) ? "selected" : "" %>>食品</option>
					<option <%="瓜果蔬菜".equals(rs.getString(3)) ? "selected" : "" %>>瓜果蔬菜</option>
				</select></li>
		  	<li><label>进货价格</label><input name="good_Pricein" type="text" class="dfinput" value="<%=rs.getInt(4) %>"/></li>
		  	<li><label>进货数量</label><input name="good_No" type="text" class="dfinput"/></li>
		    <li><label>&nbsp;</label><input type="submit" class="btn" value="确认进货"/></li>
	    </form>
		<form action="que_goods.jsp" class="forminfo">
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