package userDAO;

public class FindPassVO {
	
	private String m_id;
	private String m_name;
	private String m_telnum;
	
	public FindPassVO() {
		
	}

	public FindPassVO(String m_id, String m_name, String m_telnum) {
		this.m_id = m_id;
		this.m_name = m_name;
		this.m_telnum = m_telnum;
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

	public String getM_telnum() {
		return m_telnum;
	}

	public void setM_telnum(String m_telnum) {
		this.m_telnum = m_telnum;
	}
	
}
