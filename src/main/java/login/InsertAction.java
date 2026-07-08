package login;

import been.Staff;
import dao.StaffDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tool.Action;
import tool.PasswordUtil;


public class InsertAction extends Action {

	// executeメソッド：FrontControllerから呼ばれるメイン処理
    public String execute(
        HttpServletRequest request, HttpServletResponse response
    ) throws Exception {
    	
    	// フォームから送信されたログイン名を取得
        String staff_id = request.getParameter("staff_id");
            
        // フォームから送信された名前を取得
        String staff_name = request.getParameter("staff_name");
        
        // フォームから送信されたパスワードを取得
        String password = request.getParameter("password");
    
        // データベース操作(登録･検索)を行うためのDAOを作成
        StaffDAO dao = new StaffDAO();
            
        // 未入力チェック（最小）
        if (staff_id == null || staff_id.equals("") ||
        		staff_name == null || staff_name.equals("") ||
        		password == null || password.equals("")) {
        	request.setAttribute("error",
        			"＊未入力があります\n＊すべて入力してください");
            return "/login/insert.jsp";
        }
            
        // 重複確認
        if (dao.isExist(staff_id)) {
        	request.setAttribute("error1", "＊このログイン名は既に使われています");
            return "/login/insert.jsp";
        }
        
        // パスワードをハッシュ化
        String hashpassword = PasswordUtil.hash(password);

        // 登録処理
        // データ保存用オブジェクトを作成
        Staff staff = new Staff(); 
         
        // 1番目の ? にログイン名を設定
        staff.setStaff_id(staff_id);
        
        // 2番目の ? に名前を設定
        staff.setStaff_name(staff_name);
        
        // 3番目の ? にパスワードを設定
        staff.setPassword(hashpassword);

        // SQLを実行
        int line = dao.insert(staff);

        // lineは「更新された行数」
        if (line > 0) {
        	return "/login/result.jsp";
        } else {
            request.setAttribute("error", "＊登録に失敗しました");
            return "/login/insert.jsp";
        }

       
    }
}