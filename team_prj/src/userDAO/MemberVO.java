package userDAO;

public class MemberVO {
	
	private String m_id;
	private String m_pass;
	private String m_name;
	private String m_email;
	private String m_telnum;
	private String m_zipcode;
	private String m_address;
	private String m_add_address;
	
	public MemberVO() {
		
	}

	public MemberVO(String m_id, String m_pass, String m_name, String m_email, String m_telnum, String m_zipcode,
			String m_address, String m_add_address) {
		this.m_id = m_id;
		this.m_pass = m_pass;
		this.m_name = m_name;
		this.m_email = m_email;
		this.m_telnum = m_telnum;
		this.m_zipcode = m_zipcode;
		this.m_address = m_address;
		this.m_add_address = m_add_address;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_pass() {
		return m_pass;
	}

	public void setM_pass(String m_pass) {
		this.m_pass = m_pass;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_telnum() {
		return m_telnum;
	}

	public void setM_telnum(String m_telnum) {
		this.m_telnum = m_telnum;
	}

	public String getM_zipcode() {
		return m_zipcode;
	}

	public void setM_zipcode(String m_zipcode) {
		this.m_zipcode = m_zipcode;
	}

	public String getM_address() {
		return m_address;
	}

	public void setM_address(String m_address) {
		this.m_address = m_address;
	}

	public String getM_add_address() {
		return m_add_address;
	}

	public void setM_add_address(String m_add_address) {
		this.m_add_address = m_add_address;
	}
	
}
