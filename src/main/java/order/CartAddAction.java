/*order_register.jspから
受け取るもの：menu_id, count, tableNum

session属性にcartリストを生成し、
od単位で格納していく

遷移先で一覧表示したいんだけど、
リクエストと同じ感じで取り出せたはず
book4のカートまわりを参照する

遷移先：order_cart.jsp*/

package order;

import java.util.ArrayList;
import java.util.List;

import bean.Menu;
import bean.OrderDetail;
import dao.MenuDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class CartAddAction extends Action {
	@SuppressWarnings("unchecked")
	public String execute(HttpServletRequest req, HttpServletResponse resp)
	throws Exception {
		HttpSession session = req.getSession();
		
		String menuId = req.getParameter("menu_id");
		MenuDAO mdao = new MenuDAO();
		Menu menu = mdao.find(menuId);
		
		int count = Integer.parseInt(req.getParameter("count"));
		String tableNum = req.getParameter("tableNum");
		int stock = Integer.parseInt(req.getParameter("stock"));
		
		List<OrderDetail> cart = (List<OrderDetail>)session.getAttribute("cart");
		if (cart == null) {
			cart = new ArrayList<OrderDetail>();
			session.setAttribute("cart", cart);
		}
		
		if (count > stock) {
			return "order_cart_error.jsp";
		}
		
		OrderDetail od = new OrderDetail();
		od.setCount(count);
		od.setMenu(menu);
		od.setTableNum(tableNum);
		
		cart.add(od);
		
		return "order_cart_ok.jsp";
	}
}