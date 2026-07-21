<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../loginheader.jsp" %>

<div class="container">

    <h2>在庫登録</h2>
    
    <%-- サーバー側から送られてくるエラーメッセージの表示エリア --%>
    <c:if test="${not empty error}">
        <p style="display: none;" id="error_msg">${error}</p>
    </c:if>

    <form action="${pageContext.request.contextPath}/stock/StockRegister.action" method="post" class="input-form">
        商品ID: <input type="text" name="menu_id" id="menu_id" value="${menu_id}" required><br>
        <%-- type="number" だとブラウザによって操作感が違うため、textにしておくとバリデーションエラーを柔軟に扱えます --%>
        数量: <input type="text" name="stock_count" id="stock_count" value="${stock_count}" required><br>
        理由: <input type="text" name="reason" placeholder="理由を入力（任意）"><br>
        <div style="margin: 10px 0; text-align: left; padding-left: 5px;">
            <label style="font-weight: normal; margin-right: 20px; display: inline;">
                <input type="radio" name="mode" value="add" checked> 入庫
            </label>
            <label style="font-weight: normal; display: inline;">
                <input type="radio" name="mode" value="sub"> 出庫
            </label>
        </div><br>
        
        <div style="text-align: center; margin-top: 25px;">
            <input type="submit" value="登録して終了" class="search-btn" style="width: 150px; font-size: 16px; padding: 10px 0;">
        </div>
    </form>
    
    <div style="text-align: center; margin-top: 30px;">
        <a href="${pageContext.request.contextPath}/stock/StockList.action" class="reserve-btn" style="text-decoration: none; width: 150px; display: inline-block; padding: 8px 0;">在庫一覧へ</a>
    </div>
</div>

<%@ include file="../loginfooter.jsp" %>
    
<script>
    // サーバーからエラーが送られてきた時だけ吹き出しを出す
    <c:if test="${not empty error}">
        var errMsg = document.getElementById("error_msg").innerText;
        var target;
            
        // エラーの内容に応じて、どのフィールドに吹き出しを出すか判定
        if (errMsg.includes("文字")) {
            target = document.getElementById("menu_id");
        } else {
            target = document.getElementById("stock_count");
        }

        if (target) {
            target.setCustomValidity(errMsg);
            target.reportValidity();
            // ユーザーが入力を修正し始めたら吹き出しをリセット
            target.oninput = function() { this.setCustomValidity(""); };
        }
    </c:if>
</script>