package userDAO;

public class ProductDetailVO {
	private String p_details_img,p_explain;
	
	public ProductDetailVO() {
		
	}

	public ProductDetailVO(String p_details_img, String p_explain) {
		this.p_details_img = p_details_img;
		this.p_explain = p_explain;
	}

	public String getP_details_img() {
		return p_details_img;
	}

	public void setP_details_img(String p_details_img) {
		this.p_details_img = p_details_img;
	}

	public String getP_explain() {
		return p_explain;
	}

	public void setP_explain(String p_explain) {
		this.p_explain = p_explain;
	}
	
	
}