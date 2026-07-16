<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head><title>エラー発生</title></head>
<body>
    <h2>エラーが発生しました</h2>
    <p style="color: red;">${errorMessage}</p>
    <a href="${pageContext.request.contextPath}/stock/StockList.action">一覧に戻る</a>
</body>
</html>