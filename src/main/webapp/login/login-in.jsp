<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../loginheader.jsp" %>

<form class ="login-form" action="/cafeDX/login/Login.action" method="post">
    <h4>ログイン</h4>
    <p>
        <label>ログイン名：</label>
        <input type="text" name="staff_id">
    </p>

    <p>
        <label>パスワード：</label>
        <input type="password" name="password">
    </p>
    <p class="error">${error}</p>
    
    <p>
        <input type="submit" value="ログイン">
    </p>
    
    <br>
    
    <h4>はじめての方はこちら</h4>
    <a class="btn-link" href="/cafeDX/login/insert.jsp">新規登録</a>
</form>

<%@ include file="../loginfooter.jsp" %>
