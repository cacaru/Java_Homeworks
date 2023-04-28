<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.userDTO" %>
<%@ page import="user.userDAO" %>
<%@ page import="java.io.PrintWriter" %>

<%
	request.setCharacterEncoding("UTF-8");
	String who = null;
	String Name = null;
	String Pw = null;
	String ID = null;
	String Tel = null;
	String Email = null;
	String Major = null;
	String Work = null;
	
	if(request.getParameter("who") != null){
		who = (String) request.getParameter("who");
	}
	if(request.getParameter("Name") != null){
		Name = (String) request.getParameter("Name");
	}
	if(request.getParameter("Pw") != null){
		Pw = (String) request.getParameter("Pw");
	}
	if(request.getParameter("ID") != null){
		ID = (String) request.getParameter("ID");
	}
	if(request.getParameter("Tel") != null){
		Tel = (String) request.getParameter("Tel");
	}
	if(request.getParameter("Email") != null){
		Email = (String) request.getParameter("Email");
	}
	if(request.getParameter("Major") != null){
		Major = (String) request.getParameter("Major");
	}
	if(request.getParameter("Work") != null){
		Work = (String) request.getParameter("Work");
	}
	
	if( ID == null || Pw == null || Name == null || Major == null ){
		PrintWriter message = response.getWriter();
		message.println("<script>");
		message.println("alert('이름, 비밀번호, 학번, 학과는 필수 사항입니다. 빈 부분을 입력하여 주세요');");
		message.println("history.back();");
		message.println("</script>");
		message.close();
		return;
	}
	
	if( who.equals("1") ){
		userDAO stuDAO = new userDAO();
		int result = stuDAO.adjustStu(ID, Pw, Name, Major, Tel, Email);
		// 정보 수정 성공시
		if( result == 1){
			PrintWriter message = response.getWriter();
			message.println("<script>");
			message.println("alert('정보수정에 성공했습니다.');");
			message.println("location.href='./studentPage/stu_main.jsp?ID="+ID+"'");
			message.println("</script>");
			message.close();
			return;
		}else if( result == -1){
			PrintWriter message = response.getWriter();
			message.println("<script>");
			message.println("alert('수정에 실패했습니다. 다시 확인해주세요!');");
			message.println("history.back();");
			message.println("</script>");
			message.close();
			return;
		}
	}
	if( who.equals("2") ){
		userDAO proDAO = new userDAO();
		int result = proDAO.adjustPro(ID, Pw, Name, Tel, Email, Major, Work);
		// 정보수정 성공시
		if( result == 1){
			PrintWriter message = response.getWriter();
			message.println("<script>");
			message.println("alert('정보수정에 성공하였습니다.');");
			message.println("location.href='./professorPage/pro_main.jsp?ID="+ID+"'");
			message.println("</script>");
			message.close();
			return;
		}else if( result == -1){
			PrintWriter message = response.getWriter();
			message.println("<script>");
			message.println("alert('수정에 실패했습니다. 다시 확인해주세요!');");
			message.println("history.back();");
			message.println("</script>");
			message.close();
	return;
		}
	}
%>