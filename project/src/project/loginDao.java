package project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.cj.protocol.Resultset;

import project1.JdbcUtil;
import project1.DBCPInitListener;

public class loginDao {

		int yes = 0;
	private static loginDao ld = new loginDao();
	ResultSet rs;
	
public static loginDao getInstance() {
	return ld;
}
	
	private loginDao() {
		
	}
	
	
	public int check(Connection conn, login login) throws SQLException {
		PreparedStatement pstmt = null;
		

		
		try {
			
		
			pstmt = conn.prepareStatement("select * from member where id=?");
			pstmt.setString(1, login.getId());
	
			System.out.println(login.getId() + "---------");
			
			rs = pstmt.executeQuery();
			
			
			
			
			if(rs.next()){

                //�븘�씠�뵒 �엳�쓬

                String temp = rs.getString(2);

                if(temp.equals(login.getPass() +"")){
                	System.out.println("理쒖쥌 �넻怨�");
                	return 1;

                }

                else {
                	return -1;
                }
              

			}

			return yes;
			/*pstmt = conn.prepareStatement( "select * from member where memberID=login.getId() and password=login.pass ");
			
			return pstmt.executeUpdate();*/
                
		}  
		 finally {
			JdbcUtil.close(pstmt);
		}
		
	
	
	
	
	
	}
}
