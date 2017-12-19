<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.xt.java.admin.*" %>
<%
	String ctxPath = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>无标题文档</title>
	<link href="<%=ctxPath%>/static/css/style.css" rel="stylesheet" type="text/css" />
	<script language="JavaScript" src="<%=ctxPath%>/static/js/jquery.js"></script>
	
	<script type="text/javascript">
		$(function(){	
			//导航切换
			$(".menuson .header").click(function(){
				var $parent = $(this).parent();
				$(".menuson>li.active").not($parent).removeClass("active open").find('.sub-menus').hide();
				
				$parent.addClass("active");
				if(!!$(this).next('.sub-menus').size()){
					if($parent.hasClass("open")){
						$parent.removeClass("open").find('.sub-menus').hide();
					}else{
						$parent.addClass("open").find('.sub-menus').show();	
					}
					
					
				}
			});
			
			// 三级菜单点击
			$('.sub-menus li').click(function(e) {
		        $(".sub-menus li.active").removeClass("active")
				$(this).addClass("active");
		    });
			
			$('.title').click(function(){
				var $ul = $(this).next('ul');
				$('dd').find('.menuson').slideUp();
				if($ul.is(':visible')){
					$(this).next('.menuson').slideUp();
				}else{
					$(this).next('.menuson').slideDown();
				}
			});
		})	
	</script>
</head>
<%
	
%>
<body style="background:#fff3e1;">
<%
	AdminInfo ai = new AdminInfo();
	ai = (AdminInfo)session.getAttribute("USER_LOGIN_INFO");
	String admin_Level = ai.getAdmin_Level();
%>
	<div class="lefttop"><span></span>请选择您的操作</div>
    
    <dl class="leftmenu">
        
	    <dd>
		    <div class="title">
		   		<span><img src="<%=ctxPath%>/static/images/leftico01.png" /></span>信息管理
		    </div>
	    	<ul class="menuson">
		        <li>
		            <div class="header">
			            <cite></cite>
			            <a>商品管理</a>
			            <i></i>
		            </div>
		            <ul class="sub-menus">
	        <%
	        	if(admin_Level.equals("老板") || admin_Level.equals("管理员")){
	        %>
			            <li><a href="add_good.jsp" target="rightFrame">新商品添加</a></li>
			            <li><a href="que_goods.jsp" target="rightFrame">查看商品信息</a></li>
		    <%} %> 
			            <li><a href="Cashier.jsp" target="rightFrame">收银系统</a></li>
		            </ul>
		        </li>
		        <li>
		            <div class="header">
			            <cite></cite>
			            <a>会员管理</a>
			            <i></i>
		            </div>                
		            <ul class="sub-menus">
			            <li><a href="user_add.jsp" target="rightFrame">会员注册</a></li>
			            <li><a href="user_que.jsp" target="rightFrame">查看会员信息</a></li>
			            <li><a href="user_Recharge.jsp" target="rightFrame">会员充值</a></li>
		            </ul>
		        </li>
		    <%
	        	if(admin_Level.equals("老板") || admin_Level.equals("管理员")){
	        %>  
		        <li>
		            <div class="header">
			            <cite></cite>
			            <a>员工管理</a>
			            <i></i>
		            </div>                
		            <ul class="sub-menus">
			            <li><a href="add_admin.jsp" target="rightFrame">添加员工</a></li>
			            <li><a href="que_admins.jsp" target="rightFrame">查看员工信息</a></li>
		            </ul>
		        </li>
		    <%} %>
	        </ul>    
	    </dd>
 		<%
        	if(admin_Level.equals("老板") || admin_Level.equals("管理员")){
        %>
	    <dd>
		    <div class="title">
		    	<span><img src="<%=ctxPath%>/static/images/leftico01.png" /></span>财务管理
		    </div>
		    <ul class="menuson">
		        
		        <li>
		            <div class="header">
			            <cite></cite>
			            <a href="info_Pur.jsp" target="rightFrame">进货详情</a>
			            <i></i>
		            </div>                
		        </li>
		        
		        <li>
		            <div class="header">
			            <cite></cite>
			            <a href="info_Pay.jsp" target="rightFrame">出售详情</a>
			            <i></i>
		            </div>                
		        </li>
		        
		        <li>
		            <div class="header">
			            <cite></cite>
			            <a href="Profit.jsp" target="rightFrame">利润详情</a>
			            <i></i>
		            </div>                
		        </li>
	       	</ul>     
   		</dd> 
  		<%} %>
  		<dd>
	  		<div class="title">
		   		<span><img src="<%=ctxPath%>/static/images/leftico01.png" /></span>账户设置
		    </div>
		    <ul class="menuson">
		        <li>
		            <div class="header">
			            <cite></cite>
			            <a>我的账户信息</a>
			            <i></i>
		            </div>                
		            <ul class="sub-menus">
			            <li><a href="admin_update_info.jsp" target="rightFrame">信息修改</a></li>
			            <li><a href="admin_update_pw.jsp" target="rightFrame">密码修改</a></li>
		            </ul>
		        </li> 
		    </ul>  
		</dd>  
    </dl>  
</body>
</html>