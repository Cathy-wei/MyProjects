<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>提示</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/materialize.min.css">
<link rel="stylesheet" href="css/login.css">
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String msg = request.getParameter("message");
	String message =null; 
	if(msg!=null){
		message=msg;
	}
%>
	
	<div class="head">
	  <h4><a href="index.jsp">大学生拼车系统</a></h4>
	</div>
	<div class="col-md-6 mx-auto ">
		<div class="heading">
				<h4>提示</h4>
			</div>
       <div class="box">
			<h4><%=message %></h4>
		</div>
	</div>
		
</body>
</html>