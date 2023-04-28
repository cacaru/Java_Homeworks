<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>광운대학교 종합정보서비스</title>
<style>
    .td_border{
        border-collapse: collapse;
        border-top: solid black;
        border-bottom: solid black;
        border-right: solid black;
    }
    .td_border2{
        border-collapse: collapse;
        border-top: solid black;
        border-bottom: solid black;
        border-left: solid black;
    }
</style>
</head>
<body>
<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
            <tbody>
                    <tr>
                        <td height="5">&nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center" valign="middle">
                            <table width="900" border="0" cellspacing="0" cellpadding="0">
                                <tbody>
                                    <tr>
                                        <td class="td_border2" width="310" valign="top">
                                            <img src="image_intra01.gif" width="301" height="521">
                                        </td>
                                        <td valign="top" class="td_border">
                                            <table width="600" align="center" border="0" cellpadding="0" cellspacing="0">
                                                <tbody>
                                                    <tr>
                                                        <br><br><br><br><br><br>
                                                        <table width="559" border="0" cellspacing="0" cellpadding="0">
                                                            <tbody>
                                                                <tr><td>&nbsp;</td></tr>
                                                                <tr><td height="40"> </td></tr>
                                                                <tr><td height="140">
                                                                    <table width="559" height="137" border="0" cellpadding="0" cellspacing="0">
                                                                        <tbody>
                                                                            <tr>
                                                                                <td>
                                                                                    <table width="320" border="0" align="center" cellpadding="0" cellspacing="0">
                                                                                        <colgroup> <col width="25%"><col width="25%"><col width="35%"> <col width="*">
                                                                                        </colgroup>
                                                                                        <tbody>
                                                                                            <tr>
                                                                                            <form action="./userLoginAction.jsp" method="post">
                                                                                                <td height="30">
                                                                                                    <a style="font-size:11px;">사용자구분</a>
                                                                                                </td>
                                                                                                <td colspan="3" align="left">
                                                                                                    <select name="who" id="who" tabindex="1" style="width:145px;" onchange="">
                                                                                                        <option value="1"> 학부생 </option>
                                                                                                        <option value="2"> 교수 </option>
                                                                                                    </select>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td height="25">
                                                                                                    <a style="font-size:11px;"> 개인번호</a>
                                                                                                </td>
                                                                                                <td>
                                                                                                    <input name="ID" type="text" style="width:150px;" tabindex="2">
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td height="25">
                                                                                                    <a style="font-size:11px;"> 비밀번호</a>
                                                                                                </td>
                                                                                                <td>
                                                                                                    <input name="Pw" type="password" style="width:150px;" tabindex="3">
                                                                                                </td>
                                                                                                <td>
                                                                                                    <imput name="login" type="button" tabindex="4" width="95"  alt="로그인">
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td></td>
                                                                                                <td>
																									
																										<input name="login" type="submit" style="width:70px;" value="로그인" tabindex="4">
																							</form>
                                                                                                	<form action="./join.jsp" method="post">
                                                                                                    	<input name="join" type="submit" style="width:70px;" value="회원가입" tabindex="5">
                                                                                                    </form>
                                                                                                </td>
                                                                                            </tr>

                                                                                        </tbody>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </td></tr>
                                                            </tbody>
                                                        </table>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                </tbody>
        </table>        
</body>
</html>