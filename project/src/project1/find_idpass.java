package project1;

import java.sql.Connection;
import java.sql.SQLException;


public class find_idpass {
	private static find_idpass fdp= new find_idpass();

	public static find_idpass getInstance() {
		return fdp;
	}

	private find_idpass() {
	}

	
	
	public String fd(Member member) {
		String a = null;
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			joinDao Dao = joinDao.getInstance();
			a = Dao.findid(conn, member);
			
		} catch (SQLException e) {
		
		} finally {
			JdbcUtil.close(conn);
		}
		return a;
	}
	
	
	public String fp(Member member) {
		String a = null;
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			joinDao Dao = joinDao.getInstance();
			a = Dao.findpass(conn, member);
			
		} catch (SQLException e) {
		
		} finally {
			JdbcUtil.close(conn);
		}
		return a;
	}
	
	
	
	
	
	
	
}
