<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="bean.Menu" %>

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

<table>

<tr>
    <th>商品ID</th>
    <th>商品名</th>
    <th>価格</th>
    <th>ジャンル</th>
    <th>提供中</th>
    <th>更新</th>
</tr>

<%
List<Menu> list = (List<Menu>)request.getAttribute("list");

if(list != null){
    for(Menu menu : list){
%>

<tr>
    <td><%= menu.getMenuId() %></td>
    <td><%= menu.getMenuName() %></td>
    <td>¥<%= menu.getPrice() %></td>
    <td><%= menu.getGenre() %></td>
    <td><%= menu.isServe() ? "〇" : "×" %></td>
    <td>
        <a href="MenuEditAction?menu_id=<%= menu.getMenuId() %>">
            更新
        </a>
    </td>
</tr>

<%
    }
}
%>

</table>

<div class="button">
    <a href="menu-add.jsp">新規登録</a>
</div>

</div>

</body>
</html>