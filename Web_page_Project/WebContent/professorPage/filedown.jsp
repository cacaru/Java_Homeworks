<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>

<%@ page import="java.io.PrintWriter" %>

<%
	request.setCharacterEncoding("UTF-8");

	String fileName = "";
	
	if(request.getParameter("Name") != null){
		fileName = (String) request.getParameter("Name");
	}
	
	String savePath = "files";
	String uploadPath = request.getRealPath(savePath);
	String filefullpath = uploadPath + "\\"+ fileName ; 
	System.out.println("sFilePath : " + filefullpath);
	filefullpath.replaceAll(" ", "");
	System.out.println("sFilePath : " + filefullpath);
	
	File outputFile = new File(filefullpath);
	
	byte[] tmp = new byte[30 *1024 *1024];
	
	FileInputStream in = new FileInputStream(outputFile);
	String filetype = getServletContext().getMimeType(filefullpath);
	
	if( filetype == null){
		filetype = "application.octec-stream";
	}
	
	response.setContentType(filetype);

	String sEncoding = URLEncoder.encode(fileName, "utf-8");
	
	String AA = "Content-Disposition";
	String BB = "Attachment;filename="+sEncoding;
	response.setHeader(AA, BB);
	
	ServletOutputStream out2 = response.getOutputStream();
	
	int numRead = 0;
	
	while( (numRead = in.read(tmp, 0, tmp.length)) != -1) {
		out2.write(tmp, 0, numRead);
	}
	out2.flush();
	out2.close();
	in.close();
	
%>