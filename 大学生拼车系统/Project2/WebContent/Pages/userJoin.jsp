<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ include file="headinfo.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>我加入的拼车</title>
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
	     		<li><a href="updatePswd.jsp">修改密码</a>
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
					 <div class="col-md-12 mx-auto">
						 <div class="heading">
							<h5>我加入的拼车</h5>
						 </div>
						 <form method="get" action="" class="box">
								 <div class="table-responsive">
									<table class="table">
									  <thead>
										<tr>
										  <th>拼车号</th>
										  <th>发起人</th>
										  <th>发起时间</th>
										  <th>出发时间</th>
										  <th>出发地点</th>
										  <th>到达地点</th>
										  <th>目标人数</th>
										  <th>当前人数</th>
										  <th>当前状态</th>
										  <th style="padding-right:50px;padding-left:50px;">操&nbsp;&nbsp;作</th>
										</tr>
									  </thead>
									  <tbody class="scroll">
					<%
					  if(userinfo!=null){
						List carpool = Carpool.getCarpools(userid,"我加入的");
// 						out.print(carpool.isEmpty());
						if(!carpool.isEmpty()){
							for(Object cc:carpool){
								Map c = (Map)cc;
								String carid=(String)c.get("carid");
								String state2=(String)c.get("state2");
						%>
											<tr>
											  <td><%=carid %></td>
											  <td><%=c.get("username") %>  </td>
											  <td><%=c.get("sendtime") %></td>
											  <td><%=c.get("departuretime") %></td>
											  <td><%=c.get("departureplace") %></td>
											  <td><%=c.get("destination") %></td>
											  <td><%=c.get("targetnum") %></td>
											  <td><%=c.get("currentnum") %></td>
											  <td><%=c.get("state2") %></td>
											  <td  style="width:360px;">
						<%if(!state2.equals("拼车失败")){ %>
											  <a href="quit.jsp?carid=<%=carid %>&userid=<%=userid %>"  onclick="return check()" class="btn-white small">退出拼车</a>
						<%}else{
							out.print("不可操作");
						}%>
											  </td>
											</tr>
						<%}
						  }else{%>
						   <tr><td></td><td></td><td></td><td></td><td>暂无数据</td><td></td><td></td><td></td><td></td></tr>	 
						<% }
					  } %>				 
									  </tbody>
									</table>
								 </div>
						   </form>
					 </div>
					 <script type="text/javascript">
function check(){
	var mymessage=confirm("确定退出拼车吗？");
	if(mymessage==true)
			return true;
	else
		return false;
}
</script>
	
</body>
</html>