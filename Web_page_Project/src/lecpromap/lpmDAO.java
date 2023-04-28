package lecpromap;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DatabaseUtil;

public class lpmDAO {

	//교수 ID 불러오는 함수
	public String returnProID(String lid) {
		String SQL = "SELECT ProID from lecturepromap where lid = ? ";
		ResultSet rs = null;
		try {
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, lid);
			rs =  pstmt.executeQuery();
			if ( rs.next() ) {
				return rs.getString(1);
			}
		} catch ( Exception e) {
			e.printStackTrace();
		}
		return null;// 불러오기 실패. null값 반환.
	}
}
