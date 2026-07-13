<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!-- JSTL（繰り返し処理など）を使う宣言 -->

<%@include file="../loginheader.jsp" %>
<div class="container">

<h2>メニュー一覧</h2>

<div class="button">
    <a href="menu_create.jsp">新規登録</a>
</div>


<table>

<tr>
    <th>商品ID</th>
    <th>商品名</th>
    <th>価格</th>
    <th>ジャンル</th>
    <th>提供中</th>
    <th>更新</th>
</tr>

<!-- list（StudentActionでセッションに入れた）を繰り返し -->
<c:forEach var="menu" items="${list}">

<tr>
    <td>${menu.menu_id}</td>
    <td>${menu.menu_name}</td>
    <td>${menu.price}</td>
    <td>${menu.genre}</td>
    <td>${menu.serve ? "〇" : "×"}</td>
    <td>
      <form action="/cafeDX/menu/MenuUpdate.action" method="post">
		    <input type="hidden" name="menu_id" value="${menu.menu_id}">
		    <input type="submit" value="変更・更新" class="reserve-btn">
	  </form>
    </td>
</tr>

</c:forEach>


</table>

</div>
