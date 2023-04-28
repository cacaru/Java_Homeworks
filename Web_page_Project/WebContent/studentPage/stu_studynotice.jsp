<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="user.userDTO" %>
<%@ page import="user.userDAO" %>
<%@ page import="java.util.Vector" %>
<%@ page import="lecture.lectureDAO" %>
<%@ page import="lecture.lectureDTO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="lecpromap.lpmDAO" %>
<%@ page import="lecpromap.lpmDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="lecture.lectureboard" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::KwangWoon University U-Leaning System::</title>
<style>
    .td_border{
        border-collapse: collapse;
        border-top: solid black;
        border-left: solid black;
        border-right: solid black;
    }
    .td_rlborder{
    	border-collapse: collapse;
        border-left: solid black;
        border-right: solid black;
    }
    .td_lastborder{
    	border-collapse: collapse;
        border-bottom: solid black;
        border-left: solid black;
        border-right: solid black;
    }
    .a_likeButton{
		color: #000000;
	    border: black solid 2px;
	    padding: 10px;
	    background-color: #ffffff;
	    text-decoration:none;
    }
    .a_likeButton:hover{
    	color: #ffffff;
	    background-color: black;
    }
    .b_likeButton{
		color: #000000;
	    border: black solid 2px;
	    padding: 5px;
	    background-color: #ffffff;
	    text-decoration:none;
    }
    .b_likeButton:hover{
    	color: #ffffff;
	    background-color: black;
    }
</style>
</head>
<%! String ID; 
	String Lid;
	int pageNumber=1;
	Vector<String> lecture = new Vector<String>();
	Vector<String> lid = new Vector<>();
	
	Vector<String> lno = new Vector<>();
	Vector<String> title = new Vector<>();
	Vector<String> date = new Vector<>();
	Vector<String> content = new Vector<>();
	Vector<String> data = new Vector<>();
	Vector<String> preP = new Vector<>();
	Vector<String> proname = new Vector<>();
	
	userDAO stuDAO = new userDAO(); 
	lectureDAO lecDAO = new lectureDAO();
	lpmDAO lpDAO = new lpmDAO();
%>
<% 	
	lid.removeAllElements();
	lecture.removeAllElements();
	lno.removeAllElements();
	title.removeAllElements();
	date.removeAllElements();
	content.removeAllElements();
	data.removeAllElements();
	preP.removeAllElements();
	proname.removeAllElements();
	
	ID = request.getParameter("ID");
	Lid = request.getParameter("lecture");
	lecture.removeAllElements();
	ResultSet rs = stuDAO.stuLectureInfo(ID); 
	
	if( request.getParameter("pageNumber")!= null){
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
	
	while( rs.next() ){
		lecture.add(rs.getString(1));
		lid.add(rs.getString(2));
	}
	if( Lid == null){
		Lid = lid.get(0);
	}
	for( int i = 0; i< lid.size(); i++){
		proname.add( stuDAO.returnPname( lpDAO.returnProID(lid.get(i)) ) );	
	}
	ResultSet notice = lecDAO.noticeinfo(lid.get(0));
	if( notice != null){
		while( notice.next() ) {
			lno.add(notice.getString(1));
			title.add(notice.getString(2));
			date.add(notice.getString(3));
			content.add(notice.getString(4));
			data.add(notice.getString(5));
			preP.add(notice.getString(6));
		}	
	}
	else{
		PrintWriter message = response.getWriter();
		message.println("<script>");
		message.println("alert('데이터베이스 오류 입니다... 다시 시도해주세요!');");
		message.println("history.back();");
		message.println("</script>");
		message.close();
	}
	
%>
<body>
	<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
		<tr height="90">
			<td style="width:4%;">
				&nbsp;
			</td>
			<td style="width:100px; height:20%; text-align:center;">
				<a href="./stu_main.jsp?ID=<%=ID%>">
						::광운대학교::
						::유캠퍼스::
				</a>
			</td>
			<td style="width:4%;">
				&nbsp;
			</td>
			<td style="width:15%; text-align:bottom;"> 학부생   <%= ID %>   </td> 
			<td width="10%">
				<form action="../adjustInfo.jsp?who=1&ID=<%= ID %>"method="post">
					<input name="take" type="submit" value="정보수정" class="a_likeButton"> &nbsp;
				</form>
			</td>
			<td align="left">
				<form action="../login.jsp" >
					<input name="take" type="submit" value="로그아웃" class="a_likeButton"> &nbsp;
				</form>
			</td>
			<td>
				<I>공지사항</I>
			</td>
		</tr>
		
    </table>
    <hr>
    <div style="width:100%; height:40px;"> &nbsp;
    </div>
	<div style="width:18%; float:left ">
		<table  width="100%" height="100%" border="0" cellspacing="0" cellpadding="0" style="text-align:center;" >
			<tbody>
				<tr height="30">
					<td class="td_border"> 
						
					</td> 
				</tr>
				<tr height="30">
					<td class="td_rlborder">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="td_rlborder">
						<a href="./stu_studynotice.jsp?ID=<%= ID %>">
							<span>
								공지사항
							</span>
						</a>
					</td>
				</tr>
				<tr height="30">
					<td class="td_rlborder">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="td_rlborder">
						<a href="./stu_studySupport.jsp?ID=<%= ID %>">
							<span>
								강의자료실
							</span>
						</a>
					</td>
				</tr>
				<tr height="30">
					<td class="td_rlborder">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="td_rlborder">
						<a href="./stu_lecturelist.jsp?ID=<%= ID %>">
							<span>
								강의목록
							</span>
						</a>
					</td>
				</tr>
				<tr>
					<td class="td_rlborder">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="td_rlborder">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="td_rlborder">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="td_rlborder">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="td_rlborder">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="td_lastborder">
						&nbsp;
					</td>
				</tr>
				
			</tbody>
		</table>
	</div>
	<div style="width:80%; float:right;">
		<table  width="100%" height="100%" border="0" cellspacing="0" cellpadding="0" style="text-align:center;" >
			<tbody>
				<tr>
					<td width="15%" height="15%" align="right">
						&nbsp;
					</td>
					<td width="40%" align="left">
						
					</td>
					<td align="left">
						과목선택
						<form action="./stu_studynotice.jsp?ID=<%=ID %>" method="post">
						<select name="lecture" id="lecture" style="width:180px;" >
							<% for( int j = 0 ; j< lid.size(); j++) { %>
							<option value="<%= lid.get(j) %>"> <%=lecture.get(j) %> </option>
							<% } %>
                    	</select>
                    	<noscript><input type="submit" value="Submit"></noscript>
                    	<input type="submit" class="b_likeButton" value="Go">
                    	</form>
					</td>
					
				</tr>
			</tbody>
		</table>
		<div class="container">
			<div class="row">
			<table width="100%" class="table table-striped" style="text-align:center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<!-- <th width="8%" style="background-color: #eeeeee; text-align:center; font:duplex_roman;"> 선택 </th> -->
						<th width="8%" style="background-color: #eeeeee; text-align:center; font:duplex_roman;"> no </th>
						<th width="40%" style="background-color: #eeeeee; text-align:center; font:duplex_roman;"> 제목 </th>
						<th style="background-color: #eeeeee; text-align:center; font:duplex_roman;"> 파일 </th>
						<th style="background-color: #eeeeee; text-align:center; font:duplex_roman;"> 등록일 </th>
						<th style="background-color: #eeeeee; text-align:center; font:duplex_roman;"> 작성자 </th>
					</tr>
				</thead>
				<tbody>
					<%
						ArrayList<lectureboard> list = lecDAO.getnoticelist(pageNumber, Lid); 
						for(int j = 0; j < list.size(); j ++){
					%> 
					<tr>
						<!-- <td></td>  -->
						<td><%= list.get(j).getNo() %></td>
						<td><a href="view.jsp?ID=<%=ID %>&Lid=<%=Lid %>&no=<%=list.get(j).getNo() %>&division=1" > <%=list.get(j).getTitle() %></td>
						<td><% if(list.get(j).getFile() != null) { %> O <% } %> <% if (list.get(j).getFile() == null) { %> X <% } %></td>
						<td><%= list.get(j).getDate() %></td>
						<td><%= list.get(j).getPrePerson() %></td>
					</tr>
					<% } %>
				</tbody>
			</table>
			<div style="margin-top:25px;" >
			<%	
				if( pageNumber != 1 ){
			%>
				<a href="./stu_studynotice.jsp?ID=<%=ID %>&lid=<%=Lid %>&pageNumber=<%=pageNumber-1%>" class="b_likeButton">이전</a>
			<%		
				} if ( lecDAO.nextnotPage(pageNumber + 1, Lid) ) {
			%>
				<a href="./stu_studynotice.jsp?ID=<%=ID %>&lid=<%=Lid %>&pageNumber=<%=pageNumber+1%>" class="b_likeButton">다음</a>
			<%		
				}
			%>
			</div>
			</div>
		</div>
	</div>
</body>
</html>