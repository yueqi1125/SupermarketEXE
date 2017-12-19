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
String good_ID = request.getParameter("good_ID");
String good_Name = request.getParameter("good_Name");
String good_Kind = request.getParameter("good_Kind");
String good_Info = request.getParameter("good_Info");
String good_No = request.getParameter("good_No");
StringBuffer sql = new StringBuffer("select * from goods where 1=1");

if(good_ID != null &&! good_ID.equals("")){
	sql.append(" and good_ID = ").append(good_ID.trim());
}
if(good_Name != null &&! good_Name.equals("")){
	sql.append(" and good_Name like '%").append(good_Name.trim()).append("%'");
}
if(good_Kind != null &&! good_Kind.equals("全部")){
	sql.append(" and good_Kind = '").append(good_Kind).append("'");
}
if(good_Info != null &&! good_Info.equals("全部")){
	int Info;
	if(good_Info.equals("上架中")){
		Info = 0;
	}else{
		Info = 1;
	}
	sql.append(" and good_Info = ").append(Info);
}
if(good_No != null &&! good_No.equals("全部")){
	if(good_No.equals("库存充足")){
		sql.append(" and good_No > 100");
	}else{
		sql.append(" and good_No < 100");
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
<%
	Object msgo = request.getAttribute("msg");
	String msg = null;
	if(msgo != null){
		msg = msgo + "";
	}

%>
	<div class="place">
	    <span>位置：</span>
	    <ul class="placeul">
		    <li><a href="#">信息管理</a></li>
		    <li><a href="#">商品管理</a></li>
		    <li><a href="#">查看商品信息</a></li>
	    </ul>
	</div>
    
    <div class="formbody">
    
		<div id="usual1" class="usual"> 
		
		    <form action="que_goods.jsp" method="post">
		    
			    <ul class="seachform1">
				    <li><label>商品编号</label><input name="good_ID" type="text" class="scinput1" value="<%=good_ID == null ? "" : good_ID%>" /></li>
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
				    <li><label>上架信息</label>  
					    <div class="vocation">
						    <select name="good_Info" class="select3">
							    <option>全部</option>
							    <option <%="上架中".equals(good_Info) ? "selected" : "" %>>上架中</option>
							    <option <%="已下架".equals(good_Info) ? "selected" : "" %>>已下架</option>
						    </select>
					    </div>
				    </li>
				    
				    <li><label>库存选项</label>  
					    <div class="vocation">
						   <select name="good_No" class="select3">
							   <option>全部</option>
							   <option <%="库存充足".equals(good_No) ? "selected" : "" %>>库存充足</option>
							   <option <%="库存不足".equals(good_No) ? "selected" : "" %>>库存不足</option>
						   </select>
					    </div>
				    </li>     
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
	    <li><%if(msg != null){ %> <i class="ico-error"></i><span class="errorword"><%=msg %> </span><% } %></li>
		    <table class="tablelist">
		    	<thead>
		    	<tr>
			        <th>商品编号<i class="sort"><img src="<%=ctxPath%>/static/images/px.gif" /></i></th>
			        <th>商品名称</th>
			        <th>商品种类</th>
			        <th>商品进货价格（元）[最近一次]</th>
			        <th>商品出售价格（元）</th>
			        <th>商品数量</th>
			        <th>商品上架信息</th>
			        
			        <th>操作</th>
		        </tr>
		        </thead>
		        <%
		        int No = 0;
		        while(rs.next()){
		        No++;
		        %>
		        <tbody>
			        <tr>
				        <td><%=rs.getString(1) %></td>
				        <td><%=rs.getString(2) %></td>
				        <td><%=rs.getString(3) %></td>
				        <td><%=rs.getString(4) %></td>
				        <td><%=rs.getString(5) %></td>
				        <td><%=rs.getString(6) %></td>
				        <td><%=rs.getString(7).equals("0") ? "商品已上架" : "商品已下架" %></td>
				        <td><a href="good_Details.jsp?good_ID=<%=rs.getString(1) %>" class="tablelink">查看</a>
				        	<a href="good_Purchase.jsp?good_ID=<%=rs.getString(1) %>" class="tablelink">进货</a>
				        
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
					        	  location.href="good_Del.jsp?good_ID=<%=rs.getString(1) %>";
					        	});
	
					        	  $(".cancel").click(function(){
					        	  $(".tip").fadeOut(100);
					        	});
	
					        	});
							</script>
						
				        	<a class="click"> 删除</a>
						    <div class="tip">
						    	<div class="tiptop"><span>提示信息</span><a></a></div>
						        
							    <div class="tipinfo">
							        <span><img src="<%=ctxPath%>/static/images/ticon.png" /></span>
							        <div class="tipright">
							        <p>是否确认删除该商品信息 ？</p>
							        <cite>如果是请点击确定按钮 ，否则请点取消。</cite>
							        </div>
							    </div>
						        
						        <div class="tipbtn">
							        <input type="submit"  class="sure" value="确定" onclick="firm()"/>&nbsp;
							        <input type="button"  class="cancel" value="取消" />
						        </div>
						    
						    </div>
				        </td>
			        </tr> 
	        	</tbody>
		        <%} %> 
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