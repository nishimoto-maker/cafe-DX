/*セッションのカートから注文を取り出して、
Orderに入れていき、List<Order>に格納していく
それをDAOに渡して注文テーブルに登録する*/

package order;

import java.util.ArrayList;
import java.util.List;

import bean.Order;
import bean.OrderDetail;
import dao.OrderDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class OrderConfirmAction extends Action {
	@SuppressWarnings("unchecked")
	public String execute(HttpServletRequest req, HttpServletResponse resp)
	throws Exception {
		HttpSession session = req.getSession();
		
		List<OrderDetail> cart = (List<OrderDetail>)session.getAttribute("cart");
		
		OrderDAO odao = new OrderDAO();
		List<Order> orders = new ArrayList<>();
		
		for (OrderDetail od : cart) {
			Order o = new Order();
			o.setTableNum(od.getTableNum());
			o.setMenuId(od.getMenu().getMenu_id());
			o.setCount(od.getCount());
			orders.add(o);
		}
		
		int line = odao.insert(orders);
		
		cart = null;
		
		req.setAttribute("line", line);
		return "order_confirm_ok.jsp";
	}
}