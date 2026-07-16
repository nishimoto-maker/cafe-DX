<%@page contentType="text/html; charset=UTF-8" %>

<%@include file="../header.jsp" %>

<div class="container">
<h2><a href="${pageContext.request.contextPath}/menu/menu-list.jsp">商品管理</a></h2><br>

<!-- 商品新規登録情報入力フォーム -->
<form class="input-form" action="/cafeDX/menu/MenuInsert.action" method="post">
    <h3>商品新規登録</h3>
    <p>商品ID：<input type="text" name="menu_id"></p>
    <p class="error">${error1}</p>
    <p>商品名：<input type="text" name="menu_name"></p>
    <p>値段：<input type="text" name="price" min="0"></p>
    <p>ジャンル：<select name="genre">
                 <option value="ドリンク">ドリンク</option>
                 <option value="フード">フード</option>
                 <option value="スイーツ">スイーツ</option>
                 <option value="セットメニュー">セットメニュー</option>
                 <option value="季節限定">季節限定</option>
                 <option value="テイクアウト">テイクアウト</option>
                 </select></p>
    <p><label><input type="checkbox" name='serve'>提供中</label></p>
    <p class="error">${error}</p>
    <p><input type="submit" value="確定" class="reserve-btn"></p>
</form>

</div>

<%@include file="../loginfooter.jsp" %>