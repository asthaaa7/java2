package model;

public class OrderModel {
	private String Order_Id;
	private String product_id;
	private String email;
	private String total_price;
	

	
	public OrderModel(String Order_Id, String product_id, String email, String total_price) {

		this.Order_Id = Order_Id;
		this.product_id = product_id;
		this.email = email;
		this.total_price = total_price;
	}
	public String getOrderID() {
		return Order_Id;
		
	}
	public void setOrderID(String Order_Id) {
		this.Order_Id = Order_Id;
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
	public String getTotalPrice() {
		return total_price;
	}
	public void setQuantity(String total_price) {
		this.total_price = total_price;
	}
}
