package adminDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import adminDAO.AdminReviewVO;
import adminDAO.ReviewVO;

public class AdminReviewDAO {

	private static AdminReviewDAO arDAO;
	
	private AdminReviewDAO() {
		
	}//AdminReviewDAO
	
	/**
	 * Singleton���� ������ instance�� ��ȯ�ϴ� �� 
	 * @return �ϳ��� ��ü 
	 */
	public static AdminReviewDAO getInstance() {
		if(arDAO == null) {
			arDAO = new AdminReviewDAO();
		}//end if 
		
		return arDAO;
	}//getInstance
	
	public List<AdminReviewVO> selectAdminReview(int option, String optionText)throws SQLException{
		
		List<AdminReviewVO> list = new ArrayList<AdminReviewVO>();
		
		DbConnection dc=DbConnection.getInstance();
		PreparedStatement pstmt = null; 
		ResultSet rs= null; 
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
			
		}finally {
			//5. ���� ����
			 dc.dbClose(con, pstmt, rs);
		}//end finally
		
		return list;
	}//selectAdminReview
	
	public boolean deleteAdminReview(int o_num) throws SQLException {
		
		boolean yesorno = false;
		
		 DbConnection dc = DbConnection.getInstance();
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      Connection con = null;
	      
	      try {
	    	//1.Ŀ�ؼǾ��
				con = dc.getCon(); 
			//2. ������ ������ü ��� 
				String selectQuery = "delete ";
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
	
	public ReviewVO selectAdminReview(int o_num) throws SQLException{
		
		 ReviewVO rVO = null;
		
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
	      }
	      
	      return rVO;
	}//selectAdminReview
	
}

