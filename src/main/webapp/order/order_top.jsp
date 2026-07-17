<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@include file="../loginheader.jsp" %>

<h1>注文トップ</h1>

<div class="menu-box">
	<div class="box">
		<a href="${ pageContext.request.contextPath }/menu/menu.jsp">
			ホームページに戻る
		</a>
	</div>
	<div class="box">
		<a href="order_cart.jsp">
			カートを見る
		</a>
	</div>
</div>
<hr>
<!-- 
	ジャンルでソートできるようにする。最後。
	今どのジャンルでソートしてるか分かるようにJavaScript実装
	ジャンルたくさんあるから、JavaScript大変そう
	スイッチ文使えるか
	日本語で表示することにした
-->
<form action="Order.action" method="post">
	<h3>商品名で検索</h3>
	<p>「 ${ keyword } 」で検索中、、、</p>
	<p><input type="text" name="keyword"></p>
	
	<h3>ジャンルでソート</h3>
	<p>「 ${ sort_by } 」でソート中、、、</p>
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
							name="menuId"
							value="${ menu.menu_id }"
						>
					</p>
					<p><input type="submit" value="注文を追加"></p>
				</form>
			</td>
		</tr>
	</c:forEach>
</table>

<%@include file="../loginfooter.jsp" %>