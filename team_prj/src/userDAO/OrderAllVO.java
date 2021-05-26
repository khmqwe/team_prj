package userDAO;

public class OrderAllVO {

	private String m_id;
	private int p_num;
	private int o_cnt;
	
	public OrderAllVO() {
		
	}

	public OrderAllVO(String m_id, int p_num, int o_cnt) {
		this.m_id = m_id;
		this.p_num = p_num;
		this.o_cnt = o_cnt;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public int getP_num() {
		return p_num;
	}

	public void setP_num(int p_num) {
		this.p_num = p_num;
	}

	public int getO_cnt() {
		return o_cnt;
	}

	public void setO_cnt(int o_cnt) {
		this.o_cnt = o_cnt;
	}
	
}
