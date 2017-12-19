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
	GoodInfo gi = new GoodInfo();
	
	request.setCharacterEncoding("UTF-8");
	
	String member = request.getParameter("member");
	String good_ID = request.getParameter("good_ID");
	String user_ID = request.getParameter("user_ID");
	int good_No_ = gs.getGoodInfo(good_ID).getGood_No();
	
	String sql = "select * from user_goods where 1=1";
	
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
<%
	Object msgo = request.getAttribute("msg");
	String msg = null;
	if(msgo != null){
		msg = msgo + "";
	}
	Object msgo1 = request.getAttribute("msg1");
	String msg1 = null;
	if(msgo1 != null){
		msg1 = msgo1 + "";
	}
	Object msgo2 = request.getAttribute("msg2");
	String msg2 = null;
	if(msgo2 != null){
		msg2 = msgo2 + "";
	}
%>
	<div class="place">
	    <span>位置：</span>
	    <ul class="placeul">
		    <li><a href="#">收银系统</a></li>
		    <li><a href="Cashier_out.jsp">退出收银系统</a></li>
	    </ul>
	</div>
    
    <div class="formbody">
    
		<div id="usual1" class="usual"> 
		    
		    <form action="Cashier.jsp" method="post">
		    	<label>商品编号</label><label>&nbsp;</label> <input name="good_ID" type="text" class="scinput1"/>
			    <label>&nbsp;</label><input type="submit" class="scbtn" value="查询"/>
		    	<li><%if(msg != null){ %> <i class="ico-error"></i><span class="errorword"><%=msg %> </span><% } %></li>
		    </form>
			<%if(good_No_ > 0){ %> 
			    <form action="Cashier_add.jsp" method="post">
			    	<label>获得编号</label><label>&nbsp;</label><label><%=good_ID %></label></li>
			    	<input type="hidden" name="good_ID" value="<%=good_ID %>">
			    	<li><input type="hidden" name="good_No_" value="<%=good_No_ %>"></li>
			    	<label>购买数量</label><label>&nbsp;</label> <input name="good_No" type="text" class="scinput1"/>
				    <label>&nbsp;</label><input type="submit" class="scbtn" value="添加"/>
			    </form>
			<% }else if(good_No_== 0){ %>
			    <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label> <label>请输入商品编号！</label></li>
			<%} %>
		
	    <div class="formtitle"><span>商品列表</span></div>
		    <table class="tablelist">
		    	<thead>
		    	<tr>
			        <th>商品编号<i class="sort"><img src="<%=ctxPath%>/static/images/px.gif" /></i></th>
			        <th>商品名称</th>
			        <th>商品价格（元）</th>
			        <th>商品数量</th>
			        <th>总金额</th>
			        
			        <th>操作</th>
		        </tr>
		        </thead>
		        <%
		        BigDecimal Money = new BigDecimal(0);
		        while(rs.next()){
		        	Money = Money.add(rs.getBigDecimal(7));
		        %>
		        <tbody>
			        <tr>
				        <td><%=rs.getString(2) %></td>
				        <td><%=rs.getString(3) %></td>
				        <td><%=rs.getString(5) %></td>
				        <td><%=rs.getString(6) %></td>
				        <td><%=rs.getBigDecimal(7) %></td>
				        <td><a href="Cashier_del.jsp?Pro_batches=<%=rs.getString(1) %>" class="tablelink">删除</a>
			        </tr> 
	        	</tbody>
		        <%} %> 
		    </table> 
		    <div class="pagin">
	    		<div class="paginList">总金额为<i class="blue"><%=Money %></i>元</div>
		        <script type="text/javascript">
		        $(document).ready(function(){
		        	  $(".click").click(function(){
		        	  $(".tip").fadeIn(200);
		        	  });
		        	  
		        	  $(".tiptop a").click(function(){
		        	  $(".tip").fadeOut(200);
		        	});

		        	  $(".sure").click(function(){
		        	  $(".tip").fadeOut(100);
		        	  location.href="Cashier.jsp?member=<%="使用会员卡" %>";
		        	});

		        	  $(".cancel").click(function(){
		        	  $(".tip").fadeOut(100);
		        	  location.href="pay.jsp?Money=<%=Money %>";
		        	});

		        	});
				</script>
				<hr />
	        	<a class="click">全部购买</a>
	        	<li><%if(msg1 != null){ %> <i class="ico-error"></i><span class="errorword"><%=msg1 %> </span><% } %></li>
			    <div class="tip">
			    	<div class="tiptop"><span>提示信息</span><a></a></div>
			        
				    <div class="tipinfo">
				        <span><img src="<%=ctxPath%>/static/images/ticon.png" /></span>
				        <div class="tipright">
				        <p>需付金额<i class="blue"><%=Money %></i>元</p>
				        <cite>是否使用会员卡！</cite>
				        </div>
				    </div>
			        
			        <div class="tipbtn">
				        <input type="submit"  class="sure" value="是"  onclick="firm()"/>&nbsp;
				        <input type="submit"  class="cancel" value="否" onclick="firm()"/>
			        </div>
			    
			    </div>
			    <%if(member != null | msg2 != null){ %>
			    <div class="formbody">
    				<div id="usual1" class="usual"> 
					    <form action="user_que_2.jsp" method="post">
					    	<input type="hidden" name="Money" value="<%=Money %>"/>
					    	<label>会员卡号</label><label>&nbsp;</label> <input name="user_ID" type="text" value="<%=user_ID == null ? "" : user_ID%>" class="scinput1"/>
						    <label>&nbsp;</label><input type="submit" class="scbtn" value="查询"/>
					    	<li>
						    	<%if(msg2 != null){ %>
						    		<i class="ico-error"></i><span class="errorword"><%=msg2 %></span>
						    	<%} %>
					    	</li>
					    </form>
					</div>
				</div>
		    <%} %>
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