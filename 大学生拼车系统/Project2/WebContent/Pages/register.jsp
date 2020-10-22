 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注册</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/materialize.min.css">
<link rel="stylesheet" href="css/login.css">
</head>
<body>
	  <h4 align="center"><a href="index.jsp">大学生拼车系统</a></h4><hr>
 <div class="container">
       <div class="col-md-6 mx-auto">
			<div class="heading">
				<h5>注册用户</h5>
			</div>
			<form action="register.do" method="post" onSubmit='return check()' name="form1" class="tm-bg-black p-5 h-100">
			    <div class="input-field">
			        <input placeholder="学号(必填)" name="account" type="text" class="validate">
			    </div>
			    <div class="input-field">
			        <input placeholder="姓名(必填)" name="username" type="text" class="validate">
			    </div>
			    <div class="input-field">
			        <input placeholder="电话(必填)" name="tel" type="tel" class="validate">
			    </div>
			    <div class="input-field">
			        <input placeholder="邮箱(必填)" name="email" type="email" class="validate">
			    </div>
			    <div class="input-field">
                     <input placeholder="密码(必填)" name="password1" type="password" class="validate">
                </div>
                <div class="input-field">
                     <input placeholder="确认密码(必填)" name="password2" type="password" class="validate">
                </div>
                <div class="input-field">
                     <input placeholder="微信(选填)" name="wechat" type="text" class="validate">
                </div>
                <div class="input-field mb-5">
<!--                      <input placeholder="学校(选填)" name="school" type="text" class="validate"> -->
	                <select name="school">
					    <option value="-">学校(选填)</option>
					    <option value="闽江学院">闽江学院</option>
					    <option value="福州大学">福州大学</option>
					    <option value="江夏学院">江夏学院</option>
					    <option value="福建中医药大学">福建中医药大学</option>
					</select>
                </div>
			    <div class="tm-flex-lr">
			   		 <span class="small" ><a href="login.jsp">已有帐号？</a></span>
			        <input type="submit" class="waves-effect btn-large btn-large-white" value="注册" >
			    </div>
			</form>
      </div>
  </div>          
 
	<script type="text/javascript">
	function check(){
		if(form1.account.value==""){
			alert("账号不能为空！");
			return false;
		}else if(form1.username.value==""){
			alert("姓名不能为空！");
			return false;
		}else if(form1.tel.value==""){
			alert("电话不能为空！");
			return false;
		}else if(form1.email.value==""){
			alert("邮箱不能为空！");
			return false;
		}else if(form1.password1.value==""){
			alert("密码不能为空！");
			return false;
		}else if(form1.password2.value==""){
			alert("确认密码不能为空！");
			return false;
		}else if(form1.password1.value!=form1.password2.value){
			alert("两次密码不同！");
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