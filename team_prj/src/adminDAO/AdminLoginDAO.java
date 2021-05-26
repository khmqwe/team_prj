package adminDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import adminDAO.LoginVO;

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
		
		boolean yesorno = false;
		
		 DbConnection dc = DbConnection.getInstance();
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      Connection con = null;
	      
	      try {
	    	//1.Ŀ�ؼǾ��
				con = dc.getCon(); 
			//2. ������ ������ü ��� 
				String selectQuery = "select ";
				pstmt = con.prepareStatement(selectQuery);
				
			//3. ���ε庯���� �� �Ҵ�
				
			//4. ������ ���� �� ��� ��� 
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					
				}//end if 
	      } finally {
	    	  dc.dbClose(con, pstmt, rs);
	      }//end finally 
	      
	      return yesorno;
	}//deleteAdminReview
	
}
