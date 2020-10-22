<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="Carpool" class="objects.Carpoolinfo"></jsp:useBean>
<%
	String carid=request.getParameter("carid");
	Carpool.setCarid(carid);
	Carpool.setState2("拼车失败");//Carpool.setUserid(request.getParameter("uid"));
	int result =Carpool.updateState();
	String msg="取消失败";
	if(result==1){
		msg="取消成功";
	}

%>
	<script type="text/javascript">alert('<%=msg%>');</script>
	<%response.setHeader("Refresh", "1;url=userSend.jsp"); %>
 