<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="bean.SalesBean" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>カフェDX</title>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<style>
    .chart-container {
        width: 80%;
        max-width: 800px;
        margin: 40px auto;
    }
</style>
</head>
<body>

<div class="header">
    <a href="${pageContext.request.contextPath}/Sales/salesMenu.jsp" class="back-btn">← 戻る</a>
    <h1>日別売上推移</h1>
</div>

<div class="chart-container">
    <canvas id="dailySalesChart"></canvas>
</div>

<%
    List<SalesBean> salesList = (List<SalesBean>) request.getAttribute("salesList");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
%>

<script>
    const labels = [];
    const data = [];

    <% if (salesList != null) { 
        for (SalesBean sales : salesList) { %>
            labels.push("<%= sdf.format(sales.getSalesDate()) %>");
            data.push(<%= sales.getTotalSales() %>);
        <% } 
    } %>

    const ctx = document.getElementById('dailySalesChart').getContext('2d');
    new Chart(ctx, {
        type: 'line', 
        data: {
            labels: labels, 
            datasets: [{
                label: '売上金額 (円)',
                data: data,
                borderColor: '#4caf50',
                backgroundColor: 'rgba(76, 175, 80, 0.2)',
                borderWidth: 2,
                fill: true,
                tension: 0.1 
            }]
        },
        options: {
            responsive: true,
            scales: {
                y: {
                    beginAtZero: true,
                    ticks: {
                        callback: function(value) {
                            return '¥' + value.toLocaleString();
                        }
                    }
                }
            }
        }
    });
</script>

</body>
</html>