<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@include file="../header.jsp" %>

<div class="container">

	<h2>注文トップ</h2>
	
	<div class="menu-box">
		<div class="button">
			<a href="${ pageContext.request.contextPath }/menu/menu.jsp">
				ホームページに戻る
			</a>
		</div>
		<div class="button">
			<a href="order_cart.jsp">
				カートを見る
			</a>
		</div>
	</div>
	<hr>
	<!-- 
		ジャンルでソートできるようにする
		今どのジャンルでソートしてるか分かるように表示
	-->
	<form action="Order.action" method="post">
		<h3>商品名で検索</h3>
		<p>「 ${ keyword } 」で検索中、、、</p>
		<p><input type="text" name="keyword" placeholder="商品名を入力"></p>
		
		<h3>ジャンルでソート</h3>
		<p>「 ${ sort_by } 」でソート中、、、</p>
		<p>
			<c:forEach var="genre" items="${ genres }">
				<input type="radio" id="${ genre }"
					name="sort_by" value="${ genre }">
				<label for="${ genre }">${ genre }</label>
			</c:forEach>
		</p>
		
		<input type="submit" value="検索" class="search-btn">
	</form>
	
	<hr>
	<!-- 
		メニューを表示する。
		それぞれについたボタンで詳細ページに飛べ、
		その先で在庫数確認、カートに追加できる。
	-->
	
	<table>
		<tr>
			<th>商品ID</th>
			<th>商品名</th>
			<th>値段</th>
			<th>ジャンル</th>
			<th></th>
		</tr>
		<c:forEach var="menu" items="${ menus }">
			<tr>
				<td>${ menu.menu_id }</td>
				<td>${ menu.menu_name }</td>
				<td>${ menu.price }</td>
				<td>${ menu.genre }</td>
				<td>
					<form action="MenuGet.action">
						<p>
							<input
								type="hidden"
								name="menuId"
								value="${ menu.menu_id }"
							>
						</p>
						<p><input type="submit" value="注文を追加" class="submit-btn"></p>
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>

</div>
<%@include file="../loginfooter.jsp" %>