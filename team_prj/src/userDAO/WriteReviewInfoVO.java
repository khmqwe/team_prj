package userDAO;

public class WriteReviewInfoVO {

	private String p_thumb_img;
	private String p_name;
	
	public WriteReviewInfoVO() {
		
	}

	public WriteReviewInfoVO(String p_thumb_img, String p_name) {
		this.p_thumb_img = p_thumb_img;
		this.p_name = p_name;
	}

	public String getP_thumb_img() {
		return p_thumb_img;
	}

	public void setP_thumb_img(String p_thumb_img) {
		this.p_thumb_img = p_thumb_img;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	
}
