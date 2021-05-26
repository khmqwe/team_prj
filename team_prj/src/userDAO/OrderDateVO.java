package userDAO;

public class OrderDateVO {
	
	private String m_id;
	private String startDate;
	private String endDate;
	
	public OrderDateVO() {
		
	}

	public OrderDateVO(String m_id, String startDate, String endDate) {
		this.m_id = m_id;
		this.startDate = startDate;
		this.endDate = endDate;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	
}

