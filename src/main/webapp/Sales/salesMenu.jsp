<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>売上管理メニュー</title>

<link rel="stylesheet"
      href="${pageContext.request.contextPath}/css/salesMenu.css">

</head>

<body>

<div class="main-back">
    <a href="${pageContext.request.contextPath}/menu/menu.jsp"
       class="main-back-btn">
        ← メインメニューに戻る
    </a>
</div>

<div class="menu-container">

    <h1>売上管理メニュー</h1>

    <div class="menu">

        <a href="${pageContext.request.contextPath}/sales/DailySales.action">
            <div class="card">日別売り上げ</div>
        </a>

        <a href="${pageContext.request.contextPath}/sales/MonthlySales.action">
            <div class="card">月別売り上げ</div>
        </a>

        <a href="${pageContext.request.contextPath}/sales/SalesDetail.action">
            <div class="card">売り上げ詳細</div>
        </a>

        <a href="${pageContext.request.contextPath}/sales/SalesReport.action">
            <div class="card">売り上げレポート</div>
        </a>

    </div>

</div>

</body>
</html>
