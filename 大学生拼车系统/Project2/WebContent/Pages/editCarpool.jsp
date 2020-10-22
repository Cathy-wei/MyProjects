<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    <%@ include file="headinfo.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改拼车信息</title>
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

				</li>
	     	</ul>
	     </div>	
</div>
<jsp:useBean id="Carpool" class="objects.Carpoolinfo"></jsp:useBean>
				 <div class="col-md-6 mx-auto">
					 <div class="heading">
						<h5>修改拼车信息</h5>
					</div>
			<%
				if(userinfo!=null){
					String carid = request.getParameter("id");
					Carpool.setCarid(carid);
					Map c = Carpool.getCarpool();
					if(c!=null){
			%>
						<form action="editCarpool.do" method="post" name="form1" class="box" onSubmit='return check()'>
							<div class="row">
					        <div class="col-sm-6">
					          <div class="form-group">
					            <label>发起时间</label>
					            <input type="text" readonly="readonly" name="sendtime" value="<%=c.get("sendtime")%>">
								<input type="hidden" name="carid" value="<%=c.get("carid")%>" >
					          </div>
					        </div>
					        <div class="col-sm-6">
					          <div class="form-group">
					            <label>出发时间</label>
					            <input type="text" name="departuretime" value="<%=c.get("departuretime") %>">
					          </div>
					        </div>
							<div class="col-sm-6">
							  <div class="form-group">
								<label>出发地点</label>
								<input type="text" name="departureplace" value="<%=c.get("departureplace") %>">
							  </div>
							</div>
					        <div class="col-sm-6">
					          <div class="form-group">
					            <label>到达地点</label>
					            <input type="text" name="destination" value="<%=c.get("destination") %>">
					          </div>
					        </div>
					         <div class="col-sm-12">
					          <div class="form-group">
					            <label>目标人数</label>
					            <input type="text" name="targetnum" value="<%=c.get("targetnum") %>">
					          </div>
					        </div>
					        <div class="col-sm-12">
					          <div class="form-group">
					            <label>当前人数</label>
					            <input type="text" name="currentnum" value="<%=c.get("currentnum") %>">
					          </div>
					        </div>
					        <div class="col-sm-12 text-center">
					             <button type="submit" class="waves-effect btn-large btn-large-white px-4 ">修改</button>
					        </div>
					      </div>
			<%} 
				}
			%>				 
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