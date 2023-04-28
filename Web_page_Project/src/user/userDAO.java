package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DatabaseUtil;

public class userDAO {
	// Database Access Object 
	// 실질적으로 파일과 연동될 부분
	
	//학생 정보 가져오기
	public ResultSet stuinfo(String StuID) {
		String SQL = "SELECT StuID, Name, Major, Tel, Email FROM student where StuID = ?";
		ResultSet rs =null;
		try {
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, StuID);
			rs =  pstmt.executeQuery();
			return rs;
		} catch ( Exception e) {
			e.printStackTrace();
		}
		return rs; // 불러오기 실패. null값 반환.
	}
	
	//교수 이름 집합 반환 함수
	public String returnPname(String pid) {
		String SQL = "SELECT Name from professor where ProID = ? ";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, pid);
			rs =  pstmt.executeQuery();
			if( rs.next() ) {
				return rs.getString(1);
			}
		} catch ( Exception e) {
			e.printStackTrace();
		}finally {
			try { if( conn!=null) conn.close(); } catch (Exception e){ e.printStackTrace();}
			try { if( pstmt!=null) pstmt.close(); } catch (Exception e){ e.printStackTrace();}
			try { if( rs!=null) rs.close(); } catch (Exception e){ e.printStackTrace();}
		}
		return "";// 불러오기 실패. null값 반환.
	}
	
	//학생 수강정보 불러오기 함수.
	public ResultSet stuLectureInfo( String id ) {
		String SQL = "SELECT lname , lid FROM LECTURE where lid IN ( SELECT lid FROM LECTURESTUMAP where StuID = ?)";
		ResultSet rs =null;
		try {
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id);
			rs =  pstmt.executeQuery();
			return rs;
		} catch ( Exception e) {
			e.printStackTrace();
		}
		return rs;// 불러오기 실패. null값 반환.
	}
	
	//교수 강의 불러오기 함수.
		public ResultSet proLectureInfo( String id ) {
			String SQL = "SELECT lname, lid FROM LECTURE where lid IN ( SELECT lid FROM LECTUREPROMAP where ProID = ?)";
			ResultSet rs =null;
			try {
				Connection conn = DatabaseUtil.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, id);
				rs =  pstmt.executeQuery();
				return rs;
			} catch ( Exception e) {
				e.printStackTrace();
			}
			return rs;// 불러오기 실패. null값 반환.
		}
		
	//학생 정보 수정용 함수.
	public int adjustStu(String id, String pw, String name, String major, String tel, String email) {
		String SQL = "UPDATE STUDENT SET Pw=? , Name=?, Major=? , Tel=? , Email=? WHERE StuID=?";
		try {
			Connection conn = DatabaseUtil.getConnection();
			
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, pw);
			pstmt.setString(2, name);
			pstmt.setString(3, major);
			pstmt.setString(4, tel);
			pstmt.setString(5, email);
			pstmt.setString(6, id);
			
			return pstmt.executeUpdate();
		} catch ( Exception e) {
			e.printStackTrace();
		}
		return -1; // 정보수정 실패
	}
	
	//교수 정보 수정용 함수.
	public int adjustPro(String id, String pw, String name, String tel, String email, String major, String work) {
		String SQL = "UPDATE PROFESSOR SET Pw=? , Name=?, Major=? , Tel=? , Email=?, Work=? WHERE ProID=?";
		try {
			Connection conn = DatabaseUtil.getConnection();
			
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, pw);
			pstmt.setString(2, name);
			pstmt.setString(3, major);
			pstmt.setString(4, tel);
			pstmt.setString(5, email);
			pstmt.setString(6, work);
			pstmt.setString(7, id);
			
			return pstmt.executeUpdate();
		} catch ( Exception e) {
			e.printStackTrace();
		}
		return -1; // 정보수정 실패
	}
	
	//학생 로그인용 함수.
	public int loginStu(String ID, String Pw) {
		String SQL = "SELECT Pw FROM STUDENT WHERE StuID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, ID);
			rs = pstmt.executeQuery();
			if( rs.next()) {
				if( rs.getString(1).equals(Pw)) {
					return 1;	//로그인 성공
				}
				else {
					return 0;	//비밀번호 틀림
				}
			}
			return -1; // 아이디 없음;
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if( conn!=null) conn.close(); } catch (Exception e){ e.printStackTrace();}
			try { if( pstmt!=null) pstmt.close(); } catch (Exception e){ e.printStackTrace();}
			try { if( rs!=null) rs.close(); } catch (Exception e){ e.printStackTrace();}
		}
		return -2; // 데이터베이스 오류;
	}
	
	//교수 로그인용 함수.
	public int loginPro(String ID, String Pw) {
		String SQL = "SELECT Pw FROM PROFESSOR WHERE ProID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, ID);
			rs = pstmt.executeQuery();
			if( rs.next()) {
				if( rs.getString(1).equals(Pw)) {
					return 1;	//로그인 성공
				}
				else {
					return 0;	//비밀번호 틀림
				}
			}
			return -1; // 아이디 없음;
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if( conn!=null) conn.close(); } catch (Exception e){ e.printStackTrace();}
			try { if( pstmt!=null) pstmt.close(); } catch (Exception e){ e.printStackTrace();}
			try { if( rs!=null) rs.close(); } catch (Exception e){ e.printStackTrace();}
		}
		return -2; // 데이터베이스 오류;
	}
		
	//학생 회원가입용 함수.
	public int joinStudent(String id, String pw, String name, String major, String tel, String email) {
		String SQL = "INSERT INTO STUDENT VALUES (?, ?, ?, ?, ?, ?)";
		String SQL2 = "SELECT StuID FROM STUDENT WHERE StuID = ?";
		try {
			Connection conn = DatabaseUtil.getConnection();
			
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			PreparedStatement pstmt2 = conn.prepareStatement(SQL2);
			pstmt2.setString(1, id);
			ResultSet rs = pstmt2.executeQuery();
			while( rs.next() ) {
				if ( rs.getString(1).equals(id)) {
					return -2; // 이미 존재하는 아이디
				}
			}
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.setString(4, major);
			pstmt.setString(5, tel);
			pstmt.setString(6, email);
			
			return pstmt.executeUpdate();
		} catch ( Exception e) {
			e.printStackTrace();
		}
		return -1; // 가입 실패.
	}
	//교수 회원가입용 함수.
	public int joinProf(String id, String pw, String name, String tel, String email, String major , String work) {
		String SQL = "INSERT INTO PROFESSOR VALUES (?, ?, ?, ?, ?, ? , ?)";
		String SQL2 = "SELECT ProID FROM PROFESSOR WHERE ProID = ?";
		try {
			Connection conn = DatabaseUtil.getConnection();
			
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			PreparedStatement pstmt2 = conn.prepareStatement(SQL2);
			pstmt2.setString(1, id);
			ResultSet rs = pstmt2.executeQuery();
			while( rs.next() ) {
				if ( rs.getString(1).equals(id)) {
					return -2; // 이미 존재하는 아이디
				}
			}
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.setString(4, tel);
			pstmt.setString(5, email);
			pstmt.setString(6, major);
			pstmt.setString(7, work);
			
			return pstmt.executeUpdate();
		} catch ( Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
