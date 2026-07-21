<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../loginheader.jsp" %>

<div class="container" style="text-align: center;">

    <h2>登録完了</h2>
    
    <div style="margin: 40px 0;">
        <p style="font-size: 18px; font-weight: bold; color: #333; margin-bottom: 10px;">登録が完了しました</p>
        <p style="color: #666;">在庫情報の更新が正常に終了しました。</p>
    </div>
    
    <div style="margin-top: 30px;">
        <a href="${pageContext.request.contextPath}/stock/StockList.action" class="reserve-btn" style="text-decoration: none; width: 200px; display: inline-block; padding: 10px 0;">在庫一覧へ戻る</a>
    </div>

</div>

<%@ include file="../loginfooter.jsp" %>