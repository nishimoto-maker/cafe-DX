package sales;

import java.util.List;

import bean.SalesBean;
import dao.SalesDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tool.Action;


public class MonthlySalesAction extends Action {
	public String execute(HttpServletRequest req, HttpServletResponse resp)
	throws Exception {
		// ここに処理を書いていく
		SalesDAO dao = new SalesDAO();

        List<SalesBean> salesList =
                dao.getMonthlySales();

        req.setAttribute(
                "salesList",
                salesList);
		
		return "/sales/monthlySales.jsp";
    }
}