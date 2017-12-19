<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();
%>
<%@ page import="com.xt.java.DBUtil.*" %>
<%@ page import="java.sql.*" %>
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

request.setCharacterEncoding("UTF-8");
String info_ID = request.getParameter("info_ID");
String good_ID = request.getParameter("good_ID");
String good_Name = request.getParameter("good_Name");
String good_Kind = request.getParameter("good_Kind");
String info_time = request.getParameter("info_time");
StringBuffer sql = new StringBuffer("select * from goods_info where 1=1");

if(good_ID != null &&! good_ID.equals("")){
	sql.append(" and good_ID = ").append(good_ID.trim());
}
if(info_ID != null &&! info_ID.equals("")){
	sql.append(" and info_ID = ").append(info_ID.trim());
}
if(good_Name != null &&! good_Name.equals("")){
	sql.append(" and good_Name like '%").append(good_Name.trim()).append("%'");
}
if(good_Kind != null &&! good_Kind.equals("全部")){
	sql.append(" and good_Kind = '").append(good_Kind).append("'");
}
if(info_time != null &&! info_time.equals("默认")){
	if(info_time.equals("日期升序")){
		sql.append(" order by info_time");
	}else{
		sql.append(" order by info_time desc");
	}
}

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
		    <li><a href="#">信息管理</a></li>
		    <li><a href="#">商品管理</a></li>
		    <li><a href="#">查看出售详细信息</a></li>
	    </ul>
	</div>
    
    <div class="formbody">
    
		<div id="usual1" class="usual"> 
		
		    <form action="info_Pay.jsp" method="post">
		    
			    <ul class="seachform1">
				    <li><label>商品编号</label><input name="good_ID" type="text" class="scinput1" value="<%=good_ID == null ? "" : good_ID%>"/></li>
				    <li><label>商品名称</label><input name="good_Name" type="text" class="scinput1" value="<%=good_Name == null ? "" : good_Name%>"/></li>
		   		</ul>
		    
			    <ul class="seachform2">
				    <li><label>商品种类</label>  
					    <div class="vocation">
						    <select name="good_Kind" class="select3">
							    <option>全部</option>
							    <option <%="电器".equals(good_Kind) ? "selected" : "" %>>电器</option>
								<option <%="生活用品".equals(good_Kind) ? "selected" : "" %>>生活用品</option>
								<option <%="工具".equals(good_Kind) ? "selected" : "" %>>工具</option>
								<option <%="食品".equals(good_Kind) ? "selected" : "" %>>食品</option>
								<option <%="瓜果蔬菜".equals(good_Kind) ? "selected" : "" %>>瓜果蔬菜</option>
						    </select>
					    </div>
				    </li>  
				    
				    <li><label>日期选项</label>  
					    <div class="vocation">
						   <select name="info_time" class="select3">
							   <option>默认</option>
							   <option <%="日期升序".equals(info_time) ? "selected" : "" %>>日期升序</option>
							   <option <%="日期降序".equals(info_time) ? "selected" : "" %>>日期降序</option>
						   </select>
					    </div>
				    </li>    
				     
				    <li><label>账单编号</label><input name="info_ID" type="text" class="scinput1" value="<%=info_ID == null ? "" : info_ID%>" /></li>
			    </ul>
		    
			    <ul class="seachform1">
			    	<li class="sarchbtn">
			    		<label>&nbsp;</label> 
			    		<input name="" type="button" class="scbtn1" value="更多条件"/>
			    		<input name="" type="submit" class="scbtn" value="查询"/>   
			    	</li>  
			    </ul>
		    
			    <script language="javascript">
					$(document).ready(function() 
					{ 
					    $(".scbtn1").click(function() 
					    {      
					        if( $(".seachform2").hasClass("hideclass") ) 
					        { 
					            $(".seachform2").removeClass("hideClass"); 
					        } 
					        else 
					        { 
					            $(".seachform2").addClass("hideClass"); 
					        }    
					    }); 
					}); 
				</script>
			    
			    <script type="text/javascript">
					$(document).ready(function(){
					  $(".scbtn1").click(function(){
					  $(".seachform2").fadeIn(200);
					  }); 
					});
				</script>
			</form>
		
	    <div class="formtitle"><span>商品列表</span></div>
		    <table class="tablelist">
		    	<thead>
		    	<tr>
			        <th>账单编号<i class="sort"><img src="<%=ctxPath%>/static/images/px.gif" /></i></th>
			        <th>商品编号</th>
			        <th>商品名称</th>
			        <th>商品种类</th>
			        <th>商品出售价格（元）</th>
			        <th>出售数量</th>
			        <th>出售总金额</th>
			        <th>出售时间</th>
			        <th>购买人</th>
		        </tr>
		        </thead>
		        <%
		        int No = 0;
		        while(rs.next()){
		        	if("出售".equals(rs.getString(8))){
		        		No++;
		        %>
		        <tbody>
			        <tr>
				        <td><%=rs.getString(1) %></td>
				        <td><%=rs.getString(2) %></td>
				        <td><%=rs.getString(3) %></td>
				        <td><%=rs.getString(4) %></td>
				        <td><%=rs.getString(6) %></td>
				        <td><%=rs.getString(7) %></td>
				        <td><%=rs.getString(9) %></td>
				        <td><%=rs.getString(10) %></td>
				        <td><%=rs.getString(11) %></td>
			        </tr> 
	        	</tbody>
		        <%	}
		        } %> 
		    </table> 
		    <div class="pagin">
	    		<div class="paginList">共<i class="blue"><%=No %></i>条记录</div>
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