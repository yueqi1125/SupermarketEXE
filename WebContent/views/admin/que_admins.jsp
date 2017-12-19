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
String admin_ID = request.getParameter("admin_ID");
String admin_Name = request.getParameter("admin_Name");
String admin_Gender = request.getParameter("admin_Gender");
String admin_Age = request.getParameter("admin_Age");
String admin_Level = request.getParameter("admin_Level");
StringBuffer sql = new StringBuffer("select * from admin where 1=1");

if(admin_ID != null &&! admin_ID.equals("")){
	sql.append(" and admin_ID = ").append(admin_ID.trim());
}
if(admin_Name != null &&! admin_Name.equals("")){
	sql.append(" and admin_Name like '%").append(admin_Name.trim()).append("%'");
}
if(admin_Gender != null &&! admin_Gender.equals("全部")){
	sql.append(" and admin_Gender = '").append(admin_Gender).append("'");
}
if(admin_Level != null &&! admin_Level.equals("全部")){
	sql.append(" and admin_Level = '").append(admin_Level).append("'");
}
if(admin_Age != null &&! admin_Age.equals("默认")){
	if(admin_Age.equals("年龄升序")){
		sql.append(" order by admin_age");
	}else{
		sql.append(" order by admin_age desc");
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
		    <li><a href="#">员工管理</a></li>
		    <li><a href="#">查看员工信息</a></li>
	    </ul>
	</div>
    
    <div class="formbody">
    
		<div id="usual1" class="usual"> 
		
		    <form action="que_admins.jsp" method="post">
		    
			    <ul class="seachform1">
				    <li><label>员工ID</label><input name="admin_ID" type="text" class="scinput1" value="<%=admin_ID == null ? "" : admin_ID%>" /></li>
				    <li><label>员工姓名</label><input name="admin_Name" type="text" class="scinput1" value="<%=admin_Name == null ? "" : admin_Name%>"/></li>
		   		</ul>
		    
			    <ul class="seachform2">
				    <li><label>员工性别</label>  
					    <div class="vocation">
						    <select name="admin_Gender" class="select3">
							    <option>全部</option>
							    <option <%="男".equals(admin_Gender) ? "selected" : "" %>>男</option>
								<option <%="女".equals(admin_Gender) ? "selected" : "" %>>女</option>
						    </select>
					    </div>
				    </li>
				    
				    <li><label>员工权限</label>  
					    <div class="vocation">
						    <select name="admin_Level" class="select3">
							    <option>全部</option>
							    <option <%="收银员".equals(admin_Level) ? "selected" : "" %>>收银员</option>
								<option <%="管理员".equals(admin_Level) ? "selected" : "" %>>管理员</option>
								<option <%="老板".equals(admin_Level) ? "selected" : "" %>>老板</option>
						    </select>
					    </div>
				    </li>
				    
				    <li><label>年龄选项</label>  
					    <div class="vocation">
						   <select name="admin_Age" class="select3">
							   <option>默认</option>
							   <option <%="年龄升序".equals(admin_Age) ? "selected" : "" %>>年龄升序</option>
							   <option <%="年龄降序".equals(admin_Age) ? "selected" : "" %>>年龄降序</option>
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
		
	    <div class="formtitle"><span>员工列表</span></div>
	    <li><%if(msg != null){ %> <i class="ico-error"></i><span class="errorword"><%=msg %> </span><% } %></li>
		    <table class="tablelist">
		    	<thead>
		    	<tr>
			        <th>员工ID<i class="sort"><img src="<%=ctxPath%>/static/images/px.gif" /></i></th>
			        <th>员工姓名</th>
			        <th>员工性别</th>
			        <th>员工年龄</th>
			        <th>员工权限</th>
			        
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
				        <td><a href="admin_Details.jsp?admin_ID=<%=rs.getString(1) %>" class="tablelink">查看</a>
				        
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
					        	  location.href="admin_Del.jsp?admin_ID=<%=rs.getString(1) %>";
					        	});
	
					        	  $(".cancel").click(function(){
					        	  $(".tip").fadeOut(100);
					        	});
	
					        	});
							</script>
						
							<%if(!"2017090200".equals(rs.getString(1))){ %>
				        	<a class="click"> 解雇</a>
						    <div class="tip">
						    	<div class="tiptop"><span>提示信息</span><a></a></div>
						        
							    <div class="tipinfo">
							        <span><img src="<%=ctxPath%>/static/images/ticon.png" /></span>
							        <div class="tipright">
							        <p>是否确认解雇该员工 ？</p>
							        <cite>如果是请点击确定按钮 ，否则请点取消。</cite>
							        </div>
							    </div>
						        
						        <div class="tipbtn">
							        <input type="submit"  class="sure" value="确定" onclick="firm()"/>&nbsp;
							        <input type="button"  class="cancel" value="取消" />
						        </div>
						    </div>
						    <%} %>
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