package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;

import bean.Order;

public class OrderDAO extends DAO {
	public int insert(List<Order> orders) throws Exception {
		Connection con = getConnection();
		
		String sql = "insert into order(tableNum, menu_id, count) "
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
}