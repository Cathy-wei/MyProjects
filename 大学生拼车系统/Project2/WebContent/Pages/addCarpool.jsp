<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="headinfo.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>发起拼车</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/materialize.min.css">
<link rel="stylesheet" href="css/login.css">
</head>
<body>
<div class="head">
	  <h4><a href="index.jsp">大学生拼车系统</a></h4>
	     <div class="d0">
	     	<ul class="d01">
	     		<li>查询信息
	     			<ul>
	     				<li><a href="searchCarpool_t.jsp">按时间查询</a></li>
	     				<li><a href="searchCarpool_p.jsp">按地点查询</a></li>
	     			</ul>
	     		</li>	
	     	<%if(username!=null){ %>
	     		<li><a class="small">欢迎，<%=username %></a>
	     			<ul>
	     				<li><a href="<%=url%>">个人主页</a></li>
	     				<li><a href="login.jsp">退出</a></li>
	     			</ul>
	     		</li>
	     	<%}else{%>
	     		<li><a href="login.jsp">请登录</a></li>
	     		<%} %>
	     	</ul>
	     </div>	
</div>
<div class="col-md-8 mx-auto">
			<div class="heading">
			  <h4>填写拼车信息</h4>
			</div>
			<div class="box">
		    <form action="addCarpool.do" method="post" onSubmit='return check()' name="form1" >
		      <div class="row">
		        <div class="col-sm-12">
		          <div class="form-group">
		            <label >出发时间</label>
					<input name="departuretime"  type="datetime-local"  class="form-control"/>
		          </div>
		        </div>
		        <div class="col-sm-6">
		          <div class="form-group">
		            <label>出发地点</label>
		            <input name="departureplace" type="text" class="form-control">
		          </div>
		        </div>
				<div class="col-sm-6">
				  <div class="form-group">
					<label>到达地点</label>
					<input name ="destination" type="text" class="form-control">
				  </div>
				</div>
		        <div class="col-sm-6">
		          <div class="form-group">
		            <label>目标人数</label>
		            <input name ="targetnum" type="text" class="form-control">
		          </div>
		        </div>
		         <div class="col-sm-6">
		          <div class="form-group">
		            <label>当前人数</label>
		            <input name ="currentnum" type="text" class="form-control">
		          </div>
		        </div>
		        <div class="col-sm-12 text-center">
		             <button type="submit" class="waves-effect btn-large btn-large-white px-4 ">提交</button>
		        </div>
		      </div>
		    </form>
			</div>
		</div>	
<script type="text/javascript">
function check(){
	if(form1.departuretime.value==""){
		alert("出发时间地点不能为空！");
		return false;
	}
	if(form1.departureplace.value==""){
		alet("出发地点不能为空！");
		return false;
	}	
	if(form1.destination.value==""){
		alet("到达地点不能为空！");
		return false;
	}
		return true;
	}
</script>		
		
</body>
</html>