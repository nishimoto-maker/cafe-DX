package stock;

import java.util.List;

import bean.Stock;
import dao.StockDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tool.Action;

// 在庫一覧表示用アクション
public class StockListAction extends Action {
    
    // 在庫一覧を取得してJSPへ転送
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        try {
            // DAO作成
            StockDAO dao = new StockDAO();
        
            // 全在庫データ取得
            List<Stock> list = dao.getList();
        
            // リストをリクエストスコープにセット
            request.setAttribute("list", list);
        
            return "/stock/stockList.jsp";
            
        } catch (Exception e) {
            e.printStackTrace();
            // エラー時、メッセージをセットしてエラーページへ
            request.setAttribute("errorMessage", "データベースの処理中にエラーが発生しました。");
            return "/stock/error.jsp";
        }
    }
}