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
</style>
</head>
<%! String ID; 
	String Lid;
	String sid = null;
	String Sid = null;
	
	int i =0;
	Vector<String> stuid = new Vector<>();
	Vector<String> name = new Vector<>();
	Vector<String> major = new Vector<>();
	Vector<String> tel = new Vector<>();
	Vector<String> email = new Vector<>();
	
	userDAO proDAO = new userDAO(); 
%>
<% 	
	
	sid =  null;
	Sid = null;
	stuid.removeAllElements();
	name.removeAllElements();
	major.removeAllElements();
	tel.removeAllElements();
	email.removeAllElements();

	ID = request.getParameter("ID");
	Lid = request.getParameter("lid");
	sid = request.getParameter("check");

	System.out.println(sid);
	ResultSet rs = proDAO.stuinfo(sid);;
	System.out.println(sid);
	if( rs.next() ){
		name.add( rs.getString(2));
		major.add(rs.getString(3));
		tel.add(rs.getString(4));
		email.add(rs.getString(5));
		Sid = email.get(0);
	}
	System.out.println(Sid);
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
		<div class="container">
			<div class="row">
			<form method="post" action="mailAction.jsp?ID=<%=ID%>&lid=<%=Lid%>" >
				<table width="100%" class="table table-striped" style="text-align:center; border: 1px solid #dddddd" cellpadding="10" cellspacing="10" >
				<thead>
					<tr>
						<th colspan="2" style="background-color: #eeeeee; text-align:center; font:duplex_roman;">메일작성</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td width="10">제목</td>
						<td width="80%"> <input type="text"  name="noticetitle" maxlength="50" style="width:91%"></td>
					</tr>
					<tr height="300">
						<td width="10">내용</td>
						<td> <textarea name="content" maxlength="2048"  rows="18" style="width:91%;"></textarea></td>
					</tr>
				
					<tr align="right">
						<td>
							<input type="hidden" value="<%= Sid %>" name="sid" >
						</td>
						<td>
							<input type="submit" class="a_likeButton" value="작성완료">
						</td>
					</tr>
				</tbody>
				</table>
			</form>
			</div>
		</div>
		<div style="margin-top:10px;">
			발송명단
			<table width="100%" class="table table-striped" style="text-align:center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th width="10%" style="background-color: #eeeeee; text-align:center; font:duplex_roman;"> 학생아이디 </th>
						<th width="10%" style="background-color: #eeeeee; text-align:center; font:duplex_roman;"> 이름 </th>
						<th style="background-color: #eeeeee; text-align:center; font:duplex_roman;"> 전화 </th>
						<th style="background-color: #eeeeee; text-align:center; font:duplex_roman;"> 이메일 </th>
					</tr>
				</thead>
				<tbody>
					<% for (int j = 0; j < name.size(); j++) { %>
					<tr>
						<td><%= sid %></td>
						<td><%= name.get(j) %></td>
						<td><%= tel.get(j) %></td>
						<td><%= email.get(j) %></td>
					</tr>
					<% }  %>
				</tbody>
			</table>
			<div>
			</div>
		</div>
	</div>
</body>
</html>