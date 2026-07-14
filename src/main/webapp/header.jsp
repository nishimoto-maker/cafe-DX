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
      <c:when test="${sessionScope.teacher.teacher_id == 'admin'}">
        <a href="${pageContext.request.contextPath}/kanri/menu2.jsp">得点管理システム</a>
      </c:when>
      <c:otherwise>
        <a href="${pageContext.request.contextPath}/kanri/menu.jsp">得点管理システム</a>
      </c:otherwise>
    </c:choose>
  </div>
  
  <div class="user">${sessionScope.teacher.teacher_name}様
    <a href="/karubi/login/logout-in.jsp">ログアウト</a>
  </div>