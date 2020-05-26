package project1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class joinDao {
	// int yes = 0;
	ResultSet rs;

	private static joinDao Dao = new joinDao();

	public static joinDao getInstance() {
		return Dao;
	}

	private joinDao() {
	}

	public String findid(Connection conn, Member member) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("select * from member where id=?");
			pstmt.setString(1, member.getNum() + "");

			rs = pstmt.executeQuery();
			if (rs.next()) {

				String temp = rs.getString(3);

				if (temp.equals(member.getName())) {
					temp = rs.getString(1);
					return temp ;

				}

				else {
					return "-1";
				}

			}

		}

		finally {
			JdbcUtil.close(pstmt);
		}
		return "0";

	}

	public String findpass(Connection conn, Member member) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("select * from member where id=?");
			pstmt.setString(1, member.getNum() + "");

			rs = pstmt.executeQuery();
			if (rs.next()) {

				String temp = rs.getString(3);
				String temp2 = rs.getString(1);
				
				if (temp.equals(member.getName()) && temp2.equals(member.getId())) {
					temp = rs.getString(2);
					System.out.println("鍮꾨�踰덊샇李얘린 �꽦怨�");
					return temp ;

				}

				else {
					return "-1";
				}

			}

		}

		finally {
			JdbcUtil.close(pstmt);
		}
		return "0";

	}

	public int insert(Connection conn, Member member) throws SQLException {
		System.out.println("�쉶�썝媛��엯");
		PreparedStatement pstmt = null;
		int a = 0;
		try {
			pstmt = conn.prepareStatement(
					"insert into member " + "( id, pw, name, num, phone) values (?,?,?,?)");
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPassword() + "");
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getNum() + "");
			pstmt.setString(5, member.getPhone() + "");

			pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("�쉶�썝媛��엯 �떎�뙣");
			return 1;
		} finally {
			JdbcUtil.close(pstmt);
		}
		return 0;
	}

	public int check(Connection conn, String idd) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("select * from member where id=?");
			pstmt.setString(1, idd);

			System.out.println(idd);

			rs = pstmt.executeQuery();

			if (rs.next()) {
		
				return -1;
			}

			else {
	
				return 1;
			}

		} finally {
			JdbcUtil.close(pstmt);
		}
	}

	
	public Member memberid(String id) throws SQLException {
		 PreparedStatement pstmt = null;
		 Connection conn = null;
		 Member bean = new Member();
		try {
			
			
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement("select * from member where id=?");
			pstmt.setString(1, id);

			

			rs = pstmt.executeQuery();

			if (rs.next()) {
		
				bean.setNum(rs.getInt(4));
				bean.setName(rs.getString(3));
				
				return bean;
				
				
			}


		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(pstmt);
		}
		return bean;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
