package project;


import java.sql.Connection;
import java.sql.SQLException;
import project1.DBCPInitListener;
import project1.ConnectionProvider;
import project1.JdbcUtil;


public class loginService {
	int a ;
	private static loginService ls = new loginService();
	
	public static loginService getInstance() {
		return ls;
	}
	
	private loginService() {
		
	}
	
	public int check(login login) {
		Connection conn = null; 
		try {
	
		conn = ConnectionProvider.getConnection();
		loginDao Dao = loginDao.getInstance();
		a = Dao.check(conn, login);
			System.out.println(a + "   a");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			JdbcUtil.close(conn);
		}
		return a;
	}
	
	
	
}
