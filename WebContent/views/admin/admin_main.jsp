<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>超市系统管理</title>
</head>
<%
if(session.getAttribute("USER_LOGIN_INFO") == null){
	response.sendRedirect("../login/admin_login.jsp");
}
%>
<frameset rows="88,*,31" cols="*" frameborder="no" border="0" framespacing="0">
	<frame src="admin_top.jsp" name="topFrame" scrolling="no" noresize="noresize" id="topFrame" title="topFrame" />
	<frameset cols="187,*" frameborder="no" border="0" framespacing="0">
		<frame src="admin_menu.jsp" name="leftFrame" scrolling="no" noresize="noresize" id="leftFrame" title="leftFrame" />
		<frame src="admin_index.jsp" name="rightFrame" id="rightFrame" title="rightFrame" />
	</frameset>
	<frame src="<%=ctxPath%>/views/footer.jsp" name="bottomFrame" scrolling="no" noresize="noresize" id="bottomFrame" title="bottomFrame" />
</frameset>
<noframes><body>
</body></noframes>
</html>