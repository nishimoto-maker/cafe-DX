<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="bean.SalesBean" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>日別売上</title>

<link rel="stylesheet"
      href="${pageContext.request.contextPath}/css/dailySales.css">
</head>

<body>

<div class="header">

    <a href="${pageContext.request.contextPath}/sales/SalesMenu.action"
       class="back-btn">
        ← 戻る
    </a>

    <h1>日別売り上げ</h1>

</div>

<div class="container">

    <form action="${pageContext.request.contextPath}/sales/DailySales.action"
          method="post">
        <input type="submit" value="更新">
    </form>

    <br>

    <table>
        <tr>
            <th>日付</th>
            <th>売上金額</th>
        </tr>

        <%
        List<SalesBean> salesList =
            (List<SalesBean>) request.getAttribute("salesList");

        if (salesList != null && !salesList.isEmpty()) {

            for (SalesBean sales : salesList) {
        %>

        <tr>
            <td><%= sales.getSalesDate() %></td>
            <td><%= String.format("%,d", sales.getTotalSales()) %>円</td>
        </tr>

        <%
            }

        } else {
        %>

        <tr>
            <td colspan="2">売上データがありません。</td>
        </tr>

        <%
        }
        %>
    </table>

</div>

</body>
</html>
