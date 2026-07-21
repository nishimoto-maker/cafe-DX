<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../loginheader.jsp" %>

<div class="container">

    <h2>在庫更新</h2>
    
    <c:if test="${not empty error}">
        <p style="display: none;" id="error_msg">${error}</p>
    </c:if>

    <form action="${pageContext.request.contextPath}/stock/StockRegister.action" method="post" class="input-form">
        <%-- hiddenでmenu_idを送信 --%>
        <input type="hidden" name="menu_id" value="${stock.menu_id}">
        
        <p>商品名: ${stock.menu_name}</p>
        <p>商品ID: ${stock.menu_id}</p>
        <p>現在の在庫数: ${stock.stock_count}</p>
        <p>調整数量: <input type="text" name="stock_count" id="stock_count" value="${stock_count}" required></p>
        <p>理由: <input type="text" name="reason" placeholder="理由を入力（任意）"></p>
        
        <div style="margin: 10px 0; text-align: left; padding-left: 5px;">
            <label style="font-weight: normal; margin-right: 20px; display: inline;">
                <input type="radio" name="mode" value="add" checked> 入庫
            </label>
            <label style="font-weight: normal; display: inline;">
                <input type="radio" name="mode" value="sub"> 出庫
            </label>
        </div>
        <br>
        
        <div style="text-align: center; margin-top: 25px;">
            <button type="submit" class="search-btn" style="width: 150px; font-size: 16px; padding: 10px 0; border: none; cursor: pointer;">更新して終了</button>
        </div>
    </form>
    
    <div style="text-align: center; margin-top: 30px;">
        <a href="${pageContext.request.contextPath}/stock/StockList.action" class="reserve-btn" style="text-decoration: none; width: 150px; display: inline-block; padding: 8px 0;">在庫一覧へ</a>
    </div>

</div>

<%@ include file="../loginfooter.jsp" %>

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