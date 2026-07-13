package menu;

import bean.Menu;
import dao.MenuDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tool.Action;


public class MenuInsertAction extends Action {

	// executeメソッド：FrontControllerから呼ばれるメイン処理
    public String execute(
        HttpServletRequest request, HttpServletResponse response
    ) throws Exception {
    	
    	// フォームから送信された商品IDを取得
        String menu_id = request.getParameter("menu_id");

        // フォームから送信された商品名を取得
        String menu_name = request.getParameter("menu_name");
            
        // フォームから送信された値段を取得
        String priceStr = request.getParameter("price");

        // フォームから送信されたジャンルを取得
        String genre = request.getParameter("genre");
        
        // フォームから送信された提供フラグを取得
        Boolean serve = request.getParameter("serve") != null;
            
        // データベース操作(登録･検索)を行うためのDAOを作成
        MenuDAO dao = new MenuDAO();
            
        // 未入力チェック（最小）
        if ( menu_id == null || menu_id.equals("") ||
        		menu_name == null || menu_name.equals("") ||
        		priceStr == null || priceStr.equals("") ||
        		genre == null || genre.equals("")) {
        	request.setAttribute("error",
        			"＊未入力があります\n＊商品ID、商品名、値段、ジャンルを入力してください");
            return "/order/menu-create.jsp";
        }
            
        // 重複確認
        if (dao.isExist(menu_id)) {
        	request.setAttribute("error1", "＊この商品IDは既に使われています");
            return "/order/menu-create.jsp";
        }
        // 文字列を数値に変換
        int price = Integer.parseInt(priceStr);

        // 登録処理
        // データ保存用オブジェクトを作成
        Menu menu = new Menu(); 
         
        // 1番目の ? に商品IDを設定
        menu.setMenu_id(menu_id);
        // 2番目の ? に商品名を設定
        menu.setMenu_name(menu_name);        
        // 3番目の ? に値段を設定
        menu.setPrice(price);
        // 4番目の ? にジャンルを設定
        menu.setGenre(genre);        
        // 5番目の ? に提供フラグを設定
        menu.setServe(serve);
        
        // SQLを実行
        int line = dao.insert(menu);

        // lineは「更新された行数」
        if (line > 0) {
        	request.setAttribute("message", "＊商品情報を登録しました");
        	return "/order/menu-success.jsp";
        } else {
            request.setAttribute("error", "＊登録に失敗しました");
            return "/order/menu-create.jsp";
        }

       
    }
}