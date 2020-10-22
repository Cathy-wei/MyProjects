<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" %>

<jsp:useBean id="email" class="connect.Email"></jsp:useBean>
 <%
 	
//  	ArrayList joins =(ArrayList) session.getAttribute("joins");
//  	if(joins.isEmpty()){
//  		ArrayList al = new ArrayList();
//  		al.add(e)
//  		session.setAttribute("joins", al);
//  	}
 	String receiveMail="2640273213@qq.com";
 	String receiveName="韦仲茜";
	email.setReceiveMail(receiveMail);//收件人邮箱
 	email.setReceiveName(receiveName);//收件人姓名
 	email.send();//发送
 	out.print("消息已发送，请查收！");
 %>
