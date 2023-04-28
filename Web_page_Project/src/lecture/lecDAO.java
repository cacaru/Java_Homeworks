package lecture;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DatabaseUtil;

public class lecDAO {

	public ResultSet showlec() {
		String SQL = "SELECT * from lecture ";
		ResultSet rs =null;
		try {
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs =  pstmt.executeQuery();
			return rs;
		} catch ( Exception e) {
			e.printStackTrace();
		}
		return rs;// 불러오기 실패. null값 반환.
	}
	
}
