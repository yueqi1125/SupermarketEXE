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
	<script type="text/javascript">
		function checkInput(){
			var good_Name = document.getElementsByName("good_Name")[0].value;
			var good_Kind = document.getElementsByName("good_Kind")[0].value;
			var good_Pricein = document.getElementsByName("good_Pricein")[0].value;
			var good_Priceout = document.getElementsByName("good_Priceout")[0].value;
			var good_No = document.getElementsByName("good_No")[0].value;
			if(good_Name == ""){
				alert("商品名称不能为空！");
				return false;
			}
			if(good_Kind == "--请选择--"){
				alert("请选择商品种类！");
				return false;
			}
			if(good_Pricein == ""){
				alert("进货价格不能为空！");
				return false;
			}
			if(good_Priceout == ""){
				alert("用户ID不能为空！");
				return false;
			}
			if(good_No == ""){
				alert("商品数量不能为空！");
				return false;
			}
			return true;
		}
	</script>
</head>

<body>
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
		    <li><a href="#">商品入库</a></li>
	    </ul>
    </div>
    
    <div class="formbody">
	    <div class="formtitle"><span>商品入库</span></div>
	    <form action="doadd_good.jsp" class="forminfo" onsubmit="return checkInput()">
		    <li><label>商品名称</label><input name="good_Name" type="text" class="dfinput" placeholder="请输入商品名称"/></li>
		    <li><label>商品种类</label>
		    	<select name="good_Kind" class="dfinput">
					<option selected="true">--请选择--</option>
					<option>电器</option>
					<option>生活用品</option>
					<option>工具</option>
					<option>食品</option>
					<option>瓜果蔬菜</option>
				</select>
			</li>
			<li><label>进货价格</label><input name="good_Pricein" type="text" class="dfinput" placeholder="请输入商品进货价格"/></li>
		  	<li><label>出售价格</label><input name="good_Priceout" type="text" class="dfinput" placeholder="请输入商品出售价格"/></li>
		  	<li><label>添加数量</label><input name="good_No" type="text" class="dfinput" placeholder="请输入商品的数量"/></li>
		    <li><label>是否确定上架</label>
		    	<cite>
		    		<input name="good_Info" type="radio" value="0" checked="checked" />是&nbsp;&nbsp;&nbsp;&nbsp;
		    		<input name="good_Info" type="radio" value="1" />否
		    	</cite>
		    </li>
		    <li><%if(msg != null){ %> <i class="ico-error"></i><span class="errorword"><%=msg %> </span><% } %></li>
		    <li><label>&nbsp;</label><input type="submit" class="btn" value="确认添加"/></li>
	    </form>
    </div>
</body>

</html>