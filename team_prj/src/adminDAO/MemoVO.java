package adminDAO;

public class MemoVO {
	private String m_memo,m_id;
	
	public MemoVO() {
		
	}

	public MemoVO(String m_memo, String m_id) {
		super();
		this.m_memo = m_memo;
		this.m_id = m_id;
	}

	public String getM_memo() {
		return m_memo;
	}

	public void setM_memo(String m_memo) {
		this.m_memo = m_memo;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	
}
