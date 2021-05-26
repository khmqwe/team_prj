package adminDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DbConnection {

	private static DbConnection dc;
	
	private DbConnection() {
	}
	
	public static DbConnection getInstance() {
		if (dc == null) {
			dc = new DbConnection();
		}
		
		return dc;
	}
	
	public Connection getCon() throws SQLException {
		
		Connection con = null;
		
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/dbcp");
			con = ds.getConnection();
			
		} catch(NamingException ne) {
			ne.printStackTrace();
		}
		
		return con;
	}
	
	public void dbClose(Connection con, PreparedStatement pstmt, ResultSet rs) throws SQLException {
		
		if (rs != null) rs.close();
		if (pstmt != null) pstmt.close();
		if (con != null) con.close();
	}
}
