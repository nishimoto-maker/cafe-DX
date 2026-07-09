package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import bean.Order;

public class OrderDAO extends DAO {
	public int insert(Order order) throws Exception {
		Connection con = getConnection();
		
		String sql = "insert into order(tableNum, menu_id, count) "
				+ "values (?, ?, ?);";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, order.getTableNum());
		st.setString(2, order.getMenuId());
		st.setInt(3, order.getCount());
		
		int line = st.executeUpdate();
		st.close();
		con.close();
		
		return line;
	}
}