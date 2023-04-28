<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.userDTO" %>
<%@ page import="user.userDAO" %>
<%@ page import="java.io.PrintWriter" %>

<%
	request.setCharacterEncoding("UTF-8");
	String who = null;
	String id = null;
	String pw = null;
	
	if(request.getParameter("who") != null){
		who = (String) request.getParameter("who");
	}
	if(request.getParameter("ID") != null){
		id = (String) request.getParameter("ID");
	}
	if(request.getParameter("Pw") != null){
		pw = (String) request.getParameter("Pw");
	}
	
	if( id.isEmpty() || pw.isEmpty() ){
		PrintWriter message = response.getWriter();
		message.println("<script>");
		message.println("alert('빈 사항이 있습니다. 확인해 주세요.');");
		message.println("history.back();");
		message.println("</script>");
		message.close();
		return;
	}
	
	//학생 로그인시
	if( who.equals("1") ){
		userDAO stuDAO = new userDAO();
		int result = stuDAO.loginStu(id , pw) ;
		// 로그인 성공시
		if( result == 1){
			PrintWriter message = response.getWriter();
			message.println("<script>");
			message.println("location.href='./studentPage/stu_main.jsp?ID="+id+"'");
			message.println("</script>");
			message.close();
			return;
		}else if( result == -2){
			PrintWriter message = response.getWriter();
			message.println("<script>");
			message.println("alert('데이터베이스 오류 입니다... 다시 시도해주세요!');");
			message.println("history.back();");
			message.println("</script>");
			message.close();
			return;
		}
		else if( result == -1){
			PrintWriter message = response.getWriter();
			message.println("<script>");
			message.println("alert('아이디가 없습니다. 회원가입을 진행해주세요."+ id +"');");
			message.println("history.back();");
			message.println("</script>");
			message.close();
			return;
		}
		else if( result == 0){
			PrintWriter message = response.getWriter();
			message.println("<script>");
			message.println("alert('비밀번호가 잘못되었습니다. 다시 확인해주세요!');");
			message.println("history.back();");
			message.println("</script>");
			message.close();
			return;
		}
	}
	// 교수 로그인시 
	if( who.equals("2") ){
		userDAO stuDAO = new userDAO();
		int result = stuDAO.loginPro(id , pw) ;
		// 로그인 성공시
		if( result == 1){
			PrintWriter message = response.getWriter();
			message.println("<script>");
			message.println("location.href='./professorPage/pro_main.jsp?ID="+ id +"'");
			message.println("</script>");
			message.close();
			return;
		}else if( result == -2){
			PrintWriter message = response.getWriter();
			message.println("<script>");
			message.println("alert('데이터베이스 오류 입니다... 다시 시도해주세요!');");
			message.println("history.back();");
			message.println("</script>");
			message.close();
			return;
		}
		else if( result == -1){
			PrintWriter message = response.getWriter();
			message.println("<script>");
			message.println("alert('아이디가 없습니다. 회원가입을 진행해주세요');");
			message.println("history.back();");
			message.println("</script>");
			message.close();
			return;
		}
		else if( result == 0){
			PrintWriter message = response.getWriter();
			message.println("<script>");
			message.println("alert('비밀번호가 잘못되었습니다. 다시 확인해주세요!');");
			message.println("history.back();");
			message.println("</script>");
			message.close();
			return;
		}
	}
%>