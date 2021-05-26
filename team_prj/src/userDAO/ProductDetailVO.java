package userDAO;

public class ProductDetailVO {
	private String p_detailes_img,p_explain;
	
	public ProductDetailVO() {
		
	}

	public ProductDetailVO(String p_detailes_img, String p_explain) {
		super();
		this.p_detailes_img = p_detailes_img;
		this.p_explain = p_explain;
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
