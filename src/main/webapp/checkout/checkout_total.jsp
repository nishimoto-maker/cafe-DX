<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@include file="../header.jsp" %>
<div class="container">

	<h2>${ tableNum }番テーブルのお会計</h2>
	
	<table>
		<tr>
			<th>商品名</th>
			<th>商品単価</th>
			<th>個数</th>
			<th>小計</th>
		<c:forEach var="p" items="${payments}">
			<tr>
				<td>${ p.menuName }</td>
				<td>${ p.price }</td>
				<td>${ p.count }</td>
				<td>${ p.subtotal }</td>
			</tr>
		</c:forEach>
	</table>
	
	
	<form action="CheckoutConfirm.action" method="post" class="checkout-footer">
		<div class="total">
			<h4>合計：${ total }円</h4>
		</div>
		
		<div class="checkout-form">
			<input type="hidden" name="tableNum" value="${ tableNum }">
			<input type="submit" value="会計完了">
		</div>
	</form>

</div>
<%@include file="../loginfooter.jsp" %>