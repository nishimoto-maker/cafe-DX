<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>在庫一覧</title>
</head>
<body>
    <h1>在庫一覧</h1>
    
    <%-- エラーメッセージ表示 --%>
    <c:if test="${not empty error}">
        <p style="color: red;">${error}</p>
    </c:if>

    <a href="${pageContext.request.contextPath}/stock/stockRegister.jsp">在庫登録へ</a>

    <table border="1">
        <tr>
            <th>商品ID</th><th>在庫数</th><th>変動</th><th>理由</th><th>更新日時</th><th>ステータス</th><th>操作</th>
        </tr>
        <%-- 在庫リストを展開 --%>
        <c:forEach var="stock" items="${list}">
            <tr>
                <td>${stock.menu_id}</td>
                <td>${stock.stock_count}</td>
                <td>${stock.change_count}</td>
                <td>${stock.reason}</td>
                <td>
                    <%-- 日時のフォーマット変換 --%>
                    <fmt:parseDate value="${stock.update_at}" pattern="yyyy-MM-dd'T'HH:mm:ss.SSS" var="parsedDate" />
                    <fmt:formatDate value="${parsedDate}" pattern="yyyy/MM/dd HH:mm" />
                </td>
                <td>${stock.status == 1 ? '在庫あり' : '在庫なし'}</td>
                <td>
                    <%-- 更新アクションへのリンク --%>
                    <a href="${pageContext.request.contextPath}/stock/StockUpdateLink.action?id=${stock.stock_id}">更新</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>