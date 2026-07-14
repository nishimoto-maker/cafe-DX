<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../loginheader.jsp" %>

<!--
カートページ
カートの中身を一覧表示
注文テーブルに商品テーブルを結合して、
注文された商品の情報も見られるようにしたい
OrderDetailというbeanを作ることにした

注文修正めんどくさいな
削除フラグつけて非表示にして、正しいのをもっかい入れさせるか
DBから消すことないか、カートの中から除けばいいから簡単か
修正じゃなくて、カートから消してもっかい登録の方針で
確認画面とか無しで、ボタン押したらカートから消して、
またこのページに帰ってくるように
-->

<table style="border-collapse:separate;border-spacing:10px">
	<c:forEach var="OrderDetail" items="${ cart }" varStatus="status">
		<tr>
			<td>商品ID：${ OrderDetail.menu.menu_id }</td>
			<td>${ OrderDetail.menu.menu_name }</td>
			<td>ジャンル：${ OrderDetail.menu.genre }</td>
			<td>${ OrderDetail.menu.price}円</td>
			<td>個数：${ OrderDetail.count }</td>
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

<a href="OrderConfirm.action">注文を確定する</a>

<a href="Order.Action">メニューに戻る</a>

<%@include file="../loginfooter.jsp" %>