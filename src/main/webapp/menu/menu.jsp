<%@page contentType="text/html; charset=UTF-8" %>

<%@include file="../header.jsp" %>

<div class="container">
<h2>メニュー</h2><br>

<div class="menu-box">

<div class="box">
<a href="${ pageContext.request.contextPath }/order/Order.action">注文管理</a>
</div>

<div class="box">
<a href="/cafeDX/#/#">会計管理</a>
</div>

<div class="box">
<a href="/cafeDX/SalesMenu/">売上管理</a>
</div>

<div class="box">
<a href="/cafeDX/stock/">在庫管理</a>
</div>

</div>

</div>

<%@include file="../loginfooter.jsp" %>
