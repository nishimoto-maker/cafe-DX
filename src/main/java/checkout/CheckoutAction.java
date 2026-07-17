package checkout;
/*
	checkout_top.jspからテーブル番号を受け取って、
	注文テーブルから、指定されたテーブル番号かつ、
	会計済フラグがfalseの注文を持ってきて、
	合計金額を計算する
	商品名、単価、個数、商品ごとの合計、注文全体の合計金額を
	渡す
*/

import java.util.List;

import bean.Payment;
import dao.OrderDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tool.Action;

public class CheckoutAction extends Action {
	public String execute(HttpServletRequest req, HttpServletResponse resp)
	throws Exception {
		String tableNum = req.getParameter("tableNum");
		
		OrderDAO dao = new OrderDAO();
		List<Payment> payments = dao.getCheckouts(tableNum);
		req.setAttribute("payments", payments);
		req.setAttribute("tableNum", tableNum);
		
		return "checkout_total.jsp";
	}
}