<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>

<div class="container">

	<div class="menu-box">
		<h2>お会計が完了しました！</h2>
		
		<div class="box">
			<a href="checkout_top.jsp">次のお会計をする</a>
		</div>
		<div class="box">
			<a href="${ pageContext.request.contextPath }/menu/menu.jsp">ホームへ戻る</a>
		</div>
	</div>

</div>
<%@include file="../loginfooter.jsp" %>