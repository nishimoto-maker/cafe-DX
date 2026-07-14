package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.SalesBean;

public class SalesDAO extends DAO {

    // 日別売上を取得
    public List<SalesBean> getDailySales() throws Exception {

        List<SalesBean> list = new ArrayList<>();

        Connection con = getConnection();

        String sql =
            "SELECT o.ordered_by, m.menu_name, o.count, m.price, " +
            "(o.count * m.price) AS total " +
            "FROM \"order\" o " +
            "JOIN menu m ON o.menu_id = m.menu_id " +
            "WHERE o.payment_flg = TRUE " +
            "ORDER BY o.ordered_by";

        PreparedStatement ps = con.prepareStatement(sql);

        ResultSet rs = ps.executeQuery();

        while (rs.next()) {

            SalesBean bean = new SalesBean();

            bean.setDate(rs.getString("ordered_by"));
            bean.setMenuName(rs.getString("menu_name"));
            bean.setCount(rs.getInt("count"));
            bean.setPrice(rs.getInt("price"));
            bean.setTotal(rs.getInt("total"));

            list.add(bean);
        }

        rs.close();
        ps.close();
        con.close();

        return list;
    }
}