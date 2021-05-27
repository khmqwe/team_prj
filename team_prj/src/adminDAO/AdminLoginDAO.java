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
	 * Singleton으로 생성된 instance를 반환하는 일 
	 * @return 하나의 객체 
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
	    	//1.커넥션얻기
				con = dc.getCon(); 
			//2. 쿼리문 생성객체 얻기 
				String selectQuery = "select  * from admin where  a_id = ? and a_pass = ?";
				pstmt = con.prepareStatement(selectQuery);
				
			//3. 바인드변수에 값 할당
				pstmt.setString(1, lVO.id);
				pstmt.setString(2, lVO.pass);
				
			//4. 쿼리문 수행 후 결과 얻기 
				rs = pstmt.executeQuery();
				chk = rs.next();
				
	      } finally {
	    	  dc.dbClose(con, pstmt, rs);
	      }//end finally 
	      
	      
	      return chk;
	}//deleteAdminReview
	
	
}//class
