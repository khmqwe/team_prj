package adminDAO;

public class AdminMemberVO {
	private String m_id,m_name,m_date;
	
	public AdminMemberVO() {
		
	}

	public AdminMemberVO(String m_id, String m_name, String m_date) {
		super();
		this.m_id = m_id;
		this.m_name = m_name;
		this.m_date = m_date;
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

	public String getM_date() {
		return m_date;
	}

	public void setM_date(String m_date) {
		this.m_date = m_date;
	}
	
}
	