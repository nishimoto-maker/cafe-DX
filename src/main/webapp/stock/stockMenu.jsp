<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>在庫管理メニュー</title>
</head>
<body>
    <h1>在庫管理メニュー</h1>
    <ul>
        <li><a href="${pageContext.request.contextPath}/stock/stockRegister.jsp">在庫新規登録</a></li>
        <li><a href="${pageContext.request.contextPath}/stock/StockList.action">入出庫修正・更新</a></li>
        <li><a href="${pageContext.request.contextPath}/stock/StockList.action">在庫一覧・確認</a></li>
    </ul>
    <br>
    <a href="${pageContext.request.contextPath}/menu/menu.jsp">メニューに戻る</a>
</body>
</html>