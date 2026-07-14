package sales;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tool.Action;

public class DailySalesAction extends Action {
	public String execute(HttpServletRequest request, HttpServletResponse response)
	throws Exception {
		// ここに処理を書いていく
		
		
		/*
			戻り値(return)は次に行きたいページのファイル名
			例)  return "dailySales.jsp"  これだけでいい
			
			これを基本形として、他のサーブレットを作ること
		
			javaファイルの名前は、○○Action.javaに揃えること。
			こうすることで、jspファイルからサーブレットを経由したいとき
			(aタグのリンクで遷移させるときや、formタグで何かデータを送信するとき)
			自動で行き先を探してくれるので、
			毎回アノテーション(@WebServlet)を指定する必要がなくなる。
			
			このままだとsalesだけじゃなく全てが動かなかったので、
			全部直しました。
			
			読んだらこのJavaファイルの名前をクラスの名前と同じに直して下さい
		*/
		
	}
	
	
	/*protected void doGet(
	        HttpServletRequest request,
	        HttpServletResponse response)
	        throws ServletException, IOException {
	
	    request.getRequestDispatcher(
	            "/Sales/dailySales.jsp")
	            .forward(request, response);
	}*/
}
