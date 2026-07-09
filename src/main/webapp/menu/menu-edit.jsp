<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="bean.Menu" %>

<%
Menu menu = (Menu)request.getAttribute("menu");
%>

<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>メニュー更新</title>

<style>
body{
    font-family:"Yu Gothic","Meiryo",sans-serif;
    background:#f4f4f4;
}

.container{
    width:600px;
    margin:50px auto;
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
}

td{
    padding:10px;
}

.label{
    width:150px;
    font-weight:bold;
}

input[type=text],
input[type=number],
select{
    width:100%;
    padding:8px;
    border:1px solid #ccc;
    border-radius:5px;
    box-sizing:border-box;
}

.button{
    text-align:center;
    margin-top:25px;
}

.button input,
.button button{
    width:120px;
    height:40px;
    margin:0 10px;
}
</style>

</head>
<body>

<div class="container">

<h2>メニュー更新</h2>

<form action="MenuUpdateAction" method="post">

<table>

<tr>
    <td class="label">商品ID</td>
    <td>
        <input type="text" name="menu_id"
        value="<%=menu.getMenuId()%>" readonly>
    </td>
</tr>

<tr>
    <td class="label">商品名</td>
    <td>
        <input type="text" name="menu_name"
        value="<%=menu.getMenuName()%>">
    </td>
</tr>

<tr>
    <td class="label">価格</td>
    <td>
        <input type="number" name="price"
        value="<%=menu.getPrice()%>">
    </td>
</tr>

<tr>
    <td class="label">ジャンル</td>
    <td>
        <select name="genre">
            <option value="コーヒー" <%= "コーヒー".equals(menu.getGenre()) ? "selected" : "" %>>コーヒー</option>
            <option value="紅茶" <%= "紅茶".equals(menu.getGenre()) ? "selected" : "" %>>紅茶</option>
            <option value="ソフトドリンク" <%= "ソフトドリンク".equals(menu.getGenre()) ? "selected" : "" %>>ソフトドリンク</option>
            <option value="フード" <%= "フード".equals(menu.getGenre()) ? "selected" : "" %>>フード</option>
            <option value="スイーツ" <%= "スイーツ".equals(menu.getGenre()) ? "selected" : "" %>>スイーツ</option>
        </select>
    </td>
</tr>

<tr>
    <td class="label">提供中</td>
    <td>
        <input type="checkbox" name="serve" value="true"
        <%= menu.isServe() ? "checked" : "" %>>
    </td>
</tr>

</table>

<div class="button">
    <input type="submit" value="更新">
    <button type="button" onclick="history.back()">戻る</button>
</div>

</form>

</div>

</body>
</html>