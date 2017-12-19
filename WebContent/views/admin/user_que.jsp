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
String user_ID = request.getParameter("user_ID");
String user_Name = request.getParameter("user_Name");
String user_Gender = request.getParameter("user_Gender");
String user_Level = request.getParameter("user_Level");
String user_Integral = request.getParameter("user_Integral");
StringBuffer sql = new StringBuffer("select * from user where 1=1");

if(user_ID != null &&! user_ID.equals("")){
	sql.append(" and user_ID = ").append(user_ID.trim());
}
if(user_Name != null &&! user_Name.equals("")){
	sql.append(" and user_Name like '%").append(user_Name.trim()).append("%'");
}
if(user_Gender != null &&! user_Gender.equals("全部")){
	sql.append(" and user_Gender = '").append(user_Gender).append("'");
}
if(user_Level != null &&! user_Level.equals("全部")){
	sql.append(" and user_Level = '").append(user_Level).append("'");
}
if(user_Integral != null &&! user_Integral.equals("默认")){
	if(user_Integral.equals("积分升序")){
		sql.append(" order by user_Integral");
	}else{
		sql.append(" order by user_Integral desc");
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
		    <li><a href="#">会员管理</a></li>
		    <li><a href="#">查看会员信息</a></li>
	    </ul>
	</div>
    
    <div class="formbody">
    
		<div id="usual1" class="usual"> 
		
		    <form action="user_que.jsp" method="post">
		    
			    <ul class="seachform1">
				    <li><label>会员ID</label><input name="user_ID" type="text" class="scinput1" value="<%=user_ID == null ? "" : user_ID%>" /></li>
				    <li><label>会员姓名</label><input name="user_Name" type="text" class="scinput1" value="<%=user_Name == null ? "" : user_Name%>"/></li>
		   		</ul>
		    
			    <ul class="seachform2">
				    <li><label>会员性别</label>  
					    <div class="vocation">
						    <select name="user_Gender" class="select3">
							    <option>全部</option>
							    <option <%="男".equals(user_Gender) ? "selected" : "" %>>男</option>
								<option <%="女".equals(user_Gender) ? "selected" : "" %>>女</option>
						    </select>
					    </div>
				    </li>
				    
				    <li><label>会员等级</label>  
					    <div class="vocation">
						    <select name="user_Level" class="select3">
							    <option>全部</option>
							    <option <%="普通".equals(user_Level) ? "selected" : "" %>>普通</option>
								<option <%="白银".equals(user_Level) ? "selected" : "" %>>白银</option>
								<option <%="黄金".equals(user_Level) ? "selected" : "" %>>黄金</option>
								<option <%="钻石".equals(user_Level) ? "selected" : "" %>>钻石</option>
						    </select>
					    </div>
				    </li>
				    
				    <li><label>积分选项</label>  
					    <div class="vocation">
						   <select name="user_Integral" class="select3">
							   <option>默认</option>
							   <option <%="积分升序".equals(user_Integral) ? "selected" : "" %>>积分升序</option>
							   <option <%="积分降序".equals(user_Integral) ? "selected" : "" %>>积分降序</option>
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
		
	    <div class="formtitle"><span>会员列表</span></div>
	    <li><%if(msg != null){ %> <i class="ico-error"></i><span class="errorword"><%=msg %> </span><% } %></li>
		    <table class="tablelist">
		    	<thead>
		    	<tr>
			        <th>会员ID<i class="sort"><img src="<%=ctxPath%>/static/images/px.gif" /></i></th>
			        <th>会员姓名</th>
			        <th>会员性别</th>
			        <th>会员等级</th>
			        <th>会员积分</th>
			        <th>余额</th>
			        
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
				        <td><%=rs.getString(7) %></td>
				        <td><%=rs.getString(6) %></td>
				        <td><%=rs.getString(5) %></td>
				        <td><a href="user_Details.jsp?user_ID=<%=rs.getString(1) %>" class="tablelink">查看</a>
				        
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
					        	  location.href="user_del.jsp?user_ID=<%=rs.getString(1) %>";
					        	});
	
					        	  $(".cancel").click(function(){
					        	  $(".tip").fadeOut(100);
					        	});
	
					        	});
							</script>
				        	<a class="click">注销</a>
						    <div class="tip">
						    	<div class="tiptop"><span>提示信息</span><a></a></div>
						        
							    <div class="tipinfo">
							        <span><img src="<%=ctxPath%>/static/images/ticon.png" /></span>
							        <div class="tipright">
							        <p>该操作会清空会员余额、积分信息！</p>
							        <p>是否确认！</p>
							        <cite>如果确定请点击确定按钮 ，否则请点取消。</cite>
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