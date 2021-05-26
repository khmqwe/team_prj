package adminDAO;

public class InfoProductVO {
	private String p_num,p_name,p_price,t_type,p_cooktime,p_amount,s_type,p_thumb_img,p_main_img,p_detailes_img,p_explain;
	
	
	public InfoProductVO() {
		
	}

	public InfoProductVO(String p_num, String p_name, String p_price, String t_type, String p_cooktime, String p_amount,
			String s_type, String p_thumb_img, String p_main_img, String p_detailes_img, String p_explain) {
		super();
		this.p_num = p_num;
		this.p_name = p_name;
		this.p_price = p_price;
		this.t_type = t_type;
		this.p_cooktime = p_cooktime;
		this.p_amount = p_amount;
		this.s_type = s_type;
		this.p_thumb_img = p_thumb_img;
		this.p_main_img = p_main_img;
		this.p_detailes_img = p_detailes_img;
		this.p_explain = p_explain;
	}

	public String getP_num() {
		return p_num;
	}

	public void setP_num(String p_num) {
		this.p_num = p_num;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_price() {
		return p_price;
	}

	public void setP_price(String p_price) {
		this.p_price = p_price;
	}

	public String getT_type() {
		return t_type;
	}

	public void setT_type(String t_type) {
		this.t_type = t_type;
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

	public String getS_type() {
		return s_type;
	}

	public void setS_type(String s_type) {
		this.s_type = s_type;
	}

	public String getP_thumb_img() {
		return p_thumb_img;
	}

	public void setP_thumb_img(String p_thumb_img) {
		this.p_thumb_img = p_thumb_img;
	}

	public String getP_main_img() {
		return p_main_img;
	}

	public void setP_main_img(String p_main_img) {
		this.p_main_img = p_main_img;
	}

	public String getP_detailes_img() {
		return p_detailes_img;
	}

	public void setP_detailes_img(String p_detailes_img) {
		this.p_detailes_img = p_detailes_img;
	}

	public String getP_explain() {
		return p_explain;
	}

	public void setP_explain(String p_explain) {
		this.p_explain = p_explain;
	}

	
}
