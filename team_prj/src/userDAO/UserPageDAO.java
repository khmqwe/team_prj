package userDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import userDAO.MainVO;
import userDAO.ProductDetailVO;
import userDAO.ProductVO;

public class UserPageDAO {

	private static UserPageDAO upDAO;
	
	private UserPageDAO() {
		
	}
	
public static UserPageDAO getInstance() {
		
		if (upDAO == null) {
			upDAO = new UserPageDAO();
		}//end if
		
		return upDAO;
		
	}//end getInstance

	public List<MainVO>selectMainList(int type)throws SQLException{
		List<MainVO> list = new ArrayList<MainVO>();
		
		DbConnection dc =DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con = dc.getCon();
			StringBuilder sb = new StringBuilder();
			sb.append("select p_thumb_img, p_name, t_type, p_num  ");
			//.append(" from member m, ordering o, product p, product_img pi ")
			//.append(" where (o.m_id = m.m_id) and (o.p_num = p.p_num) and (pi.p_num = p.p_num) and m.m_id = ? ");
			
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setInt(1, type);
			
			rs = pstmt.executeQuery();
			
			MainVO mVO = null;
			int result = 0;
			
			while (rs.next()) {
				mVO = new MainVO(rs.getString(1), rs.getString(2),
						rs.getInt(3), rs.getInt(4));
				
				//result = selectExistReview(mVO.getP_num());
				
				if (result != 0) {
					mVO.setFlag(true);
				}
				
				list.add(mVO);
				result = 0;
			}
			
		} finally {
			dc.dbClose(con, pstmt, rs);
		}
		
		return list;
		
	}//selectMainList
	

	public ProductVO selectProduct(int p_num)throws SQLException {
		
		ProductVO pVO = null;
		
		DbConnection dc = DbConnection.getInstance();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection con = null;
		
		try {
			con = dc.getCon();
			
			StringBuilder sb = new StringBuilder();
			sb.append("select p_name, p_cooktime, p_amount, s_key, p_main_img, p_price ");
			//.append(" from ordering o, product p, product_img pi ")
			//.append(" where (o.p_num = p.p_num) and (pi.p_num = p.p_num) and o.o_num = ? ");
			
			pstmt = con.prepareStatement(sb.toString());
			
			pstmt.setInt(1, p_num);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				pVO = new ProductVO(rs.getString(1), rs.getString(2),rs.getString(3),
						rs.getString(4),rs.getString(5),rs.getInt(6));
			}//end if
		} finally {
			dc.dbClose(con, pstmt, rs);
		}//end finally
		
		return pVO;
		
	}//selectProduct
	
	public List<ProductReviewVO>selectReviewList(int p_num)throws SQLException{
		List<ProductReviewVO> list = new ArrayList<ProductReviewVO>();
		
		DbConnection dc =DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con = dc.getCon();
			StringBuilder sb = new StringBuilder();
			sb.append("select r_title, r_content, r_date, r_score  ");
			//.append(" from member m, ordering o, product p, product_img pi ")
			//.append(" where (o.m_id = m.m_id) and (o.p_num = p.p_num) and (pi.p_num = p.p_num) and m.m_id = ? ");
			
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setInt(1, p_num);
			
			rs = pstmt.executeQuery();
			
			ProductReviewVO prVO = null;
			int result = 0;
			
			while (rs.next()) {
				prVO = new ProductReviewVO(rs.getString(1), rs.getString(2),
						rs.getString(3), rs.getInt(4));
				
				//result = selectExistReview(mVO.getP_num());
				
				if (result != 0) {
					prVO.setFlag(true);
				}//end if
				
				list.add(prVO);
				result = 0;
			}//end while
			
		} finally {
			dc.dbClose(con, pstmt, rs);
		}//end finally
		
		return list;
	}//selectReviewList
	
	public ProductDetailVO selectProductDetail(int p_num)throws SQLException {
			ProductDetailVO pdVO = null;
		
		DbConnection dc = DbConnection.getInstance();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection con = null;
		
		try {
			con = dc.getCon();
			
			StringBuilder sb = new StringBuilder();
			sb.append("select p_detailes_img, p_explain ");
			//.append(" from ordering o, product p, product_img pi ")
			//.append(" where (o.p_num = p.p_num) and (pi.p_num = p.p_num) and o.o_num = ? ");
			
			pstmt = con.prepareStatement(sb.toString());
			
			pstmt.setInt(1, p_num);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				pdVO = new ProductDetailVO(rs.getString(1), rs.getString(2));
			}//end if
		} finally {
			dc.dbClose(con, pstmt, rs);
		}//end finally
		
		return pdVO;
		
	}//selectProductDetail
	
}//class