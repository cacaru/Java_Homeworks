package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DatabaseUtil;

public class userDAO {
	// Database Access Object 
	// ���������� ���ϰ� ������ �κ�
	
	//�л� ���� ��������
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
		return rs; // �ҷ����� ����. null�� ��ȯ.
	}
	
	//���� �̸� ���� ��ȯ �Լ�
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
		return "";// �ҷ����� ����. null�� ��ȯ.
	}
	
	//�л� �������� �ҷ����� �Լ�.
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
		return rs;// �ҷ����� ����. null�� ��ȯ.
	}
	
	//���� ���� �ҷ����� �Լ�.
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
			return rs;// �ҷ����� ����. null�� ��ȯ.
		}
		
	//�л� ���� ������ �Լ�.
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
		return -1; // �������� ����
	}
	
	//���� ���� ������ �Լ�.
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
		return -1; // �������� ����
	}
	
	//�л� �α��ο� �Լ�.
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
					return 1;	//�α��� ����
				}
				else {
					return 0;	//��й�ȣ Ʋ��
				}
			}
			return -1; // ���̵� ����;
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if( conn!=null) conn.close(); } catch (Exception e){ e.printStackTrace();}
			try { if( pstmt!=null) pstmt.close(); } catch (Exception e){ e.printStackTrace();}
			try { if( rs!=null) rs.close(); } catch (Exception e){ e.printStackTrace();}
		}
		return -2; // �����ͺ��̽� ����;
	}
	
	//���� �α��ο� �Լ�.
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
					return 1;	//�α��� ����
				}
				else {
					return 0;	//��й�ȣ Ʋ��
				}
			}
			return -1; // ���̵� ����;
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if( conn!=null) conn.close(); } catch (Exception e){ e.printStackTrace();}
			try { if( pstmt!=null) pstmt.close(); } catch (Exception e){ e.printStackTrace();}
			try { if( rs!=null) rs.close(); } catch (Exception e){ e.printStackTrace();}
		}
		return -2; // �����ͺ��̽� ����;
	}
		
	//�л� ȸ�����Կ� �Լ�.
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
					return -2; // �̹� �����ϴ� ���̵�
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
		return -1; // ���� ����.
	}
	//���� ȸ�����Կ� �Լ�.
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
					return -2; // �̹� �����ϴ� ���̵�
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
