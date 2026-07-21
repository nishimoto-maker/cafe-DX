<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@include file="../header.jsp" %>
<div class="container">

	<h2>お会計を計算します</h2>
	
	<div class="menu-box">
		<div class="box">
			<a href="${ pageContext.request.contextPath }/menu/menu.jsp">
				ホームページに戻る
			</a>
		</div>
	</div>
	<hr>
	
	<h4>お会計をするテーブル番号を指定してください</h4>
	<form action="Checkout.action">
		<select name="tableNum">
			<c:forEach var="i" begin="1" end="10">
				<option value="${i}">${i}</option>
			</c:forEach>
		</select>
		<input type="submit" value="送信">
	</form>

</div>
<%@include file="../loginfooter.jsp" %>