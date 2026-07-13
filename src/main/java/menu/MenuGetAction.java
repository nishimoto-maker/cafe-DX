/*
 order_top.jspで指定されたメニューIDでメニューを一件取得し、
「注文」とするために送るサーブレット
在庫テーブルから在庫数も取得
StudentGetAction.java参照
受け取るもの：menu_id
送るもの：menu、在庫数
送り先：order_register.jsp
*/

package menu;

import bean.Menu;
import dao.MenuDAO;
import dao.StockDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tool.Action;

public class MenuGetAction extends Action {
	public String execute(HttpServletRequest req, HttpServletResponse resp)
	throws Exception {
		String id = req.getParameter("id");
		
		MenuDAO mdao = new MenuDAO();
		Menu menu = mdao.find(id);
		
		// menu_idで検索して在庫数を取得するメソッドを作ってもらう
		StockDAO sdao = new StockDAO();
		int stock = sdao.getStock(id);
		
		req.setAttribute("menu", menu);
		req.setAttribute("stock", stock);
		
		return "order_register.jsp";
	}
}