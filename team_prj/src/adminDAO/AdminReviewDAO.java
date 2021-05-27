package adminDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
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
				sb.append(" and m.m_id like '%?%'  " );
				pstmt.setString(1, optionText);
			}else if(option == 1 ){ //���� �������� �˻��� �� 
				sb.append("  r.r_title = '%?%' " );
				pstmt.setString(1, optionText);
			} 
			pstmt = con.prepareStatement(sb.toString());
			
		//4. ������ ���� �� ��� ��� 
			rs = pstmt.executeQuery();
			
			AdminReviewVO arVO = null; 
			
			while(rs.next()) {
				arVO = new AdminReviewVO(rs.getString(1), rs.getString(2), rs.getString(3),rs.getInt(4));
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
				
				sb.append("update review" )
				.append("set  o_num = ?, r_title = ?, r_content = ?, r_date = ?, r_score = ? ")
				.append("where o_num = ? ");
				
				pstmt = con.prepareStatement(sb.toString());
				
				//3. ���ε庯���� �� �Ҵ�
				pstmt.setNull(1, Types.INTEGER);
				pstmt.setNull(2, Types.VARCHAR);
				pstmt.setNull(3, Types.VARCHAR);
				pstmt.setNull(4, Types.DATE);
				pstmt.setNull(5, Types.INTEGER);
				pstmt.setInt(6, o_num);
				
				
			//4. ������ ���� �� ��� ��� 
				rs = pstmt.executeQuery();
	      } finally {
	    	  dc.dbClose(con, pstmt, rs);
	      }//end finally 
	      
	      return chk;
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
				StringBuilder sb = new StringBuilder();
				sb.append("select m.m_id, m.m_name, p.p_name, r.r_score, r.r_date, r.r_title,r.r_content")
				.append("from  member m ,  product p , review r, product_img pi, ordering o")
				.append("where (o.p_num = p.p_num) and (pi.p_num = p.p_num) and o.o_num = ?"); 
				
				pstmt = con.prepareStatement(sb.toString());
				
				//3. ���ε庯���� �� �Ҵ�
				pstmt.setInt(1, o_num);
				
				
				//4. ������ ���� �� ��� ��� 
				rs = pstmt.executeQuery();
				
				
				if (rs.next()) {
					rVO = new ReviewVO(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5)
							,rs.getString(6),rs.getString(7));
				}//end if 
	      } finally {
	         dc.dbClose(con, pstmt, rs);
	      }
	      
	      return rVO;
	}//selectAdminReview
	
}

