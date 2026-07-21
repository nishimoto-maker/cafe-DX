package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.SalesBean;

public class SalesDAO extends DAO {

    public List<SalesBean> getDailySales() throws Exception {

        Connection con = getConnection();

        String sql =
            "select ordered_by, " +
            "sum(m.price * o.count) as total " +
            "from orders o " +
            "inner join menu m " +
            "on o.menu_id = m.menu_id " +
            "where payment_flg = true " +
            "group by ordered_by " +
            "order by ordered_by;";

        PreparedStatement st = con.prepareStatement(sql);

        ResultSet rs = st.executeQuery();

        List<SalesBean> list = new ArrayList<>();

        while(rs.next()){

            SalesBean s = new SalesBean();

            s.setDate(rs.getString("ordered_by"));
            s.setTotal(rs.getInt("total"));

            list.add(s);
        }

        rs.close();
        st.close();
        con.close();

        return list;
    }

}
