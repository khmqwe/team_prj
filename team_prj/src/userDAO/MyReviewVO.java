package userDAO;

public class MyReviewVO {
	private String p_name;
	private int r_score;
	private String r_title;
	private String r_date;
	
	public MyReviewVO() {
		
	}

	public MyReviewVO(String p_name, int r_score, String r_title, String r_date) {
		this.p_name = p_name;
		this.r_score = r_score;
		this.r_title = r_title;
		this.r_date = r_date;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public int getR_score() {
		return r_score;
	}

	public void setR_score(int r_score) {
		this.r_score = r_score;
	}

	public String getR_title() {
		return r_title;
	}

	public void setR_title(String r_title) {
		this.r_title = r_title;
	}

	public String getR_date() {
		return r_date;
	}

	public void setR_date(String r_date) {
		this.r_date = r_date;
	}
	
}
