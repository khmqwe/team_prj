package userDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import adminDAO.DbConnection;

public class ReviewDAO {

	private static ReviewDAO rDAO;
	
	private ReviewDAO() {
		
	}
	
	public static ReviewDAO getInstance() {
		
		if (rDAO == null) {
			rDAO = new ReviewDAO();
		}
		
		return rDAO;
	}
	
	public List<MyReviewVO> selectMyReviewList(String id) throws SQLException {
		
		List<MyReviewVO> list = new ArrayList<MyReviewVO>();
		
		DbConnection dc = DbConnection.getInstance();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection con = null;
		
		try {
			
			con = dc.getCon();
			
			StringBuilder sb = new StringBuilder();
			sb.append("select p_name, r.r_score , r.r_title, r.r_content, r.r_date ")
			.append(" from member m, ordering o, review r, product p ")
			.append(" where   (o.m_id = m.m_id) and (r.o_num = o.o_num) and (o.p_num = p.p_num) and m.m_id = ? ");
			
			pstmt = con.prepareStatement(sb.toString());
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			MyReviewVO mrVO = null;
			
			while (rs.next()) {
				mrVO = new MyReviewVO(rs.getString(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5));
				list.add(mrVO);
			}
		} finally {
			dc.dbClose(con, pstmt, rs);
		}
		
		return list;
		
	}//end selectMyReviewList
	
	public void insertReview(WriteReviewVO wrVO) throws SQLException {
		
		DbConnection dc = DbConnection.getInstance();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection con = null;
		
		try {
			con = dc.getCon();
			
			StringBuilder sb = new StringBuilder();
			sb.append(" insert into review(o_num, r_title, r_content, r_date, r_score) ")
			.append(" values(?,?,?, sysdate,?)");
			
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setInt(1, wrVO.getO_num());
			pstmt.setString(2, wrVO.getR_title());
			pstmt.setString(3, wrVO.getR_content());
			pstmt.setInt(4, wrVO.getR_score());
			
			pstmt.executeUpdate();
			
		} finally {
			dc.dbClose(con, pstmt, rs);
		}
		
	}//end insertReview
	
	public WriteReviewInfoVO selectReview(int o_num) throws SQLException {
		
		WriteReviewInfoVO wriVO = null;
		
		DbConnection dc = DbConnection.getInstance();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection con = null;
		
		try {
			con = dc.getCon();
			
			StringBuilder sb = new StringBuilder();
			sb.append("select p_thumb_img, p.p_name ")
			.append(" from ordering o, product p, product_img pi ")
			.append(" where (o.p_num = p.p_num) and (pi.p_num = p.p_num) and o.o_num = ? ");
			
			pstmt = con.prepareStatement(sb.toString());
			
			pstmt.setInt(1, o_num);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				wriVO = new WriteReviewInfoVO(rs.getString(1), rs.getString(2));
			}
		} finally {
			dc.dbClose(con, pstmt, rs);
		}
		
		return wriVO;
	}
}
