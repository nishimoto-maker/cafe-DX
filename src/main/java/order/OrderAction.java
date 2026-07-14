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
		/*  ジャンルで絞り込んで取得する
			指定しなければ全部取得
			
			order_top.jspに行く前に動くサーブレット
			最初は何も指定しないので、全件取得・渡す
			order_top.jspにアクセスした後、
			ジャンルでソートできるように、
			ジャンル一覧も一緒に送る
		*/
		// ジャンル一覧の取得をするメソッド勝手に作ったろかな
		
		String sortBy = req.getParameter("sort_by");
		if (sortBy == null) {
			sortBy = "";
		}
		String keyword = req.getParameter("keyword");
		if (keyword == null) {
			keyword = "";
		}
		
		MenuDAO dao = new MenuDAO();
		List<Menu> menus = dao.search(keyword, sortBy);
		List<String> ganres = dao.getGenre();
		
		req.setAttribute("menus", menus);
		req.setAttribute("genres", ganres);
		
		return "order_top.jsp";
	}
}