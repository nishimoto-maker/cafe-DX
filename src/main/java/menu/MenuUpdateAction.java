package menu;

import bean.Menu;
import dao.MenuDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tool.Action;


public class MenuUpdateAction extends Action {

	// executeメソッド：FrontControllerから呼ばれるメイン処理
    public String execute(
        HttpServletRequest request, HttpServletResponse response
    ) throws Exception {
    	
        // フォームから送信された商品IDを取得
        String menu_id = request.getParameter("menu_id");
        
        MenuDAO dao = new MenuDAO();
        
        // 商品一覧から｢変更・更新｣ボタンが押されたとき、#へ
        // それ以外のときは、更新処理でMenu.actionへ
        String menu_name = request.getParameter("menu_name");
        if ( menu_name == null ) {
        	Menu menu = dao.find(menu_id);
            request.setAttribute("menu", menu);
            return "/menu/menu_update.jsp";
        } else {
        	String price = request.getParameter("price");
        	Boolean serve = request.getParameter("serve") != null;
        	
        	// 元データを必ず取得
            Menu menu = dao.find(menu_id);
            
            // 未入力チェック（最小）
            if ( price == null || price.equals("") ) {
            	request.setAttribute("error",
            			"＊未入力があります\n＊値段を入力してください");
            	
                request.setAttribute("menu", menu);
   
                return "/menu/menu_update.jsp";
            }
            // 入力値を上書き（保持のため）
            menu.setPrice(Integer.parseInt(price));
            menu.setServe(serve);
            
        	dao.update(menu);
        	
        	request.setAttribute("message", "＊商品情報を更新しました");
        	return "/menu/menu_success.jsp";           
        }
    }

}