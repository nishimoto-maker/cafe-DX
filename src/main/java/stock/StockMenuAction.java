package stock;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tool.Action;

public class StockMenuAction extends Action {
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // 在庫管理メニュー画面を表示する
        return "stockMenu.jsp";
    }
}