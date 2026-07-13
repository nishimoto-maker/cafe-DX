<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@include file="../tool/header.jsp" %>

<h1>注文トップ</h1>

<hr>

<!-- ジャンルでソートできるようにする。最後。 -->
<!-- 
	メニューを表示する。
	それぞれについたボタンで詳細ページに飛べ、
	その先で在庫数確認、カートに追加できる。
-->

<!-- beanでどう命名されているか要確認 -->
<table>
	<c:forEach var="menu" items="${list}">
		<tr>
			<td>商品ID：${ menu.menu_id }</td>
			<td>商品名：${ menu.menu_name }</td>
			<td>値段：${ menu.price }</td>
			<td>ジャンル：${ menu.genre }</td>
			<td>
				<form action="MenuGet.action">
					<p>
						<input
							type="hidden"
							name="id"
							value="${ menu.menu_id }"
						>
					</p>
					<p><input type="submit" value="注文を追加"></p>
				</form>
			</td>
		</tr>
	</c:forEach>
</table>

<%@include file="../tool/footer.jsp" %>