<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>売上管理メニュー</title>

<link rel="stylesheet" href="/cafeDX/css/salesMenu.css">
</head>

<body>

<div class="main-back">
    <a href="/cafeDX/" class="main-back-btn">
        ← メインメニューに戻る
    </a>
</div>

<div class="menu-container">

    <h1>売上管理メニュー</h1>

    <div class="menu">

        <a href="/cafeDX/sales/DailySales.action">
            <div class="card">日別売り上げ</div>
        </a>

        <a href="/cafeDX/sales/MonthlySales.action">
            <div class="card">月別売り上げ</div>
        </a>

        <a href="/cafeDX/sales/SalesDetail.action">
            <div class="card">売り上げ詳細</div>
        </a>

        <a href="/cafeDX/sales/SalesReport.action">
            <div class="card">売り上げレポート</div>
        </a>

    </div>

</div>

</body>
</html>
