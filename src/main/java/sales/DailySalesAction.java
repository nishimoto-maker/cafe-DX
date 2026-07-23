package sales;

import java.util.List;

import bean.SalesBean;
import dao.SalesDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tool.Action;

public class DailySalesAction extends Action {

    @Override
    public String execute(
            HttpServletRequest req,
            HttpServletResponse resp)
            throws Exception {

        SalesDAO dao = new SalesDAO();

        List<SalesBean> salesList =
                dao.getDailySales();

        req.setAttribute(
                "salesList",
                salesList);

        return "/sales/dailySales.jsp";
    }
}
