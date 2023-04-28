<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.userDTO" %>
<%@ page import="user.userDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="lecture.lectureDAO" %>
<%@ page import="lecture.lectureDTO" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<%@ page import="java.io.*,java.util.*,javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.util.regex.Pattern" %>

<%
	request.setCharacterEncoding("UTF-8");
	String uploadPath = request.getRealPath("/files");
	int division = 0;
	String lid = null;
	String title = null;
	String content = null;
	String file = null;

	String prePerson = null;
	String ID = null;
	
	String filename = null;
	String originalname = null;
	long filesize = 0;
	String filetype = null;
	try{
		MultipartRequest multi=new MultipartRequest(request, uploadPath ,30*1024*1024,"UTF-8",new DefaultFileRenamePolicy());	
		userDAO proDAO = new userDAO();

		if(request.getParameter("ID") != null){
			ID = (String) request.getParameter("ID");
		}
		if(request.getParameter("lid") != null){
			lid = (String) request.getParameter("lid");
		}
		prePerson = (String) proDAO.returnPname(ID);
		
		if(multi.getParameter("lecture") != null){
			lid = (String) multi.getParameter("lecture");
		}
		if(multi.getParameter("noticetitle") != null){
			title = (String) multi.getParameter("noticetitle");
		}
		if(multi.getParameter("content") != null){
			content = (String) multi.getParameter("content");
		}	
		if(multi.getParameter("division") != null){
			division = Integer.parseInt( multi.getParameter("division") ) ;
		}
		Enumeration files = multi.getFileNames();
		
		if( files.hasMoreElements() ){
			String file1 = (String)files.nextElement(); 
			originalname = multi.getOriginalFileName(file1); 
			file = originalname;
			filename = multi.getFilesystemName(file1);   
			filetype = multi.getContentType(file1);   
			File fileover = multi.getFile(file1);    
			filesize = file.length();
		}
		
	} catch ( Exception e ){
		e.printStackTrace();
	}
	
	if( title == null  ){
		PrintWriter message = response.getWriter();
		message.println("<script>");
		message.println("alert('제목은 필수입력사항입니다. 입력해주세요');");
		message.println("history.back();");
		message.println("</script>");
		message.close();
		return;
	}
	
	lectureDAO lecDAO = new lectureDAO();
	int result = lecDAO.write(title, content, lid, file, prePerson , division);
	// 게시판 등록 성공시
	if( result == 1){
		if( division == 1){
			PrintWriter message = response.getWriter();
			message.println("<script>");
			message.println("alert('공지사항이 추가되었습니다.');");
			message.println("location.href='./pro_notice.jsp?ID="+ID+"&lid="+lid+"'");
			message.println("</script>");
			message.close();
		}else if ( division == 2) {
			PrintWriter message = response.getWriter();
			message.println("<script>");
			message.println("alert('강의게시판에 게시글이 추가되었습니다.');");
			message.println("location.href='./pro_support.jsp?ID="+ID+"&lid="+lid+"'");
			message.println("</script>");
			message.close();
		}
	}else if( result == -1){
		PrintWriter message = response.getWriter();
		message.println("<script>");
		message.println("alert('수정에 실패했습니다. 다시 확인해주세요!');");
		message.println("history.back();");
		message.println("</script>");
		message.close();
		return;
	}
	if( file != null ) {
		
	}
%>