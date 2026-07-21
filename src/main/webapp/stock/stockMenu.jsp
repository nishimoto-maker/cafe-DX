<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../loginheader.jsp" %>

<div class="container" style="text-align: center;">

    <h2>在庫管理メニュー</h2>
    
    <div style="display: flex; flex-direction: column; align-items: center; gap: 20px; margin-top: 30px; margin-bottom: 30px;">
    	<div class="box" style="width: 250px; height: 60px;">
            <a href="${pageContext.request.contextPath}/stock/stockRegister.jsp" style="font-size: 18px; text-decoration: none;">在庫新規登録</a>
        </div>
        
        <div class="box" style="width: 250px; height: 60px;">
            <a href="${pageContext.request.contextPath}/stock/StockList.action" style="font-size: 18px; text-decoration: none;">入出庫修正・更新</a>
        </div>
        
        <div class="box" style="width: 250px; height: 60px;">
            <a href="${pageContext.request.contextPath}/stock/StockList.action" style="font-size: 18px; text-decoration: none;">在庫一覧・確認</a>
        </div>
    </div>
    <br>
    <hr>
    
    <div style="margin-top: 25px;">
        <a href="${pageContext.request.contextPath}/menu/menu.jsp" class="reserve-btn" style="text-decoration: none; width: 180px; display: inline-block; padding: 10px 0;">メニューに戻る</a>
    </div>

</div>

<%@ include file="../loginfooter.jsp" %>