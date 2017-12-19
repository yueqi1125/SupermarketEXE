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
		function checkAddadmin(){
			var admin_Name = document.getElementsByName("admin_Name")[0].value;
			var admin_Age = document.getElementsByName("admin_Age")[0].value;
			var admin_Level = document.getElementsByName("admin_Level")[0].value;
			if(admin_Name == ""){
				alert("员工姓名不能为空！");
				return false;
			}
			if(admin_Age == ""){
				alert("员工年龄不能为空！");
				return false;
			}
			if(admin_Level == "--请设置--"){
				alert("请设置员工岗位！");
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
		    <li><a href="#">员工管理</a></li>
		    <li><a href="#">员工注册</a></li>
	    </ul>
    </div>
    
    <div class="formbody">
	    <div class="formtitle"><span>员工注册</span></div>
	    <form action="doadd_admin.jsp" class="forminfo" onsubmit="return checkAddadmin()">
		    <li><label>员工姓名</label><input name="admin_Name" type="text" class="dfinput" placeholder="请输入员工姓名"/></li>
		    <li><label>员工性别</label>
		    	<cite>
		    		<input name="admin_Gender" type="radio" value="男" checked="checked"/>男&nbsp;&nbsp;&nbsp;&nbsp;
		    		<input name="admin_Gender" type="radio" value="女"/>女
		    	</cite>
		    </li>
			<li><label>员工年龄</label><input name="admin_Age" type="text" class="dfinput" placeholder="请输入员工年龄"/></li>
			<li><label>员工权限</label>
		    	<select name="admin_Level" class="dfinput">
					<option>--请设置--</option>
					<option>收银员</option>
					<option>管理员</option>
				</select>
			</li>
		    <li><%if(msg != null){ %> <i class="ico-error"></i><span class="errorword"><%=msg %> </span><% } %></li>
		    <li><label>&nbsp;</label><input type="submit" class="btn" value="确认添加"/></li>
	    </form>
    </div>
</body>

</html>