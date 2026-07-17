package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Stock;

// 在庫テーブル(stock)操作用DAO
public class StockDAO extends DAO {
    
    // 全データ取得（ID降順）
    public List<Stock> getList() throws Exception {
        List<Stock> list = new ArrayList<>();
        String sql = "SELECT * FROM stock ORDER BY stock_id DESC";
        
        // 自動クローズ対応
        try (Connection con = getConnection();
             PreparedStatement st = con.prepareStatement(sql);
             ResultSet rs = st.executeQuery()) {
            
            while (rs.next()) {
                Stock s = new Stock();
                s.setStock_id(rs.getInt("stock_id"));
                s.setMenu_id(rs.getString("menu_id"));
                s.setStock_count(rs.getInt("stock_count"));
                s.setChange_count(rs.getInt("change_count"));
                s.setReason(rs.getString("reason"));
                s.setUpdate_at(rs.getTimestamp("update_at").toLocalDateTime());
                s.setStatus(rs.getInt("status"));
                list.add(s);
            }
        }
        return list;
    }
    
    // データ追加
    public int insert(Stock stock) throws Exception {
        String sql = "INSERT INTO stock(menu_id, stock_count, status, change_count, reason, update_at) VALUES (?,?,?,?,?,?)";
        
        try (Connection con = getConnection();
             PreparedStatement st = con.prepareStatement(sql)) {
            
            st.setString(1, stock.getMenu_id());
            st.setInt(2, stock.getStock_count());
            st.setInt(3, stock.getStatus());
            st.setInt(4, stock.getChange_count());
            st.setString(5, stock.getReason());
            st.setTimestamp(6, new java.sql.Timestamp(System.currentTimeMillis()));
            
            return st.executeUpdate();
        }
    }

    // 全データ取得（getList呼び出し）
    public List<Stock> searchAll() throws Exception {
        return getList();
    }
    
    // 指定IDのデータ取得
    public Stock get(int id) throws Exception {
        String sql = "SELECT * FROM stock WHERE stock_id = ?";
        
        try (Connection con = getConnection();
             PreparedStatement st = con.prepareStatement(sql)) {
            
            st.setInt(1, id);
            
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    Stock s = new Stock();
                    s.setStock_id(rs.getInt("stock_id"));
                    s.setMenu_id(rs.getString("menu_id"));
                    s.setStock_count(rs.getInt("stock_count"));
                    s.setChange_count(rs.getInt("change_count"));
                    s.setReason(rs.getString("reason"));
                    s.setUpdate_at(rs.getTimestamp("update_at").toLocalDateTime());
                    s.setStatus(rs.getInt("status"));
                    return s;
                }
            }
        }
        return null;
    }
    
    // 
    public int getStock(String menuId) throws Exception {
        String sql = "SELECT stock_count FROM stock WHERE menu_id = ?";
        
        try (Connection con = getConnection();
             PreparedStatement st = con.prepareStatement(sql)) {
            
            st.setString(1, menuId);
            
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                	int stock = rs.getInt("stock_count");
                	return stock;
                }
            }
        }
        return 0;
    }
}