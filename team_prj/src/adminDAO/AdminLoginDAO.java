package adminDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminLoginDAO {
	
	private static AdminLoginDAO alDAO;
	
	private AdminLoginDAO() {
		
	}
	
	/**
	 * Singleton���� ������ instance�� ��ȯ�ϴ� �� 
	 * @return �ϳ��� ��ü 
	 */
	public static AdminLoginDAO getInstance() {
		if(alDAO == null) {
			alDAO = new AdminLoginDAO();
		}//end if 
		
		return alDAO;
	}//getInstance
	
	public boolean selectLogin(LoginVO lVO) throws SQLException {
		
		boolean chk = false;
		
		 DbConnection dc = DbConnection.getInstance();
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      Connection con = null;
	      
	      try {
	    	//1.Ŀ�ؼǾ��
				con = dc.getCon(); 
			//2. ������ ������ü ��� 
				String selectQuery = "select  * from admin where  a_id = ? and a_pass = ?";
				pstmt = con.prepareStatement(selectQuery);
				
			//3. ���ε庯���� �� �Ҵ�
				pstmt.setString(1, lVO.id);
				pstmt.setString(2, lVO.pass);
				
			//4. ������ ���� �� ��� ��� 
				rs = pstmt.executeQuery();
				chk = rs.next();
				
	      } finally {
	    	  dc.dbClose(con, pstmt, rs);
	      }//end finally 
	      
	      
	      return chk;
	}//deleteAdminReview
	
	
}//class
