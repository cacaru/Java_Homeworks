package lecstumap;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DatabaseUtil;

public class lsmDAO {

	public ResultSet getstuid(String lid) {
		String SQL = "SELECT StuID from LECTURESTUMAP where lid = ? ";
		ResultSet rs =null;
		try {
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, lid);
			rs =  pstmt.executeQuery();
			return rs;
		} catch ( Exception e) {
			e.printStackTrace();
		}
		return rs;// �ҷ����� ����. null�� ��ȯ.
	}
	
	public ResultSet getlectureforstu(String StuID) {
		String SQL = "SELECT lid from LECTURESTUMAP where StuID = ? ";
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
		return rs;// �ҷ����� ����. null�� ��ȯ.
	}
	//���� �����ϱ�
	public int insertStumap(String id, String lid) {
		String SQL = "INSERT INTO lecturestumap VALUES (?, ?) ";
		try {
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, lid);
			pstmt.setString(2, id);
			
			return pstmt.executeUpdate();
		} catch ( Exception e) {
			e.printStackTrace();
		}
		return -1; // ���� �߰� ����.
	}
	// ���� ����ϱ�
	public int deleteStumap(String id, String lid) {
		String SQL = "delete from lecturestumap where StuID = ? AND lid = ? ";
		try {
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id);
			pstmt.setString(2, lid);
			
			return pstmt.executeUpdate();
		} catch ( Exception e) {
			e.printStackTrace();
		}
		return -1; // ���� ���� ����.
	}
	
}
