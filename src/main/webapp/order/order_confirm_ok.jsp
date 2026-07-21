<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>

<div class="container">

	<h3>注文の登録を確定しました！</h3>
	<p>${ line }件登録されました</p>
	
	<hr>
	
	<div class="button">
		<a href="Order.action">メニュー一覧へ戻る</a>
	</div>

</div>
<%@include file="../loginfooter.jsp" %>