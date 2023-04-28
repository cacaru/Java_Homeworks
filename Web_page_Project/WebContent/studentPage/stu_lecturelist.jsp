<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="user.userDTO" %>
<%@ page import="user.userDAO" %>
<%@ page import="java.util.Vector" %>
<%@ page import="lecture.lectureDAO" %>
<%@ page import="lecture.lectureDTO" %>
<%@ page import="lecture.lecDAO" %>
<%@ page import="lecture.lecDTO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="lecstumap.lsmDAO" %>
<%@ page import="lecstumap.lsmDTO" %>
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
 	.bc_style{
		color: #000000;
	    border: red solid 2px;
	    padding: 10px;
	    background-color: #ffffff;
	}
	.bc_style:hover {
	    color: #ffffff;
	    background-color: red;
	}
	.ba_style{
		color: #000000;
	    border: #000000 solid 2px;
	    padding: 10px;
	    background-color: #ffffff;
	}
	.ba_style:hover {
	    color: #ffffff;
	    background-color: black;
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
<%! String ID;int i =0;  
	userDAO stuDAO = new userDAO();
	lectureDAO lecDAO = new lectureDAO();
	lecDAO ldao = new lecDAO();
	lsmDAO lsDAO = new lsmDAO();
	lpmDAO lpDAO = new lpmDAO();
	
	Vector<String> lname = new Vector<>();
	Vector<String> linfo = new Vector<>();
	Vector<String> lid = new Vector<>();
	Vector<String> slid = new Vector<>();
	Vector<Integer> has = new Vector<>();
	Vector<String> pname = new Vector<>();
%>
<% 	
	lname.removeAllElements();
	lname.clear(); 
	linfo.removeAllElements(); 
	linfo.clear(); 
	has.removeAllElements();
	has.clear();
	pname.removeAllElements();
	pname.clear();
	
	ID = request.getParameter("ID");
	ResultSet rs = ldao.showlec();
	ResultSet rs2 = lsDAO.getlectureforstu(ID);

	if( rs != null) {
		while( rs.next()){
			lname.add(rs.getString(1));
			linfo.add(rs.getString(2));
			lid.add(rs.getString(3));
		}
	}
	for( int j = 0; j < lid.size(); j ++){
		String s = lpDAO.returnProID(lid.get(j));
		String result = stuDAO.returnPname(s);
		pname.add(result);
	}
	
	if( rs2 != null){
		while( rs2.next() ){
			slid.add(rs2.getString(1));
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
	for( int j = 0; j < lid.size(); j++){
		has.add(j, 0);
	}
	for( int j = 0; j< slid.size() ; j++){
		for( i=0; i < lid.size(); i++){
			String a = slid.get(j);
			String b= lid.get(i);
			if( a.equals(b) ){
				has.set(i, 1);
			}
		}
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
			<td style="width:15%; text-align:bottom;"> 학부생   <%= ID %>  </td> 
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
				<I>강의 목록</I>
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
		<table  width="100%" height="100%" border="0" cellspacing="0" cellpadding="0" style="text-align:left; border-collapse: separate; border-spacing: 0 10px;" >
			<tbody>
			<% for (int i = 0 ; i < lname.size() ; i++){ %>
				<tr >
					<td> <%= lname.get(i) %></td>
					<td> <%= linfo.get(i) %></td>
					<td> <%= pname.get(i) %></td>
					<% if ( has.get(i) == 0 ) { %>
					<td style="text-align:left"> 
						<form action="./stuLectureAction.jsp?ID=<%= ID %>&lid=<%= lid.get(i) %>&a=1" method="post">
							<input name="take" type="submit" value="수강하기" class="ba_style"> 
						</form>
					</td>
					<% } %>
					<% if ( has.get(i) == 1 ){ %>
					<td style="text-align:left"> 
						<form action="./stuLectureAction.jsp?ID=<%= ID %>&lid=<%= lid.get(i) %>&a=0" method="post">
							<input name="take" type="submit" value="수강취소" class="bc_style"> 
						</form>
					</td>
					<% } %>
				</tr>
			<%} %>

			</tbody>
		</table>	
			<% 
				lname.removeAllElements();
				lname.clear(); 
				linfo.removeAllElements();
				linfo.clear(); 
				has.removeAllElements();
				has.clear();
				lid.removeAllElements();
				lid.clear();
				slid.removeAllElements();
				slid.clear();
			%>
	</div>
</body>
</html>