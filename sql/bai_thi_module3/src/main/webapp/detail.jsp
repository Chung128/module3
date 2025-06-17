<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Laptop
  Date: 6/10/2025
  Time: 11:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Hiển thị chi tiết</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <style>
        body {
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
            font-family: 'Segoe UI', sans-serif;
        }

        .form-container {
            background-color: rgba(255, 255, 255, 0.95);
            border-radius: 12px;
            padding: 30px;
            margin-top: 50px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            width: 40%;
        }
        #table{
            min-width: 400px; width: 50%;
        }
    </style>
</head>
<body>
<div class="container mt-4">
    <div class="row justify-content-center">
        <div class="col-md-10 form-container">
            <h2 class="text-center">Chi tiết</h2>
            <table id="table" class="table table-bordered w-50 mx-auto ">
                <tr>
                    <th>Mã con heo</th>
                    <td>${heo.maSoHeo}</td>
                </tr>
                <tr>
                    <th>Thời gian nhập chuồng</th>
                    <td>${heo.thoiGianNhapChuong}</td>
                </tr>
                <tr>
                    <th>cân nặng khi nhập chuồng</th>
                    <td>${heo.canNangNhapChuong}</td>
                </tr>
                <tr>
                    <th>Thời gian xuất chuồng</th>
                    <td>${heo.thoiGianxuatChuong}</td>
                </tr>
                <tr>
                    <th>cân nặng khi xuất chuồng</th>
                    <td>${heo.canNangXuatChuong}</td>
                </tr>
                <tr>
                    <th>tình trạng</th>
                    <td>
                        <c:forEach var="lp" items="${listTinhTrang}">
                            <c:if test="${lp.maTinhTrang == heo.maTinhTrang}">
                                ${lp.tenTinhTrang}
                            </c:if>
                        </c:forEach>
                    </td>
                </tr>
                <tr>
                    <th>Xuất xứ</th>
                    <td>
                        <c:forEach var="tt" items="${listXuatXu}">
                            <c:if test="${tt.maXuatXu == heo.maXuatXu}">
                                ${tt.xuatXu}
                            </c:if>
                        </c:forEach>
                    </td>
                </tr>
            </table>
            <div class="text-center">
                <a class="btn btn-secondary" href="/heos">Quay lại danh sách</a>
                <a href="heos?action=update&id=${heo.idHeo}" class="btn btn-warning btn-sm">Sửa</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>
