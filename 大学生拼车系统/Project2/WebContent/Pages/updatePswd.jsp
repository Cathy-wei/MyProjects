<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="objects.User_pswd" %>
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
	     		<li><a href="userPage.jsp">基本资料</a></li>
	     		<li><a href="updateUser.jsp">修改资料</a></li>
	     		<li>拼车记录
	     			<ul>
	     				<li><a href="userSend.jsp">我发起的</a></li>
	     				<li><a href="userJoin.jsp">我加入的</a></li>
	     			</ul>
	     		</li>
	     	</ul>
	     </div>	
</div>
<%String id=(String)session.getAttribute("userid"); %>
<%-- <jsp:useBean id="pswd" class="objects.User_pswd"></jsp:useBean> --%>
<%-- <jsp:setProperty property="<%=id %>" name="userid"/> --%>
					 <div class="col-md-6 mx-auto">
						 <div class="heading">
							<h5>修改密码</h5>
						</div>
			<%
					User_pswd pswd = new User_pswd();
					Map u = (Map)pswd.getUser(id);
					if(u!=null){
			%>
						<form action="updatePswd.do" method="post" name="form1" class="box" onSubmit='return check()'>
						        <div class="col-sm-12">
						          <div class="form-group">
						            <label>账号</label>
						            <input type="hidden" name="userid" value="<%=u.get("userid")%>" >
									<input type="text" readonly="readonly" value="<%=u.get("account") %>">
						          </div>
						        </div>
						        <div class="col-sm-12">
						          <div class="form-group">
						            <label>当前密码</label>
						            <input type="hidden" name="password" value="<%=u.get("password")%>">
						            <input type="password" name="password1">
						          </div>
						        </div>
								<div class="col-sm-12">
								  <div class="form-group">
									<label>新密码</label>
									<input type="password" name="password2">
								  </div>
								</div>
						        <div class="col-sm-12 text-center">
						             <button type="submit" class="waves-effect btn-large btn-large-white px-4 ">修改</button>
						        </div>
				   	 </form>		 
		 <%} %>					
					 </div>
<script type="text/javascript">
function check(){
	var mymessage=confirm("确定修改吗？");
	if(mymessage==true){
		if(form1.password1.value==form1.password2.value){
			alert("两次密码不能一致！");
			return false;
		}
		return true;
	}
	else
		return false;

	}
</script>
</body>
</html>