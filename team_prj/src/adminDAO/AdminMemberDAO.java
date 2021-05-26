package adminDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import adminDAO.AdminMemberVO;
import adminDAO.MemberVO;
import adminDAO.MemoVO;


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

	public List<AdminMemberVO>selectAdminMember(int option,String optionText)throws SQLException{
		List<AdminMemberVO>list=new ArrayList<AdminMemberVO>();
		
		
		DbConnection dc =DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con = dc.getCon();
			
			StringBuilder sb = new StringBuilder();
			sb.append("select m_id, m_name , m_date, ");
			//.append();//???????????????????????
			
			pstmt = con.prepareStatement(sb.toString());
			
			pstmt.setString(1, optionText);
			
			rs = pstmt.executeQuery();
			
			AdminMemberVO amVO = null;
			
			while (rs.next()) {
			//모르겠음 ㅜㅜ	amVO = new AdminMemberVO(rs.getString(1), rs.getInt(2), rs.getString(3));
				list.add(amVO);
			}//end while
		}finally {
			dc.dbClose(con, pstmt, rs);
		}//end finally
		
		return list;
		
	}//selectAdminMember
	
	public MemberVO selectAdminMember(String id)throws SQLException{
		Context ctx;
		DataSource ds;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		MemberVO mbVO = null;
		//2. 이름(name="jdbc/dbcp")을 사용하여 실행 중인 자바 환경에서 객체를 찾는다.
		
		//3. DBCP에서 꺼내온 객체로부터 Connection 얻기
		try {
			ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/dbcp");
			
			con = ds.getConnection();
			
			String selectVO = "select m_id, m_name, m_email, m_telnum, m_zipcode, m_address, m_add_address "
					+ " from member "
					+ " where m_id = ? ";
			pstmt = con.prepareStatement(selectVO);
			//4.바인드변수에 값 할당
			pstmt.setString(1, id);
			//5.쿼리문 수행후 결과 얻기
			rs = pstmt.executeQuery();
			
			
			if (rs.next()) {
				//조회된 컬럼값을 VO에 할당
				mbVO = new MemberVO(rs.getString("m_id"), rs.getString("m_name"), rs.getString("m_email"),
						rs.getString("m_telnum"), rs.getString("m_zipcode"), rs.getString("m_address") ,
						rs.getString("m_add_address"),rs.getString("m_memo"));
				
			}//end if
			
		} catch (NamingException e) {
			e.printStackTrace();
		}  finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (con != null) con.close();
		}//end finally
		
		
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
