<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>在庫更新</title></head>
<body>
    <h2>在庫更新</h2>
    
    <%-- エラーメッセージ表示エリア --%>
    <c:if test="${not empty error}">
        <p style="display: none;" id="error_msg">${error}</p>
    </c:if>

    <form action="${pageContext.request.contextPath}/stock/StockRegister.action" method="post">
        <%-- hiddenでmenu_idを送信 --%>
        <input type="hidden" name="menu_id" value="${stock.menu_id}">
        
        <p>商品名: ${stock.menu_name}</p>
        <p>商品ID: ${stock.menu_id}</p>
        <p>現在の在庫数: ${stock.stock_count}</p>
        <p>調整数量: <input type="text" name="stock_count" id="stock_count" value="${stock_count}" required></p>
        <p>理由: <input type="text" name="reason"></p>
        
        <input type="radio" name="mode" value="add" checked> 入庫
        <input type="radio" name="mode" value="sub"> 出庫
        <br>
        <button type="submit">更新して終了</button>
    </form>
    
    <a href="${pageContext.request.contextPath}/stock/StockList.action">在庫一覧へ</a>
    
    <script>
        <c:if test="${not empty error}">
            var errMsg = document.getElementById("error_msg").innerText;
            var target = document.getElementById("stock_count"); // 更新画面は数量のみなので固定でOK
            
            if (target) {
                target.setCustomValidity(errMsg);
                target.reportValidity();
                target.oninput = function() { this.setCustomValidity(""); };
            }
        </c:if>
    </script>
</body>
</html>