package project1;

import java.sql.Connection;
import java.sql.SQLException;


public class joinService {
	
	private static joinService ser = new joinService();

	public static joinService getInstance() {
		return ser;
	}

	private joinService() {
	}

	
	
	public int joinservice(Member member) {
		System.out.println("1111");
		int a =0;
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			joinDao Dao = joinDao.getInstance();
			a = Dao.insert(conn, member);
			return a;
		} catch (SQLException e) {
		
		} finally {
			JdbcUtil.close(conn);
		}
		return a;
	}
	
	public int joincheck(String idd) {
		int a = 0;
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			joinDao Dao = joinDao.getInstance();
			 a = Dao.check(conn, idd);	
			
		} catch (SQLException e) {
		
		} finally {
			JdbcUtil.close(conn);
		}
		return a;
	}
	



}
	
	
	

