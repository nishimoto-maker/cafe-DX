package sales;

import java.util.List;

import bean.SalesBean;
import dao.SalesDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tool.Action;

public class SalesReportAction extends Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

        SalesDAO dao = new SalesDAO();
        
        // 日別の売上リストを取得 (※DAO側で昇順 ASC にしておくとグラフが見やすいです)
        List<SalesBean> salesList = dao.getDailySales();

        // リクエストスコープにセット
        request.setAttribute("salesList", salesList);

        // グラフ表示用のJSPへフォワード
        return "/sales/salesReport.jsp";
    }
}