package model;

public class CartModel {
	
	private String product_id;
	private String email;
	private String quantity;
	

	
	public CartModel(String product_id, String email, String quantity) {
		this.product_id = product_id;
		this.email = email;
		this.quantity = quantity;
		
		

	}
	
	public String getProductID() {
		return product_id;
	}
	public void setProductName(String product_id) {
		this.product_id = product_id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	
}