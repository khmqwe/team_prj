package userDAO;

public class MainVO {
	private String p_thumb_img,p_name;
	private int t_type,p_num;
	
	public MainVO() {
		
	}

	public MainVO(String p_thumb_img, String p_name, int t_type, int p_num) {
		super();
		this.p_thumb_img = p_thumb_img;
		this.p_name = p_name;
		this.t_type = t_type;
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

	public int getT_type() {
		return t_type;
	}

	public void setT_type(int t_type) {
		this.t_type = t_type;
	}

	public int getP_num() {
		return p_num;
	}

	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	
}
