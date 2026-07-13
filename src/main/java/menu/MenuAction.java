package menu;

import java.util.ArrayList;
import java.util.List;

import bean.Menu;
import dao.MenuDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;


// 商品検索を行うアクションクラス
public class MenuAction extends Action {

    public String execute(
        HttpServletRequest request, HttpServletResponse response
    ) throws Exception {

        // セッションを取得（商品リストなどと共有するため）
        HttpSession session = request.getSession();

        // リクエストから検索キーワードを取得
        String keyword = request.getParameter("keyword");

        // キーワードが未入力（null）の場合は空文字にする
        if (keyword == null) keyword = "";

        // DAOを使って商品検索
        MenuDAO dao = new MenuDAO();
        List<Menu> list = dao.search(keyword);
        
        // 提供中だけを入れるリスト
        List<Menu> attendlist = new ArrayList<>();
        
        // serveがTrueの商品だけ追加
        for (Menu m : list) {
        	if (m.getServe()) {
        		attendlist.add(m);
        	}
        }

        // 検索結果をセッションに保存（JSPで使うため）
        session.setAttribute("list", attendlist);

        // .jspへフォワード
        return "/menu/menu-list.jsp#";
    }
}
