<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>광운대학교 유캠퍼스 회원가입 창</title>
<style>
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
<%! String ID, who;%>
<%  ID = request.getParameter("ID");
	who = request.getParameter("who");
%>
<body>
	<hr>
	<table border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
            <td height="5">&nbsp;</td>
        </tr>
		<tr align="center"> 
			<% if ( who.equals("1") ){  %>
				<td> <a style="font-size:30px;"> 학생 정보수정 </a></td>
			<% } %>
			<% if ( who.equals("2") ) { %>
				<td> <a style="font-size:30px;"> 교수 정보수정 </a></td>
			<% } %>
		</tr>
		<% if ( who.equals("1") ){  %>
			<form action="./useradjustAction.jsp?who=1" method="post">
		<% } %>
		<% if ( who.equals("2") ) { %>
			<form action="./useradjustAction.jsp?who=2" method="post">
		<% } %>	
		
			<table border="0" align="center" cellpadding="0" cellspacing="0">
			    <tr>
			        <td height="25">
			            <a style="font-size:15px;">* 아이디</a>
			        </td>
			        <td>
			            <%= ID %>
			        </td>
			    </tr>
			    <tr>
			        <td height="25">
			            <a style="font-size:15px;">* 비밀번호</a>
			        </td>
			        <td>
			            <input name="Pw" type="password" style="width:200px;">
			        </td>
			    </tr>
			    <tr>
			        <td height="25">
			            <a style="font-size:15px;">* 이름</a>
			        </td>
			        <td>
			            <input name="Name" type="text" style="width:200px;">
			        </td>
			    </tr>
			    <tr>
			        <td height="25">
			            <a style="font-size:15px;">* 학과(전공)</a>
			        </td>
			        <td>
			            <input name="Major" type="text" style="width:200px;">
			        </td>
			    </tr>
			    <tr>
			        <td height="25">
			            <a style="font-size:15px;"> 재직학과</a>
			        </td>
			        <td>
			            <input name="Work" type="text" style="width:200px;">
			        </td>
			    </tr>
			    <tr>
			        <td height="25">
			            <a style="font-size:15px;"> 이메일</a>
			        </td>
			        <td>
			            <input name="Email" type="text" style="width:200px;" >
			        </td>
			    </tr>
			    <tr>
			        <td height="25">
			            <a style="font-size:15px;">전화번호 </a>
			        </td>
			        <td>
			            <input name="Tel" type="text" style="width:200px;" >
			        </td>
			    </tr>
			    <table align="center" cellpadding="0" cellspacing="0" border="0">
			    	<tr> <td> *는 필수 입력 사항 입니다. </td> </tr>
			    	<tr> <td> 학생은 재직학과를 입력하지 않으셔도 됩니다.</td> </tr>
			    	<tr> <td> 수정하실 것이라면 필요한 모든 정보를 전부 입력해주셔야합니다. </td> </tr>
				    <tr>
				    	<td align="center" >
				    		<input name="adjust" type="submit"  value="수정하기" method="post" class="a_likeButton"> &nbsp;&nbsp;&nbsp;
				        	<% if ( who.equals("1")) { %>
				        	<a href="./studentPage/stu_main.jsp?ID=<%= ID %>" class="a_likeButton">돌아가기</a> &nbsp;
				        	<%} %>
				        	<% if( who.equals("2")) { %>
				        	<a href="./professorPage/pro_main.jsp?ID=<%= ID %>" class="a_likeButton">돌아가기</a> &nbsp;
				        	<%} %>
				        </td>
			        </tr>
			    </table>
			</table>
		</form>
	</table>
</body>
</html>