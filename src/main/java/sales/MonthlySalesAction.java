package sales;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tool.Action;


public class MonthlySalesAction extends Action {
	public String execute(HttpServletRequest req, HttpServletResponse resp)
	throws Exception {
		// ここに処理を書いていく

		
		return "monthlySales.jsp";
    }
}