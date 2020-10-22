 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/materialize.min.css">
<link rel="stylesheet" href="css/login.css">
</head>
<body>
	  <h4 align="center">欢迎使用！大学生拼车系统</h4><hr>
 <div class="container">
       <div class="col-md-6 mx-auto">
			<div class="heading">
				<h5>登录</h5>
			</div>
			<form action="login.do" method="post" onSubmit='return check()' name="form1" class="tm-bg-black p-5 h-100">
			    <div class="input-field">
			        <input placeholder="账号" name="account" type="text" class="validate">
			    </div>
			    <div class="input-field">
                     <input placeholder="密码" name="password" type="password" class="validate">
                </div>
				<div class="mb-5">
				    <label class="mr-4">
				        <input class="with-gap" name="role" type="radio" value="common" checked />
				        <span>用户</span>
				    </label>
				    <label class="mr-4">
				        <input class="with-gap" name="role" type="radio" value="admin" />
				        <span>管理员</span>
				    </label>
				</div>
			    <div class="tm-flex-lr">
			        <span><a href="#" class="small">忘记密码?</a>&nbsp;&nbsp;<a href="register.jsp" class="small">注册?</a></span>
			        <input type="submit" class="waves-effect btn-large btn-large-white" value="登录" >
			    </div>
			</form>
      </div>
  </div>          
	<script type="text/javascript">
	function check(){
		if(form1.account.value=="" ||form1.password.value==""){
			alert("账号或密码不能为空！");
			return false;
		}else{
			return true;
		}
	}
	
	</script>
	<script src="js/jquery-3.2.1.slim.min.js"></script>
    <script src="js/materialize.min.js"></script>
    <script>
        $(document).ready(function () {
            $('select').formSelect();
        });
    </script>
</body>
</html>