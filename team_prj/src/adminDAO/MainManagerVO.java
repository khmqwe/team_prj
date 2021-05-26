package adminDAO;

public class MainManagerVO {
	private String p_thumb_img,p_name;
	private int p_num;
	
	public MainManagerVO() {
		
	}

	public MainManagerVO(String p_thumb_img, String p_name, int p_num) {
		super();
		this.p_thumb_img = p_thumb_img;
		this.p_name = p_name;
		this.p_num = p_num;
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

	public int getP_num() {
		return p_num;
	}

	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	
}
