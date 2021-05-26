package adminDAO;

public class AdminReviewVO {

	private String m_id, m_name, r_title; 
	private int o_num;
	
	public AdminReviewVO() {
		
	}
	
	public AdminReviewVO(String m_id, String m_name, String r_title, int o_num) {
		this.m_id = m_id;
		this.m_name = m_name;
		this.r_title = r_title;
		this.o_num = o_num;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getR_title() {
		return r_title;
	}
	public void setR_title(String r_title) {
		this.r_title = r_title;
	}
	public int getO_num() {
		return o_num;
	}
	public void setO_num(int o_num) {
		this.o_num = o_num;
	}
	
	
	
}
