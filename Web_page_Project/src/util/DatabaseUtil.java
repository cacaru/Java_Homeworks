package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseUtil {

	public static Connection getConnection() {
		try {
			String URL = "jdbc:mysql://192.168.0.104:3306/PROJECT?serverTimezone=UTC";
			String dbID = "user";
			String dbPw = "1095";
			Class.forName("com.mysql.cj.jdbc.Driver");
			return DriverManager.getConnection(URL , dbID, dbPw);			
		} catch (Exception e) {
			e.printStackTrace();
		}
		//오류 발생시 
		return null;
	}
}
