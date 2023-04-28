<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.mail.Transport" %>
<%@ page import="javax.mail.Message" %>
<%@ page import="javax.mail.Address" %>
<%@ page import="javax.mail.internet.InternetAddress" %>
<%@ page import="javax.mail.internet.MimeMessage" %>
<%@ page import="javax.mail.Session" %>
<%@ page import="javax.mail.Authenticator" %>
<%@ page import="java.util.Properties" %>
<%@ page import="util.Gmail" %>
<%@ page import="user.userDAO" %>
<%@ page import="user.userDTO" %>
<%@ page import="util.SHA256" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.ResultSet" %>

<%
	
	String host = "http:///192.168.0.100:8080/PROJECT";
	String from = "zikodin12@gmail.com";
	
	String subject = ""; //제목
	String content = ""; //내용
	String to = null;
	String ID = null;
	String lid = null;
	
	if( request.getParameter("ID") != null){
		ID = request.getParameter("ID");
	}if( request.getParameter("lid") != null){
		lid = request.getParameter("lid");
	}
	if( request.getParameterValues("sid") != null){
		to = (String) request.getParameter("sid");
	}
	if( request.getParameter("noticetitle") != null){
		subject = request.getParameter("noticetitle");
	}
	if( request.getParameter("content") != null){
		content = request.getParameter("content");
	}
	System.out.println(to);
	userDAO proDAO = new userDAO();
	ResultSet rs ;
	int i = 0;
	
	
	try{
		Properties pro = new Properties();
		pro.put("mail.smtp.user", from);
		pro.put("mail.smtp.host", "smtp.gmail.com");
		pro.put("mail.smtp.port", "465");
		pro.put("mail.smtp.starttls.enable", "true");
		pro.put("mail.smtp.auth", "true");
		pro.put("mail.smtp.debug", "true");
		pro.put("mail.smtp.socketFactory.port", "465");
		pro.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		pro.put("mail.smtp.socketFactory.fallback", "false");
		
		Authenticator auth = new Gmail();
		Session ses = Session.getInstance(pro, auth);
		ses.setDebug(true);
		MimeMessage msg = new MimeMessage(ses);
		msg.setSubject(subject);
		Address fromAddr = new InternetAddress(from);
		msg.setFrom(fromAddr);
		Address toAddr = new InternetAddress(to);
		msg.addRecipient(Message.RecipientType.TO, toAddr);
		msg.setContent(content, "text/html;charset=UTF-8");
		Transport.send(msg);
		
	}catch (Exception e){
		e.printStackTrace();
		PrintWriter pww = response.getWriter();
		pww.println("<script>");
		pww.println("location.href='./pro_main.jsp?ID="+ID+"&lid="+lid+"&sid="+to+"'");
		pww.println("history.back();");
		pww.println("</script>");
		pww.close();
		return;
	}
	System.out.println("Success! " );
	PrintWriter pww = response.getWriter();
	pww.println("<script>");
	pww.println("location.href='./pro_main.jsp?ID="+ID+"&lid="+lid+"'");
	pww.println("</script>");
	pww.close();
	return;
%>