<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="bean.SalesBean" %>
<%@ page import="java.text.NumberFormat" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>カフェDX</title>

<link rel="stylesheet"
      href="${pageContext.request.contextPath}/css/salesDetail.css">
</head>

<body>

<div class="header">

    <a href="${pageContext.request.contextPath}/sales/salesMenu.jsp"
       class="back-btn">
        ← 戻る
    </a>

    <h1>商品別売り上げ</h1>

</div>

<div class="container">

    <%
        // サーブレットから受け取ったリストを取得
        List<SalesBean> salesList = (List<SalesBean>) request.getAttribute("salesList");
        if (salesList == null) {
            salesList = (List<SalesBean>) request.getAttribute("list");
        }

        // 3桁カンマ区切りフォーマット（例: 1,500）
        NumberFormat currencyFormat = NumberFormat.getIntegerInstance();
    %>

    <% if (salesList != null && !salesList.isEmpty()) { %>
        <table class="sales-table">
            <thead>
                <tr>
                    <th>商品名</th>
                    <th>販売個数</th>
                    <th>売上合計</th>
                </tr>
            </thead>
            <tbody>
                <% for (SalesBean sales : salesList) { %>
                    <tr>
                        <td class="menu-name">
                            <%= (sales.getMenuName() != null) ? sales.getMenuName() : "-" %>
                        </td>
                        <td class="count">
                            <%= currencyFormat.format(sales.getTotalCount()) %> 個
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