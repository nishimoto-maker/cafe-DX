<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@include file="../loginheader.jsp" %>
<div class="container">

	<p>商品ID：${ menu.menu_id }</p>
	<p>商品名：${ menu.menu_name }</p>
	<p>価格：${ menu.price }</p>
	<p>ジャンル：${ menu.genre }</p>
	<p>在庫数：${ stock }</p>
	
	<form action="CartAdd.action" method="post">
		<p><input type="hidden" name="menuId" value="${ menu.menu_id }"></p>
		<p><input type="hidden" name="stock" value="${ stock }"></p>
		<p>
			テーブル番号：
			<select name="tableNum">
				<c:forEach var="i" begin="1" end="10">
					<option value="${i}">${i}</option>
				</c:forEach>
			</select>
		</p>
		<p>
			個数：
			<c:choose>
				<c:when test="${stock > 0}">
					<input type="number" name="count" min="1" max="${stock}">
					<input type="submit" value="カートに追加">
				</c:when>
				<c:otherwise>
					在庫無しのため、追加不可
				</c:otherwise>
			</c:choose>
		</p>
	</form>
	
	<p><a href="Order.action">メニュー一覧に戻る</a></p>

</div>
<%@include file="../loginfooter.jsp" %>