package userDAO;

public class OrderVO {
	
	private String p_thumb_img;
	private String p_name;
	private int o_cnt;
	private int p_price;
	private String o_date;
	private int o_num;
	private boolean flag;
	
	public OrderVO() {
		
	}

	public OrderVO(String p_thumb_img, String p_name, int o_cnt, int p_price, String o_date, int o_num, boolean flag) {
		this.p_thumb_img = p_thumb_img;
		this.p_name = p_name;
		this.o_cnt = o_cnt;
		this.p_price = p_price;
		this.o_date = o_date;
		this.o_num = o_num;
		this.flag = flag;
	}

	public boolean getFlag() {
		return flag;
	}
	
	public void setFlag(boolean flag) {
		this.flag = flag;
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

	public int getO_cnt() {
		return o_cnt;
	}

	public void setO_cnt(int o_cnt) {
		this.o_cnt = o_cnt;
	}

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public String getO_date() {
		return o_date;
	}

	public void setO_date(String o_date) {
		this.o_date = o_date;
	}

	public int getO_num() {
		return o_num;
	}

	public void setO_num(int o_num) {
		this.o_num = o_num;
	}
	
}
