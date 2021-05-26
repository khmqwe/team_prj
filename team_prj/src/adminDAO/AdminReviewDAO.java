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
	 * Singleton으로 생성된 instance를 반환하는 일 
	 * @return 하나의 객체 
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
		//1.커넥션얻기
			con = dc.getCon(); 
		//2. 쿼리문 생성객체 얻기 
			String selectQuery = "select ";
			pstmt = con.prepareStatement(selectQuery);
			
		//3. 바인드변수에 값 할당
			
		//4. 쿼리문 수행 후 결과 얻기 
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				
			}//end if 
			
		}finally {
			//5. 연결 끊기
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
	    	//1.커넥션얻기
				con = dc.getCon(); 
			//2. 쿼리문 생성객체 얻기 
				String selectQuery = "delete ";
				pstmt = con.prepareStatement(selectQuery);
				
			//3. 바인드변수에 값 할당
				
			//4. 쿼리문 수행 후 결과 얻기 
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
	    	//1.커넥션얻기
				con = dc.getCon(); 
			//2. 쿼리문 생성객체 얻기 
				String selectQuery = "select ";
				pstmt = con.prepareStatement(selectQuery);
				
			//3. 바인드변수에 값 할당
				
			//4. 쿼리문 수행 후 결과 얻기 
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					
				}//end if 
	      } finally {
	         dc.dbClose(con, pstmt, rs);
	      }
	      
	      return rVO;
	}//selectAdminReview
	
}

