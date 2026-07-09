package order;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tool.Action;

public class OrderAction extends Action {
	public String execute(HttpServletRequest req, HttpServletResponse resp)
	throws Exception {
		// 商品一覧を取得する。
		// 各名前、インポートは要確認
		MenuDAO dao = new MenuDAO();
		List<menu> list = dao.getMenu();
		
		req.setAttribute("menus", list);
		
		return "order_top.jsp";
	}
}