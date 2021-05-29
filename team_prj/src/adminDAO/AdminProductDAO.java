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
			sb.append("select p_thumb_img, p_name, p.p_num ")
			.append("  from  product_img pi, product p")
			.append(" where (pi.p_num = p.p_num) ");
			
			if (option == 1) {
				sb.append(" and p.p_name like '%' || ? || '%' ");
			} else if (option == 2) {
				sb.append(" and p.p_num=? ");
				
			}
			pstmt = con.prepareStatement(sb.toString());
			
			if (option == 1 || option == 2) {
				pstmt.setString(1, optionText);
			}
			
			rs = pstmt.executeQuery();
			
			MainManagerVO mmVO = null;
			
			while (rs.next()) {
			mmVO = new MainManagerVO(rs.getString(1), rs.getString(2), rs.getInt(3));
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
		//2. �̸�(name="jdbc/dbcp")�� ����Ͽ� ���� ���� �ڹ� ȯ�濡�� ��ü�� ã�´�.
		
		//3. DBCP���� ������ ��ü�κ��� Connection ���
		try {
			ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/dbcp");
			
			con = ds.getConnection();
			
			String selectVO = "select p.p_num, p_name, p_price, p.t_type, p_cooktime, p_amount, s_type, p_thumb_img, p_main_img, p_details_img, p_explain "
					+ " from product p, product_img pi, type t "
					+ " where p.P_NUM = pi.P_NUM AND t.T_TYPE = p.T_TYPE AND p_num = ? ";
			pstmt = con.prepareStatement(selectVO);
			//4.���ε庯���� �� �Ҵ�
			pstmt.setString(1, id);
			//5.������ ������ ��� ���
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				//��ȸ�� �÷����� VO�� �Ҵ�
				ipVO = new InfoProductVO(rs.getString("p_num"), rs.getString("p_name"),rs.getString("p_img_num"), rs.getString("p_price"),
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
			
			/*
			 * String query =
			 * "insert into Product(p_num, p_name, p_price, t_type, p_cooktime," +
			 * " p_amount, s_type, p_thumb_img, p_main_img, p_details_img, p_explain) " +
			 * "values(?,?,?,?,?,?,?,?,?,?,?)";
			 */
			String query =
			"insert into Product(p_num, p_name, p_price, t_type, p_cooktime," +
		    " p_amount, s_type, p_explain) " +
		    "values(?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, iVO.getP_num());
			pstmt.setString(2, iVO.getP_name());
			pstmt.setString(3, iVO.getP_price());
			pstmt.setString(4, iVO.getT_type());
			pstmt.setString(5, iVO.getP_cooktime());
			pstmt.setString(6, iVO.getP_amount());
			pstmt.setString(7, iVO.getS_type());
			pstmt.setString(8, iVO.getP_explain());
			
			pstmt.executeUpdate();
			dc.dbClose(con, pstmt, rs);
			
			query = "insert into Product_img( p_num, p_img_num, p_thumb_img, p_main_img, p_details_img)"
					+ "values(?,?,?,?,?)";
			
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, iVO.getP_num());
			pstmt.setString(2, iVO.getP_img_num());
			pstmt.setString(3, iVO.getP_thumb_img());
			pstmt.setString(4, iVO.getP_main_img());
			pstmt.setString(5, iVO.getP_details_img());
	
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
			.append(" set p_name = ?, p_price = ?, t_type = ?, p_cooktime = ?, p_amount = ?, s_type = ?, p_explain = ? ")
			.append(" where p_num = ? ");
			
			pstmt = con.prepareStatement(sb.toString());
			
			pstmt.setString(1, iVO.getP_name());
			pstmt.setString(2, iVO.getP_price());
			pstmt.setString(3, iVO.getT_type());
			pstmt.setString(4, iVO.getP_cooktime());
			pstmt.setString(5, iVO.getP_amount());
			pstmt.setString(6, iVO.getS_type());
			pstmt.setString(7, iVO.getP_explain());
			pstmt.setString(8, iVO.getP_num());
			
			result = pstmt.executeUpdate();
			dc.dbClose(con, pstmt, rs);
			
			sb.append(" update product_img ")
			.append(" set p_thumb_img = ?, p_main_img = ?, p_details_img = ? ")
			.append(" where p_num = ? ");
			
			pstmt = con.prepareStatement(sb.toString());
			
			pstmt.setString(1, iVO.getP_thumb_img());
			pstmt.setString(2, iVO.getP_main_img());
			pstmt.setString(3, iVO.getP_details_img());
			pstmt.setString(4, iVO.getP_num());
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
			
			sb.append(" update product ")
			.append(" set  p_name = ?, p_price = ?, t_type = ?, p_cooktime = ?, p_amount = ?, s_type = ?, p_explain = ? ")
			.append(" where p_num = ? ");
			
			pstmt = con.prepareStatement(sb.toString());
			
			pstmt.setNull(1, Types.VARCHAR);
			pstmt.setNull(2, Types.VARCHAR);
			pstmt.setNull(3, Types.VARCHAR);
			pstmt.setNull(4, Types.VARCHAR);
			pstmt.setNull(5, Types.VARCHAR);
			pstmt.setNull(6, Types.VARCHAR);
			pstmt.setNull(7, Types.VARCHAR);
			pstmt.setString(8, p_num);
			
			result = pstmt.executeUpdate();
			dc.dbClose(con, pstmt, rs);
			
			sb.append(" update product_img ")
			.append(" set  p_thumb_img = ?, p_main_img = ?, p_details_img =? ")
			.append(" where p_num = ? ");
			
			pstmt = con.prepareStatement(sb.toString());
			
			pstmt.setNull(1, Types.VARCHAR);
			pstmt.setNull(2, Types.VARCHAR);
			pstmt.setNull(3, Types.VARCHAR);
			pstmt.setString(4, p_num);
			
		} finally {
			
			dc.dbClose(con, pstmt, rs);
		}//end finally
		
		
		return result;
		
	}//deleteProduct
}//class

