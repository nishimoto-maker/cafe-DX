<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>在庫更新画面</title>
</head>
<body>
    <h1>在庫更新</h1>
    
    <form action="StockRegisterAction" method="POST">
        メニューID: <input type="text" name="menu_id"><br>
        在庫数: <input type="number" name="stock_count"><br>
        <input type="submit" value="更新する">
    </form>
        </tr>
    
    <br>
    
    <a href="StockListAction">一覧画面に戻る</a>
</body>
</html>