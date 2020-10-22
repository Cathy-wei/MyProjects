<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Map"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户个人页面</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/materialize.min.css">
<link rel="stylesheet" href="css/login.css">
</head>
<body>
<jsp:useBean id="user" class="objects.Userinfo"></jsp:useBean>
<div class="head">
	  <h4><a href="index.jsp">大学生拼车系统</a></h4>
<!-- 	     <div class="d0"> -->
<!-- 	     	<ul class="d01"> -->
<!-- 	     		<li><a href="index.jsp">返回</a></li> -->
<!-- 	     	</ul> -->
<!-- 	     </div>	 -->
</div>
					 <div class="col-md-4 mx-auto">
						 <div class="heading">
							<h5>发起人信息</h5>
						</div>
						<table class="box text-center">
						  <tbody>
		<%
				String userid=request.getParameter("userid");
				user.setUserid(userid);
				Map userinfo = user.getUserInfo();
				if(userinfo!=null){
		%>
							<tr>
							  <td class="th">姓名</td>
							  <td><%=userinfo.get("username") %>  </td>
							</tr>
							<tr>
							  <td class="th">电话</td>
							  <td><%=userinfo.get("tel") %></td>
							</tr>
							<tr>
							  <td class="th">邮箱</td>
							  <td><%=userinfo.get("email") %></td>
							</tr>
							<tr>
							   <td class="th">微信</td>
							   <td><%=userinfo.get("wechat") %></td>
							</tr>
							<tr>
							  <td class="th">学校</td>
							  <td><%=userinfo.get("school") %></td>
							</tr>
							<tr>
							  <td colspan="2" class="text-center"><a href="index.jsp" class="btn-white small">返回</a></td>
							</tr>
		<%} %>				 
						  </tbody>
						</table>
					 </div>
</body>
</html>