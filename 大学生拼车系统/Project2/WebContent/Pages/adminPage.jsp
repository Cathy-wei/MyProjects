<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.Map"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理员页面</title>
</head>
<body>
<h3>管理员</h3>
<%
	Map admininfo =(Map)session.getAttribute("admininfo");
	if(admininfo!=null)
		out.print(admininfo.get("username"));
	out.print(admininfo.get("tel"));
	out.print(admininfo.get("email"));
	out.print(admininfo.get("wechat"));
%>
</body>
</html>