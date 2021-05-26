package userDAO;

public class ProductReviewVO {
	private String r_title,r_content,r_date;
	private int r_score;
	
	public ProductReviewVO() {
		
	}

	public ProductReviewVO(String r_title, String r_content, String r_date, int r_score) {
		super();
		this.r_title = r_title;
		this.r_content = r_content;
		this.r_date = r_date;
		this.r_score = r_score;
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

	public String getR_date() {
		return r_date;
	}

	public void setR_date(String r_date) {
		this.r_date = r_date;
	}

	public int getR_score() {
		return r_score;
	}

	public void setR_score(int r_score) {
		this.r_score = r_score;
	}
	
}
