package order;

import java.util.List;

import bean.OrderDetail;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class CartRemoveAction extends Action {
	@SuppressWarnings("unchecked")
	public String execute(HttpServletRequest req, HttpServletResponse resp)
	throws Exception {
		HttpSession session = req.getSession();
		
		List<OrderDetail> cart = (List<OrderDetail>)session.getAttribute("cart");
		
		int ODindex = Integer.parseInt(req.getParameter("ODindex"));
		
		if (ODindex >= 0 && ODindex < cart.size()) {
			cart.remove(ODindex);
		}
		
		return "order_cart.jsp";
	}
}