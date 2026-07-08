package login;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

// ログアウト処理を行うクラス
public class LogoutAction extends Action {

    // executeメソッド：FrontControllerから呼ばれる
    public String execute(
        HttpServletRequest request, HttpServletResponse response
    ) throws Exception {

        // セッションを取得
        HttpSession session = request.getSession();

        // ログインしているか確認（customerがあるか）
        if (session.getAttribute("staff") != null) {

            // セッションからログイン情報を削除（ログアウト）
            session.removeAttribute("staff");

            // ログアウト成功ページへ
            return "/login/logout-out.jsp";
        }

        // すでにログアウトしている場合
        return "/login/logout-error.jsp";
    }
}