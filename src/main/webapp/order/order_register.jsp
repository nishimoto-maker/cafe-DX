<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../tool/header.jsp" %>

<!-- 
MenuGetAction.javaからmenu、在庫数を受け取る
選択されたメニューの詳細、在庫数を表示する画面
在庫ない場合はカートに追加するボタンは無効化する
個数を入力、テーブル番号を選択させる
個数を入力するinput type="number"の上限値を在庫数にする
	これで判定処理減らせると思ったのに、
	サーブレットでも判定したほうがいいらしい(一旦無視)

送るもの：menu_id, count, tableNum
送り先：CartAdd.action
 -->

<p>商品ID：${ menu.menu_id }</p>
<p>商品名：${ menu.menu_name }</p>
<p>価格：${ menu.price }</p>
<p>ジャンル：${ menu.genre }</p>
<p>在庫数：${ stock }</p>

<form action="CartAdd.action" method="post">
	<p><input type="hidden" name="menu_id" value="${ menu.menu_id }"></p>
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
		</c:choose>
		<c:otherwise>
			在庫無しのため、追加不可
		</c:otherwise>
	</p>
</form>

<p><a href="Order.action">メニュー一覧に戻る</a></p>

<%@include file="../tool/footer.jsp" %>