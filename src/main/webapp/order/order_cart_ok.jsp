<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>

<div class="container">

	<!-- カート内の注文を登録出来た時に表示するページ -->
	<h2>カートに追加しました！</h2>
	
	<p>まだ注文がある場合は</p>
	<a href="Order.action">トップへ戻る</a>
	
	<p>注文が出そろった場合は</p>
	<a href="order_cart.jsp">カートページへ</a>

</div>
<%@include file="../loginfooter.jsp" %>