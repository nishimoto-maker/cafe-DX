<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="bean.SalesBean" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>日別売上</title>

<link rel="stylesheet" href="/cafeDX/css/dailySales.css">

</head>
<body>

<div class="header">

    <a href="/cafeDX/sales/SalesMenu.action" class="back-btn">
        ← 戻る
    </a>

    <h1>日別売り上げ</h1>

</div>

<div class="container">

    <form action="/cafeDX/sales/DailySales.action" method="post">

        日付：
        <input type="date" name="salesDate">

        <input type="submit" value="検索">

    </form>

    <br>

    <table>
        <tr>
            <th>日付</th>
            <th>売上金額</th>
        </tr>

        <%
        List<SalesBean> salesList =
            (List<SalesBean>)request.getAttribute("salesList");

        if(salesList != null){
            for(SalesBean s : salesList){
        %>

        <tr>
            <td><%= s.getDate() %></td>
            <td><%= s.getTotal() %>円</td>
        </tr>

        <%
            }
        }
        %>

    </table>

</div>

</body>
</html>
