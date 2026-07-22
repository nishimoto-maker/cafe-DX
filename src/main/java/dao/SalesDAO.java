package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.SalesBean;

public class SalesDAO extends DAO {

	public List<SalesBean> getDailySales() throws Exception {

	    List<SalesBean> salesList = new ArrayList<>();

	    String sql =
	            "SELECT " +
	            "CAST(o.ordered_at AS DATE) AS sales_date, " +
	            "SUM(o.count * m.price) AS total_sales " +
	            "FROM orders o " +
	            "INNER JOIN menu m " +
	            "ON o.menu_id = m.menu_id " +
	            "WHERE o.payment_flg = true " +
	            "GROUP BY CAST(o.ordered_at AS DATE) " +
	            "ORDER BY sales_date DESC";

	    try (
	        Connection con = getConnection();
	        PreparedStatement st = con.prepareStatement(sql);
	        ResultSet rs = st.executeQuery();
	    ) {

	        while (rs.next()) {

	            SalesBean sales = new SalesBean();

	            sales.setSalesDate(
	                    rs.getDate("sales_date"));

	            sales.setTotalSales(
	                    rs.getInt("total_sales"));

	            salesList.add(sales);
	        }
	    }

	    return salesList;
	}
	
	public List<SalesBean> getMonthlySales() throws Exception {

	    List<SalesBean> salesList = new ArrayList<>();

	    String sql =
	            "SELECT " +
	            "CAST(FORMATDATETIME(o.ordered_at, 'yyyy-MM-01') AS DATE) AS sales_date, " +
	            "SUM(o.count * m.price) AS total_sales " +
	            "FROM orders o " +
	            "INNER JOIN menu m " +
	            "ON o.menu_id = m.menu_id " +
	            "WHERE o.payment_flg = true " +
	            "GROUP BY CAST(FORMATDATETIME(o.ordered_at, 'yyyy-MM-01') AS DATE) " +
	            "ORDER BY sales_date DESC";

	    try (
	        Connection con = getConnection();
	        PreparedStatement st = con.prepareStatement(sql);
	        ResultSet rs = st.executeQuery();
	    ) {

	        while (rs.next()) {

	            SalesBean sales = new SalesBean();

	            // SQLで AS sales_date にしたので、ここも sales_date で一致します！
	            sales.setSalesDate(rs.getDate("sales_date"));
	            sales.setTotalSales(rs.getInt("total_sales"));

	            salesList.add(sales);
	        }
	    }

	    return salesList;
	}
	
	public List<SalesBean> getSalesDetail() throws Exception {

	    List<SalesBean> salesList = new ArrayList<>();

	    String sql =
	            "SELECT " +
	            "m.menu_name AS menu_name, " +
	            "SUM(o.count) AS total_count, " +
	            "SUM(o.count * m.price) AS total_sales " +
	            "FROM orders o " +
	            "INNER JOIN menu m " +
	            "ON o.menu_id = m.menu_id " +
	            "WHERE o.payment_flg = true " +
	            "GROUP BY m.menu_id, m.menu_name " +
	            "ORDER BY total_sales DESC";

	    try (
	        Connection con = getConnection();
	        PreparedStatement st = con.prepareStatement(sql);
	        ResultSet rs = st.executeQuery();
	    ) {

	        while (rs.next()) {

	            SalesBean sales = new SalesBean();

	            sales.setMenuName(
	                    rs.getString("menu_name"));

	            sales.setTotalCount(
	                    rs.getInt("total_count"));

	            sales.setTotalSales(
	                    rs.getInt("total_sales"));

	            salesList.add(sales);
	        }
	    }

	    return salesList;
	}
}
