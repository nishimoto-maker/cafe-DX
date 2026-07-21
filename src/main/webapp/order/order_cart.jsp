<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@include file="../header.jsp" %>
<div class="countainer">

<div class="menu-box">
	<div class="button">
		<a href="OrderConfirm.action">
			注文を確定する
		</a>
	</div>
	<div class="button">
		<a href="Order.action">
			メニューに戻る
		</a>
	</div>
</div>

<br>

<table>
	<tr>
		<th>商品ID</th>
		<th>商品名</th>
		<th>ジャンル</th>
		<th>値段</th>
		<th>個数</th>
		<th>テーブル番号</th>
		<th></th>
	</tr>
	<c:forEach var="OrderDetail" items="${ cart }" varStatus="status">
		<tr>
			<td>${ OrderDetail.menu.menu_id }</td>
			<td>${ OrderDetail.menu.menu_name }</td>
			<td>${ OrderDetail.menu.genre }</td>
			<td>${ OrderDetail.menu.price}円</td>
			<td>${ OrderDetail.count }</td>
			<td>${ OrderDetail.tableNum }番テーブル</td>
			<td>
				<form action="CartRemove.action" method="post">
					<input type="hidden" name="ODindex" value="${ status.index }">
					<input type="submit" value="注文を削除する">
				</form>
			</td>
		</tr>
	</c:forEach>
</table>

</div>
<%@include file="../loginfooter.jsp" %>