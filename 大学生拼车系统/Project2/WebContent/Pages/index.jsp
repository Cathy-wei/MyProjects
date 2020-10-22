<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="headinfo.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>主页</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/materialize.min.css">
<link rel="stylesheet" href="css/login.css">
</head>
<body>
<div class="head">
	  <h4><a href="index.jsp">大学生拼车系统</a></h4>
	     <div class="d0">
	     	<ul class="d01">
	     	  <li><a href="http://172.16.217.30:8080/ChatRoom/index.jsp" target="blank">问题反馈</a></li>
	     		<%if(username!=null)
	     			out.print("<li><a href='addCarpool.jsp'>发起拼车</a></li>");
	     		%>
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
<jsp:useBean id="Carpool" class="objects.Carpoolinfo"></jsp:useBean>

	<div class="container">
       <div class="col-md-12 mx-auto">
			<div class="heading">
				<h5>拼车信息</h5>
			</div>
<!-- 			   <form method="get" action="join.do" class="box"> -->
					 <div class="table-responsive box">
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
							  <th>操作</th>
							</tr>
						  </thead>
						  <tbody class="scroll">
		<%
		if(userinfo!=null){
			String str1="我发起的";String str2="拼车中";
			List carpool = Carpool.getAllCarpool(str1,str2);
			if(!carpool.isEmpty()){
				for(Object cc:carpool){
					Map c = (Map)cc;
					String state2 = (String)c.get("state2");
					String carid=(String)c.get("carid");
					String uid=(String)c.get("userid");
					String t=(String)c.get("targetnum");
					String cu=(String)c.get("currentnum");
					int targetnum = Integer.parseInt(t);
					int currentnum = Integer.parseInt(cu);
			%>
								<tr>
								  <td><%=c.get("carid") %></td>
								  <td><a href="user.jsp?userid=<%=uid%>"><%=c.get("username") %></a>  </td>
								  <td><%=c.get("sendtime") %></td>
								  <td><%=c.get("departuretime") %></td>
								  <td><%=c.get("departureplace") %></td>
								  <td><%=c.get("destination") %></td>
								  <td><%=c.get("targetnum") %></td>
								  <td><%=c.get("currentnum") %></td>
								  <td><%=state2 %></td>
								  <td><a href="join.jsp?carid=<%=carid %>&userid=<%=uid %>&t=<%=t %>&c=<%=cu %>"  onclick="return check()" class="btn-white small">加入拼车</a></td>
								</tr>
			<%} 
				}else{
					out.print(" <tr><td></td><td></td><td></td><td></td><td>暂无数据</td><td></td><td></td><td></td><td></td></tr>	");
				}}
		    %>				 
						  </tbody>
						</table>
					 </div>
<!-- 			   </form> -->
		  </div>
      </div>
<!--      <footer class="row tm-mt-big mb-3"> -->
<!--        <div class="col-xl-12 text-center font-weight-light"> -->
<!--             <p class="d-inline-block tm-bg-black white-text py-2 tm-px-5"> -->
<!--                 Copyright &copy; 2019 大学生拼车系统 - Design:  Tooplate / More Templates -->
<!--             </p> -->
<!--         </div> -->
<!--     </footer> -->
<script type="text/javascript">
function check(){
	var table=document.getElementsByTagName('table')[0];
	var target=table.rows[1].cells[6].innerHTML;
	var current=table.rows[1].cells[7].innerHTML+1;
	var mymessage=confirm("确定加入拼车吗？");
	if(mymessage==true){
		if(current==target){
			alert("人数已满！");
			return false;
		}
		else{
			return true;
		}
	}else
		return false;
	 
}
</script>
	
</body>
</html>