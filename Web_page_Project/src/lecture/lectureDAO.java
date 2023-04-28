package lecture;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DatabaseUtil;

public class lectureDAO {
	
	//�������� ��� ��ȯ.
	public ResultSet noticeinfo( String lid ) {
		String SQL = "SELECT no, title, DATE_FORMAT(date, \"%Y.%m.%d\"), content, file, prePerson FROM lectureboard where lid = ? AND division = 1 order by no DESC";
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
	//���ǰԽ��� ��� ��ȯ.
	public ResultSet supportinfo( String lid ) {
		String SQL = "SELECT no, title, DATE_FORMAT(date, \"%Y.%m.%d\"), content, file, prePerson FROM lectureboard where lid = ? AND division = 2 order by no DESC";
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
	
	//���� ��¥�� ��ȯ�ϴ� �Լ�
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			ResultSet rs = pstmt.executeQuery();
			if( rs.next() ) {
				return rs.getString(1);
			}
		} catch ( Exception e) {
			e.printStackTrace();
		}
		return "";// �ҷ����� ����. null�� ��ȯ.
	}
	//�������� ���� �Խñ� ��ȣ ã��
	public int getnoticeNext(String lid) {
		String SQL = "SELECT no from lectureboard where lid = ? AND division = 1 order by no DESC";
		try {
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, lid);
			ResultSet rs = pstmt.executeQuery();
			if( rs.next() ) {
				return rs.getInt(1) + 1;
			}
			return 1; // ù ��° �Խù��� ���
		} catch ( Exception e) {
			e.printStackTrace();
		}
		return -1;// �ҷ����� ����
	}
	//���ǰԽ��� ���� ��ȣ ã��
	public int getcouNext(String lid) {
		String SQL = "SELECT no from lectureboard where lid = ? AND division = 2 order by no DESC";
		try {
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, lid);
			ResultSet rs = pstmt.executeQuery();
			if( rs.next() ) {
				return rs.getInt(1) + 1;
			}
			return 1; // ù ��° �Խù��� ���
		} catch ( Exception e) {
			e.printStackTrace();
		}
		return -1;// �ҷ����� ����
	}

	// �۾���
	public int write( String title, String content , String lid, String file, String prePerson , int division) {
		String SQL = "insert into lectureboard values ( ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, lid);
			if( division == 1 ) {
				pstmt.setInt(2, getnoticeNext(lid));
			} else if ( division == 2) {
				pstmt.setInt(2, getcouNext(lid));
			}
			pstmt.setInt(3, division);
			pstmt.setString(4, title);
			pstmt.setString(5, getDate());
			pstmt.setString(6, content);
			pstmt.setString(7, file);
			pstmt.setInt(8, 1);
			pstmt.setString(9, prePerson );
			
			return pstmt.executeUpdate();
			
		} catch ( Exception e) {
			e.printStackTrace();
		}
		return -1;// �ҷ����� ����
	}
	
	//�������� �Խ��� 
	public ArrayList<lectureboard> getnoticelist(int pageNumber, String lid){
		String SQL = "SELECT no, title, DATE_FORMAT(date, \"%Y.%m.%d\"), content, file, prePerson , available from lectureboard where no < ? AND lid = ? AND division = 1 AND available = 1 order by no desc limit 10";
		ArrayList<lectureboard> list = new ArrayList<lectureboard>();
		try {
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getnoticeNext(lid) - (pageNumber -1 ) * 10);
			pstmt.setString(2, lid);
			ResultSet rs = pstmt.executeQuery();
			while( rs.next() ) {
				lectureboard  lb = new lectureboard();
				lb.setNo(rs.getInt(1));
				lb.setTitle(rs.getString(2));
				lb.setDate(rs.getString(3));
				lb.setContent(rs.getString(4));
				lb.setFile(rs.getString(5));
				lb.setPrePerson(rs.getString(6));
				
				list.add(lb);
			}
		} catch ( Exception e) {
			e.printStackTrace();
		}
		return list; // ���������� 10�������� �ɰ��� �����ֱ�
	}
	//���� �Խ���  
	public ArrayList<lectureboard> getsupportlist(int pageNumber, String lid){
		String SQL = "SELECT no, title, DATE_FORMAT(date, \"%Y.%m.%d\"), content, file, prePerson , available from lectureboard where no < ? AND lid = ? AND division = 2 AND available = 1 order by no desc limit 10";
		ArrayList<lectureboard> list = new ArrayList<lectureboard>();
		try {
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getcouNext(lid) - (pageNumber -1 ) * 10);
			pstmt.setString(2, lid);
			ResultSet rs = pstmt.executeQuery();
			while( rs.next() ) {
				lectureboard  lb = new lectureboard();
				lb.setNo(rs.getInt(1));
				lb.setTitle(rs.getString(2));
				lb.setDate(rs.getString(3));
				lb.setContent(rs.getString(4));
				lb.setFile(rs.getString(5));
				lb.setPrePerson(rs.getString(6));
				
				list.add(lb);
			}
		} catch ( Exception e) {
			e.printStackTrace();
		}
		return list; // �Խ����� 10�������� �ɰ��� �����ֱ�
	}
	//���� ������ ( 10���� ���������� 11��°�� �ִ��� ) �˻� // �������׹���
	public boolean nextnotPage(int pageNumber, String lid) {
		String SQL = "SELECT no, title, DATE_FORMAT(date, \"%Y.%m.%d\"), content, file, prePerson , available from lectureboard where no < ? AND lid = ? AND division = 1 AND available = 1 order by no desc limit 10";
		try {
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getnoticeNext(lid) - (pageNumber -1 ) * 10);
			pstmt.setString(2, lid);
			ResultSet rs = pstmt.executeQuery();
			if( rs.next() ) {
				return true;
			}
		} catch ( Exception e) {
			e.printStackTrace();
		}
		return false; // ���������� 10�������� �ɰ��� �����ֱ�
	}
	//���� ������ ( 10���� ���������� 11��°�� �ִ��� ) �˻� // ���ǰԽ��ǹ���
	public boolean nextsupPage(int pageNumber, String lid) {
		String SQL = "SELECT no, title, DATE_FORMAT(date, \"%Y.%m.%d\"), content, file, prePerson , available from lectureboard where no < ? AND lid = ? AND division = 2 AND available = 1 order by no desc limit 10";
		try {
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getcouNext(lid) - (pageNumber -1 ) * 10);
			pstmt.setString(2, lid);
			ResultSet rs = pstmt.executeQuery();
			if( rs.next() ) {
				return true;
			}
		} catch ( Exception e) {
			e.printStackTrace();
		}
		return false; // ���ǰԽ��� �Խñ��� 10�������� �ɰ��� �����ֱ�
	}
	
	public lectureboard getboard( int no, String lid, int division) {
		String SQL = "SELECT no, title, DATE_FORMAT(date, \"%Y.%m.%d\"), content, file, prePerson , available from lectureboard where no = ? AND lid = ? AND division = ? AND available = 1";
		try {
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, no);
			pstmt.setString(2, lid);
			pstmt.setInt(3, division);
			ResultSet rs = pstmt.executeQuery();
			if( rs.next() ) {
				lectureboard lb = new lectureboard();
				lb.setNo(rs.getInt(1));
				lb.setTitle(rs.getString(2));
				lb.setDate(rs.getString(3));
				lb.setContent(rs.getString(4));
				lb.setFile(rs.getString(5));
				lb.setPrePerson(rs.getString(6));
				return lb;
			}
		} catch ( Exception e) {
			e.printStackTrace();
		}
		return null; // �ش� ���� ���°��...!!
	}
}
