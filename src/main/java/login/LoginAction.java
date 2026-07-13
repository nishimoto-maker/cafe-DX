package login;

import bean.Staff;
import dao.StaffDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;
import tool.PasswordUtil;

public class LoginAction extends Action {

    // executeメソッド：FrontControllerから呼ばれるメイン処理
    public String execute(
        HttpServletRequest request, HttpServletResponse response
    ) throws Exception {

        // セッションを取得（なければ新しく作成）
        HttpSession session = request.getSession();

        // フォームから送られてきたログイン名とパスワードを取得
        String staff_id = request.getParameter("staff_id");
        String password = request.getParameter("password");
        
        // 未入力チェック（最小）
        if (staff_id == null || staff_id.equals("") ||
        		password == null || password.equals("")) {
        	request.setAttribute("error",
        			"＊ログイン名とパスワードを入力してください");
            return "/login/login-in.jsp";
        }
        
        // パスワードをハッシュ化
        String hashpassword = PasswordUtil.hash(password);

        // DAOを使ってDBからユーザー検索（認証処理）
        StaffDAO dao = new StaffDAO();
        Staff staff = dao.search(staff_id, hashpassword);

        // ユーザーが見つかった場合（ログイン成功）
        if (staff != null) {

            // セッションにユーザー情報を保存（ログイン状態を保持）
            session.setAttribute("staff", staff);
            
            // ログイン名が管理者(admin)の場合
            if ("admin".equals(staff.getStaff_id())) {
                return "/menu/menu2.jsp";
            }

            // ログイン成功ページへ遷移
            return "/menu/menu.jsp";
        } else {
        	// ログイン名とパスワードが一致しない場合(ログイン失敗)
        	// ユーザーが見つからなかった場合(ログイン失敗)
        	request.setAttribute("error",
        			"＊ログインに失敗しました\n＊ログイン名またはパスワードが違います");
        	return "/login/login-in.jsp";
        }
    }
}