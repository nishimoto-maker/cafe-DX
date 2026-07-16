<%@page contentType="text/html; charset=UTF-8" %>

<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!-- JSTL（繰り返し処理など）を使う宣言 -->

<%@include file="../header.jsp" %>

<div class="container">
<h2><a href="${pageContext.request.contextPath}/menu/menu-list.jsp">商品管理</a></h2><br>

<!-- 商品登録情報入力フォーム -->

<form class="input-form" action="/cafeDX/menu/MenuUpdate.action" method="post">
<h3>商品情報の変更・更新</h3>
<input type="hidden" name="menu_id" value="${menu.menu_id}">
<input type="hidden" name="menu_name" value="${menu.menu_name}">
<input type="hidden" name="genre" value="${menu.genre}">
    <p>商品名：${menu.menu_name}</p>
    <p>値段：<input type="text" name="price" min="0"></p>
    <p>ジャンル：${menu.genre}</p>
    <p><label><input type="checkbox" name='serve'>提供中</label></p>
    <p class="error">${error}</p>
    <p><input type="submit" value="変更・更新" class="reserve-btn"></p>
</form>

</div>

<%@include file="../loginfooter.jsp" %>