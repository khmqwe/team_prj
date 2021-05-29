package adminDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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

	         StringBuilder sb = new StringBuilder();

	         sb.append(" select m.m_id , m.m_name, r.r_title, o.o_num ")
	         .append(" from member m, review r, ordering o ")
	         .append(" where (o.m_id=m.m_id) and (r.o_num = o.o_num) ");

	         //3. ���ε庯���� �� �Ҵ�

	         if(option == 0 ) { // id�� �˻��� �� 

	            sb.append(" and m.m_id like '%' || ? || '%' " );

	         }else if(option == 1 ){ //���� �������� �˻��� �� 
	            sb.append(" and r.r_title like '%' || ? || '%' " );
	         }
	         pstmt = con.prepareStatement(sb.toString());
	         
	         if (option == 1 || option == 0) {
	            pstmt.setString(1, optionText);
	         }
	         
	      //4. ������ ���� �� ��� ��� 

	         rs = pstmt.executeQuery();
	         AdminReviewVO arVO = null; 
	         
	         while(rs.next()) {
	            arVO = new AdminReviewVO(rs.getString("m_id"), rs.getString("m_name"), 
	            		rs.getString("r_title"),rs.getInt("o_num"));

	            list.add(arVO);
	         }

	      }finally {
	         //5. ���� ����
	          dc.dbClose(con, pstmt, rs);
	      }//end finally      
	      
	      return list;
	   }//selectAdminReview   
	
	public boolean deleteAdminReview(int o_num) throws SQLException {
		
		boolean chk = false;
		
		 DbConnection dc = DbConnection.getInstance();
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      Connection con = null;
	      
	      try {
	    	//1.Ŀ�ؼǾ��
				con = dc.getCon(); 
			//2. ������ ������ü ��� 
				StringBuilder sb = new StringBuilder();
				
				sb.append("delete from review  " )
				.append("where  o_num = ?  ");
				
				pstmt = con.prepareStatement(sb.toString());
				
				//3. ���ε庯���� �� �Ҵ�
				pstmt.setInt(1, o_num);
				
				
			//4. ������ ���� �� ��� ��� 
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					chk = true;
				}
				
	      
	      } finally {
	    	  dc.dbClose(con, pstmt, rs);
	      }//end finally 
	      
	      return chk;
	}//deleteAdminReview
	
	public ReviewVO selectAdminReviewPage(int o_num) throws SQLException{
		ReviewVO rVO = null;
		
		  DbConnection dc = DbConnection.getInstance();
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      Connection con = null;
	      
	      try {
	    	//1.Ŀ�ؼǾ��
				con = dc.getCon(); 
			//2. ������ ������ü ��� 
				StringBuilder sb = new StringBuilder();
				sb.append("select  m.m_id,m. m_name,p.p_name,r.r_score, r.r_date, r.r_title, r.r_content ")
				.append("from REVIEW r,ORDERING o,member m,product p ")
				.append("where r.o_num=o.o_num and o.m_id=m.m_id and o.p_num=p.p_num " )
				.append("and o.o_num=?");
				
				pstmt = con.prepareStatement(sb.toString());
				
				//3. ���ε庯���� �� �Ҵ�
				pstmt.setInt(1,o_num);
				
				
				//4. ������ ���� �� ��� ��� 
				rs = pstmt.executeQuery();
				
				
				if (rs.next()) {
					rVO = new ReviewVO(rs.getString("m_id"),rs.getString("m_name"),rs.getString("p_name"),
									rs.getString("r_score"),rs.getString("r_date"),
									rs.getString("r_title"),rs.getString("r_content"));
				}//end if 
	      } finally {
	         dc.dbClose(con, pstmt, rs);
	      }
	      
	      return rVO;
	}//selectAdminReview
	
}

