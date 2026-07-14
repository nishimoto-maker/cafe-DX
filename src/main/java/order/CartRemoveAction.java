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
		
		int orderId = Integer.parseInt(req.getParameter("orderId"));
		
		List<OrderDetail> cart = (List<OrderDetail>)session.getAttribute("cart");
		
		for (OrderDetail o : cart) {
			if (o.getOrderId() == orderId) {
				cart.remove(o);
				break;
			}
		}
		
		return "order_cart.jsp";
	}
}