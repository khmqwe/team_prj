package adminDAO;

public class MemberVO {
	private String m_id,m_name,m_email,m_telnum,m_zipcode,m_add_address,m_date,m_memo;
	
	public MemberVO() {
		
	}

	public MemberVO(String m_id, String m_name, String m_email, String m_telnum, String m_zipcode, String m_add_address,
			String m_date, String m_memo) {
		super();
		this.m_id = m_id;
		this.m_name = m_name;
		this.m_email = m_email;
		this.m_telnum = m_telnum;
		this.m_zipcode = m_zipcode;
		this.m_add_address = m_add_address;
		this.m_date = m_date;
		this.m_memo = m_memo;
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

	public String getM_add_address() {
		return m_add_address;
	}

	public void setM_add_address(String m_add_address) {
		this.m_add_address = m_add_address;
	}

	public String getM_date() {
		return m_date;
	}

	public void setM_date(String m_date) {
		this.m_date = m_date;
	}

	public String getM_memo() {
		return m_memo;
	}

	public void setM_memo(String m_memo) {
		this.m_memo = m_memo;
	}
	
}//class
