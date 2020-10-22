<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
    <jsp:useBean id="Carpool" class="objects.Carpoolinfo"></jsp:useBean>
<%
	String carid=request.getParameter("carid");
	String userid=request.getParameter("userid");
	Carpool.setCarid(carid);
// 	List c=Carpool.getAllsuccess();
// 	if(!c.isEmpty()){
// 		for(Object o:c){
// 			Map cc = (Map)o;
// 			String state2 = (String)cc.get("state2");
// 			//String cid = (String)cc.get("carid");
// 			String uid = (String)cc.get("useid");
// 			if(state2.equals("拼车成功")){
// 				Carpool.setState2("拼车中");
// 				Carpool.setCarid(carid);Carpool.setUserid(uid);
// 				Carpool.updateState2();
// 			}
			
// 		}
// 	}
	Carpool.setUserid(userid);
	Carpool.setState2("拼车失败");
	int result1 =Carpool.updateState2();
	int result2=Carpool.updateCurrentsub();//人数减一
	String msg="退出失败"+result1+","+result2;//out.print(result1+","+result2);
	if(result1!=0 && result2!=0){
		msg="退出成功";
	}

%>
	<script type="text/javascript">alert('<%=msg%>');</script>
	<%response.setHeader("Refresh", "1;url=userJoin.jsp"); %>
 