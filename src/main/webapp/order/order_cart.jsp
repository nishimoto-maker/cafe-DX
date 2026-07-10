<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../tool/header.jsp" %>

<!-- カートページ
ここで個数を指定するように
メニューへ戻るリンクと、注文確定するリンク -->

<table style="border-collapse:separate;border-spacing:10px">
	<c:forEach var="menu" items"${ cart }>
		<tr>
			<td>商品ID：${ menu.menu_id }</td>
			<td>${ menu.name }</td>
			<td>${ menu.genre }</td>
			<td>${ menu.price}円</td>
			<td>
				<form action="CartAdd.action" method="post">
					<input type="hidden" name="menu_id" value="${ menu.menu_id }">
					<input type="number" name="count" value=""
				</form>
			</td>
		</tr>
	</c:forEach>
</table>

<a href="Order.Action">メニューに戻る</a>

<%@include file="../tool/footer.jsp" %>