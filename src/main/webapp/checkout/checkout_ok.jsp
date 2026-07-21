<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>

<div class="container">

	<h3>お会計が完了しました！</h3>
	
	<p><a href="checkout_top.jsp">次のお会計をする</a></p>
	
	<p><a href="${ pageContext.request.contextPath }/menu/menu.jsp">ホーム画面へ戻る</a></p>

</div>
<%@include file="../loginfooter.jsp" %>