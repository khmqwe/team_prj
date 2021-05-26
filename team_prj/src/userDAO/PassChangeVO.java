package userDAO;

public class PassChangeVO {
	private String m_id;
	private String oldPass;
	private String newPass;
	
	public PassChangeVO() {
		
	}

	public PassChangeVO(String m_id, String oldPass, String newPass) {
		this.m_id = m_id;
		this.oldPass = oldPass;
		this.newPass = newPass;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getOldPass() {
		return oldPass;
	}

	public void setOldPass(String oldPass) {
		this.oldPass = oldPass;
	}

	public String getNewPass() {
		return newPass;
	}

	public void setNewPas(String newPass) {
		this.newPass = newPass;
	}
	
}
