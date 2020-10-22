<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ include file="headinfo.jsp" %>
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

<div class="head">
	  <h4><a href="index.jsp">大学生拼车系统</a></h4>
	     <div class="d0">
	     	<ul class="d01">
	     		<li><a href="updateUser.jsp">修改资料</a></li>
	     		<li><a href="updatePswd.jsp">修改密码</a></li>	     	
	     		<li>拼车记录
	     			<ul>
	     				<li><a href="userSend.jsp">我发起的</a></li>
	     				<li><a href="userJoin.jsp">我加入的</a></li>
	     			</ul>
	     		</li>
	     	</ul>
	     </div>	
</div>
					 <div class="col-md-4 mx-auto">
						 <div class="heading">
							<h5>基本资料</h5>
						</div>
						<table class="box text-center">
						  <tbody>
		<%
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
							  <td colspan="2" class="text-center"><a href="updateUser.jsp" class="btn-white small">修改信息</a></td>
							</tr>
		<%} %>				 
						  </tbody>
						</table>
					 </div>
</body>
</html>