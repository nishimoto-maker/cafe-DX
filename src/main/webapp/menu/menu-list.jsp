<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="bean.Menu" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!-- JSTL（繰り返し処理など）を使う宣言 -->


<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>メニュー一覧</title>

<style>
body{
    font-family:"Yu Gothic","Meiryo",sans-serif;
    background:#f4f4f4;
}

.container{
    width:900px;
    margin:40px auto;
    background:#fff;
    padding:30px;
    border-radius:10px;
    box-shadow:0 0 10px rgba(0,0,0,.2);
}

h2{
    text-align:center;
    margin-bottom:30px;
}

table{
    width:100%;
    border-collapse:collapse;
}

th,td{
    border:1px solid #ccc;
    padding:10px;
    text-align:center;
}

th{
    background:#6f4e37;
    color:white;
}

.button{
    margin-top:20px;
    text-align:right;
}

.button a{
    display:inline-block;
    padding:10px 20px;
    background:#007bff;
    color:#fff;
    text-decoration:none;
    border-radius:5px;
}

.button a:hover{
    background:#0056b3;
}
</style>

</head>
<body>

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

</body>
</html>