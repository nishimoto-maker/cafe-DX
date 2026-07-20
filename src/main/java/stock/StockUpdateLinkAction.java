package stock;

import bean.Menu;
import bean.Stock;
import dao.MenuDAO;
import dao.StockDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tool.Action;

// 更新画面へ遷移するためのアクション
public class StockUpdateLinkAction extends Action {
    
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        // パラメータからID取得
        String idParam = request.getParameter("id");
        
        // IDの数値変換とチェック
        int id;
        try {
            id = Integer.parseInt(idParam);
        } catch (NumberFormatException | NullPointerException e) {
            request.setAttribute("errorMessage", "無効なIDが指定されました。");
            return "/stock/error.jsp";
        }
        
        // 指定IDのデータを取得
        Stock stock = new StockDAO().get(id);
        
        if (stock != null) {
            Menu m = new MenuDAO().find(stock.getMenu_id());
            if (m != null) {
                stock.setMenu_name(m.getMenu_name());
            } else {
                stock.setMenu_name("不明な商品");
            }
        }
        
        // データをスコープにセットして更新画面へ
        request.setAttribute("stock", stock);
        
        return "/stock/stockUpdate.jsp";
    }
}