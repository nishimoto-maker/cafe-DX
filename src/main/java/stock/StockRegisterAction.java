package stock;

import java.util.List;

import bean.Stock;
import dao.StockDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tool.Action;

// 在庫の入庫・出庫処理用アクション
public class StockRegisterAction extends Action {
    
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String menuId = request.getParameter("menu_id");
        String countStr = request.getParameter("stock_count");
        String reason = request.getParameter("reason");
        String mode = request.getParameter("mode");
        
        // フォームから送られてきた "from" パラメータを取得
        String from = request.getParameter("from");
        String returnPage = "/stock/stockRegister.jsp";
        // "update" から送られてきた場合は、エラー時も更新画面に戻す
        if ("update".equals(from)) {
            returnPage = "/stock/stockUpdate.jsp";
        }
        
        // DAOと全データリストの準備
        StockDAO dao = new StockDAO();
        List<Stock> list = dao.searchAll();

        // 共通：更新画面に戻る際、画面表示用の stock オブジェクトを再取得してセットするヘルパー処理
        if ("update".equals(from) && menuId != null) {
            for (Stock s : list) {
                if (s.getMenu_id().equals(menuId)) {
                    request.setAttribute("stock", s);
                    break;
                }
            }
        }

        // IDバリデーション：空チェック
        if (menuId == null || menuId.isEmpty()) {
            request.setAttribute("error", "商品IDを入力してください。");
            return returnPage;
        }
        
        // IDバリデーション：不正文字チェック
        if (!menuId.matches("^[a-zA-Z0-9]+$")) {
            request.setAttribute("error", "使用できない文字が含まれています。");
            request.setAttribute("menu_id", menuId);
            return returnPage;
        }
        
        // 数量入力チェック
        if (countStr == null || countStr.isEmpty()) {
            request.setAttribute("error", "数量を入力してください。");
            request.setAttribute("list", list);
            return returnPage;
        }

        // 数値変換エラー対策
        int countInput;
        try {
            countInput = Integer.parseInt(countStr);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "数量フィールドに正しい数値を入力してください。");
            request.setAttribute("menu_id", menuId);
            request.setAttribute("stock_count", countStr);
            return returnPage;
        }

        // 数量の妥当性チェック
        if (countInput <= 0) {
            request.setAttribute("error", "数量は1以上を入力してください。");
            request.setAttribute("list", list);
            return returnPage;
        }

        // 在庫変動計算の準備
        int changeCount = ("sub".equals(mode)) ? -countInput : countInput;

        // 現在の在庫数特定
        int currentTotal = 0;
        boolean isExists = false;
        for (Stock s : list) {
            if (s.getMenu_id().equals(menuId)) {
                currentTotal = s.getStock_count();
                isExists = true;
                break;
            }
        }

        if (isExists && !"update".equals(from)) {
            request.setAttribute("error", "この商品は既に登録されています。");
            return returnPage;
        }

        // 出庫時の在庫不足チェック
        if ("sub".equals(mode) && (currentTotal - countInput < 0)) {
            request.setAttribute("error", "在庫が不足しています。（現在：" + currentTotal + "）");
            request.setAttribute("list", list);
            return returnPage;
        }

        // 新規データ作成と保存
        int newTotal = currentTotal + changeCount;
        Stock record = new Stock();
        record.setMenu_id(menuId);
        record.setStock_count(newTotal);
        record.setChange_count(changeCount);
        record.setReason(reason);
        record.setStatus(newTotal > 0 ? 1 : 0);

        dao.insert(record);

        // 完了画面へ
        request.setAttribute("list", dao.searchAll());
        return "/stock/success.jsp";
    }
}