<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.FileInputStream" %>
<%    
  String filename = "Fire.PNG";   
  String filepath = "C:\\apache-tomcat\\webapps\\data";   
  response.setContentType("APPLICATION/OCTET-STREAM");   
  response.setHeader("Content-Disposition","attachment; filename=\"" + filename + "\"");   
  
  FileInputStream fileInputStream = new FileInputStream(filepath +"\\\\" + filename);  
            
  int i;   
  while ((i=fileInputStream.read()) != -1) {  
    out.write(i);   
  }   
  fileInputStream.close();   
%>   