package adminDAO;

public class ReviewVO {

	private String m_id, m_name, p_name, r_score, r_date, r_title, r_content;

	public ReviewVO() {
		
	}
	
	public ReviewVO(String m_id, String m_name, String p_name, String r_score, String r_date, String r_title, String r_content) {
		this.m_id = m_id;
		this.m_name = m_name;
		this.p_name = p_name;
		this.r_score = r_score;
		this.r_date = r_date;
		this.r_title = r_title;
		this.r_content = r_content;
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

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getR_score() {
		return r_score;
	}

	public void setR_score(String r_score) {
		this.r_score = r_score;
	}

	public String getR_date() {
		return r_date;
	}

	public void setR_date(String r_date) {
		this.r_date = r_date;
	}

	public String getR_title() {
		return r_title;
	}

	public void setR_title(String r_title) {
		this.r_title = r_title;
	}

	public String getR_content() {
		return r_content;
	}

	public void setR_content(String r_content) {
		this.r_content = r_content;
	}

	
}
