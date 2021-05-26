package userDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import adminDAO.DbConnection;
import userDAO.FindIdVO;
import userDAO.FindPassVO;
import userDAO.LoginVO;
import userDAO.MemberVO;
import userDAO.ModifyMemberVO;
import userDAO.PassChangeVO;

public class MemberDAO {
	private static MemberDAO mDAO;
	
	public static MemberDAO getInstance() {
		
		if (mDAO == null) {
			mDAO = new MemberDAO();
		}
		
		return mDAO;
		
	}
	
	private MemberDAO() {
		
	}
	
	public String selectLogin(LoginVO lVO) {
		String name = null;
		
		DbConnection dc = DbConnection.getInstance();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection con = null;
		
		try {
			con = dc.getCon();
			
			String query = "select m_name from member where m_id = ? and m_pass = ?";
			
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, lVO.getId());
			pstmt.setString(2, lVO.getPass());
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				name = rs.getString("m_name");
			}
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			try {
				dc.dbClose(con, pstmt, rs);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return name;
		
	}// end selectLogin
	
	public boolean selectIdCheck(String id) throws SQLException {
		
		boolean chk = false;
		String name = "";
		DbConnection dc = DbConnection.getInstance();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection con = null;
		
		try {
			con = dc.getCon();
			
			String query = "select m_id from member where m_id = ?";
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				name = rs.getString("m_id");
			}
			
		} finally {
			dc.dbClose(con, pstmt, rs);
		}
		
		if ("".equals(name)) {
			chk = true;
		}
		
		return chk;
		
	}// end selectIdCheck
	
	public void insertMember(MemberVO mVO) throws SQLException {
		
		DbConnection dc = DbConnection.getInstance();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection con = null;
		
		try {
			con = dc.getCon();
			
			String query = "insert into member(m_id, m_pass, m_name,"
					+ " m_email, m_telnum, m_zipcode, m_address, m_add_address, m_date) "
					+ "values(?,?,?,?,?,?,?,?,sysdate)";
			
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, mVO.getM_id());
			pstmt.setString(2, mVO.getM_pass());
			pstmt.setString(3, mVO.getM_name());
			pstmt.setString(4, mVO.getM_email());
			pstmt.setString(5, mVO.getM_telnum());
			pstmt.setString(6, mVO.getM_zipcode());
			pstmt.setString(7, mVO.getM_address());
			pstmt.setString(8, mVO.getM_add_address());
			
			pstmt.executeUpdate();
			
		} finally {
			dc.dbClose(con, pstmt, rs);
		}
		
	}//end insertMember
	
	public int updateMember(ModifyMemberVO mmVO) throws SQLException {
		
		int result = 0;
		DbConnection dc = DbConnection.getInstance();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection con = null;
		
		try {
			con = dc.getCon();
			
			StringBuilder sb = new StringBuilder();
			
			sb.append(" update member ")
			.append(" set m_name = ?, m_email = ?, m_telnum = ?, m_zipcode = ?, m_address = ?, m_add_address = ? ")
			.append(" where m_id = ? ");
			
			pstmt = con.prepareStatement(sb.toString());
			
			pstmt.setString(1, mmVO.getM_name());
			pstmt.setString(2, mmVO.getM_email());
			pstmt.setString(3, mmVO.getM_telnum());
			pstmt.setString(4, mmVO.getM_zipcode());
			pstmt.setString(5, mmVO.getM_address());
			pstmt.setString(6, mmVO.getM_add_address());
			pstmt.setString(7, mmVO.getM_id());
			
			result = pstmt.executeUpdate();
			
		} finally {
			dc.dbClose(con, pstmt, rs);
		}
		
		return result;
		
	}//end updateMember
	
	public int deleteMember(String id) throws SQLException {
		
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
		} finally {
			dc.dbClose(con, pstmt, rs);
		}
		
		return result;
		
	}//end deleteMember
	
	public String selectFindId(FindIdVO fiVO) throws SQLException {
		
		String id = null;
		DbConnection dc = DbConnection.getInstance();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection con = null;
		
		try {
			con = dc.getCon();
			
			String query = "select m_id from member where m_name = ? and m_telnum = ?";
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, fiVO.getM_name());
			pstmt.setString(2, fiVO.getM_telnum());
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				id = rs.getString("m_id");
			}
			
		} finally {
			dc.dbClose(con, pstmt, rs);
		}
		
		return id;
	}
	
	public String selectFindPass(FindPassVO fpVO) throws SQLException {
		
		String pass = null;
		DbConnection dc = DbConnection.getInstance();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection con = null;
		
		try {
			con = dc.getCon();
			
			String query = "select m_pass from member where m_id = ? and m_name = ? and m_telnum = ? ";
			
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, fpVO.getM_id());
			pstmt.setString(2, fpVO.getM_name());
			pstmt.setString(3, fpVO.getM_telnum());
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				pass = rs.getString("m_pass");
			}
			
		} finally {
			dc.dbClose(con, pstmt, rs);
		}
		
		return pass;
		
	}//end selectFindPass
	
	public ModifyMemberVO selectMember(String id) throws SQLException {
		
		Context ctx;
		DataSource ds;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ModifyMemberVO mmVO = null;
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
				mmVO = new ModifyMemberVO(rs.getString("m_id"), rs.getString("m_name"), rs.getString("m_email"),
						rs.getString("m_telnum"), rs.getString("m_zipcode"), rs.getString("m_address") ,rs.getString("m_add_address"));
				
			}
			
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (con != null) con.close();
		}
		
		return mmVO;
		
	}//end selectMember
	
	//여기서 매개변수가 비밀번호 뿐만 아니라 아이디도 알고 있어야 해서 LoginVO
	public boolean selectCheckPass(LoginVO lVO) throws SQLException {
		
		boolean flag = false;
		String chkPass = null;
		DbConnection dc = DbConnection.getInstance();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection con = null;
		
		try {
			
			con = dc.getCon();
			String query = "select m_pass from member where m_id = ?";
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, lVO.getId());
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				chkPass = rs.getString("m_pass");
			}
			
			if (chkPass.equals(lVO.getPass())) {
				flag = true;
			}
			
		} finally {
			dc.dbClose(con, pstmt, rs);
		}
		
		return flag;
		
	}//end selectCheckPass
	
	public int updateNewPass(PassChangeVO pcVO) throws SQLException {
		
		int result = 0;
		DbConnection dc = DbConnection.getInstance();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection con = null;
		
		try {
			con = dc.getCon();
			
			String query = "update member set m_pass = ? where m_id = ?";
			
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, pcVO.getNewPass());
			pstmt.setString(2, pcVO.getM_id());
			
			result = pstmt.executeUpdate();
			
		} finally {
			dc.dbClose(con, pstmt, rs);
		}
		
		return result;
		
	}//end updateNewPass
	
}
