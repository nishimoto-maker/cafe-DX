<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@include file="../loginheader.jsp" %>


<div class="menu-box">
	<div class="box">
		<a href="OrderConfirm.action">
			注文を確定する
		</a>
	</div>
	<div class="box">
		<a href="Order.action">
			メニューに戻る
		</a>
	</div>
</div>

<br>

<table style="border-collapse:separate;border-spacing:10px">
	<tr>
		<td>商品ID</td>
		<td>商品名</td>
		<td>ジャンル</td>
		<td>値段</td>
		<td>個数</td>
		<td>テーブル番号</td>
		<td></td>
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


<%@include file="../loginfooter.jsp" %>