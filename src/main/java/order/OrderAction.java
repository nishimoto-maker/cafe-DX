package order;

import java.util.List;

import bean.Menu;
import dao.MenuDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tool.Action;

public class OrderAction extends Action {
	public String execute(HttpServletRequest req, HttpServletResponse resp)
	throws Exception {
		// 商品一覧を取得する。
		// 全件取得のメソッドを作ってもらう
		MenuDAO dao = new MenuDAO();
		List<Menu> list = dao.getMenu();
		
		req.setAttribute("menus", list);
		
		return "order_top.jsp";
	}
}