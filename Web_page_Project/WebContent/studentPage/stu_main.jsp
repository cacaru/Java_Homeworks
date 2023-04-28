<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="user.userDTO" %>
<%@ page import="user.userDAO" %>
<%@ page import="java.util.Vector" %>
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
<%! String ID; Vector<String> lecture = new Vector<String>();
	Vector<String> lecID = new Vector<>();
	userDAO stuDAO = new userDAO(); 
%>
<% 	
	ID = request.getParameter("ID"); 	
	lecture.removeAllElements();
	ResultSet rs = stuDAO.stuLectureInfo(ID); 
	while( rs.next() ){
		lecture.add(rs.getString(1));
		lecID.add(rs.getString(2));
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
		<table  width="100%" height="100%" border="0" cellspacing="0" cellpadding="0" style="text-align:left;" >
			<tbody>
				<tr>
					<td width="15%" height="30">
						&nbsp;
					</td>
					<td>
						현재 수강중인 강좌
					</td>
					<td width="15%">
					</td>
				</tr>
				<tr height="50">
					<td>
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<% if ( lecture.size() >= 1) { %>
				<tr>
					<td>
					</td>
					<td>
						<%= lecture.get(0) %>
					</td>
				</tr>
				<tr>
					<td></td>
					<td> &nbsp;</td>
				</tr>
				<% } %>
				<% if ( lecture.size() >= 2) { %>
				<tr>
					<td>
					</td>
					<td>
						<%= lecture.get(1) %>
					</td>
				</tr>
				<tr>	<td></td>
					<td> &nbsp;</td>
				</tr>
				<% } %>
				<% if ( lecture.size() >= 3) { %>
				<tr>
					<td>
					</td>
					<td>
						<%= lecture.get(2) %>
					</td>
				</tr>
				<tr> <td></td>
					<td> &nbsp;</td>
				</tr>
				<% } %>
				<% if ( lecture.size() >= 4) { %>
				<tr>
					<td>
					</td>
					<td>
						<%= lecture.get(3) %>
					</td>
				</tr>
				<tr> <td></td>
					<td> &nbsp;</td>
				</tr>
				<% } %>
				<% if ( lecture.size() >= 5) { %>
				<tr>
					<td>
					</td>
					<td>
						<%= lecture.get(4) %>
					</td>
				</tr>
				<tr> <td></td>
					<td> &nbsp;</td>
				</tr>
				<% } %>
				<% if ( lecture.size() >= 6) { %>
				<tr>
					<td>
					</td>
					<td>
						<%= lecture.get(5) %>
					</td>
				</tr>
				<tr> <td></td>
					<td> &nbsp;</td>
				</tr>
				<% } %>
				<% if ( lecture.size() >= 7) { %>
				<tr>
					<td>
					</td>
					<td>
						<%=lecture.get(6) %>
					</td>
				</tr>
				<tr> <td></td>
					<td> &nbsp;</td>
				</tr>
				<% } %>
			</tbody>
			<% lecture.removeAllElements(); %> 
			<% lecture.clear(); %>
		</table>	
	</div>
    				
</body>
</html>