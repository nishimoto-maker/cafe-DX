<%@page contentType="text/html; charset=UTF-8" %>
<%@include file="../loginheader.jsp" %>

<form class ="login-form" action="/cafeDX/login/Insert.action" method="post">
<h4>新規登録</h4>
<p>
  <label>ログイン名：</label>
  <input type="text" name="staff_id">
</p>
<p class="error">${error1}</p>
<p>
  <label>名前：</label>
  <input type="text" name="staff_name">
</p>
<p>
  <label>パスワード：</label>
  <input type="password" name="password">
</p>
<p class="error">${error2}</p>
<p class="error">${error}</p>
<p><input type="submit" value="登録"  class="reserve-btn"></p>
</form>

<%@include file="../loginfooter.jsp" %>

