package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Order;
import bean.Payment;

public class OrderDAO extends DAO {
	public int insert(List<Order> orders) throws Exception {
		Connection con = getConnection();
		
		String sql = "insert into orders(table_num, menu_id, count) "
				+ "values (?, ?, ?);";
		PreparedStatement st = con.prepareStatement(sql);
		
		int line = 0;
		
		for (Order o : orders) {
			st.setString(1, o.getTableNum());
			st.setString(2, o.getMenuId());
			st.setInt(3, o.getCount());
			line += st.executeUpdate();
		}
		
		st.close();
		con.close();
		
		return line;
	}
	
	public List<Payment> getCheckouts(String tableNum) throws Exception {
		Connection con = getConnection();
		
		String sql = "select "
				+ "m.menu_name, m.price, "
				+ "sum(o.count) as total_count, "
				+ "m.price * sum(o.count) as subtotal "
				+ "from orders o inner join menu m "
				+ "on o.menu_id = m.menu_id "
				+ "where o.table_num = ? and payment_flg = false "
				+ "group by m.menu_id, m.menu_name, m.price;";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, tableNum);
		
		ResultSet rs = st.executeQuery();
		
		List<Payment> list = new ArrayList<>();
		
		while (rs.next()) {
			Payment p = new Payment();
			p.setMenuName(rs.getString("menu_name"));
			p.setPrice(rs.getInt("price"));
			p.setCount(rs.getInt("total_count"));
			p.setSubtotal(rs.getInt("subtotal"));
			list.add(p);
		}
		
		rs.close();
		st.close();
		con.close();
		
		return list;
	}
	
	public int updatePayment(String tableNum) throws Exception {
		Connection con = getConnection();
		
		String sql = "update orders "
				+ "set payment_flg = True "
				+ "where table_num = ? and payment_flg = false;";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, tableNum);
	    int line  = st.executeUpdate();
	    
	    st.close();
	    con.close();
	    
	    return line;
	}
}