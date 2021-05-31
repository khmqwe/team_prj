package adminDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;


public class AdminMemberDAO {
	private static AdminMemberDAO amDAO;
	
	private AdminMemberDAO() {
		
	}//AdminMemberDAO
public static AdminMemberDAO getInstance() {
		
		if (amDAO == null) {
			amDAO = new AdminMemberDAO();
		}//end if
		
		return amDAO;
		
	}//getInstance

	public List<AdminMemberVO>selectAdminMember_list(int option,String optionText)throws SQLException{
		List<AdminMemberVO>list=new ArrayList<AdminMemberVO>();
		
		
		DbConnection dc =DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con = dc.getCon();
			
			StringBuilder sb = new StringBuilder();
			sb.append("select m_id, m_name , m_date ")
			.append("  from  member ");
			
			if (option == 1) {
				sb.append(" where m_id like '%' || ? || '%' ");
			} else if (option == 2) {
				sb.append(" where m_name like '%' || ? || '%' ");
			}
			
			pstmt = con.prepareStatement(sb.toString());
			
			if (option == 1 || option == 2) {
				pstmt.setString(1, optionText);
			}
			
			rs = pstmt.executeQuery();
			
			AdminMemberVO amVO = null;
			
			while (rs.next()) {
				if (rs.getString(2) != null) {
					amVO = new AdminMemberVO(rs.getString(1), rs.getString(2), rs.getString(3));
					list.add(amVO);
				}
			}//end while
		}finally {
			dc.dbClose(con, pstmt, rs);
		}//end finally
		
		return list;
		
	}//selectAdminMember
	
	public MemberVO selectAdminMember(String id)throws SQLException{
		 DbConnection dc = DbConnection.getInstance();
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      Connection con = null;
		
		MemberVO mbVO = null;
		//2. �̸�(name="jdbc/dbcp")�� ����Ͽ� ���� ���� �ڹ� ȯ�濡�� ��ü�� ã�´�.
		
		//3. DBCP���� ������ ��ü�κ��� Connection ���
		try {
			con = dc.getCon(); 
			StringBuilder sb = new StringBuilder();
			
			sb.append( "select m_id, m_name, m_email, m_telnum, m_zipcode, m_address, m_add_address, m_memo   ")
			   .append("from member  ")
			    .append("where m_id = ? " );
			
			pstmt = con.prepareStatement(sb.toString());
			//4.���ε庯���� �� �Ҵ�
			pstmt.setString(1, id);
			//5.������ ������ ��� ���
			rs = pstmt.executeQuery();
			
			
			if (rs.next()) {
				//��ȸ�� �÷����� VO�� �Ҵ�
				mbVO = new MemberVO(rs.getString("m_id"), rs.getString("m_name"), rs.getString("m_email"),
						rs.getString("m_telnum"), rs.getString("m_zipcode"), rs.getString("m_address") ,
						rs.getString("m_add_address"),rs.getString("m_memo"));
				
			}//end if
			
		} finally {
	         dc.dbClose(con, pstmt, rs);
	      }
	      
	      return mbVO;
	}//selectAdminMember
	
	public int updateAdminMember(MemoVO mVO)throws SQLException {
		int result = 0;
		DbConnection dc = DbConnection.getInstance();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection con = null;
		
		try {
			con=dc.getCon();
			
			String query = "update member set m_memo = ? where m_id = ?";
			
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, mVO.getM_memo());
			pstmt.setString(2, mVO.getM_id());
			
			result = pstmt.executeUpdate();
			
		}finally {
			dc.dbClose(con, pstmt, rs);
		}//end finally
		return result;
		
	}//updateAdminMember
	
	public int deleteAdminMember(String id)throws SQLException {
		int result = 0;
		DbConnection dc = DbConnection.getInstance();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection con = null;
		
		try {
			con = dc.getCon();
			
			StringBuilder sb = new StringBuilder();
			
			sb.append(" update member ")
			.append(" set m_name = ?, m_pass = ?, m_email = ?, m_telnum = ?, m_zipcode = ?, m_address = ?, m_add_address = ?, m_date = ?, m_memo = ? ")
			.append(" where m_id = ? ");
			
			pstmt = con.prepareStatement(sb.toString());
			
			pstmt.setNull(1, Types.VARCHAR);
			pstmt.setNull(2, Types.VARCHAR);
			pstmt.setNull(3, Types.VARCHAR);
			pstmt.setNull(4, Types.VARCHAR);
			pstmt.setNull(5, Types.VARCHAR);
			pstmt.setNull(6, Types.VARCHAR);
			pstmt.setNull(7, Types.VARCHAR);
			pstmt.setNull(8, Types.VARCHAR);
			pstmt.setNull(9, Types.VARCHAR);
			pstmt.setString(10, id);
			
			result = pstmt.executeUpdate();
			
			
		}finally {
			dc.dbClose(con, pstmt, rs);
		}//end finally
		
		return result;
	}//deleteAdminMember
	
}//class
