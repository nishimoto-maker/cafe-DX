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
	<c:forEach var="OrderDetail" items="${ cart }">
		<tr>
			<td>注文ID：${ OrderDetail.orderId }</td>
			<td>商品ID：${ OrderDetail.menuId }</td>
			<td>${ OrderDetail.menuName }</td>
			<td>ジャンル：${ OrderDetail.genre }</td>
			<td>${ OrderDetail.price}円</td>
			<td>個数：${ OrderDetail.count }</td>
			<td>${ OrderDetail.tableNum }番テーブル</td>
			<td>
				<form action="CartRemove.action" method="post">
					<input type="hidden" name="orderId" value="${ OrderDetail.orderId }">
					<input type="submit" value="注文を削除する">
				</form>
			</td>
		</tr>
	</c:forEach>
</table>

<a href="Order.Action">メニューに戻る</a>

<%@include file="../loginfooter.jsp" %>