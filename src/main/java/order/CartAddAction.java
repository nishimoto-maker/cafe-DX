/*order_register.jspから
受け取るもの：menu_id, count, tableNum

session属性にcartリストを生成し、
order単位で格納していく

遷移先で一覧表示したいんだけど、
リクエストと同じ感じで取り出せたはず
book4のカートまわりを参照する

遷移先：order_cart.jsp*/

package order;

import java.util.ArrayList;
import java.util.List;

import bean.Order;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class CartAddAction extends Action {
	@SuppressWarnings("unchecked")
	public String execute(HttpServletRequest req, HttpServletResponse resp)
	throws Exception {
		HttpSession session = req.getSession();
		
		String menu_id = req.getParameter("menu_id");
		int count = Integer.parseInt(req.getParameter("count"));
		String tableNum = req.getParameter("tabelNum");
		int stock = Integer.parseInt(req.getParameter("stock"));
		
		List<Order> cart = (List<Order>)session.getAttribute("cart");
		if (cart == null) {
			cart = new ArrayList<Order>();
			session.setAttribute("cart", cart);
		}
		
		if (count > stock) {
			return "order_cart_error.jsp";
		}
		
		Order order = new Order();
		order.setCount(count);
		order.setMenuId(menu_id);
		order.setTableNum(tableNum);
		
		cart.add(order);
		
		return "order_cart_ok.jsp";
	}
}