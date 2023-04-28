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
		return rs;// 불러오기 실패. null값 반환.
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
		return rs;// 불러오기 실패. null값 반환.
	}
	//새로 수강하기
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
		return -1; // 수강 추가 실패.
	}
	// 수강 취소하기
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
		return -1; // 수강 삭제 실패.
	}
	
}
