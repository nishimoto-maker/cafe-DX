package sales;

import java.util.List;

import bean.SalesBean;
import dao.SalesDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tool.Action;

public class SalesDetailAction extends Action {
	public String execute(HttpServletRequest req, HttpServletResponse resp)
	throws Exception {
		// ここに処理を書いていく
		SalesDAO dao = new SalesDAO();

        List<SalesBean> salesList =
                dao.getSalesDetail();

        req.setAttribute(
                "salesList",
                salesList);
		
		return "/Sales/salesDetail.jsp";
    }
}