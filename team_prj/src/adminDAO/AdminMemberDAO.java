package adminDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import adminDAO.AdminMemberVO;
import adminDAO.MemberVO;
import adminDAO.MemoVO;


public class AdminMemberDAO {
	
	public List<AdminMemberVO>selectAdminMember(int option,String optionText){
		List<AdminMemberVO>mdto=new ArrayList<AdminMemberVO>();
		
		DbConnection dc =DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		return mdto;
		
	}//selectAdminMember
	
	public MemberVO selectAdminMember(String id){
		
		return null;
	}//selectAdminMember
	
	public int updateAdminMember(MemoVO mVO) {
		return 0;
		
	}//updateAdminMember
	
	public int deleteAdminMember(String id) {
		return 0;
		
	}//deleteAdminMember
	
	
	
}//class
