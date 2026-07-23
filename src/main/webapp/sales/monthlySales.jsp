<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<div class="header">

    <a href="${pageContext.request.contextPath}/Sales/salesMenu.jsp"
       class="back-btn">
        ← 戻る
    </a>

    <h1>月別売り上げ</h1>

</div>

<div class="container">

    <%
        // サーブレットから受け取ったリストを取得
        List<SalesBean> salesList = (List<SalesBean>) request.getAttribute("salesList");
        if (salesList == null) {
            salesList = (List<SalesBean>) request.getAttribute("list");
        }

        // 金額の3桁カンマ区切りフォーマット（例: 150,000）
        NumberFormat currencyFormat = NumberFormat.getIntegerInstance();
        // 年月フォーマット（例: 2026年07月）
        SimpleDateFormat monthFormat = new SimpleDateFormat("yyyy年MM月");
    %>

    <% if (salesList != null && !salesList.isEmpty()) { %>
        <table class="sales-table">
            <thead>
                <tr>
                    <th>年月</th>
                    <th>売上合計</th>
                </tr>
            </thead>
            <tbody>
                <% for (SalesBean sales : salesList) { %>
                    <tr>
                        <td>
                            <%= (sales.getSalesDate() != null) ? monthFormat.format(sales.getSalesDate()) : "-" %>
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