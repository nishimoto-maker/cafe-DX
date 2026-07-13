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
		// ジャンルで絞り込んで取得する
		// 指定しなければ全部取得
		// 作ってもらうか、自分で作るか
		MenuDAO dao = new MenuDAO();
		List<Menu> list = dao.getMenu();
		
		req.setAttribute("menus", list);
		
		return "order_top.jsp";
	}
}