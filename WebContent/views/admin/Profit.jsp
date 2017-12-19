<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();
%>
<%@ page import="com.xt.java.DBUtil.*" %>
<%@ page import="com.xt.java.goods.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.math.BigDecimal" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>无标题文档</title>
	<link href="<%=ctxPath%>/static/css/style.css" rel="stylesheet" type="text/css" />
	<link href="<%=ctxPath%>/static/css/select.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="<%=ctxPath%>/static/js/jquery.js"></script>
	<script type="text/javascript" src="<%=ctxPath%>/static/js/jquery.idTabs.min.js"></script>
	<script type="text/javascript" src="<%=ctxPath%>/static/js/select-ui.min.js"></script>
	<script type="text/javascript" src="<%=ctxPath%>/static/editor/kindeditor.js"></script>
	
	<script type="text/javascript">
	    KE.show({
	        id : 'content7',
	        cssPath : './index.css'
	    });
	</script>
	  
	<script type="text/javascript">
		$(document).ready(function(e) {
		
			$(".select3").uedSelect({
				width : 152
			});
		});
	</script>
</head>
<%
	GoodService gs = new GoodService();
	
	request.setCharacterEncoding("UTF-8");
	
	String date = request.getParameter("date");
	
	String sql = "select * from money where 1=1";
	
	DBUtil dbu = DBUtil.getDBUInstance();
	Connection conn = null;
	Statement stat = null;
	ResultSet rs = null;
	
	try{
		conn = dbu.getDBConn();
		stat = conn.createStatement();
		rs = stat.executeQuery(sql.toString());
%>
<body class="sarchbody">
	<div class="place">
	    <span>位置：</span>
	    <ul class="placeul">
		    <li><a href="#">财务管理</a></li>
		    <li><a href="#">利润详情</a></li>
	    </ul>
	</div>
    
    <div class="formbody">
    
		<div id="usual1" class="usual"> 
		    
		    <form action="Profit.jsp" method="post">
		    	<label>日期选项</label><label>&nbsp;</label> <input name="money_date" type="text" class="scinput1"/>
			    <label>&nbsp;</label><input type="submit" class="scbtn" value="查询"/>
		    </form>
		
	    <div class="formtitle"><span>账单列表</span></div>
		    <table class="tablelist">
		    	<thead>
		    	<tr>
			        <th>账单日期<i class="sort"><img src="<%=ctxPath%>/static/images/px.gif" /></i></th>
			        <th>进货总金额（元）</th>
			        <th>出售总金额（元）</th>
			        <th>出售总利润（元）</th>
			        <th>资产变动金额（元）</th>
		        </tr>
		        </thead>
		        <%
		        BigDecimal Money = new BigDecimal(0);
		        while(rs.next()){
		        	Money = Money.add(rs.getBigDecimal(5));
		        %>
		        <tbody>
			        <tr>
				        <td><%=rs.getDate(1) %></td>
				        <td><%=rs.getBigDecimal(2) %></td>
				        <td><%=rs.getBigDecimal(3) %></td>
				        <td><%=rs.getBigDecimal(4) %></td>
				        <td><%=rs.getBigDecimal(5) %></td>
			        </tr> 
	        	</tbody>
		        <%} %> 
		    </table> 
		    <div class="pagin">
	    		<div class="paginList">累计资产变动总金额<i class="blue"><%=Money %></i>元</div>
		        
	    	</div> 
		</div> 
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