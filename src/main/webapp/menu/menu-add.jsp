<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>メニュー登録</title>

<style>
body{
    font-family: "Yu Gothic","Meiryo",sans-serif;
    background:#f4f4f4;
}

.container{
    width:600px;
    margin:50px auto;
    background:#ffffff;
    padding:30px;
    border-radius:10px;
    box-shadow:0 0 10px rgba(0,0,0,0.2);
}

h2{
    text-align:center;
    margin-bottom:30px;
}

table{
    width:100%;
    border-collapse:collapse;
}

td{
    padding:12px;
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
    margin-top:30px;
}

.button input{
    width:120px;
    height:40px;
    margin:0 10px;
    font-size:15px;
}
</style>

</head>
<body>

<div class="container">

<h2>メニュー登録</h2>

<form action="MenuInsertAction" method="post">

<table>

<tr>
    <td class="label">商品ID</td>
    <td>
        <input type="text" name="menu_id" maxlength="10" required>
    </td>
</tr>

<tr>
    <td class="label">商品名</td>
    <td>
        <input type="text" name="menu_name" maxlength="20" required>
    </td>
</tr>

<tr>
    <td class="label">価格</td>
    <td>
        <input type="number" name="price" min="0" required>
    </td>
</tr>

<tr>
    <td class="label">ジャンル</td>
    <td>
        <select name="genre">
            <option value="コーヒー">コーヒー</option>
            <option value="紅茶">紅茶</option>
            <option value="ソフトドリンク">ソフトドリンク</option>
            <option value="フード">フード</option>
            <option value="スイーツ">スイーツ</option>
        </select>
    </td>
</tr>
<tr>
    <td class="label">提供中</td>
    <td>
        <input type="checkbox" name="serve" value="true" checked>
    </td>
</tr>

</table>

<div class="button">
    <input type="submit" value="登録">
    <input type="reset" value="クリア">
    <input type="button" value="戻る" onclick="history.back()">
</div>

</form>

</div>

</body>
</html>