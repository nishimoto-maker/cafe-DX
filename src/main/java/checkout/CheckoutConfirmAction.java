package checkout;

import dao.OrderDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tool.Action;

public class CheckoutConfirmAction extends Action {
	public String execute(HttpServletRequest req, HttpServletResponse resp)
	throws Exception {
		String tableNum = req.getParameter("tableNum");
		
		OrderDAO dao = new OrderDAO();
		int line = dao.updatePayment(tableNum);
		
		req.setAttribute("line", line);
		
		return "checkout_ok.jsp";
	}
}