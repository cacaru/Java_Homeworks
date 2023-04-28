<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>광운대학교 유캠퍼스 회원가입 창</title>
</head>
<body>
	<hr>
	<table border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
            <td height="5">&nbsp;</td>
        </tr>
		<tr align="center"> 
			<td> <a style="font-size:30px;">회원가입 </a></td>
		</tr>
		<form action="./userJoinAction.jsp" method="post">
			<table border="0" align="center" cellpadding="0" cellspacing="0">
				<tr>
			        <td height="30">
			            <a style="font-size:15px;">사용자구분</a>
			        </td>
			        <td colspan="3" align="left">
			            <select name="who" id="who" style="width:145px;" onchange="">
			                <option value="1"> 학부생 </option>
			                <option value="2"> 교수 </option>
			            </select>
			        </td>
			    </tr>
			    <tr>
			        <td height="25">
			            <a style="font-size:15px;">* 아이디</a>
			        </td>
			        <td>
			            <input name="ID" type="text" style="width:200px;">
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
			    <table align="center" cellpadding="0" cellspacing="0">
			    	<tr> <td> *는 필수 입력 사항 입니다. </td> </tr>
			    	<tr> <td> 학생은 재직학과를 입력하지 않으셔도 됩니다.</td> </tr>
				    <tr>
				    	<td align="center">
				    		<input name="join" type="submit" style="width:70px;" value="회원가입">
				        	<input type="button" style="width:70px;" value="돌아가기" onclick=back();>
				        	<script>
				        		function back(){
				        			location.href = './login.jsp';
				        		}
				        	</script>
				        </td>
			        </tr>
			    </table>
			</table>
		</form>
	</table>
</body>
</html>