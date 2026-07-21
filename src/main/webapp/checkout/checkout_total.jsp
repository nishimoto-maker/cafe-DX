<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@include file="../header.jsp" %>

<h2>${ tableNum }番テーブルのお会計</h2>

<table>
	<tr>
		<td>商品名</td>
		<td>商品単価</td>
		<td>個数</td>
		<td>小計</td>
	</tr>
	
	<c:forEach var="p" items="${payments}">
		<tr>
			<td>${ p.menuName }</td>
			<td>${ p.price }</td>
			<td>${ p.count }</td>
			<td>${ p.subtotal }</td>
		</tr>
	</c:forEach>
</table>

<h4>合計：${ total }円</h4>

<form action="CheckoutConfirm.action" method="post">
	<input type="hidden" name="tableNum" value="${ tableNum }">
	<input type="submit" value="会計完了">
</form>

<%@include file="../loginfooter.jsp" %>