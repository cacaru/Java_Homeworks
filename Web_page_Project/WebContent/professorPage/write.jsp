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
	String division;
%>
<% 	
	ID = request.getParameter("ID");
	Lid = request.getParameter("lid");
	division = request.getParameter("division");

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
			<form method="post" action="writeAction.jsp?ID=<%=ID%>&lid=<%=Lid%>&division=<%=division %>" enctype="multipart/form-data">
				<table width="100%" class="table table-striped" style="text-align:center; border: 1px solid #dddddd" cellpadding="10" cellspacing="10" >
				<thead>
					<tr>
					<%
						if ( division.equals("1") ) {
					%>
						<th colspan="2" style="background-color: #eeeeee; text-align:center; font:duplex_roman;">공지사항작성</th>
					<%
						} if ( division.equals("2") ) {
					%>
						<th colspan="2" style="background-color: #eeeeee; text-align:center; font:duplex_roman;">강의게시판 작성</th>
					<%
						}
					%>
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
					<tr>
						<td>
							파일 업로드
						</td>
						<td align="left" style="margin-left: 15%;">
							<form>
							<input type="file" name="file" size="50" >
							</form>
							
						</td>
					</tr>
					<tr align="right">
						<td>
							&nbsp;
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
	</div>
</body>
</html>