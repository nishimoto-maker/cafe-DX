<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ include file="../loginheader.jsp" %>

<div class="container">

    <h2>在庫一覧</h2>
    
    <%-- エラーメッセージ表示 --%>
    <c:if test="${not empty error}">
        <p style="color: red;">${error}</p>
    </c:if>

    <div style="display: flex; justify-content: center; gap: 15px; margin-bottom: 20px;">
        <div class="box" style="width: 200px; height: 100px;">
            <a href="${pageContext.request.contextPath}/stock/stockRegister.jsp" style="font-size: 16px;">在庫登録</a>
        </div>
        <div class="box" style="width: 200px; height: 100px;">
            <a href="${pageContext.request.contextPath}/menu/menu.jsp" style="font-size: 16px;">ホームページに戻る</a>
        </div>
    </div>

    <table border="1">
        <tr>
            <th>商品名</th>
            <th>商品ID</th>
            <th>在庫数</th>
            <th>変動</th>
            <th>理由</th>
            <th>更新日時</th>
            <th>ステータス</th>
            <th>操作</th>
        </tr>
        
        <%-- 在庫リストを展開 --%>
        <c:forEach var="stock" items="${list}">
            <tr>
                <td>${stock.menu_name}</td>
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
                    <a href="${pageContext.request.contextPath}/stock/StockUpdateLink.action?id=${stock.stock_id}" class="reserve-btn" style="text-decoration: none; width: auto; display: inline-block;">更新</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    
    <c:if test="${empty list}">
        <p style="text-align: center; margin-top: 20px;">※現在、登録されている在庫データはありません。</p>
    </c:if>
    
    <br>
    <hr>
</div>

<%@ include file="../loginfooter.jsp" %>