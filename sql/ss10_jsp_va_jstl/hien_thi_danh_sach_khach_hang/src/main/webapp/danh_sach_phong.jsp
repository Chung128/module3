<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Laptop
  Date: 6/3/2025
  Time: 3:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
<meta charset="UTF-8">
<title>Danh sách khách hàng</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
        .customer-img {
        width: 80px;
        height: 80px;
        object-fit: cover;
        border-radius: 8px;
    }

    .container {
        margin-top: 40px;
    }

    h2 {
        text-align: center;
        margin-bottom: 30px;
        font-weight: bold;
    }

    table {
        box-shadow: 0 0 12px rgba(0,0,0,0.2);
        border-radius: 10px;
        overflow: hidden;
    }
</style>
</head>
<body>
<div class="container">
    <h2>Danh sách khách hàng</h2>
    <table class="table table-bordered text-center align-middle">
            <tr>
                <th>Tên</th>
                <th>Ngày sinh</th>
                <th>Địa chỉ</th>
                <th>Ảnh</th>
            </tr>
            <c:forEach var="item" items="${customer}">
                <tr>
                    <td>${item.name}</td>
                    <td>${item.birthday}</td>
                    <td>${item.address}</td>
                    <td><img src="${item.image}" class="customer-img" alt="Ảnh khách hàng"></td>
                </tr>
            </c:forEach>
        </table>
</div>
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
