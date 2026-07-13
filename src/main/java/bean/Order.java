package bean;

import java.sql.Date;

// 注文テーブルへ登録するときに使う
public class Order implements java.io.Serializable {
	private int order_id;
	private String tableNum;
	private Date ordered_at;
	private String menu_id;
	private int count;
	private boolean payment_flg;
	
	public int getOrderId() {
		return order_id;
	}
	public String getTableNum() {
		return tableNum;
	}
	public Date getOrderedAt() {
		return ordered_at;
	}
	public String getMenuId() {
		return menu_id;
	}
	public int getCount() {
		return count;
	}
	public boolean getPaymentFlg() {
		return payment_flg;
	}
	
	public void setTableNum(String tableNum) {
		this.tableNum = tableNum;
	}
	public void setMenuId(String menu_id) {
		this.menu_id = menu_id;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public void setPaymentFlg(boolean payment_flg) {
		this.payment_flg = payment_flg;
	}
}