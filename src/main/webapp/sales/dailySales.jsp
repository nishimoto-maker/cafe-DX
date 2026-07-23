<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="bean.SalesBean" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>カフェDX</title>
<link rel="stylesheet"
      href="${pageContext.request.contextPath}/css/monthlySales.css">
</head>
<body>

    <div class="container">
        <div class="header">
            <!-- 戻るボタン（パスはチームの構成に合わせて変更してください） -->
            <a href="/cafeDX/sales/salesMenu.jsp" class="back-btn">戻る</a>
            <h1>日別売上</h1>
        </div>

        <%
            // サーブレット等から受け取ったリスト（属性名は適宜調整してください）
            List<SalesBean> salesList = (List<SalesBean>) request.getAttribute("salesList");
            if (salesList == null) {
                // attribute名が "list" の場合のフォールバック
                salesList = (List<SalesBean>) request.getAttribute("list");
            }

            // 3桁カンマ区切りのフォーマット（例: 1,500）
            NumberFormat currencyFormat = NumberFormat.getIntegerInstance();
            // 日付のフォーマット（例: 2026/07/23）
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
        %>

        <% if (salesList != null && !salesList.isEmpty()) { %>
            <table class="sales-table">
                <thead>
                    <tr>
                        <th>日付</th>
                        <th>売上合計</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (SalesBean sales : salesList) { %>
                        <tr>
                            <td>
                                <%= (sales.getSalesDate() != null) ? dateFormat.format(sales.getSalesDate()) : "-" %>
                            </td>
                            <td class="amount">
                                ¥ <%= currencyFormat.format(sales.getTotalSales()) %>
                            </td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        <% } else { %>
            <p class="no-data">売上データが存在しません。</p>
        <% } %>
    </div>

</body>
</html>