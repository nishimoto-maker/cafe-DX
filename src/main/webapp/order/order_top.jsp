<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@include file="../tool/header.jsp" %>

<h1>注文登録</h1>

<hr>

<!-- ジャンルでソートできるようにする。あとで。 -->

<!-- beanでどう命名されているか要確認 -->
<table>
	<c:forEach var="menu" items="${list}">
		<tr>
			<td>商品ID：${ menu.menu_id }</td>
			<td>商品名：${ menu.menu_name }</td>
			<td>値段：${ menu.price }</td>
			<td>ジャンル：${ menu.genre }</td>
			<td>
				<form action="OrderRegister.action">
					<p><input type="hidden" name="id" value="${ menu.menu_id }"></p>
					<p>個数：<input type="number" name="count" value="1" min="1"></p>
					<p>テーブル番号：
					<select name="tableNum">
						<c:forEach var="i" begin="1" end="10">
							<option value="${ i }">${ i }</option>
						</c:forEach>
					</select>
					</p>
					<p><input type="submit" value="注文を追加"></p>
				</form>
			</td>
		</tr>
	</c:forEach>
</table>

<%@include file="../tool/footer.jsp" %>