<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../tool/header.jsp" %>

<!-- 
MenuGetAction.javaからmenu、在庫数を受け取る
選択されたメニューの詳細、在庫数を表示する画面
在庫ない場合はカートに追加するボタンは無効化する
個数、テーブル番号を入力させる
個数を入力するinput type="number"の上限値を在庫数にする
	これで判定処理減らせると思ったのに、
	サーブレットでも判定したほうがいいらしい(一旦無視)

送るもの：menu_id, count, tableNum
送り先：CartAdd.action

トップに戻るリンクを用意 -->

<%@include file="../tool/footer.jsp" %>