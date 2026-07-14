package bean;

import java.sql.Date;

// 注文について詳細を確認するときに使う
public class OrderDetail implements java.io.Serializable {
	private int orderId;
	private String menuId;
	private String menuName;
	private int price;
	private Date orderedAt;
	private int count;
	private String tableNum;
	
	// Getter
	public int getOrderId() {
	    return orderId;
	}

	public String getMenuId() {
	    return menuId;
	}

	public String getMenuName() {
	    return menuName;
	}

	public int getPrice() {
	    return price;
	}

	public Date getOrderedAt() {
	    return orderedAt;
	}

	public int getCount() {
	    return count;
	}

	public String getTableNum() {
	    return tableNum;
	}

	// Setter
	public void setOrderId(int orderId) {
	    this.orderId = orderId;
	}

	public void setMenuId(String menuId) {
	    this.menuId = menuId;
	}

	public void setMenuName(String menuName) {
	    this.menuName = menuName;
	}

	public void setPrice(int price) {
	    this.price = price;
	}

	public void setOrderedAt(Date orderedAt) {
	    this.orderedAt = orderedAt;
	}

	public void setCount(int count) {
	    this.count = count;
	}

	public void setTableNum(String tableNum) {
	    this.tableNum = tableNum;
	}
	
}