<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@include file="../header.jsp" %>
<div class="container">

	<h2>${ tableNum }番テーブルのお会計</h2>
	
	<table>
		<c:forEach var="p" items="${payments}">
			<tr>
				<td>商品名：${ p.menuName }</td>
				<td>商品単価：${ p.price }</td>
				<td>個数：${ p.count }</td>
				<td>小計：${ p.subtotal }</td>
			</tr>
		</c:forEach>
	</table>
	
	<h4>合計：${ total }円</h4>
	
	<form action="CheckoutConfirm.action" method="post">
		<input type="hidden" name="tableNum" value="${ tableNum }">
		<input type="submit" value="会計完了">
	</form>

</div>
<%@include file="../loginfooter.jsp" %>