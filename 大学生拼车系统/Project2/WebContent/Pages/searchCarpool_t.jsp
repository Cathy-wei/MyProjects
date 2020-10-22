<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    <%@ include file="headinfo.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>查询拼车</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/materialize.min.css">
<link rel="stylesheet" href="css/login.css">
</head>
<body>
<div class="head">
	  <h4><a href="index.jsp">大学生拼车系统</a></h4>
	     <div class="d0">
	     	<ul class="d01">
	    		<li><a href="searchCarpool_p.jsp">按地点查询</a>
	     		<li><a href="addCarpool.jsp">发起拼车</a></li>
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
<div class="col-md-12 mx-auto">
	<div class="heading">
	  <h5>按时间查询</h5>
	</div>
	<form action="searcht.do" method="post"  name="form1"id="form1"  class="col-md-6 mx-auto">
	  		<div class="row tm-flex-lr" > 
			   从 <div class="col-sm-4">
			        <input  name="t1" type="datetime-local" class="validate">
			    </div>
			    到
			     <div class="col-sm-4">
			        <input name="t2" type="datetime-local" class="validate">
			    </div>
		        <div class="col-sm-2"> <a href="#" onclick="check()" class="btn-white small">查&nbsp;询</a>
		        </div>
	        </div>
	</form>
	<div class="box">
	  
	
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
							  <th>操作</th>
							</tr>
						  </thead>
						  <tbody class="scroll">
		<%
			List carpool = (List)session.getAttribute("carpool_t");
			if(carpool!=null ){
		//		out.print(carpool);
				for(Object cc:carpool){
					Map c = (Map)cc;
					String carid=(String)c.get("carid");
					String uid=(String)c.get("userid");
					String t=(String)c.get("targetnum");
					String cu=(String)c.get("currentnum");
					int targetnum = Integer.parseInt(t);
					int currentnum = Integer.parseInt(cu);
  		%> 
							<tr>
							  <td><%=c.get("carid") %></td>
							  <td><%=c.get("username") %>  </td>
							  <td><%=c.get("sendtime") %></td>
							  <td><%=c.get("departuretime") %></td>
							  <td><%=c.get("departureplace") %></td>
							  <td><%=c.get("destination") %></td>
							  <td><%=c.get("targetnum") %></td>
							  <td><%=c.get("currentnum") %></td>
							  <td><%=c.get("state2") %></td>
							  <td><a href="join.jsp?carid=<%=carid %>&userid=<%=uid %>&t=<%=t %>&c=<%=cu %>"  onclick="return check1()" class="btn-white small">加入拼车</a></td>
							</tr>
		<%		}
		   }else{%>
		   		 <tr><td></td><td></td><td></td><td></td><td>暂无数据</td><td></td><td></td><td></td><td></td></tr>
		<%	}
		%>
						  </tbody>
						</table>
	</div>
	</div>
</div>
<script type="text/javascript">
function check(){
	if(form1.t1.value=="" || form1.t2.value==""){
		alert("时间不能为空！");
		return false;
	}
	document.form1.submit();
 	return true;
	 
}
function check1(){
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