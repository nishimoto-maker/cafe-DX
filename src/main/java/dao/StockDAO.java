package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Stock;

public class StockDAO extends DAO {
	
	public List<Stock> getList() throws Exception {
		List<Stock> list=new ArrayList<>();
		
		Connection con = getConnection();
		
		PreparedStatement st=con.prepareStatement(
				"select * from stock");
		ResultSet rs = st.executeQuery();
		
		
		while (rs.next()) {
			Stock s=new Stock();
			s.setStock_id(rs.getInt("stock_id"));
			s.setMenu_id(rs.getString("menu_id"));
			s.setStock_count(rs.getInt("stock_count"));
			s.setChange_count(rs.getInt("change_count"));
			s.setReason(rs.getString("reason"));
			s.setUpdate_at(rs.getTimestamp("update_at").toLocalDateTime());
			s.setStatus(rs.getInt("status"));
			list.add(s);
		}
		
		rs.close();
		st.close();
		con.close();
		
		return list;
	}
	
	public int insert(Stock stock) throws Exception {
		Connection con = getConnection();
		
		PreparedStatement st = con.prepareStatement(
				"insert into stock(menu_id, stock_count, status) VALUES (?,?,?)");
		st.setString(1, stock.getMenu_id());
		st.setInt(2, stock.getStock_count());
		st.setInt(3,  stock.getStatus());
		int line = st.executeUpdate();
		
		st.close();
		con.close();
		return line;
	}
	
	public int update(Stock stock) throws Exception {
		Connection con = getConnection();
		
		PreparedStatement st = con.prepareStatement(
				"update stock set stock_count = ?, status = ?, update_at = now() where stock_id = ?");
		st.setInt(1, stock.getStock_count());
		st.setInt(2, stock.getStatus());
		st.setInt(3, stock.getStock_id());
		int line = st.executeUpdate();
		
		st.close();
		con.close();
		return line;
	}
	
	public int getStock(String menuId) throws Exception {
		Connection con = getConnection();
		
		String sql = "select stock_count from stock where menu_id = ?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, menuId);
		ResultSet rs = st.executeQuery();
		
		int stock = 0;
		
		if (rs.next()) {
			stock = rs.getInt("stock_count");
		}
		
		return stock;
	}
}