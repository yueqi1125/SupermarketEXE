<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<body style="background:#fff3e1;">
	<div class="lefttop"><span></span>请选择您的操作</div>
    
    <dl class="leftmenu">
        
	    <dd>
		    <div class="title">
		   		<span><img src="<%=ctxPath%>/static/images/leftico01.png" /></span>商品选购
		    </div>
	    	<ul class="menuson">
	        
		        <li>
		            <div class="header">
			            <cite></cite>
			            <a href="index.html" target="rightFrame">商品列表</a>
			            <i></i>
		            </div>
		        </li>
		        
		        <li>
		            <div class="header">
			            <cite></cite>
			            <a href="right.html" target="rightFrame">我的购物车</a>
			            <i></i>
		            </div>                
		            <ul class="sub-menus">
			            <li><a href="javascript:;">未购买的商品</a></li>
			            <li><a href="javascript:;">已购买的商品</a></li>
		            </ul>
		        </li>
	        </ul>    
	    </dd>
    
	    <dd>
		    <div class="title">
		    	<span><img src="<%=ctxPath%>/static/images/leftico01.png" /></span>会员管理
		    </div>
		    <ul class="menuson">
		        <li>
		            <div class="header">
			            <cite></cite>
			            <a href="right.html" target="rightFrame">我的会员信息</a>
			            <i></i>
		            </div>                
		            <ul class="sub-menus">
			            <li><a href="javascript:;">我的积分信息</a></li>
			            <li><a href="javascript:;">账户充值</a></li>
			            <li><a href="javascript:;">会员晋升规则</a></li>
		            </ul>
		        </li>
	       	</ul>     
   		</dd> 
  
	    <dd><div class="title"><span><img src="<%=ctxPath%>/static/images/leftico03.png" /></span>用户设置</div>
		    <ul class="menuson">
		        <li><cite></cite><a href="#">我的账户信息</a><i></i></li>
		        <li><cite></cite><a href="#">信息修改</a><i></i></li>
		    </ul>    
	    </dd>     
    </dl>  
</body>
</html>
