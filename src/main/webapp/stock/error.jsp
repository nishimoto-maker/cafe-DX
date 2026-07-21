<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../loginheader.jsp" %>

<div class="container" style="text-align: center;">

    <h2 style="color: #d9534f;">エラーが発生しました</h2>
    
    <div style="margin: 30px 0;">
        <p style="color: red; font-size: 16px; font-weight: bold;">${errorMessage}</p>
    </div>
    
    <div style="margin-top: 30px;">
        <a href="${pageContext.request.contextPath}/stock/StockList.action" class="reserve-btn" style="text-decoration: none; width: 180px; display: inline-block; padding: 10px 0;">一覧に戻る</a>
    </div>

</div>

<%@ include file="../loginfooter.jsp" %>