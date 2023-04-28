<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="user.userDTO" %>
<%@ page import="user.userDAO" %>
<%@ page import="java.util.Vector" %>
<%@ page import="lecture.lectureDAO" %>
<%@ page import="lecture.lectureDTO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="lecstumap.lsmDAO" %>
<%@ page import="lecstumap.lsmDTO" %>

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
<%! String ID; int pageNumber = 1;
	String Lid;
	Vector<String> lecture = new Vector<String>();
	Vector<String> lid = new Vector<>();
	
	Vector<String> stuid = new Vector<>();
	Vector<String> name = new Vector<>();
	Vector<String> major = new Vector<>();
	Vector<String> tel = new Vector<>();
	Vector<String> email = new Vector<>();

	
	userDAO proDAO = new userDAO(); 
	lsmDAO lsDAO = new lsmDAO();
%>
<% 	
	lid.removeAllElements();
	lecture.removeAllElements();
	stuid.removeAllElements();
	name.removeAllElements();
	major.removeAllElements();
	tel.removeAllElements();
	email.removeAllElements();
	lid.clear();
	lecture.clear();
	stuid.clear();
	name.clear();
	major.clear();
	tel.clear();
	email.clear();
	

	ID = request.getParameter("ID");
	Lid = request.getParameter("lecture");
	
	if( request.getParameter("pageNumber")!= null){
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
	
	ResultSet rs = proDAO.proLectureInfo(ID); 

	while( rs.next() ){
		lecture.add(rs.getString(1));
		lid.add(rs.getString(2));
	}
	rs.close();
	
	if( Lid == null){
		Lid = lid.get(0); 
	}
	
	ResultSet rss = lsDAO.getstuid(Lid);
	while( rss.next()){
		stuid.add( rss.getString(1) );
	}
	rss.close();
	int i = 0;
	while( i < stuid.size() ){
		ResultSet rsrs = proDAO.stuinfo(stuid.get(i));
		if( rsrs.next() ){
			name.add( rsrs.getString(2));
			major.add(rsrs.getString(3));
			tel.add(rsrs.getString(4));
			email.add(rsrs.getString(5));
		}
		i++;
		rsrs.close();
	}
%>
<body>
	<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
		<tr height="90">
			<td style="width:4%;">
				&nbsp;
			</td>
			<td style="width:100px; height:20%; text-align:center;">
				<a href="./pro_main.jsp?ID=<%=ID%>">
						::광운대학교::
						::유캠퍼스::
				</a>
			</td>
			<td style="width:4%;">
				&nbsp;
			</td>
			<td style="width:15%; text-align:bottom;"> 교수   <%= ID %> 님  </td> 
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
						<a href="./pro_notice.jsp?ID=<%= ID %>">
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
						<a href="./pro_support.jsp?ID=<%= ID %>">
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
						<a href="./pro_manage.jsp?ID=<%= ID %>">
							<span>
								강의관리
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
		<table  width="100%" height="100%" border="0" cellspacing="5" cellpadding="5" style="text-align:center;" >
			<tbody>
				<tr height="15%">
					<td width="15%" height="15%" align="right">

					</td>
					<td width="40%" align="left">
						
					</td>
					<td align="left">
						과목선택
						<form action="./pro_manage.jsp?ID=<%=ID %>&lid=<%=Lid %>" method="post">
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
			<form action="./mailing.jsp?ID=<%=ID %>&lid=<%=Lid %>" method="post" >
			<table width="100%" class="table table-striped" style="text-align:center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th width="6%" style="background-color: #eeeeee; text-align:center; font:duplex_roman;"> 선택 </th>
						<th width="10%" style="background-color: #eeeeee; text-align:center; font:duplex_roman;"> 학생아이디 </th>
						<th width="10%" style="background-color: #eeeeee; text-align:center; font:duplex_roman;"> 이름 </th>
						<th style="background-color: #eeeeee; text-align:center; font:duplex_roman;"> 학과 </th>
						<th style="background-color: #eeeeee; text-align:center; font:duplex_roman;"> 전화 </th>
						<th style="background-color: #eeeeee; text-align:center; font:duplex_roman;"> 이메일 </th>
					</tr>
				</thead>
				<tbody>
					<% for (int j = 0; j < name.size(); j++) { %>
					<tr>
						<td><input type="radio" name="check" value="<%= stuid.get(j) %>" > </td>
						<td><%= stuid.get(j) %></td>
						<td><%= name.get(j) %></td>
						<td><%= major.get(j) %></td>
						<td><%= tel.get(j) %></td>
						<td><%= email.get(j) %></td>
					</tr>
					<% }  %>
				</tbody>
			</table>
				<div style="margin-top:25px;" >
					<input type="submit" name="mailing" class="b_likeButton" value="메일보내기">  </input>
				</div>
			</form>
			</div>
		</div>
	</div>
</body>
</html>