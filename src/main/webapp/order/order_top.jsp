<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@include file="../tool/header.jsp" %>

<h1>注文トップ</h1>

<hr>
<!-- 
	ジャンルでソートできるようにする。最後。
	今どのジャンルでソートしてるか分かるようにJavaScript実装
	ジャンルたくさんあるから、JavaScript大変そう
	スイッチ文使えるか
-->
<form action="Order.action" method="post">
	<h3>商品名で検索</h3>
	<p><input type="text" name="keyword"></p>

	<hr>
	
	<h3>ジャンルでソート</h3>
	<p>
		<c:forEach var="genre" items="${ genres }">
			<input type="radio" id="${ genre }"
				name="sort_by" value="${ genre }">
			<label for="${ genre }">${ genre }</label>
		</c:forEach>
	</p>
	
	<input type="submit" value="検索">
</form>

<hr>
<!-- 
	メニューを表示する。
	それぞれについたボタンで詳細ページに飛べ、
	その先で在庫数確認、カートに追加できる。
-->

<table>
	<c:forEach var="menu" items="${ menus }">
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

<script>
	/* ジャンル何があるか分からないので聞かなきゃ 
	const sortBy = ${ sort_by }

	switch (sortBy) {
		case "";
	}
	*/
</script>

<%@include file="../tool/footer.jsp" %>