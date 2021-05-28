package userDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import adminDAO.DbConnection;

public class OrderDAO {
	
	private static OrderDAO oDAO;
	
	private OrderDAO() {
		
	}
	
	public static OrderDAO getInstance() {
		
		if (oDAO == null) {
			oDAO = new OrderDAO();
		}
		
		return oDAO;
	}
	
	public void insertOrder(OrderAllVO oaVO) throws SQLException {
		
		DbConnection dc = DbConnection.getInstance();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection con = null;
		
		try {
			con = dc.getCon();
			StringBuilder sb = new StringBuilder();
			sb.append(" insert into ordering(o_num, m_id, o_cnt, p_num, o_date) ")
			.append(" values(ordering_seq.nextval, ?, ?, ?, sysdate) ");
			
			pstmt = con.prepareStatement(sb.toString());
			
			pstmt.setString(1, oaVO.getM_id());
			pstmt.setInt(2, oaVO.getO_cnt());
			pstmt.setInt(3, oaVO.getP_num());
			
			pstmt.executeUpdate();
			
		} finally {
			dc.dbClose(con, pstmt, rs);
		}
	}
	
	public List<OrderVO> selectOrderList(String id) throws SQLException {
		
		List<OrderVO> list = new ArrayList<OrderVO>();
		
		DbConnection dc = DbConnection.getInstance();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection con = null;
		
		try {
			con = dc.getCon();
			StringBuilder sb = new StringBuilder();
			sb.append("select pi.p_thumb_img, p.p_name, o.o_cnt, p.p_price, o.o_date, o.o_num  ")
			.append(" from member m, ordering o, product p, product_img pi ")
			.append(" where (o.m_id = m.m_id) and (o.p_num = p.p_num) and (pi.p_num = p.p_num) and m.m_id = ? ");
			
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			OrderVO oVO = null;
			int result = 0;
			
			while (rs.next()) {
				oVO = new OrderVO(rs.getString(1), rs.getString(2),
						rs.getInt(3), rs.getInt(4), rs.getString(5), rs.getInt(6), false);
				
				result = selectExistReview(oVO.getO_num());
				
				if (result != 0) {
					oVO.setFlag(true);
				}
				
				list.add(oVO);
				result = 0;
			}
			
			
		} finally {
			dc.dbClose(con, pstmt, rs);
		}
		
		return list;
	}
	
	private int selectExistReview(int o_num) throws SQLException {
		
		int result = 0;
		
		DbConnection dc = DbConnection.getInstance();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection con = null;
		
		try {
			con = dc.getCon();
			
			String query = "select o_num from review where o_num = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, o_num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt("o_num");
			}
			
		} finally {
			dc.dbClose(con, pstmt, rs);
		}
		
		return result;
	}
	
	public List<OrderVO> selectOrderDateList(OrderDateVO odVO) throws SQLException {
		
		List<OrderVO> list = new ArrayList<OrderVO>();
		
		DbConnection dc = DbConnection.getInstance();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection con = null;
		
		try {
			con = dc.getCon();
			
			StringBuilder sb = new StringBuilder();
			sb.append("select pi.p_thumb_img, p.p_name, o.o_cnt, p.p_price, o.o_date, o.o_num ")
			.append(" from member m, ordering o, product p, product_img pi ")
			.append(" where (o.m_id = m.m_id) and (o.p_num = p.p_num) and (pi.p_num = p.p_num) and m.m_id=? ")
			.append(" and o.o_date between to_date(?, 'YYYYMMDD') and to_date(?, 'YYYYMMDD') ");
			
			pstmt = con.prepareStatement(sb.toString());
			
			pstmt.setString(1, odVO.getM_id());
			pstmt.setString(2, odVO.getStartDate());
			pstmt.setString(3, odVO.getEndDate());
			
			rs = pstmt.executeQuery();
			
			OrderVO oVO = null;
			int result = 0;
			
			while (rs.next()) {
				oVO = new OrderVO(rs.getString(1), rs.getString(2),
						rs.getInt(3), rs.getInt(4), rs.getString(5), rs.getInt(6), false);
				
				result = selectExistReview(oVO.getO_num());
				
				if (result != 0) {
					oVO.setFlag(true);
				}
				
				list.add(oVO);
				result = 0;
			}
			
		} finally {
			dc.dbClose(con, pstmt, rs);
		}
		
		return list;
	}
}
