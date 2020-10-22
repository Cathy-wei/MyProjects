<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
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
					 <div class="col-md-6 mx-auto">
						 <div class="heading">
							<h5>修改个人资料</h5>
						</div>
			<%
				if(userinfo!=null){
			%>
						<form action="updateUser.do" method="post" name="form1" class="box" onSubmit='return check()'>
							<div class="row">
					        <div class="col-sm-6">
					          <div class="form-group">
					            <label>姓名</label>
					            <input type="text" name="username" value="<%=userinfo.get("username") %>">
								<input type="hidden" name="userid" value="<%=userinfo.get("userid")%>" >
					          </div>
					        </div>
					        <div class="col-sm-6">
					          <div class="form-group">
					            <label>电话</label>
					            <input type="tel" name="tel" value="<%=userinfo.get("tel") %>">
					          </div>
					        </div>
							<div class="col-sm-6">
							  <div class="form-group">
								<label>邮箱</label>
								<input type="email" name="email" value="<%=userinfo.get("email") %>">
							  </div>
							</div>
					        <div class="col-sm-6">
					          <div class="form-group">
					            <label>微信</label>
					            <input type="text" name="wechat" value="<%=userinfo.get("wechat") %>">
					          </div>
					        </div>
					         <div class="col-sm-12">
					          <div class="form-group">
					            <label>学校</label>
					            <input type="text" name="school" value="<%=userinfo.get("school") %>">
					          </div>
					        </div>
					        <div class="col-sm-12 text-center">
					             <button type="submit" class="waves-effect btn-large btn-large-white px-4 ">修改</button>
					        </div>
					      </div>
			<%} %>				 
						</form>
					 </div>
<script type="text/javascript">
function check(){
	var mymessage=confirm("确定修改吗？");
	if(mymessage==true)
		return true;
	else
		return false;

	}
</script>
</body>
</html>