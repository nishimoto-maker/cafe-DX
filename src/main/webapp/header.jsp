<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
<meta charset="UTF-8">
<title>cafeDXシステム</title>
</head>
<body>
  <div class="title">
    <c:choose>
      <c:when test="${sessionScope.staff.staff_id == 'admin'}">
        <a href="${pageContext.request.contextPath}/menu/menu2.jsp">cafeDXシステム</a>
      </c:when>
      <c:otherwise>
        <a href="${pageContext.request.contextPath}/menu/menu.jsp">cafeDXシステム</a>
      </c:otherwise>
    </c:choose>
  </div>
  
  <div class="user">${sessionScope.staff.staff_name}様
    <a href="/cafeDX/login/logout-in.jsp">ログアウト</a>
  </div>