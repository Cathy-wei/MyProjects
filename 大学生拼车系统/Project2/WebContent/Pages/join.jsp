<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="java.util.List,java.util.ArrayList"%>
     <jsp:useBean id="Carpool" class="objects.Carpoolinfo"></jsp:useBean>
     <jsp:useBean id="email" class="connect.Email"></jsp:useBean>
<%

	String targetnum=request.getParameter("t");
	String currentnum=request.getParameter("c");
	int t = Integer.parseInt(targetnum);
	int c = Integer.parseInt(currentnum);
	List joins = null;//session.getAttribute("joins");
	String msg="加入失败";
	if(t==c){
		msg="人数已满";
	}else{
		String carid=request.getParameter("carid");
		String userid=(String)session.getAttribute("userid");
		Carpool.setCarid(carid);Carpool.setUserid(userid);
		List lucp=Carpool.getUserState();
		if(!lucp.isEmpty()){//如果之前加入过这个拼车
			for(Object uc:lucp){
				Map ucp=(Map)uc;
				if(ucp!=null ){
					String s2=(String)ucp.get("state2");
					if(s2.equals("拼车失败")){//如果之前加入的拼车是拼车失败
						Carpool.setState1("我加入的"); 
						if(t==(c+1)){
							Carpool.setState2("拼车成功");
							int result1 =Carpool.addUsercarpool();
							int result2=Carpool.updateCurrentadd();//人数加一
// 							String id=request.getParameter("userid");//发起者id
// 							Carpool.setUserid(id);
							List list=Carpool.getUsercarpool();//获取当前拼车所有参与者
							if(!list.isEmpty()){
								for(Object o:list){
									Map ll=(Map)o;
									String st2=(String)ll.get("state2");
									String uid=(String)ll.get("userid");
									if(st2.equals("拼车中")){
										Carpool.setUserid(uid);
										int r2=Carpool.updateState2();//把当前所有参与拼车的用户状态改为拼车成功
										if(result1==1 && r2==1 && result2==1){
											msg="加入成功1"+result1+r2+result2;
										}
									}
									
								}
							}
						}else{
							Carpool.setState2("拼车中");
							int result2=Carpool.updateCurrentadd();//人数加一
							int result1 =Carpool.addUsercarpool();
							if(result1==1 && result2==1){
								msg="加入成功";
							}
						}
					}else{
						msg="您已加入";
					}
				}
			}
		}else{
			Carpool.setState1("我加入的"); 
			if(t==(c+1)){
				Carpool.setState2("拼车成功");
				int result1 =Carpool.addUsercarpool();
				int result2=Carpool.updateCurrentadd();//人数加一
				
// 				String id=request.getParameter("userid");//发起人id
// 				Carpool.setUserid(id);
				List list=Carpool.getUsercarpool();//获取当前拼车所有参与者
				if(!list.isEmpty()){
					for(Object o:list){
						Map ll=(Map)o;
						String s2=(String)ll.get("state2");
						String uid=(String)ll.get("userid");
						if(s2.equals("拼车中")){
							Carpool.setUserid(uid);
							int r2=Carpool.updateState2();//把当前所有参与拼车的用户状态改为拼车成功
							if(result1==1 && r2==1 && result2==1){
								msg="加入成功2";
							}
						}
						
					}
				}
				
			
					//发邮件
// 					joins = Carpool.getAllsuccess();
// 					if(joins!=null){
// 						for(Object j:joins){
// 							Map jj=(Map)j;
// 							String receiveMail=(String)jj.get("email");
// 						 	String receiveName=(String)jj.get("username");
// 							email.setReceiveMail(receiveMail);//收件人邮箱
// 						 	email.setReceiveName(receiveName);//收件人姓名
// 						 	email.send();//发送
// 						 	out.print("消息已发送，请查收！");
// 						}
// 					}
					
				
			}else{
				Carpool.setState2("拼车中");
				int result1 =Carpool.addUsercarpool();
				int result2=Carpool.updateCurrentadd();//人数加一
				if(result1==1&&result2==1){
					msg="加入成功，2秒后返回";
				}
			}
			
		}
		
	}
	//发邮件
	joins = Carpool.getAllsuccess();//获取当前拼车所有“拼车成功”的参与者
	if(joins!=null){
		for(Object j:joins){
			Map jj=(Map)j;
			String receiveMail=(String)jj.get("email");
		 	String receiveName=(String)jj.get("username");
			email.setReceiveMail(receiveMail);//收件人邮箱
		 	email.setReceiveName(receiveName);//收件人姓名
		 	email.send();//发送
		}
		out.print("消息已发送，请查收！");
	}
	
%>
<script type="text/javascript">alert('<%=msg%>');</script>
<% response.setHeader("Refresh", "2;url=userJoin.jsp"); %>
 