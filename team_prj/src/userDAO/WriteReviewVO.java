package userDAO;

public class WriteReviewVO {
	
	private int o_num;
	private String r_title;
	private String r_content;
	private int r_score;
	
	public WriteReviewVO() {
		
	}

	public WriteReviewVO(int o_num, String r_title, String r_content, int r_score) {
		this.o_num = o_num;
		this.r_title = r_title;
		this.r_content = r_content;
		this.r_score = r_score;
	}

	public int getO_num() {
		return o_num;
	}

	public void setO_num(int o_num) {
		this.o_num = o_num;
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

	public int getR_score() {
		return r_score;
	}

	public void setR_score(int r_score) {
		this.r_score = r_score;
	}
	
}
