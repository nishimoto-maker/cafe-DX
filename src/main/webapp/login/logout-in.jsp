<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../header.jsp" %>

<form class="login-form" action="/cafeDX/login/Logout.action" method="post">
  <h4>本当にログアウトしますか？</h4>
  <input type="submit" value="ログアウト">
  <c:choose>
      <c:when test="${sessionScope.staff.staff_id == 'admin'}">
        <a href="/cafeDX/menu/menu2.jsp" class="btn-link">戻る</a>
      </c:when>
      <c:otherwise>
        <a href="/cafeDX/menu/menu.jsp" class="btn-link">戻る</a>
      </c:otherwise>
  </c:choose>
</form>

<%@ include file="../loginfooter.jsp" %>