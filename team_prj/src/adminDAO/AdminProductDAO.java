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

import adminDAO.InfoProductVO;
import adminDAO.MainManagerVO;
import userDAO.MemberDAO;

public class AdminProductDAO {
	
	private static AdminProductDAO pmDAO;
	
	private AdminProductDAO() {
		
	}//AdminMemberDAO
public static AdminProductDAO getInstance() {
		
		if (pmDAO == null) {
			pmDAO = new AdminProductDAO();
		}//end if
		
		return pmDAO;
		
	}//getInstance

	public List<MainManagerVO>selectMainPage(int option,String optionText)throws SQLException{
		List<MainManagerVO>list=new ArrayList<MainManagerVO>();
		
		DbConnection dc =DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con = dc.getCon();
			
			StringBuilder sb = new StringBuilder();
			sb.append("select m_id, m_name , m_date, ");
			
			pstmt = con.prepareStatement(sb.toString());
			
			pstmt.setString(1, optionText);
			
			rs = pstmt.executeQuery();
			
			MainManagerVO mmVO = null;
			
			while (rs.next()) {
			//모르겠음 ㅜㅜ mmVO = new AdminMemberVO(rs.getString(1), rs.getInt(2), rs.getString(3));
				list.add(mmVO);
			}//end while
		}finally {
			dc.dbClose(con, pstmt, rs);
		}//end finally
		return list;
		
	}//selectMainPage
	
	public InfoProductVO selectProduct(String id)throws SQLException {
		
		Context ctx;
		DataSource ds;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		InfoProductVO ipVO = null;
		//2. 이름(name="jdbc/dbcp")을 사용하여 실행 중인 자바 환경에서 객체를 찾는다.
		
		//3. DBCP에서 꺼내온 객체로부터 Connection 얻기
		try {
			ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/dbcp");
			
			con = ds.getConnection();
			
			String selectVO = "select p_num, p_name, p_price, t_type, p_cooktime, p_amount, s_type, p_thumb_img, p_main_img, p_detailes_img, p_explain "
					+ " from product "
					+ " where p_num = ? ";
			pstmt = con.prepareStatement(selectVO);
			//4.바인드변수에 값 할당
			pstmt.setString(1, id);
			//5.쿼리문 수행후 결과 얻기
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				//조회된 컬럼값을 VO에 할당
				ipVO = new InfoProductVO(rs.getString("p_num"), rs.getString("p_name"), rs.getString("p_price"),
						rs.getString("t_type"), rs.getString("p_cooktime"), rs.getString("p_amount") ,rs.getString("s_type"),
						rs.getString("p_thumb_img"), rs.getString("p_main_img"), rs.getString("p_detailes_img"),rs.getString("p_explain"));
				
			}//end if
			
		} catch (NamingException e) {
			e.printStackTrace();
		}  finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (con != null) con.close();
		}
		
		return ipVO;
		
	}//selectProduct
	
	public void insertProduct(InfoProductVO iVO)throws SQLException {
		DbConnection dc = DbConnection.getInstance();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection con = null;
		
		try {
			con = dc.getCon();
			
			String query = "insert into InfoProduct(p_num, p_name, p_price, t_type, p_cooktime"
					+ " p_amount, s_type, p_thumb_img, p_main_img, p_detailes_img, p_explain) "
					+ "values(?,?,?,?,?,?,?,?,?,?,?)";
			
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, iVO.getP_num());
			pstmt.setString(2, iVO.getP_name());
			pstmt.setString(3, iVO.getP_price());
			pstmt.setString(4, iVO.getT_type());
			pstmt.setString(5, iVO.getP_cooktime());
			pstmt.setString(6, iVO.getP_amount());
			pstmt.setString(7, iVO.getS_type());
			pstmt.setString(8, iVO.getP_thumb_img());
			pstmt.setString(9, iVO.getP_main_img());
			pstmt.setString(10, iVO.getP_detailes_img());
			pstmt.setString(11, iVO.getP_explain());
			
			pstmt.executeUpdate();
			
		} finally {
			dc.dbClose(con, pstmt, rs);
		}//end finally
		
	}//insertProduct
	
	public int updateProduct(InfoProductVO iVO)throws SQLException {
		int result = 0;
		DbConnection dc = DbConnection.getInstance();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection con = null;
		
		try {
			con = dc.getCon();
			
			StringBuilder sb = new StringBuilder();
			
			sb.append(" update product ")
			.append(" set p_name = ?, p_price = ?, t_type = ?, p_cooktime = ?, p_amount = ?, s_type = ?, p_thumb_img = ?, p_main_img = ?, p_detailes_img = ?, p_explain = ? ")
			.append(" where p_num = ? ");
			
			pstmt = con.prepareStatement(sb.toString());
			
			pstmt.setString(1, iVO.getP_num());
			pstmt.setString(2, iVO.getP_name());
			pstmt.setString(3, iVO.getP_price());
			pstmt.setString(4, iVO.getT_type());
			pstmt.setString(5, iVO.getP_cooktime());
			pstmt.setString(6, iVO.getP_amount());
			pstmt.setString(7, iVO.getS_type());
			pstmt.setString(8, iVO.getP_thumb_img());
			pstmt.setString(9, iVO.getP_main_img());
			pstmt.setString(10, iVO.getP_detailes_img());
			pstmt.setString(11, iVO.getP_explain());
			
			result = pstmt.executeUpdate();
			
		} finally {
			dc.dbClose(con, pstmt, rs);
		}
		
		return result;
		
	}//updateProduct
	
	public int deleteProduct(String p_num)throws SQLException {
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
			pstmt.setString(10, p_num);
			
			result = pstmt.executeUpdate();
		} finally {
			dc.dbClose(con, pstmt, rs);
		}//end finally
		
		
		return result;
		
	}//deleteProduct
}//class

