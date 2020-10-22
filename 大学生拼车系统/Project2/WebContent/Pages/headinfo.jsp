<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.Map" import = "java.util.List"%>
<%
		Map userinfo =(Map)session.getAttribute("userinfo");//out.print(userinfo);
		Map admininfo =(Map)session.getAttribute("admininfo");
		String role = (String)session.getAttribute("role");
		String userid=null,username=null,url=null;
 		if(role!=null){
	 		if(role.equals("common")){
	 			    userid=(String)userinfo.get("userid");
	 			    session.setAttribute("userid",userid);
		 			username=(String)userinfo.get("username");
					url="userPage.jsp";
	 		}else if(role.equals("admin")){
	 			userid=(String)admininfo.get("userid");
	 			session.setAttribute("userid",userid);
	 			username=(String)admininfo.get("username");
				url="adminPage.jsp";
	 		}
 		}
	 %>