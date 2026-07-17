<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../loginheader.jsp" %>

<!-- 詳細ページで確認はするけど、それでも抜けた注文と
在庫数を確認し、売切れの際に吐くエラーページ -->

<h2>カート追加エラー</h2>
<p>注文個数が在庫数を超えています</p>

<%@include file="../loginfooter.jsp" %>