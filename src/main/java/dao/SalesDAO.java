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
                "select " +
                "o.ordered_at as sales_date, " +
                "sum(o.count * m.price) as total_sales " +
                "from orders o " +
                "inner join menu m " +
                "on o.menu_id = m.menu_id " +
                "where o.payment_flg = true " +
                "group by o.ordered_at " +
                "order by o.ordered_at";

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
}
