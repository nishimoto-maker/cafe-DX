package bean;

public class Payment implements java.io.Serializable {
	private String menuName;
	private int price;
	private int count;
	private int subtotal;
	
	public String getMenuName() {
		return menuName;
	}
	
	public int getPrice() {
		return price;
	}
	
	public int getCount() {
		return count;
	}
	
	public int getSubtotal() {
		return subtotal;
	}
	
	
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	
	public void setPrice(int price) {
		this.price = price;
	}
	
	public void setCount(int count) {
		this.count = count;
	}
	
	public void setSubtotal(int subtotal) {
		this.subtotal = subtotal;
	}
}