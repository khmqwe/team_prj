package adminDAO;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import adminDAO.InfoProductVO;
import adminDAO.MainManagerVO;
import userDAO.MemberDAO;

public class AdminProductDAO {
	
	private static AdminProductDAO apDAO;
	
	public static AdminProductDAO getInstance() {
		
		if (apDAO == null) {
			apDAO = new AdminProductDAO();
		}
		
		return apDAO;
		
	}//getInstance
	
	
	public List<MainManagerVO>selectMainPage(int option,String optionText){
		
		return null;
		
	}
	
	public InfoProductVO selectProduct(String p_num) throws SQLException {
		InfoProductVO ipVO=null;
		
		DbConnection dc= DbConnection.getInstance();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Connection con=null;
		
		try {
		con=dc.getCon();
		
		String query="select p.P_NUM, p.P_NAME, p.P_PRICE, p.P_COOKTIME,p. P_AMOUNT, p.P_EXPLAIN, p.S_TYPE, p.T_TYPE, "
				+ "pi.P_THUMB_IMG, pi.P_MAIN_IMG, pi.P_DETAILS_IMG "
				+ "from PRODUCT p,PRODUCT_IMG pi "
				+ "where  p.P_NUM=pi.P_NUM and p.P_NUM=?";
		pstmt=con.prepareStatement(query);
		pstmt.setString(1,p_num);
		
		rs=pstmt.executeQuery();
		
		if(rs.next()) {
			ipVO=new InfoProductVO(rs.getString("P_NUM"), rs.getString("P_NAME"), rs.getString("P_PRICE"),
					rs.getString("P_COOKTIME"), rs.getString("P_AMOUNT"), rs.getString("P_EXPLAIN"),
					rs.getString("S_TYPE"),rs.getString("T_TYPE"), 
					rs.getString("P_THUMB_IMG"), rs.getString("P_MAIN_IMG"), rs.getString("P_DETAILS_IMG"));
		}
			
		}finally {
			try {
				dc.dbClose(con, pstmt, rs);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return ipVO;
		
	}//selectProduct
	
	public void insertProduct(InfoProductVO IVO) {
		
	}//insertProduct
	
	public int updateProduct(InfoProductVO lVO) {
		return 0;
		
	}//updateProduct
	
	public int deleteProduct(String p_num) {
		return 0;
		
	}
		
	
}//class


