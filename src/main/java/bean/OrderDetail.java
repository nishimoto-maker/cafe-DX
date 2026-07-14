package bean;

import java.sql.Date;

// 注文について詳細を確認するときに使う
public class OrderDetail implements java.io.Serializable {
	private int orderId;
	private Menu menu;
	private Date orderedAt;
	private int count;
	private String tableNum;
	
	// Getter
	public int getOrderId() {
	    return orderId;
	}

	public Menu getMenu() {
		return menu;
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

	public void setMenu(Menu menu) {
		this.menu = menu;
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