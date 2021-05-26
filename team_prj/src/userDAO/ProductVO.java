package userDAO;

public class ProductVO {
	private String p_name,p_cooktime,p_amount,p_main_img,s_key;
	private int p_price;
	
	public ProductVO() {
		
	}

	public ProductVO(String p_name, String p_cooktime, String p_amount, String p_main_img, String s_key, int p_price) {
		this.p_name = p_name;
		this.p_cooktime = p_cooktime;
		this.p_amount = p_amount;
		this.p_main_img = p_main_img;
		this.s_key = s_key;
		this.p_price = p_price;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_cooktime() {
		return p_cooktime;
	}

	public void setP_cooktime(String p_cooktime) {
		this.p_cooktime = p_cooktime;
	}

	public String getP_amount() {
		return p_amount;
	}

	public void setP_amount(String p_amount) {
		this.p_amount = p_amount;
	}

	public String getP_main_img() {
		return p_main_img;
	}

	public void setP_main_img(String p_main_img) {
		this.p_main_img = p_main_img;
	}

	public String getS_key() {
		return s_key;
	}

	public void setS_key(String s_key) {
		this.s_key = s_key;
	}

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

}
