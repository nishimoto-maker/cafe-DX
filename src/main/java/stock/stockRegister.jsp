<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>在庫登録</title></head>
<body>
    <h2>在庫登録</h2>
    
    <%-- サーバー側から送られてくるエラーメッセージの表示エリア --%>
    <c:if test="${not empty error}">
        <p style="display: none;" id="error_msg">${error}</p>
    </c:if>

    <form action="${pageContext.request.contextPath}/stock/StockRegister.action" method="post">
        商品ID: <input type="text" name="menu_id" id="menu_id" value="${menu_id}" required><br>
        <%-- type="number" だとブラウザによって操作感が違うため、textにしておくとバリデーションエラーを柔軟に扱えます --%>
        数量: <input type="text" name="stock_count" id="stock_count" value="${stock_count}" required><br>
        理由: <input type="text" name="reason"><br>
        <input type="radio" name="mode" value="add" checked> 入庫
        <input type="radio" name="mode" value="sub"> 出庫
        <br>
        <input type="submit" value="登録して終了">
    </form>
    
    <a href="${pageContext.request.contextPath}/stock/StockList.action">在庫一覧へ</a>
    
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
</body>
</html>