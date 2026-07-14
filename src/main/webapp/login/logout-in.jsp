<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../header.jsp" %>

<form class="login-form" action="/cafeDX/login/Logout.action" method="post">
  <h4>本当にログアウトしますか？</h4>
  <input type="submit" value="ログアウト">
  <a href="/cafeDX/">戻る</a>
</form>

<%@ include file="../loginfooter.jsp" %>