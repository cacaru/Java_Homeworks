<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="lecstumap.lsmDAO" %>
<%@ page import="lecstumap.lsmDTO" %>
<%@ page import="java.io.PrintWriter" %>

<%
	request.setCharacterEncoding("UTF-8");
	String id = null;
	String lid = null;
	String a = null;
	
	if(request.getParameter("ID") != null){
		id = (String) request.getParameter("ID");
	}
	if(request.getParameter("lid") != null){
		lid = (String) request.getParameter("lid");
	}
	if(request.getParameter("a") != null){
		a = (String) request.getParameter("a");
	}
	
	if( id.isEmpty() || lid.isEmpty()  ){
		PrintWriter message = response.getWriter();
		message.println("<script>");
		message.println("alert('실행 오류');");
		message.println("history.back();");
		message.println("</script>");
		message.close();
		return;
	}
	lsmDAO stuDAO = new lsmDAO();
	int result;
	if( a.equals("1")){
		result = stuDAO.insertStumap(id, lid);
		if( result == 1){
			PrintWriter message = response.getWriter();
			message.println("<script>");
			message.println("alert('강의 추가에 성공하였습니다.');");
			message.println("location.href='./stu_lecturelist.jsp?ID="+id+"'");
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
	if( a.equals("0")){
		result = stuDAO.deleteStumap(id, lid);
		if( result == 1){
			PrintWriter message = response.getWriter();
			message.println("<script>");
			message.println("alert('강의 삭제에 성공하였습니다.');");
			message.println("location.href='./stu_lecturelist.jsp?ID="+id+"'");
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
